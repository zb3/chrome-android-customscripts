.class final enum Lorg/iq80/leveldb/impl/VersionEditTag$7;
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
    .line 162
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
    .line 168
    invoke-static {p1}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->readVariableLengthInt(Lorg/iq80/leveldb/util/SliceInput;)I

    move-result v2

    .line 171
    .local v2, "level":I
    invoke-static {p1}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->readVariableLengthLong(Lorg/iq80/leveldb/util/SliceInput;)J

    move-result-wide v0

    .line 173
    .local v0, "fileNumber":J
    invoke-virtual {p2, v2, v0, v1}, Lorg/iq80/leveldb/impl/VersionEdit;->deleteFile(IJ)V

    .line 174
    return-void
.end method

.method public writeValue(Lorg/iq80/leveldb/util/SliceOutput;Lorg/iq80/leveldb/impl/VersionEdit;)V
    .locals 6
    .param p1, "sliceOutput"    # Lorg/iq80/leveldb/util/SliceOutput;
    .param p2, "versionEdit"    # Lorg/iq80/leveldb/impl/VersionEdit;

    .prologue
    .line 179
    invoke-virtual {p2}, Lorg/iq80/leveldb/impl/VersionEdit;->getDeletedFiles()Lcom/google/common/collect/Multimap;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/common/collect/Multimap;->entries()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 180
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Long;>;"
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/VersionEditTag$7;->getPersistentId()I

    move-result v1

    invoke-static {v1, p1}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->writeVariableLengthInt(ILorg/iq80/leveldb/util/SliceOutput;)V

    .line 183
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1, p1}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->writeVariableLengthInt(ILorg/iq80/leveldb/util/SliceOutput;)V

    .line 186
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-static {v4, v5, p1}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->writeVariableLengthLong(JLorg/iq80/leveldb/util/SliceOutput;)V

    goto :goto_0

    .line 188
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Long;>;"
    :cond_0
    return-void
.end method
