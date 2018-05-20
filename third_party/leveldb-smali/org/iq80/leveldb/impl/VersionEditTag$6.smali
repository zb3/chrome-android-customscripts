.class final enum Lorg/iq80/leveldb/impl/VersionEditTag$6;
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
    .line 133
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/iq80/leveldb/impl/VersionEditTag;-><init>(Ljava/lang/String;IILorg/iq80/leveldb/impl/VersionEditTag$1;)V

    return-void
.end method


# virtual methods
.method public readValue(Lorg/iq80/leveldb/util/SliceInput;Lorg/iq80/leveldb/impl/VersionEdit;)V
    .locals 3
    .param p1, "sliceInput"    # Lorg/iq80/leveldb/util/SliceInput;
    .param p2, "versionEdit"    # Lorg/iq80/leveldb/impl/VersionEdit;

    .prologue
    .line 139
    invoke-static {p1}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->readVariableLengthInt(Lorg/iq80/leveldb/util/SliceInput;)I

    move-result v1

    .line 142
    .local v1, "level":I
    new-instance v0, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-static {p1}, Lorg/iq80/leveldb/util/Slices;->readLengthPrefixedBytes(Lorg/iq80/leveldb/util/SliceInput;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;)V

    .line 144
    .local v0, "internalKey":Lorg/iq80/leveldb/impl/InternalKey;
    invoke-virtual {p2, v1, v0}, Lorg/iq80/leveldb/impl/VersionEdit;->setCompactPointer(ILorg/iq80/leveldb/impl/InternalKey;)V

    .line 145
    return-void
.end method

.method public writeValue(Lorg/iq80/leveldb/util/SliceOutput;Lorg/iq80/leveldb/impl/VersionEdit;)V
    .locals 3
    .param p1, "sliceOutput"    # Lorg/iq80/leveldb/util/SliceOutput;
    .param p2, "versionEdit"    # Lorg/iq80/leveldb/impl/VersionEdit;

    .prologue
    .line 150
    invoke-virtual {p2}, Lorg/iq80/leveldb/impl/VersionEdit;->getCompactPointers()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 151
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lorg/iq80/leveldb/impl/InternalKey;>;"
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/VersionEditTag$6;->getPersistentId()I

    move-result v1

    invoke-static {v1, p1}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->writeVariableLengthInt(ILorg/iq80/leveldb/util/SliceOutput;)V

    .line 154
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1, p1}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->writeVariableLengthInt(ILorg/iq80/leveldb/util/SliceOutput;)V

    .line 157
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/InternalKey;->encode()Lorg/iq80/leveldb/util/Slice;

    move-result-object v1

    invoke-static {p1, v1}, Lorg/iq80/leveldb/util/Slices;->writeLengthPrefixedBytes(Lorg/iq80/leveldb/util/SliceOutput;Lorg/iq80/leveldb/util/Slice;)V

    goto :goto_0

    .line 159
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lorg/iq80/leveldb/impl/InternalKey;>;"
    :cond_0
    return-void
.end method
