.class public Lorg/iq80/leveldb/table/TableBuilder;
.super Ljava/lang/Object;
.source "TableBuilder.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final TABLE_MAGIC_NUMBER:J = -0x24b88adb747f04a9L


# instance fields
.field private final blockRestartInterval:I

.field private final blockSize:I

.field private closed:Z

.field private compressedOutput:Lorg/iq80/leveldb/util/Slice;

.field private final compressionType:Lorg/iq80/leveldb/CompressionType;

.field private final dataBlockBuilder:Lorg/iq80/leveldb/table/BlockBuilder;

.field private entryCount:J

.field private final fileChannel:Ljava/nio/channels/FileChannel;

.field private final indexBlockBuilder:Lorg/iq80/leveldb/table/BlockBuilder;

.field private lastKey:Lorg/iq80/leveldb/util/Slice;

.field private pendingHandle:Lorg/iq80/leveldb/table/BlockHandle;

.field private pendingIndexEntry:Z

.field private position:J

.field private final userComparator:Lorg/iq80/leveldb/table/UserComparator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-class v0, Lorg/iq80/leveldb/table/TableBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/iq80/leveldb/table/TableBuilder;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lorg/iq80/leveldb/Options;Ljava/nio/channels/FileChannel;Lorg/iq80/leveldb/table/UserComparator;)V
    .locals 10
    .param p1, "options"    # Lorg/iq80/leveldb/Options;
    .param p2, "fileChannel"    # Ljava/nio/channels/FileChannel;
    .param p3, "userComparator"    # Lorg/iq80/leveldb/table/UserComparator;

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    const-string v4, "options is null"

    invoke-static {p1, v4}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    const-string v4, "fileChannel is null"

    invoke-static {p2, v4}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    :try_start_0
    iget-wide v4, p0, Lorg/iq80/leveldb/table/TableBuilder;->position:J

    invoke-virtual {p2}, Ljava/nio/channels/FileChannel;->position()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-nez v4, :cond_0

    move v2, v3

    :cond_0
    const-string v4, "Expected position %s to equal fileChannel.position %s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-wide v8, p0, Lorg/iq80/leveldb/table/TableBuilder;->position:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-virtual {p2}, Ljava/nio/channels/FileChannel;->position()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v2, v4, v5}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    iput-object p2, p0, Lorg/iq80/leveldb/table/TableBuilder;->fileChannel:Ljava/nio/channels/FileChannel;

    .line 85
    iput-object p3, p0, Lorg/iq80/leveldb/table/TableBuilder;->userComparator:Lorg/iq80/leveldb/table/UserComparator;

    .line 87
    invoke-virtual {p1}, Lorg/iq80/leveldb/Options;->blockRestartInterval()I

    move-result v2

    iput v2, p0, Lorg/iq80/leveldb/table/TableBuilder;->blockRestartInterval:I

    .line 88
    invoke-virtual {p1}, Lorg/iq80/leveldb/Options;->blockSize()I

    move-result v2

    iput v2, p0, Lorg/iq80/leveldb/table/TableBuilder;->blockSize:I

    .line 89
    invoke-virtual {p1}, Lorg/iq80/leveldb/Options;->compressionType()Lorg/iq80/leveldb/CompressionType;

    move-result-object v2

    iput-object v2, p0, Lorg/iq80/leveldb/table/TableBuilder;->compressionType:Lorg/iq80/leveldb/CompressionType;

    .line 91
    new-instance v2, Lorg/iq80/leveldb/table/BlockBuilder;

    iget v4, p0, Lorg/iq80/leveldb/table/TableBuilder;->blockSize:I

    int-to-double v4, v4

    const-wide v6, 0x3ff199999999999aL    # 1.1

    mul-double/2addr v4, v6

    const-wide/high16 v6, 0x4140000000000000L    # 2097152.0

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(DD)D

    move-result-wide v4

    double-to-int v4, v4

    iget v5, p0, Lorg/iq80/leveldb/table/TableBuilder;->blockRestartInterval:I

    invoke-direct {v2, v4, v5, p3}, Lorg/iq80/leveldb/table/BlockBuilder;-><init>(IILjava/util/Comparator;)V

    iput-object v2, p0, Lorg/iq80/leveldb/table/TableBuilder;->dataBlockBuilder:Lorg/iq80/leveldb/table/BlockBuilder;

    .line 94
    const/16 v1, 0x400

    .line 95
    .local v1, "expectedNumberOfBlocks":I
    new-instance v2, Lorg/iq80/leveldb/table/BlockBuilder;

    const/16 v4, 0x5000

    invoke-direct {v2, v4, v3, p3}, Lorg/iq80/leveldb/table/BlockBuilder;-><init>(IILjava/util/Comparator;)V

    iput-object v2, p0, Lorg/iq80/leveldb/table/TableBuilder;->indexBlockBuilder:Lorg/iq80/leveldb/table/BlockBuilder;

    .line 97
    sget-object v2, Lorg/iq80/leveldb/util/Slices;->EMPTY_SLICE:Lorg/iq80/leveldb/util/Slice;

    iput-object v2, p0, Lorg/iq80/leveldb/table/TableBuilder;->lastKey:Lorg/iq80/leveldb/util/Slice;

    .line 98
    return-void

    .line 80
    .end local v1    # "expectedNumberOfBlocks":I
    :catch_0
    move-exception v0

    .line 81
    .local v0, "e":Ljava/io/IOException;
    invoke-static {v0}, Lcom/google/common/base/Throwables;->propagate(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2
.end method

.method public static crc32c(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/CompressionType;)I
    .locals 4
    .param p0, "data"    # Lorg/iq80/leveldb/util/Slice;
    .param p1, "type"    # Lorg/iq80/leveldb/CompressionType;

    .prologue
    .line 273
    new-instance v0, Lorg/iq80/leveldb/util/PureJavaCrc32C;

    invoke-direct {v0}, Lorg/iq80/leveldb/util/PureJavaCrc32C;-><init>()V

    .line 274
    .local v0, "crc32c":Lorg/iq80/leveldb/util/PureJavaCrc32C;
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/Slice;->getRawArray()[B

    move-result-object v1

    invoke-virtual {p0}, Lorg/iq80/leveldb/util/Slice;->getRawOffset()I

    move-result v2

    invoke-virtual {p0}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Lorg/iq80/leveldb/util/PureJavaCrc32C;->update([BII)V

    .line 275
    invoke-virtual {p1}, Lorg/iq80/leveldb/CompressionType;->persistentId()I

    move-result v1

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Lorg/iq80/leveldb/util/PureJavaCrc32C;->update(I)V

    .line 276
    invoke-virtual {v0}, Lorg/iq80/leveldb/util/PureJavaCrc32C;->getMaskedValue()I

    move-result v1

    return v1
.end method

.method private flush()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 154
    iget-boolean v0, p0, Lorg/iq80/leveldb/table/TableBuilder;->closed:Z

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    const-string v3, "table is finished"

    invoke-static {v0, v3}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 155
    iget-object v0, p0, Lorg/iq80/leveldb/table/TableBuilder;->dataBlockBuilder:Lorg/iq80/leveldb/table/BlockBuilder;

    invoke-virtual {v0}, Lorg/iq80/leveldb/table/BlockBuilder;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 163
    :goto_1
    return-void

    :cond_0
    move v0, v2

    .line 154
    goto :goto_0

    .line 159
    :cond_1
    iget-boolean v0, p0, Lorg/iq80/leveldb/table/TableBuilder;->pendingIndexEntry:Z

    if-nez v0, :cond_2

    move v2, v1

    :cond_2
    const-string v0, "Internal error: Table already has a pending index entry to flush"

    invoke-static {v2, v0}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 161
    iget-object v0, p0, Lorg/iq80/leveldb/table/TableBuilder;->dataBlockBuilder:Lorg/iq80/leveldb/table/BlockBuilder;

    invoke-direct {p0, v0}, Lorg/iq80/leveldb/table/TableBuilder;->writeBlock(Lorg/iq80/leveldb/table/BlockBuilder;)Lorg/iq80/leveldb/table/BlockHandle;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/table/TableBuilder;->pendingHandle:Lorg/iq80/leveldb/table/BlockHandle;

    .line 162
    iput-boolean v1, p0, Lorg/iq80/leveldb/table/TableBuilder;->pendingIndexEntry:Z

    goto :goto_1
.end method

.method private static maxCompressedLength(I)I
    .locals 2
    .param p0, "length"    # I

    .prologue
    .line 228
    add-int/lit8 v0, p0, 0x20

    div-int/lit8 v1, p0, 0x6

    add-int/2addr v0, v1

    return v0
.end method

.method private writeBlock(Lorg/iq80/leveldb/table/BlockBuilder;)Lorg/iq80/leveldb/table/BlockHandle;
    .locals 13
    .param p1, "blockBuilder"    # Lorg/iq80/leveldb/table/BlockBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    .line 169
    invoke-virtual {p1}, Lorg/iq80/leveldb/table/BlockBuilder;->finish()Lorg/iq80/leveldb/util/Slice;

    move-result-object v5

    .line 172
    .local v5, "raw":Lorg/iq80/leveldb/util/Slice;
    move-object v1, v5

    .line 173
    .local v1, "blockContents":Lorg/iq80/leveldb/util/Slice;
    sget-object v0, Lorg/iq80/leveldb/CompressionType;->NONE:Lorg/iq80/leveldb/CompressionType;

    .line 174
    .local v0, "blockCompressionType":Lorg/iq80/leveldb/CompressionType;
    iget-object v7, p0, Lorg/iq80/leveldb/table/TableBuilder;->compressionType:Lorg/iq80/leveldb/CompressionType;

    sget-object v8, Lorg/iq80/leveldb/CompressionType;->SNAPPY:Lorg/iq80/leveldb/CompressionType;

    if-ne v7, v8, :cond_0

    .line 175
    invoke-virtual {v5}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v7

    invoke-static {v7}, Lorg/iq80/leveldb/table/TableBuilder;->maxCompressedLength(I)I

    move-result v7

    invoke-virtual {p0, v7}, Lorg/iq80/leveldb/table/TableBuilder;->ensureCompressedOutputCapacity(I)V

    .line 177
    :try_start_0
    invoke-virtual {v5}, Lorg/iq80/leveldb/util/Slice;->getRawArray()[B

    move-result-object v7

    invoke-virtual {v5}, Lorg/iq80/leveldb/util/Slice;->getRawOffset()I

    move-result v8

    invoke-virtual {v5}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v9

    iget-object v10, p0, Lorg/iq80/leveldb/table/TableBuilder;->compressedOutput:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v10}, Lorg/iq80/leveldb/util/Slice;->getRawArray()[B

    move-result-object v10

    const/4 v11, 0x0

    invoke-static {v7, v8, v9, v10, v11}, Lorg/iq80/leveldb/util/Snappy;->compress([BII[BI)I

    move-result v4

    .line 180
    .local v4, "compressedSize":I
    invoke-virtual {v5}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v7

    invoke-virtual {v5}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v8

    div-int/lit8 v8, v8, 0x8

    sub-int/2addr v7, v8

    if-ge v4, v7, :cond_0

    .line 181
    iget-object v7, p0, Lorg/iq80/leveldb/table/TableBuilder;->compressedOutput:Lorg/iq80/leveldb/util/Slice;

    const/4 v8, 0x0

    invoke-virtual {v7, v8, v4}, Lorg/iq80/leveldb/util/Slice;->slice(II)Lorg/iq80/leveldb/util/Slice;

    move-result-object v1

    .line 182
    sget-object v0, Lorg/iq80/leveldb/CompressionType;->SNAPPY:Lorg/iq80/leveldb/CompressionType;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 191
    .end local v4    # "compressedSize":I
    :cond_0
    :goto_0
    new-instance v3, Lorg/iq80/leveldb/table/BlockTrailer;

    invoke-static {v1, v0}, Lorg/iq80/leveldb/table/TableBuilder;->crc32c(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/CompressionType;)I

    move-result v7

    invoke-direct {v3, v0, v7}, Lorg/iq80/leveldb/table/BlockTrailer;-><init>(Lorg/iq80/leveldb/CompressionType;I)V

    .line 192
    .local v3, "blockTrailer":Lorg/iq80/leveldb/table/BlockTrailer;
    invoke-static {v3}, Lorg/iq80/leveldb/table/BlockTrailer;->writeBlockTrailer(Lorg/iq80/leveldb/table/BlockTrailer;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v6

    .line 195
    .local v6, "trailer":Lorg/iq80/leveldb/util/Slice;
    new-instance v2, Lorg/iq80/leveldb/table/BlockHandle;

    iget-wide v8, p0, Lorg/iq80/leveldb/table/TableBuilder;->position:J

    invoke-virtual {v1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v7

    invoke-direct {v2, v8, v9, v7}, Lorg/iq80/leveldb/table/BlockHandle;-><init>(JI)V

    .line 198
    .local v2, "blockHandle":Lorg/iq80/leveldb/table/BlockHandle;
    iget-wide v8, p0, Lorg/iq80/leveldb/table/TableBuilder;->position:J

    iget-object v7, p0, Lorg/iq80/leveldb/table/TableBuilder;->fileChannel:Ljava/nio/channels/FileChannel;

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Lorg/iq80/leveldb/util/Slice;->toByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v11

    aput-object v11, v10, v12

    const/4 v11, 0x1

    invoke-virtual {v6}, Lorg/iq80/leveldb/util/Slice;->toByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-virtual {v7, v10}, Ljava/nio/channels/FileChannel;->write([Ljava/nio/ByteBuffer;)J

    move-result-wide v10

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/iq80/leveldb/table/TableBuilder;->position:J

    .line 201
    invoke-virtual {p1}, Lorg/iq80/leveldb/table/BlockBuilder;->reset()V

    .line 203
    return-object v2

    .line 185
    .end local v2    # "blockHandle":Lorg/iq80/leveldb/table/BlockHandle;
    .end local v3    # "blockTrailer":Lorg/iq80/leveldb/table/BlockTrailer;
    .end local v6    # "trailer":Lorg/iq80/leveldb/util/Slice;
    :catch_0
    move-exception v7

    goto :goto_0
.end method


# virtual methods
.method public abandon()V
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 267
    iget-boolean v0, p0, Lorg/iq80/leveldb/table/TableBuilder;->closed:Z

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    const-string v2, "table is finished"

    invoke-static {v0, v2}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 268
    iput-boolean v1, p0, Lorg/iq80/leveldb/table/TableBuilder;->closed:Z

    .line 269
    return-void

    .line 267
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public add(Lorg/iq80/leveldb/table/BlockEntry;)V
    .locals 2
    .param p1, "blockEntry"    # Lorg/iq80/leveldb/table/BlockEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 114
    const-string v0, "blockEntry is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    invoke-virtual {p1}, Lorg/iq80/leveldb/table/BlockEntry;->getKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    invoke-virtual {p1}, Lorg/iq80/leveldb/table/BlockEntry;->getValue()Lorg/iq80/leveldb/util/Slice;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/iq80/leveldb/table/TableBuilder;->add(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)V

    .line 116
    return-void
.end method

.method public add(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)V
    .locals 10
    .param p1, "key"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "value"    # Lorg/iq80/leveldb/util/Slice;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 121
    const-string v3, "key is null"

    invoke-static {p1, v3}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    const-string v3, "value is null"

    invoke-static {p2, v3}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    iget-boolean v3, p0, Lorg/iq80/leveldb/table/TableBuilder;->closed:Z

    if-nez v3, :cond_0

    const/4 v3, 0x1

    :goto_0
    const-string v5, "table is finished"

    invoke-static {v3, v5}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 126
    iget-wide v6, p0, Lorg/iq80/leveldb/table/TableBuilder;->entryCount:J

    const-wide/16 v8, 0x0

    cmp-long v3, v6, v8

    if-lez v3, :cond_1

    .line 127
    sget-boolean v3, Lorg/iq80/leveldb/table/TableBuilder;->$assertionsDisabled:Z

    if-nez v3, :cond_1

    iget-object v3, p0, Lorg/iq80/leveldb/table/TableBuilder;->userComparator:Lorg/iq80/leveldb/table/UserComparator;

    iget-object v5, p0, Lorg/iq80/leveldb/table/TableBuilder;->lastKey:Lorg/iq80/leveldb/util/Slice;

    invoke-interface {v3, p1, v5}, Lorg/iq80/leveldb/table/UserComparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v3

    if-gtz v3, :cond_1

    new-instance v3, Ljava/lang/AssertionError;

    const-string v4, "key must be greater than last key"

    invoke-direct {v3, v4}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3

    :cond_0
    move v3, v4

    .line 124
    goto :goto_0

    .line 131
    :cond_1
    iget-boolean v3, p0, Lorg/iq80/leveldb/table/TableBuilder;->pendingIndexEntry:Z

    if-eqz v3, :cond_2

    .line 132
    iget-object v3, p0, Lorg/iq80/leveldb/table/TableBuilder;->dataBlockBuilder:Lorg/iq80/leveldb/table/BlockBuilder;

    invoke-virtual {v3}, Lorg/iq80/leveldb/table/BlockBuilder;->isEmpty()Z

    move-result v3

    const-string v5, "Internal error: Table has a pending index entry but data block builder is empty"

    invoke-static {v3, v5}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 134
    iget-object v3, p0, Lorg/iq80/leveldb/table/TableBuilder;->userComparator:Lorg/iq80/leveldb/table/UserComparator;

    iget-object v5, p0, Lorg/iq80/leveldb/table/TableBuilder;->lastKey:Lorg/iq80/leveldb/util/Slice;

    invoke-interface {v3, v5, p1}, Lorg/iq80/leveldb/table/UserComparator;->findShortestSeparator(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    .line 136
    .local v2, "shortestSeparator":Lorg/iq80/leveldb/util/Slice;
    iget-object v3, p0, Lorg/iq80/leveldb/table/TableBuilder;->pendingHandle:Lorg/iq80/leveldb/table/BlockHandle;

    invoke-static {v3}, Lorg/iq80/leveldb/table/BlockHandle;->writeBlockHandle(Lorg/iq80/leveldb/table/BlockHandle;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v1

    .line 137
    .local v1, "handleEncoding":Lorg/iq80/leveldb/util/Slice;
    iget-object v3, p0, Lorg/iq80/leveldb/table/TableBuilder;->indexBlockBuilder:Lorg/iq80/leveldb/table/BlockBuilder;

    invoke-virtual {v3, v2, v1}, Lorg/iq80/leveldb/table/BlockBuilder;->add(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)V

    .line 138
    iput-boolean v4, p0, Lorg/iq80/leveldb/table/TableBuilder;->pendingIndexEntry:Z

    .line 141
    .end local v1    # "handleEncoding":Lorg/iq80/leveldb/util/Slice;
    .end local v2    # "shortestSeparator":Lorg/iq80/leveldb/util/Slice;
    :cond_2
    iput-object p1, p0, Lorg/iq80/leveldb/table/TableBuilder;->lastKey:Lorg/iq80/leveldb/util/Slice;

    .line 142
    iget-wide v4, p0, Lorg/iq80/leveldb/table/TableBuilder;->entryCount:J

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    iput-wide v4, p0, Lorg/iq80/leveldb/table/TableBuilder;->entryCount:J

    .line 143
    iget-object v3, p0, Lorg/iq80/leveldb/table/TableBuilder;->dataBlockBuilder:Lorg/iq80/leveldb/table/BlockBuilder;

    invoke-virtual {v3, p1, p2}, Lorg/iq80/leveldb/table/BlockBuilder;->add(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)V

    .line 145
    iget-object v3, p0, Lorg/iq80/leveldb/table/TableBuilder;->dataBlockBuilder:Lorg/iq80/leveldb/table/BlockBuilder;

    invoke-virtual {v3}, Lorg/iq80/leveldb/table/BlockBuilder;->currentSizeEstimate()I

    move-result v0

    .line 146
    .local v0, "estimatedBlockSize":I
    iget v3, p0, Lorg/iq80/leveldb/table/TableBuilder;->blockSize:I

    if-lt v0, v3, :cond_3

    .line 147
    invoke-direct {p0}, Lorg/iq80/leveldb/table/TableBuilder;->flush()V

    .line 149
    :cond_3
    return-void
.end method

.method public ensureCompressedOutputCapacity(I)V
    .locals 1
    .param p1, "capacity"    # I

    .prologue
    .line 281
    iget-object v0, p0, Lorg/iq80/leveldb/table/TableBuilder;->compressedOutput:Lorg/iq80/leveldb/util/Slice;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/iq80/leveldb/table/TableBuilder;->compressedOutput:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v0

    if-le v0, p1, :cond_0

    .line 285
    :goto_0
    return-void

    .line 284
    :cond_0
    invoke-static {p1}, Lorg/iq80/leveldb/util/Slices;->allocate(I)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/table/TableBuilder;->compressedOutput:Lorg/iq80/leveldb/util/Slice;

    goto :goto_0
.end method

.method public finish()V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 234
    iget-boolean v7, p0, Lorg/iq80/leveldb/table/TableBuilder;->closed:Z

    if-nez v7, :cond_1

    move v7, v8

    :goto_0
    const-string v10, "table is finished"

    invoke-static {v7, v10}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 237
    invoke-direct {p0}, Lorg/iq80/leveldb/table/TableBuilder;->flush()V

    .line 240
    iput-boolean v8, p0, Lorg/iq80/leveldb/table/TableBuilder;->closed:Z

    .line 243
    new-instance v4, Lorg/iq80/leveldb/table/BlockBuilder;

    const/16 v7, 0x100

    iget v8, p0, Lorg/iq80/leveldb/table/TableBuilder;->blockRestartInterval:I

    new-instance v10, Lorg/iq80/leveldb/table/BytewiseComparator;

    invoke-direct {v10}, Lorg/iq80/leveldb/table/BytewiseComparator;-><init>()V

    invoke-direct {v4, v7, v8, v10}, Lorg/iq80/leveldb/table/BlockBuilder;-><init>(IILjava/util/Comparator;)V

    .line 245
    .local v4, "metaIndexBlockBuilder":Lorg/iq80/leveldb/table/BlockBuilder;
    invoke-direct {p0, v4}, Lorg/iq80/leveldb/table/TableBuilder;->writeBlock(Lorg/iq80/leveldb/table/BlockBuilder;)Lorg/iq80/leveldb/table/BlockHandle;

    move-result-object v5

    .line 248
    .local v5, "metaindexBlockHandle":Lorg/iq80/leveldb/table/BlockHandle;
    iget-boolean v7, p0, Lorg/iq80/leveldb/table/TableBuilder;->pendingIndexEntry:Z

    if-eqz v7, :cond_0

    .line 249
    iget-object v7, p0, Lorg/iq80/leveldb/table/TableBuilder;->userComparator:Lorg/iq80/leveldb/table/UserComparator;

    iget-object v8, p0, Lorg/iq80/leveldb/table/TableBuilder;->lastKey:Lorg/iq80/leveldb/util/Slice;

    invoke-interface {v7, v8}, Lorg/iq80/leveldb/table/UserComparator;->findShortSuccessor(Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v6

    .line 251
    .local v6, "shortSuccessor":Lorg/iq80/leveldb/util/Slice;
    iget-object v7, p0, Lorg/iq80/leveldb/table/TableBuilder;->pendingHandle:Lorg/iq80/leveldb/table/BlockHandle;

    invoke-static {v7}, Lorg/iq80/leveldb/table/BlockHandle;->writeBlockHandle(Lorg/iq80/leveldb/table/BlockHandle;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    .line 252
    .local v2, "handleEncoding":Lorg/iq80/leveldb/util/Slice;
    iget-object v7, p0, Lorg/iq80/leveldb/table/TableBuilder;->indexBlockBuilder:Lorg/iq80/leveldb/table/BlockBuilder;

    invoke-virtual {v7, v6, v2}, Lorg/iq80/leveldb/table/BlockBuilder;->add(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)V

    .line 253
    iput-boolean v9, p0, Lorg/iq80/leveldb/table/TableBuilder;->pendingIndexEntry:Z

    .line 257
    .end local v2    # "handleEncoding":Lorg/iq80/leveldb/util/Slice;
    .end local v6    # "shortSuccessor":Lorg/iq80/leveldb/util/Slice;
    :cond_0
    iget-object v7, p0, Lorg/iq80/leveldb/table/TableBuilder;->indexBlockBuilder:Lorg/iq80/leveldb/table/BlockBuilder;

    invoke-direct {p0, v7}, Lorg/iq80/leveldb/table/TableBuilder;->writeBlock(Lorg/iq80/leveldb/table/BlockBuilder;)Lorg/iq80/leveldb/table/BlockHandle;

    move-result-object v3

    .line 260
    .local v3, "indexBlockHandle":Lorg/iq80/leveldb/table/BlockHandle;
    new-instance v0, Lorg/iq80/leveldb/table/Footer;

    invoke-direct {v0, v5, v3}, Lorg/iq80/leveldb/table/Footer;-><init>(Lorg/iq80/leveldb/table/BlockHandle;Lorg/iq80/leveldb/table/BlockHandle;)V

    .line 261
    .local v0, "footer":Lorg/iq80/leveldb/table/Footer;
    invoke-static {v0}, Lorg/iq80/leveldb/table/Footer;->writeFooter(Lorg/iq80/leveldb/table/Footer;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v1

    .line 262
    .local v1, "footerEncoding":Lorg/iq80/leveldb/util/Slice;
    iget-wide v8, p0, Lorg/iq80/leveldb/table/TableBuilder;->position:J

    iget-object v7, p0, Lorg/iq80/leveldb/table/TableBuilder;->fileChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v1}, Lorg/iq80/leveldb/util/Slice;->toByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/nio/channels/FileChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v7

    int-to-long v10, v7

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/iq80/leveldb/table/TableBuilder;->position:J

    .line 263
    return-void

    .end local v0    # "footer":Lorg/iq80/leveldb/table/Footer;
    .end local v1    # "footerEncoding":Lorg/iq80/leveldb/util/Slice;
    .end local v3    # "indexBlockHandle":Lorg/iq80/leveldb/table/BlockHandle;
    .end local v4    # "metaIndexBlockBuilder":Lorg/iq80/leveldb/table/BlockBuilder;
    .end local v5    # "metaindexBlockHandle":Lorg/iq80/leveldb/table/BlockHandle;
    :cond_1
    move v7, v9

    .line 234
    goto :goto_0
.end method

.method public getEntryCount()J
    .locals 2

    .prologue
    .line 102
    iget-wide v0, p0, Lorg/iq80/leveldb/table/TableBuilder;->entryCount:J

    return-wide v0
.end method

.method public getFileSize()J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 108
    iget-wide v0, p0, Lorg/iq80/leveldb/table/TableBuilder;->position:J

    iget-object v2, p0, Lorg/iq80/leveldb/table/TableBuilder;->dataBlockBuilder:Lorg/iq80/leveldb/table/BlockBuilder;

    invoke-virtual {v2}, Lorg/iq80/leveldb/table/BlockBuilder;->currentSizeEstimate()I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    return-wide v0
.end method
