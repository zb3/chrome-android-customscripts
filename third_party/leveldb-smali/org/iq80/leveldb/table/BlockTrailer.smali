.class public Lorg/iq80/leveldb/table/BlockTrailer;
.super Ljava/lang/Object;
.source "BlockTrailer.java"


# static fields
.field public static final ENCODED_LENGTH:I = 0x5


# instance fields
.field private final compressionType:Lorg/iq80/leveldb/CompressionType;

.field private final crc32c:I


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/CompressionType;I)V
    .locals 1
    .param p1, "compressionType"    # Lorg/iq80/leveldb/CompressionType;
    .param p2, "crc32c"    # I

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const-string v0, "compressionType is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    iput-object p1, p0, Lorg/iq80/leveldb/table/BlockTrailer;->compressionType:Lorg/iq80/leveldb/CompressionType;

    .line 39
    iput p2, p0, Lorg/iq80/leveldb/table/BlockTrailer;->crc32c:I

    .line 40
    return-void
.end method

.method public static readBlockTrailer(Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/table/BlockTrailer;
    .locals 4
    .param p0, "slice"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 95
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/Slice;->input()Lorg/iq80/leveldb/util/SliceInput;

    move-result-object v2

    .line 96
    .local v2, "sliceInput":Lorg/iq80/leveldb/util/SliceInput;
    invoke-virtual {v2}, Lorg/iq80/leveldb/util/SliceInput;->readUnsignedByte()I

    move-result v3

    invoke-static {v3}, Lorg/iq80/leveldb/CompressionType;->getCompressionTypeByPersistentId(I)Lorg/iq80/leveldb/CompressionType;

    move-result-object v0

    .line 97
    .local v0, "compressionType":Lorg/iq80/leveldb/CompressionType;
    invoke-virtual {v2}, Lorg/iq80/leveldb/util/SliceInput;->readInt()I

    move-result v1

    .line 98
    .local v1, "crc32c":I
    new-instance v3, Lorg/iq80/leveldb/table/BlockTrailer;

    invoke-direct {v3, v0, v1}, Lorg/iq80/leveldb/table/BlockTrailer;-><init>(Lorg/iq80/leveldb/CompressionType;I)V

    return-object v3
.end method

.method public static writeBlockTrailer(Lorg/iq80/leveldb/table/BlockTrailer;)Lorg/iq80/leveldb/util/Slice;
    .locals 2
    .param p0, "blockTrailer"    # Lorg/iq80/leveldb/table/BlockTrailer;

    .prologue
    .line 103
    const/4 v1, 0x5

    invoke-static {v1}, Lorg/iq80/leveldb/util/Slices;->allocate(I)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    .line 104
    .local v0, "slice":Lorg/iq80/leveldb/util/Slice;
    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Slice;->output()Lorg/iq80/leveldb/util/SliceOutput;

    move-result-object v1

    invoke-static {p0, v1}, Lorg/iq80/leveldb/table/BlockTrailer;->writeBlockTrailer(Lorg/iq80/leveldb/table/BlockTrailer;Lorg/iq80/leveldb/util/SliceOutput;)V

    .line 105
    return-object v0
.end method

.method public static writeBlockTrailer(Lorg/iq80/leveldb/table/BlockTrailer;Lorg/iq80/leveldb/util/SliceOutput;)V
    .locals 1
    .param p0, "blockTrailer"    # Lorg/iq80/leveldb/table/BlockTrailer;
    .param p1, "sliceOutput"    # Lorg/iq80/leveldb/util/SliceOutput;

    .prologue
    .line 110
    invoke-virtual {p0}, Lorg/iq80/leveldb/table/BlockTrailer;->getCompressionType()Lorg/iq80/leveldb/CompressionType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/iq80/leveldb/CompressionType;->persistentId()I

    move-result v0

    invoke-virtual {p1, v0}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 111
    invoke-virtual {p0}, Lorg/iq80/leveldb/table/BlockTrailer;->getCrc32c()I

    move-result v0

    invoke-virtual {p1, v0}, Lorg/iq80/leveldb/util/SliceOutput;->writeInt(I)V

    .line 112
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 55
    if-ne p0, p1, :cond_1

    .line 71
    :cond_0
    :goto_0
    return v1

    .line 58
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 59
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 62
    check-cast v0, Lorg/iq80/leveldb/table/BlockTrailer;

    .line 64
    .local v0, "that":Lorg/iq80/leveldb/table/BlockTrailer;
    iget v3, p0, Lorg/iq80/leveldb/table/BlockTrailer;->crc32c:I

    iget v4, v0, Lorg/iq80/leveldb/table/BlockTrailer;->crc32c:I

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 65
    goto :goto_0

    .line 67
    :cond_4
    iget-object v3, p0, Lorg/iq80/leveldb/table/BlockTrailer;->compressionType:Lorg/iq80/leveldb/CompressionType;

    iget-object v4, v0, Lorg/iq80/leveldb/table/BlockTrailer;->compressionType:Lorg/iq80/leveldb/CompressionType;

    if-eq v3, v4, :cond_0

    move v1, v2

    .line 68
    goto :goto_0
.end method

.method public getCompressionType()Lorg/iq80/leveldb/CompressionType;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lorg/iq80/leveldb/table/BlockTrailer;->compressionType:Lorg/iq80/leveldb/CompressionType;

    return-object v0
.end method

.method public getCrc32c()I
    .locals 1

    .prologue
    .line 49
    iget v0, p0, Lorg/iq80/leveldb/table/BlockTrailer;->crc32c:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 77
    iget-object v1, p0, Lorg/iq80/leveldb/table/BlockTrailer;->compressionType:Lorg/iq80/leveldb/CompressionType;

    invoke-virtual {v1}, Lorg/iq80/leveldb/CompressionType;->hashCode()I

    move-result v0

    .line 78
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lorg/iq80/leveldb/table/BlockTrailer;->crc32c:I

    add-int v0, v1, v2

    .line 79
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 85
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "BlockTrailer"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    const-string v1, "{compressionType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/table/BlockTrailer;->compressionType:Lorg/iq80/leveldb/CompressionType;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 88
    const-string v1, ", crc32c=0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/iq80/leveldb/table/BlockTrailer;->crc32c:I

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 90
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
