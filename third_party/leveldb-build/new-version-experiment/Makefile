BAKSMALI=../baksmali.jar
DESUGAR=../desugar.jar
DX=../build-tools-23/dx
REPO=pcmind/leveldb

BOOTCLASSPATH=~/Android/Sdk/platforms/android-23/android.jar
JAR_FILE=../../CustomScripts/lib/leveldb.jar
SMALI_FOLDER=../leveldb-smali

all: smali


v.gradle:
	git clone https://github.com/$(REPO) && \
	cd leveldb && \
	patch -p1 < ../guava.patch && \
	gradle init && \
	patch -p1 < ../fat_jar.patch && \
	need more patches
	touch $<
	touch $@
	
sugar.jar: v.gradle
	cd leveldb && \
	gradle jar && \
	mv leveldb/build/libs/*jar sugar.jar	
	

$(JAR_FILE): sugar.jar
	java -jar $(DESUGAR) --bootclasspath_entry $(BOOTCLASSPATH) --input sugar.jar --min_sdk_version 13 -o $(JAR_FILE)
	rm sugar.jar

smali: $(JAR_FILE)
	$(DX) --dex --output t.dex $(JAR_FILE)
	java -jar $(BAKSMALI) d --use-locals --sl -o $(SMALI_FOLDER) t.dex

clean:
	rm -rf leveldb $(JAR_FILE) $(SMALI_FOLDER) sugar.jar v.gradle
	

.PHONY: jar smali clean