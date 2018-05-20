.class final enum Lorg/iq80/leveldb/impl/VersionEditTag$1;
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
    .line 34
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
    .line 39
    invoke-static {p1}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->readVariableLengthInt(Lorg/iq80/leveldb/util/SliceInput;)I

    move-result v1

    new-array v0, v1, [B

    .line 40
    .local v0, "bytes":[B
    invoke-virtual {p1, v0}, Lorg/iq80/leveldb/util/SliceInput;->readBytes([B)V

    .line 41
    new-instance v1, Ljava/lang/String;

    sget-object v2, Lcom/google/common/base/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, v0, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-virtual {p2, v1}, Lorg/iq80/leveldb/impl/VersionEdit;->setComparatorName(Ljava/lang/String;)V

    .line 42
    return-void
.end method

.method public writeValue(Lorg/iq80/leveldb/util/SliceOutput;Lorg/iq80/leveldb/impl/VersionEdit;)V
    .locals 3
    .param p1, "sliceOutput"    # Lorg/iq80/leveldb/util/SliceOutput;
    .param p2, "versionEdit"    # Lorg/iq80/leveldb/impl/VersionEdit;

    .prologue
    .line 47
    invoke-virtual {p2}, Lorg/iq80/leveldb/impl/VersionEdit;->getComparatorName()Ljava/lang/String;

    move-result-object v1

    .line 48
    .local v1, "comparatorName":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 49
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/VersionEditTag$1;->getPersistentId()I

    move-result v2

    invoke-static {v2, p1}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->writeVariableLengthInt(ILorg/iq80/leveldb/util/SliceOutput;)V

    .line 50
    sget-object v2, Lcom/google/common/base/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 51
    .local v0, "bytes":[B
    array-length v2, v0

    invoke-static {v2, p1}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->writeVariableLengthInt(ILorg/iq80/leveldb/util/SliceOutput;)V

    .line 52
    invoke-virtual {p1, v0}, Lorg/iq80/leveldb/util/SliceOutput;->writeBytes([B)V

    .line 54
    .end local v0    # "bytes":[B
    :cond_0
    return-void
.end method
