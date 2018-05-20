.class final enum Lorg/iq80/leveldb/impl/VersionEditTag$8;
.super Lorg/iq80/leveldb/impl/VersionEditTag;
.source "VersionEditTag.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/impl/VersionEditTag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;II)V
    .locals 1
    .param p3, "persistentId"    # I

    .prologue
    .line 191
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/iq80/leveldb/impl/VersionEditTag;-><init>(Ljava/lang/String;IILorg/iq80/leveldb/impl/VersionEditTag$1;)V

    return-void
.end method


# virtual methods
.method public readValue(Lorg/iq80/leveldb/util/SliceInput;Lorg/iq80/leveldb/impl/VersionEdit;)V
    .locals 8
    .param p1, "sliceInput"    # Lorg/iq80/leveldb/util/SliceInput;
    .param p2, "versionEdit"    # Lorg/iq80/leveldb/impl/VersionEdit;

    .prologue
    .line 197
    invoke-static {p1}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->readVariableLengthInt(Lorg/iq80/leveldb/util/SliceInput;)I

    move-result v1

    .line 200
    .local v1, "level":I
    invoke-static {p1}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->readVariableLengthLong(Lorg/iq80/leveldb/util/SliceInput;)J

    move-result-wide v2

    .line 203
    .local v2, "fileNumber":J
    invoke-static {p1}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->readVariableLengthLong(Lorg/iq80/leveldb/util/SliceInput;)J

    move-result-wide v4

    .line 206
    .local v4, "fileSize":J
    new-instance v6, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-static {p1}, Lorg/iq80/leveldb/util/Slices;->readLengthPrefixedBytes(Lorg/iq80/leveldb/util/SliceInput;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    invoke-direct {v6, v0}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;)V

    .line 209
    .local v6, "smallestKey":Lorg/iq80/leveldb/impl/InternalKey;
    new-instance v7, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-static {p1}, Lorg/iq80/leveldb/util/Slices;->readLengthPrefixedBytes(Lorg/iq80/leveldb/util/SliceInput;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    invoke-direct {v7, v0}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;)V

    .local v7, "largestKey":Lorg/iq80/leveldb/impl/InternalKey;
    move-object v0, p2

    .line 211
    invoke-virtual/range {v0 .. v7}, Lorg/iq80/leveldb/impl/VersionEdit;->addFile(IJJLorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)V

    .line 212
    return-void
.end method

.method public writeValue(Lorg/iq80/leveldb/util/SliceOutput;Lorg/iq80/leveldb/impl/VersionEdit;)V
    .locals 6
    .param p1, "sliceOutput"    # Lorg/iq80/leveldb/util/SliceOutput;
    .param p2, "versionEdit"    # Lorg/iq80/leveldb/impl/VersionEdit;

    .prologue
    .line 217
    invoke-virtual {p2}, Lorg/iq80/leveldb/impl/VersionEdit;->getNewFiles()Lcom/google/common/collect/Multimap;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/common/collect/Multimap;->entries()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 218
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lorg/iq80/leveldb/impl/FileMetaData;>;"
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/VersionEditTag$8;->getPersistentId()I

    move-result v2

    invoke-static {v2, p1}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->writeVariableLengthInt(ILorg/iq80/leveldb/util/SliceOutput;)V

    .line 221
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2, p1}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->writeVariableLengthInt(ILorg/iq80/leveldb/util/SliceOutput;)V

    .line 224
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 225
    .local v1, "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/FileMetaData;->getNumber()J

    move-result-wide v4

    invoke-static {v4, v5, p1}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->writeVariableLengthLong(JLorg/iq80/leveldb/util/SliceOutput;)V

    .line 228
    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/FileMetaData;->getFileSize()J

    move-result-wide v4

    invoke-static {v4, v5, p1}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->writeVariableLengthLong(JLorg/iq80/leveldb/util/SliceOutput;)V

    .line 231
    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/FileMetaData;->getSmallest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v2

    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/InternalKey;->encode()Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    invoke-static {p1, v2}, Lorg/iq80/leveldb/util/Slices;->writeLengthPrefixedBytes(Lorg/iq80/leveldb/util/SliceOutput;Lorg/iq80/leveldb/util/Slice;)V

    .line 234
    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/FileMetaData;->getLargest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v2

    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/InternalKey;->encode()Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    invoke-static {p1, v2}, Lorg/iq80/leveldb/util/Slices;->writeLengthPrefixedBytes(Lorg/iq80/leveldb/util/SliceOutput;Lorg/iq80/leveldb/util/Slice;)V

    goto :goto_0

    .line 236
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lorg/iq80/leveldb/impl/FileMetaData;>;"
    .end local v1    # "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_0
    return-void
.end method
