import os
import shutil

from patchlib.patchlib import *
from patchlib import brsc

#should be idempotent when making changes, but not when changing build flags
#we compare patched files' contents, and restore modtime when they don't change
#this is to avoid resmaling classes.dex

no_sw = os.getenv('NO_SW')
insecure_mode = os.getenv('INSECURE')
new_package_name = os.getenv('NEWPKG')

##

new_dir = 'CustomScripts/dist/out/'
base_out_dir = 'chrome/'
src_dir = base_out_dir+'smali/'
src2_dir = base_out_dir+'smali_classes2/'

wci_create_sig = 'private static create(JLorg/chromium/content_public/browser/NavigationController;)Lorg/chromium/content/browser/webcontents/WebContentsImpl;'
wci_execute_sig = 'public executeJS(Ljava/lang/String;Lorg/chromium/content_public/browser/JavaScriptCallback;)V'
wci_cb_sig = 'private static onEvaluateJavaScriptResult(Ljava/lang/String;Lorg/chromium/content_public/browser/JavaScriptCallback;)V'
ca_ic_sig = 'public initializeCompositor()V'


def main():
  orig_dir = os.getcwd()
  
  csm_cls = 'pl/zb3/customscripts/CustomScriptsManager'

  set_class_flags(new_dir+csm_cls+'.smali', csm_cls, (
    ('INSECURE', insecure_mode),
    ('NO_SW', no_sw)
  ))

  #needed?
  replace_method(new_dir+csm_cls+'.smali', 'public static main([Ljava/lang/String;)V', '', True)

  #make wci public
  ensure_public(src_dir+'org/chromium/content/browser/webcontents/WebContentsImpl.smali')
  
  #these could be done in a loop
  
  #replace wci create method
  replace_method(src_dir+'org/chromium/content/browser/webcontents/WebContentsImpl.smali', wci_create_sig, extract_method(new_dir+'org/chromium/content/browser/webcontents/WebContentsImpl.smali', wci_create_sig))
  
  #replace wci cb method
  replace_method(src_dir+'org/chromium/content/browser/webcontents/WebContentsImpl.smali', wci_cb_sig, extract_method(new_dir+'org/chromium/content/browser/webcontents/WebContentsImpl.smali', wci_cb_sig))
  
  #add executeJS methods
  replace_method(src_dir+'org/chromium/content/browser/webcontents/WebContentsImpl.smali', wci_execute_sig, extract_method(new_dir+'org/chromium/content/browser/webcontents/WebContentsImpl.smali', wci_execute_sig), True)
  
  #patch CA initializeCompositor
  mc = method_contents(extract_method(new_dir+'org/chromium/chrome/browser/ChromeActivity.smali', ca_ic_sig))
  patch_before(src_dir+'org/chromium/chrome/browser/ChromeActivity.smali', ca_ic_sig, 'cs-init', '    return-void', mc)
  
  #copy JSC class since it's been stripped by PG
  copy(new_dir+'org/chromium/content_public/browser/JavaScriptCallback.smali', src_dir+'org/chromium/content_public/browser')
  
  
  #copy our packages, they all go to classes2.dex to prevent overflows
    
  copytree(new_dir+'pl/zb3/customscripts', src2_dir+'pl/zb3/customscripts', False)
  
  #code should check for sw classes at runtime, so it's safe to skip them
  
  if no_sw:
    shutil.rmtree(src2_dir+'pl/zb3/customscripts/sw')
  
  if not no_sw:
    copytree(new_dir+'com/google/protobuf', src2_dir+'com/google/protobuf', False)
  
    #copy original (with one patch) leveldb library + deps
    for fn in os.listdir('third_party/leveldb-smali'):
      path = os.path.join('third_party/leveldb-smali', fn)
    
      if os.path.isdir(path):
        copytree(path, src2_dir+fn, False)
      else:
        shutil.copy(path, src2_dir)
  
    #copy our leveldb patches
    copytree(new_dir+'org/iq80', src2_dir+'org/iq80', False)
    
    
  if new_package_name:
    rename_package(new_package_name)  


def rename_package(new_package_name):
  to_replace_res = ('AndroidManifest.xml',
                    'res/xml/launchershortcuts.xml',
                    'res/xml/syncadapter.xml',
                    'res/xml/icing_search_corpora.xml',
                    'res/xml/searchable.xml',
                    'res/xml-v22/launchershortcuts.xml')
                    
  old_name = ''

  def change_name(name):
    nonlocal old_name
  
    print('olt', name)
    old_name = name
    return new_package_name
    
  brsc.arsc_package_name(base_out_dir+'resources.arsc', change_name)
  if old_name != new_package_name:
    def replace_cb(name):
      return name.replace(old_name, new_package_name)
                  
    for res in to_replace_res:
      if os.path.exists(base_out_dir+res):
        brsc.str_replace(base_out_dir+res, replace_cb)
  
  
  
#######################

if __name__ == "__main__":
  main()
  
  
  