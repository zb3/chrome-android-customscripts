import io
import os
import struct

"""
This file absolutely shouldn't exist. Package name should be changed by not passing the -r flag to apktool and then modifying AndroidManifest.xml. Functions defined here can't deal with some configurations apktool can, but they often don't even know about it and just corrupt input files in process. What a crap. I don't know what's worse - "is-odd" package or this file.

TODO: Change the way we rename a package and remove this file. (or not, so that it can become a monument to my stupidity?)
"""

def main():
  import sys
  #bxml_str_replace(sys.argv[1], lambda x: x)
  #arsc_rename_package(sys.argv[1], lambda x: 'com.chrome.beta')

def pack_len(l, wide):
  max = 0x8000 if wide else 0x80
  fmt = 'H' if wide else 'B'
  shift = 16 if wide else 8
  
  if l < max:
    ret = struct.pack('<'+fmt, l)
  else:
    ret = struct.pack('<'+fmt+fmt, max | (l >> shift), l & ((max<<1)-1))
  
  return ret
  
  
def read_len(bio, size):
  max = 1 << (size-1)
  fmt = '<H' if size==16 else '<B'
  
  l = struct.unpack(fmt, bio.read(size >> 3))[0]
  if l & max:
    l = (l & (max-1)) << size | struct.unpack(fmt, bio.read(size >> 3))[0]
  
  return l
  
def arsc_package_name(fn, cb):
  with open(fn, 'r+b') as f:
    file_type, head_len = struct.unpack('<HH', f.read(4))
    f.seek(head_len-4, os.SEEK_CUR)
        
    while True:
      #read chunks
      chunk_head = f.read(8)
      chunk_type, chunk_head_len, chunk_len = struct.unpack('<HHI', chunk_head)
      
      if chunk_type == 0x200:
        f.seek(4, os.SEEK_CUR)
        name = f.read(256).decode('utf-16-le')
        name = name[:name.index('\x00')]
        
        name = cb(name)
        name += '\x00'
        
        f.seek(-256, os.SEEK_CUR)
        f.write(name.encode('utf-16-le'))
        
        break
      else:
        f.seek(chunk_len-8, os.SEEK_CUR)

          
def str_replace(fn, cb):
  with open(fn, 'rb') as f:
    buff = io.BytesIO(f.read())

  with open(fn+'.tmp', 'wb') as f:
    file_head = buff.read(4)
    file_type, head_len = struct.unpack('<HH', file_head)
    
    file_head += buff.read(head_len-4)
    f.write(file_head)
    
    sphead = buff.read(28)
    
    #we'll rewrite it later
    f.write(sphead)
    
    kind, hlen, sp_size, str_count, style_count, flags, str_off, style_off = struct.unpack('<HHIIIIII',  sphead)
    if kind != 1:
      raise Exception('unsupported XML file (no stringpool)')
   
    if style_count:
      #implementation not tested
      #but does supporting them make any sense in replacement context
      raise Exception('unsupported XML file (has styles)')
      
    if flags&1:
      #we can't support sorted here, unless we parse the whole file and replace all refs
      raise Exception('unsupported XML file (sorted strings)')
     
    is_utf8 = flags&0x100
    
    strings = []
        
    idx_table = []
    for x in range(str_count):
      idx_table.append(struct.unpack('<I', buff.read(4))[0])
    
    new_idx_table = []
    new_head = 0
    
    for idx in idx_table:
      buff.seek(str_off + idx + head_len)
      l = 0
      
      this_str = ''
      
      if is_utf8:
        read_len(buff, 8)
        l = read_len(buff, 8)
        this_str = buff.read(l).decode('utf8')
      else:
        l = read_len(buff, 16)
        this_str = buff.read(l<<1).decode('utf-16-le')

      this_str = cb(this_str)
      
      if is_utf8:
        lp = pack_len(len(this_str), False)
        this_str = this_str.encode('utf8')
        lp += pack_len(len(this_str), False)
        
        this_str = lp + this_str + b'\x00'
      else:
        this_str = this_str.encode('utf-16-le')
        this_str = pack_len(len(this_str)>>1, True) + this_str + b'\x00\x00'
   
      strings.append(this_str)
      new_idx_table.append(new_head)
      new_head += len(this_str)
  
    for off in new_idx_table:
      f.write(struct.pack('<I', off))
    
    for bt in strings:
      f.write(bt)

    new_sp_size = f.tell()-head_len
    if new_sp_size & 0x3:
      pad = 4-(new_sp_size & 0x3)
      new_sp_size += pad
      f.write(b'\x00' * pad)

    buff.seek(sp_size+head_len)
    f.write(buff.read())

    whole_size = f.tell()

    #write proper strpool size
    f.seek(head_len+4)
    f.write(struct.pack('<I', new_sp_size))

    #write proper file size
    f.seek(0x4)
    f.write(struct.pack('<I', whole_size))
    
  os.rename(fn+'.tmp', fn)

#######################

if __name__ == "__main__":
  main()
   
      