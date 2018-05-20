const assert = require('assert').strict;

//todo: case-insensitive match? like ?i?pattern ?
//future: consider ?!exclude||include -> ^(?!(exclude)$)(include)$

function urlRegex(pattern) {
  const invert = pattern.startsWith('?!');
  if (invert)
    pattern = pattern.slice(2);

  pattern = pattern.replace(/([^(])\./g, '$1\\.');
  pattern = pattern.replace(/(^|[^)*])\*/g, '$1.*');
  pattern = pattern.replace(/(^|[(|]|\/\/)(@|\.\*\\\.)/g, '$1(.*\\.)?');
  pattern = pattern.replace(/\^($|\)|\|)/g, '([?#].*)?$1');

  if (invert)
    return new RegExp('^(?!(' + pattern + ')$)');
  else
    return new RegExp('^(' + pattern + ')$');
}

assert.equal(urlRegex('*://*.google.com/*') + '',
  /^(.*:\/\/(.*\.)?google\.com\/.*)$/ + '');

assert.equal(urlRegex('*://@google.com/*') + '',
  /^(.*:\/\/(.*\.)?google\.com\/.*)$/ + '');

assert.equal(urlRegex('*://(@google.com|@google.ru|*.g.pl)/*') + '',
  /^(.*:\/\/((.*\.)?google\.com|(.*\.)?google\.ru|(.*\.)?g\.pl)\/.*)$/ + '');

assert.equal(urlRegex('?!@google.com|@google.ru') + '',
  /^(?!((.*\.)?google\.com|(.*\.)?google\.ru)$)/ + '');

assert.equal(urlRegex('@zb3.com') + '', /^((.*\.)?zb3\.com)$/ + '');

assert.equal(urlRegex('https?://test.*.com/some@file.js*') + '',
  /^(https?:\/\/test\..*\.com\/some@file\.js.*)$/ + '');

assert.equal(urlRegex('https?://test.*.com/some@file.js^') + '',
  /^(https?:\/\/test\..*\.com\/some@file\.js([?#].*)?)$/ + '');

const orPattern = urlRegex('zb3.com|zb3.net');
assert(!orPattern.test('zb3.com.pl'));

const notPattern = urlRegex('?!zb3.com|zb3.net');

assert.equal(notPattern + '', /^(?!(zb3\.com|zb3\.net)$)/ + '');

assert(!notPattern.test('zb3.com'));
assert(!notPattern.test('zb3.net'));
assert(notPattern.test('tst.zb3.com.pl'));
assert(notPattern.test('zb3.net.pl'));
assert(notPattern.test('zb3.com.pl'));
assert(notPattern.test('zb3.net.pl'));

const filePattern = urlRegex('https?://(@zb3.com|@zb3.net)/file.js^');
assert(filePattern.test('https://what.zb3.com/file.js'));
assert(!filePattern.test('https://what.zb3.com/file.jsc'));
assert(filePattern.test('https://zb3.com/file.js?v=34'));
assert(filePattern.test('https://zb3.com/file.js#v=34'));

const filesPattern = urlRegex('https?://(@zb3.com|@zb3.net)/(f.js^|o.js^)');
assert(filesPattern.test('https://zb3.com/f.js'));
assert(filesPattern.test('https://zb3.com/f.js?a'));
assert(!filesPattern.test('https://zb3.com/f.jss'));
assert(filesPattern.test('https://zb3.com/o.js'));
assert(filesPattern.test('https://zb3.com/o.js?a'));
assert(!filesPattern.test('https://zb3.com/o.jss'));
