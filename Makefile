export ENABLE_SW
export INSECURE
export NEWPKG

APKTOOL=third_party/apktool.jar
BAKSMALI=third_party/baksmali.jar
BT_DIR=third_party/build-tools/
KEYSTORE=misc/release-key.keystore
KEYSTORE_PWD=pass:dummy123
APK=apk/patched.apk
PROJECT=CustomScripts
JARDIR=$(PROJECT)/dist

export PATH := $(PATH):$(BT_DIR)

all: apk
java: $(JARDIR)/out

#Compile the source using normal java (1.7)

$(JARDIR)/$(PROJECT).jar: $(shell find $(PROJECT)/src $(PROJECT)/lib)
	ant -f $(PROJECT) clean jar

#jar to dex using dx, we can do this without desugar here, since our source is compatible with 1.7	
$(JARDIR)/cs.dex: $(JARDIR)/$(PROJECT).jar
	dx --dex --core-library --output=$(JARDIR)/cs.dex $<
	
#technically cs.dex could be a thrid dex, but we baksmali for now
$(JARDIR)/out: $(JARDIR)/cs.dex
	java -jar $(BAKSMALI) d -o $@ $(JARDIR)/cs.dex

#now we want to copy our code and patch existing chromium code
#patch.py checks file contents and resets modification date
#so it should always be executed

patch: $(JARDIR)/out
	python3 patch.py

keystore:
	@if [ ! -f $(KEYSTORE) ]; then \
		keytool -genkey -v -keystore $(KEYSTORE) -alias alias_name \
		  -dname "CN=CustomScripts" -keyalg RSA -keysize 2048 -validity 10000 \
			-storepass dummy123 -keypass dummy123; \
	fi

#apktool also checks modtime
apk: patch keystore
	mkdir -p `dirname $(APK)`
	java -jar $(APKTOOL) -p misc b chrome -o $(APK)
	zipalign -fpv 4 $(APK) $(APK)_aligned
	rm $(APK)
	mv $(APK)_aligned $(APK)
	apksigner sign --ks $(KEYSTORE) --ks-pass $(KEYSTORE_PWD) $(APK)
	
clean:
	rm -rf $(JARDIR) $(PROJECT)/build
	rm -rf chrome/smali_classes2
	
cleanmore: clean
	rm -rf chrome/build
	
totalclean: clean
	rm -rf chrome


.PHONY: java patch keystore apk clean cleanmore totalclean