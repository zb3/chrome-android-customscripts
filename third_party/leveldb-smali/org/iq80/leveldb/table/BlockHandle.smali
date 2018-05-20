.class public Lorg/iq80/leveldb/table/BlockHandle;
.super Ljava/lang/Object;
.source "BlockHandle.java"


# static fields
.field public static final MAX_ENCODED_LENGTH:I = 0x14


# instance fields
.field private final dataSize:I

.field private final offset:J


# direct methods
.method constructor <init>(JI)V
    .locals 1
    .param p1, "offset"    # J
    .param p3, "dataSize"    # I

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-wide p1, p0, Lorg/iq80/leveldb/table/BlockHandle;->offset:J

    .line 36
    iput p3, p0, Lorg/iq80/leveldb/table/BlockHandle;->dataSize:I

    .line 37
    return-void
.end method

.method public static readBlockHandle(Lorg/iq80/leveldb/util/SliceInput;)Lorg/iq80/leveldb/table/BlockHandle;
    .locals 6
    .param p0, "sliceInput"    # Lorg/iq80/leveldb/util/SliceInput;

    .prologue
    .line 97
    invoke-static {p0}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->readVariableLengthLong(Lorg/iq80/leveldb/util/SliceInput;)J

    move-result-wide v0

    .line 98
    .local v0, "offset":J
    invoke-static {p0}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->readVariableLengthLong(Lorg/iq80/leveldb/util/SliceInput;)J

    move-result-wide v2

    .line 100
    .local v2, "size":J
    const-wide/32 v4, 0x7fffffff

    cmp-long v4, v2, v4

    if-lez v4, :cond_0

    .line 101
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Blocks can not be larger than Integer.MAX_VALUE"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 104
    :cond_0
    new-instance v4, Lorg/iq80/leveldb/table/BlockHandle;

    long-to-int v5, v2

    invoke-direct {v4, v0, v1, v5}, Lorg/iq80/leveldb/table/BlockHandle;-><init>(JI)V

    return-object v4
.end method

.method public static writeBlockHandle(Lorg/iq80/leveldb/table/BlockHandle;)Lorg/iq80/leveldb/util/Slice;
    .locals 3
    .param p0, "blockHandle"    # Lorg/iq80/leveldb/table/BlockHandle;

    .prologue
    .line 109
    const/16 v2, 0x14

    invoke-static {v2}, Lorg/iq80/leveldb/util/Slices;->allocate(I)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    .line 110
    .local v0, "slice":Lorg/iq80/leveldb/util/Slice;
    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Slice;->output()Lorg/iq80/leveldb/util/SliceOutput;

    move-result-object v1

    .line 111
    .local v1, "sliceOutput":Lorg/iq80/leveldb/util/SliceOutput;
    invoke-static {p0, v1}, Lorg/iq80/leveldb/table/BlockHandle;->writeBlockHandleTo(Lorg/iq80/leveldb/table/BlockHandle;Lorg/iq80/leveldb/util/SliceOutput;)V

    .line 112
    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Slice;->slice()Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    return-object v2
.end method

.method public static writeBlockHandleTo(Lorg/iq80/leveldb/table/BlockHandle;Lorg/iq80/leveldb/util/SliceOutput;)V
    .locals 2
    .param p0, "blockHandle"    # Lorg/iq80/leveldb/table/BlockHandle;
    .param p1, "sliceOutput"    # Lorg/iq80/leveldb/util/SliceOutput;

    .prologue
    .line 117
    iget-wide v0, p0, Lorg/iq80/leveldb/table/BlockHandle;->offset:J

    invoke-static {v0, v1, p1}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->writeVariableLengthLong(JLorg/iq80/leveldb/util/SliceOutput;)V

    .line 118
    iget v0, p0, Lorg/iq80/leveldb/table/BlockHandle;->dataSize:I

    int-to-long v0, v0

    invoke-static {v0, v1, p1}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->writeVariableLengthLong(JLorg/iq80/leveldb/util/SliceOutput;)V

    .line 119
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 8
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 57
    if-ne p0, p1, :cond_1

    .line 73
    :cond_0
    :goto_0
    return v1

    .line 60
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 61
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 64
    check-cast v0, Lorg/iq80/leveldb/table/BlockHandle;

    .line 66
    .local v0, "that":Lorg/iq80/leveldb/table/BlockHandle;
    iget v3, p0, Lorg/iq80/leveldb/table/BlockHandle;->dataSize:I

    iget v4, v0, Lorg/iq80/leveldb/table/BlockHandle;->dataSize:I

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 67
    goto :goto_0

    .line 69
    :cond_4
    iget-wide v4, p0, Lorg/iq80/leveldb/table/BlockHandle;->offset:J

    iget-wide v6, v0, Lorg/iq80/leveldb/table/BlockHandle;->offset:J

    cmp-long v3, v4, v6

    if-eqz v3, :cond_0

    move v1, v2

    .line 70
    goto :goto_0
.end method

.method public getDataSize()I
    .locals 1

    .prologue
    .line 46
    iget v0, p0, Lorg/iq80/leveldb/table/BlockHandle;->dataSize:I

    return v0
.end method

.method public getFullBlockSize()I
    .locals 1

    .prologue
    .line 51
    iget v0, p0, Lorg/iq80/leveldb/table/BlockHandle;->dataSize:I

    add-int/lit8 v0, v0, 0x5

    return v0
.end method

.method public getOffset()J
    .locals 2

    .prologue
    .line 41
    iget-wide v0, p0, Lorg/iq80/leveldb/table/BlockHandle;->offset:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 6

    .prologue
    .line 79
    iget-wide v2, p0, Lorg/iq80/leveldb/table/BlockHandle;->offset:J

    iget-wide v4, p0, Lorg/iq80/leveldb/table/BlockHandle;->offset:J

    const/16 v1, 0x20

    ushr-long/2addr v4, v1

    xor-long/2addr v2, v4

    long-to-int v0, v2

    .line 80
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lorg/iq80/leveldb/table/BlockHandle;->dataSize:I

    add-int v0, v1, v2

    .line 81
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 87
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 88
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "BlockHandle"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    const-string v1, "{offset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/iq80/leveldb/table/BlockHandle;->offset:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 90
    const-string v1, ", dataSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/iq80/leveldb/table/BlockHandle;->dataSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 92
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
