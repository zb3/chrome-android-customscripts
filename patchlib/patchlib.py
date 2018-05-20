import os
import re
import shutil
import hashlib


def hash_file(fname):
  md5 = hashlib.md5()

  with open(fname, 'rb') as f:
    while True:
      data = f.read(65536)
     
      if not data:
        break
   
      md5.update(data)

  return md5.digest()
  

def copy(s, d, check_mod=True):
  if os.path.isdir(d):
    d = os.path.join(d, os.path.basename(s))
    
  if not check_mod or not os.path.exists(d) or hash_file(s) != hash_file(d):
    shutil.copy2(s, d)
    
    
def copytree(src, dst, check_mod=True):
  if not os.path.exists(dst):
    os.makedirs(dst)
    
  for item in os.listdir(src):
    s = os.path.join(src, item)
    d = os.path.join(dst, item)
    if os.path.isdir(s):
      copytree(s, d, check_mod)
    else:
      copy(s, d, check_mod)
    
    
def meaningful_modtime(f):
  # first parameter of f must be the output filename
  # currently, the file must exist

  def wrapper(fn, *args, **kwargs):
    hash, modtime = hash_file(fn), os.path.getmtime(fn)
    
    ret = f(fn, *args, **kwargs)
    
    if hash == hash_file(fn):
      os.utime(fn, (os.path.getatime(fn), modtime))
    
    return ret
    
  return wrapper
  
@meaningful_modtime
def simple_replace(fn, subst):
  c = None
  
  with open(fn, 'r') as f:
    c = f.read()
    
    for src, dst in subst:
      c = c.replace(src, dst)

  if c:
    with open(fn, 'w') as f:
      f.write(c)
    

def simple_replace_directory(dname, subst):
  for dirpath, dnames, fnames in os.walk(dname):
    for f in fnames:
      simple_replace(os.path.join(dirpath, f), subst)
    

#extracts the whole method
def extract_method(fn, sig):
  c = ''
  on = False
  
  with open(fn, 'r') as f:
    
    for line in f:
      if not on and line.strip() == '.method '+sig:
        on = True
      
      if on:
        c += line 
       
      if on and line.strip() == '.end method':
        on = False
        
  if not c:     
    print('method', sig, 'not found in', fn, '!!')
    
  return c

#before using the output make sure there are enough registers
def method_contents(method):
  mlines = method.split('\n')
  
  idx_start = trim_end = 1
  
  for idx, line in enumerate(mlines):
    if line.startswith('    .registers') or line.startswith('    .locals'):
      idx_start = idx+1
      break
      
  #we support only simple case where the method ends with a return
  #TODO: otherwise we should replace all return-void with goto
  #to a new cond we'd append to output.
  
  while mlines[-trim_end] == '':
    trim_end += 1
    
  if mlines[-trim_end] == '.end method':
    trim_end += 1
    
  if mlines[-trim_end].startswith('    return'):
    trim_end += 1
  
  return '\n'.join(mlines[idx_start:-trim_end])

def method_set_class_flag(method, cls, name, value):
  pat = r'(\s*const/\d+ v(\d), 0x)[01](\n?\s*sput-boolean v\2, L%s;->%s:Z)' % (
    re.escape(cls), re.escape(name))

  return re.sub(pat, r'\g<1>%s\g<3>' % ('1' if value else '0'), method)
      
@meaningful_modtime
def replace_method(fn, sig, content, may_create=False):
  c = ''
  skip, replaced = False, False
  
  with open(fn, 'r') as f:
    for line in f:
      if not skip and line.strip() == '.method '+sig:
        skip = True
    
      if not skip:
        c += line
        
      if skip and line.strip() == '.end method':
        c += content
        skip = False
        replaced = True
    
  if not replaced and content:
    if may_create:
      c += '\n'+content
    else:
      print('method', sig, 'not found in', fn, '!!')
  
  with open(fn, 'w') as f:
    f.write(c)

@meaningful_modtime
def ensure_public(fn):
  c = ''
  
  with open(fn, 'r') as f:
    c = f.read()
    
    first_line, rest = c.split('\n', 1)
    if ' public ' not in first_line:
      first_line = first_line.replace('.class', '.class public')
      
    c = first_line+'\n'+rest

  with open(fn, 'w') as f:
    f.write(c)
    

def remove_patch(lines, name):
  if '#patch:'+name in lines:
    start_idx = lines.index('#patch:'+name)
    end_idx = lines.index('#endpatch:'+name)
    
    return lines[:start_idx]+lines[end_idx+1:]
    
  return lines
  

#insert patch before last occurence of a given string
def patch_before(fn, sig, patch_name, string, content, remove=False):
  mc_lines = extract_method(fn, sig).split('\n')
  
  #remove previous patch if present
  mc_lines = remove_patch(mc_lines, patch_name)

  mc = '\n'.join(mc_lines)
  
  if string not in mc:
    print(string, 'not found in', sig, 'in', fn)
    return
    
  where = mc.rindex(string)
  nmc = mc[:where]+'#patch:'+patch_name+'\n'
  nmc += content+'\n'
  nmc += '#endpatch:'+patch_name+'\n'
  
  if remove:
   nmc += mc[where+len(string):]
  else:
   nmc += mc[where:]
  
  replace_method(fn, sig, nmc)


def set_class_flags(fn, cls, flags):
  clinit_sig = 'static constructor <clinit>()V'

  method = extract_method(fn, clinit_sig)
  for name, value in flags:
    method = method_set_class_flag(method, cls, name, value)

  replace_method(fn, clinit_sig, method)

