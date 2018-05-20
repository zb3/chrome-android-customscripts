BAKSMALI=../baksmali.jar
DX=../build-tools-23/dx
REPO=dain/leveldb

DIR=leveldb
JAR_FILE=../../CustomScripts/lib/leveldb.jar
SMALI_FOLDER=../leveldb-smali

all: $(SMALI_FOLDER)

leveldb.ok:
	git clone https://github.com/$(REPO) && \
	cd $(DIR) && \
	git checkout 39b6e0c38045281fba5f6532c52dc06905890cad && \
	patch -p1 < ../fix_file_size.patch && \
	patch -p1 < ../finalizer.patch && \
	gradle init && \
	patch -p1 < ../fat_jar.patch
	touch $@
	
$(JAR_FILE): leveldb.ok
	cd $(DIR) && \
	gradle jar && \
	mv leveldb/build/libs/*jar ../$(JAR_FILE)

$(DIR)/t.dex: $(JAR_FILE)
	$(DX) --dex --output $@ $(JAR_FILE)

$(SMALI_FOLDER): $(DIR)/t.dex
	java -jar $(BAKSMALI) d --use-locals --sl -o $@ $<


clean:
	rm -rf $(DIR) $(JAR_FILE) $(SMALI_FOLDER) leveldb.ok
	

.PHONY: clean