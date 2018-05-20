/*

This provides a "proxyFetch" function that enables fetching things from origins
that we can inject our "agent" into. It creates an agent iframe

Requirements:
-> CSP must not block our agent frame (no frame-src restriction)
-> CSP must not block frames @ all via 

*/

const agentFrames = {};
const pendingAgentFrames = {};

const skipKeys = ['headers', 'body', 'bodyUsed'];

addEventListener('message', async function (event) {
  if (event.data && event.data.command === 'cs-agent-ready' && pendingAgentFrames[event.origin]) {
    event.stopImmediatePropagation();

    agentFrames[event.origin] = pendingAgentFrames[event.origin].el.contentWindow;

    //we assume that "origin" is standarized here (no trailing slash)
    for (const cb of pendingAgentFrames[event.origin].listeners) {
      //no await here
      cb();
    }

    pendingAgentFrames[event.origin] = null;
  }
});

function createAgentFrame(origin, agentURL) {
  const f = document.createElement('iframe');
  pendingAgentFrames[origin] = { el: f, listeners: [] };


  f.style.display = 'none';

  f.src = agentURL ? agentURL : origin + '/cs-fetch-agent.html';

  document.body.appendChild(f);
}

async function findOrCreateAgent(url) {
  const { origin } = new URL(url);

  if (!agentFrames[origin]) {
    if (!pendingAgentFrames[origin]) {
      createAgentFrame(origin);
    }

    await new Promise((resolve) => {
      pendingAgentFrames[origin].listeners.push(resolve);
    });
  }

  return agentFrames[origin];
}

async function encodeRequest(r) {
  const retObj = {};

  for (const k of Object.keys(Request.prototype)) {
    if (!skipKeys.includes(k) && typeof r[k] !== 'function')
      retObj[k] = r[k];
  }

  retObj.headers = [];

  for (const e of r.headers.entries()) {
    retObj.headers.push(e);
  }

  //future: instead of this await, just pass the readablestream
  //that is transferrable. currently that doesn't work.
  const toTransfer = r.method != 'GET' && r.method != 'HEAD' ? await r.arrayBuffer() : null;

  retObj.body = toTransfer;

  return [retObj, toTransfer];
}

function decodeResponse(r) {
  //FAIL: most fields don't work (like url)
  const ret = new Response(r.body, r);

  //HACK: to get other properties quasi-working

  for (const k of Object.keys(r)) {
    if (!skipKeys.includes(k))
      Object.defineProperty(ret, k, { value: r[k] })
  }

  return ret;
}

function decodeError({ message, ctor, name }) {
  if (ctor === 'DOMException')
    return new DOMException(message, name);

  return new window[ctor](message);
}

async function proxyFetch(input, init) {
  /*
  -credential api not supported
   we'd need it on the client, but they can't be accessed from within an iframe
  -abort signals not supported
   abort signals could be emulated by returning an additional id
   and on the client side we'd always register an abort signal and map id to it
   and here we'd register onaborted and send that msg 
  */

  let request;

  if (input instanceof Request && !init)
    request = input;
  else
    request = new Request(input, init);

  const { origin } = new URL(request.url);

  if (origin == document.origin)
    return await fetch(input, init);

  const agent = await findOrCreateAgent(origin);


  const [requestData, requestTransfer] = await encodeRequest(request);

  if (init)
    requestData.keepalive = init.keepalive;

  const messageChannel = new MessageChannel();

  const msg = new Promise((resolve) => {
    messageChannel.port1.onmessage = function (event) {
      resolve(event.data);
    };
  });

  const toTransfer = [messageChannel.port2];

  if (requestTransfer)
    toTransfer.push(requestTransfer);

  agent.postMessage({ command: 'cs-agent-fetch', requestData }, '*', toTransfer);

  const { ok, reply } = await msg;

  if (!ok)
    throw decodeError(reply);

  return decodeResponse(reply);
}

export {createAgentFrame, proxyFetch}