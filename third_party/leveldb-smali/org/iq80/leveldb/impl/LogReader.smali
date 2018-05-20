.class public Lorg/iq80/leveldb/impl/LogReader;
.super Ljava/lang/Object;
.source "LogReader.java"


# instance fields
.field private final blockScratch:Lorg/iq80/leveldb/util/SliceOutput;

.field private currentBlock:Lorg/iq80/leveldb/util/SliceInput;

.field private currentChunk:Lorg/iq80/leveldb/util/Slice;

.field private endOfBufferOffset:J

.field private eof:Z

.field private final fileChannel:Ljava/nio/channels/FileChannel;

.field private final initialOffset:J

.field private lastRecordOffset:J

.field private final monitor:Lorg/iq80/leveldb/impl/LogMonitor;

.field private final recordScratch:Lorg/iq80/leveldb/util/DynamicSliceOutput;

.field private final verifyChecksums:Z


# direct methods
.method public constructor <init>(Ljava/nio/channels/FileChannel;Lorg/iq80/leveldb/impl/LogMonitor;ZJ)V
    .locals 2
    .param p1, "fileChannel"    # Ljava/nio/channels/FileChannel;
    .param p2, "monitor"    # Lorg/iq80/leveldb/impl/LogMonitor;
    .param p3, "verifyChecksums"    # Z
    .param p4, "initialOffset"    # J

    .prologue
    const v1, 0x8000

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    new-instance v0, Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-direct {v0, v1}, Lorg/iq80/leveldb/util/DynamicSliceOutput;-><init>(I)V

    iput-object v0, p0, Lorg/iq80/leveldb/impl/LogReader;->recordScratch:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    .line 74
    invoke-static {v1}, Lorg/iq80/leveldb/util/Slices;->allocate(I)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Slice;->output()Lorg/iq80/leveldb/util/SliceOutput;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/LogReader;->blockScratch:Lorg/iq80/leveldb/util/SliceOutput;

    .line 79
    sget-object v0, Lorg/iq80/leveldb/util/Slices;->EMPTY_SLICE:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Slice;->input()Lorg/iq80/leveldb/util/SliceInput;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/LogReader;->currentBlock:Lorg/iq80/leveldb/util/SliceInput;

    .line 84
    sget-object v0, Lorg/iq80/leveldb/util/Slices;->EMPTY_SLICE:Lorg/iq80/leveldb/util/Slice;

    iput-object v0, p0, Lorg/iq80/leveldb/impl/LogReader;->currentChunk:Lorg/iq80/leveldb/util/Slice;

    .line 88
    iput-object p1, p0, Lorg/iq80/leveldb/impl/LogReader;->fileChannel:Ljava/nio/channels/FileChannel;

    .line 89
    iput-object p2, p0, Lorg/iq80/leveldb/impl/LogReader;->monitor:Lorg/iq80/leveldb/impl/LogMonitor;

    .line 90
    iput-boolean p3, p0, Lorg/iq80/leveldb/impl/LogReader;->verifyChecksums:Z

    .line 91
    iput-wide p4, p0, Lorg/iq80/leveldb/impl/LogReader;->initialOffset:J

    .line 92
    return-void
.end method

.method private readNextChunk()Lorg/iq80/leveldb/impl/LogChunkType;
    .locals 12

    .prologue
    .line 234
    sget-object v6, Lorg/iq80/leveldb/util/Slices;->EMPTY_SLICE:Lorg/iq80/leveldb/util/Slice;

    iput-object v6, p0, Lorg/iq80/leveldb/impl/LogReader;->currentChunk:Lorg/iq80/leveldb/util/Slice;

    .line 237
    iget-object v6, p0, Lorg/iq80/leveldb/impl/LogReader;->currentBlock:Lorg/iq80/leveldb/util/SliceInput;

    invoke-virtual {v6}, Lorg/iq80/leveldb/util/SliceInput;->available()I

    move-result v6

    const/4 v7, 0x7

    if-ge v6, v7, :cond_1

    .line 238
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/LogReader;->readNextBlock()Z

    move-result v6

    if-nez v6, :cond_1

    .line 239
    iget-boolean v6, p0, Lorg/iq80/leveldb/impl/LogReader;->eof:Z

    if-eqz v6, :cond_1

    .line 240
    sget-object v1, Lorg/iq80/leveldb/impl/LogChunkType;->EOF:Lorg/iq80/leveldb/impl/LogChunkType;

    .line 298
    :cond_0
    :goto_0
    return-object v1

    .line 246
    :cond_1
    iget-object v6, p0, Lorg/iq80/leveldb/impl/LogReader;->currentBlock:Lorg/iq80/leveldb/util/SliceInput;

    invoke-virtual {v6}, Lorg/iq80/leveldb/util/SliceInput;->readInt()I

    move-result v4

    .line 247
    .local v4, "expectedChecksum":I
    iget-object v6, p0, Lorg/iq80/leveldb/impl/LogReader;->currentBlock:Lorg/iq80/leveldb/util/SliceInput;

    invoke-virtual {v6}, Lorg/iq80/leveldb/util/SliceInput;->readUnsignedByte()I

    move-result v5

    .line 248
    .local v5, "length":I
    iget-object v6, p0, Lorg/iq80/leveldb/impl/LogReader;->currentBlock:Lorg/iq80/leveldb/util/SliceInput;

    invoke-virtual {v6}, Lorg/iq80/leveldb/util/SliceInput;->readUnsignedByte()I

    move-result v6

    shl-int/lit8 v6, v6, 0x8

    or-int/2addr v5, v6

    .line 249
    iget-object v6, p0, Lorg/iq80/leveldb/impl/LogReader;->currentBlock:Lorg/iq80/leveldb/util/SliceInput;

    invoke-virtual {v6}, Lorg/iq80/leveldb/util/SliceInput;->readByte()B

    move-result v2

    .line 250
    .local v2, "chunkTypeId":B
    invoke-static {v2}, Lorg/iq80/leveldb/impl/LogChunkType;->getLogChunkTypeByPersistentId(I)Lorg/iq80/leveldb/impl/LogChunkType;

    move-result-object v1

    .line 253
    .local v1, "chunkType":Lorg/iq80/leveldb/impl/LogChunkType;
    iget-object v6, p0, Lorg/iq80/leveldb/impl/LogReader;->currentBlock:Lorg/iq80/leveldb/util/SliceInput;

    invoke-virtual {v6}, Lorg/iq80/leveldb/util/SliceInput;->available()I

    move-result v6

    if-le v5, v6, :cond_2

    .line 254
    iget-object v6, p0, Lorg/iq80/leveldb/impl/LogReader;->currentBlock:Lorg/iq80/leveldb/util/SliceInput;

    invoke-virtual {v6}, Lorg/iq80/leveldb/util/SliceInput;->available()I

    move-result v6

    add-int/lit8 v3, v6, 0x7

    .line 255
    .local v3, "dropSize":I
    int-to-long v6, v3

    const-string v8, "Invalid chunk length"

    invoke-direct {p0, v6, v7, v8}, Lorg/iq80/leveldb/impl/LogReader;->reportCorruption(JLjava/lang/String;)V

    .line 256
    sget-object v6, Lorg/iq80/leveldb/util/Slices;->EMPTY_SLICE:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v6}, Lorg/iq80/leveldb/util/Slice;->input()Lorg/iq80/leveldb/util/SliceInput;

    move-result-object v6

    iput-object v6, p0, Lorg/iq80/leveldb/impl/LogReader;->currentBlock:Lorg/iq80/leveldb/util/SliceInput;

    .line 257
    sget-object v1, Lorg/iq80/leveldb/impl/LogChunkType;->BAD_CHUNK:Lorg/iq80/leveldb/impl/LogChunkType;

    goto :goto_0

    .line 261
    .end local v3    # "dropSize":I
    :cond_2
    sget-object v6, Lorg/iq80/leveldb/impl/LogChunkType;->ZERO_TYPE:Lorg/iq80/leveldb/impl/LogChunkType;

    if-ne v1, v6, :cond_3

    if-nez v5, :cond_3

    .line 264
    sget-object v6, Lorg/iq80/leveldb/util/Slices;->EMPTY_SLICE:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v6}, Lorg/iq80/leveldb/util/Slice;->input()Lorg/iq80/leveldb/util/SliceInput;

    move-result-object v6

    iput-object v6, p0, Lorg/iq80/leveldb/impl/LogReader;->currentBlock:Lorg/iq80/leveldb/util/SliceInput;

    .line 265
    sget-object v1, Lorg/iq80/leveldb/impl/LogChunkType;->BAD_CHUNK:Lorg/iq80/leveldb/impl/LogChunkType;

    goto :goto_0

    .line 269
    :cond_3
    iget-wide v6, p0, Lorg/iq80/leveldb/impl/LogReader;->endOfBufferOffset:J

    const-wide/16 v8, 0x7

    sub-long/2addr v6, v8

    int-to-long v8, v5

    sub-long/2addr v6, v8

    iget-wide v8, p0, Lorg/iq80/leveldb/impl/LogReader;->initialOffset:J

    cmp-long v6, v6, v8

    if-gez v6, :cond_4

    .line 270
    iget-object v6, p0, Lorg/iq80/leveldb/impl/LogReader;->currentBlock:Lorg/iq80/leveldb/util/SliceInput;

    invoke-virtual {v6, v5}, Lorg/iq80/leveldb/util/SliceInput;->skipBytes(I)I

    .line 271
    sget-object v1, Lorg/iq80/leveldb/impl/LogChunkType;->BAD_CHUNK:Lorg/iq80/leveldb/impl/LogChunkType;

    goto :goto_0

    .line 275
    :cond_4
    iget-object v6, p0, Lorg/iq80/leveldb/impl/LogReader;->currentBlock:Lorg/iq80/leveldb/util/SliceInput;

    invoke-virtual {v6, v5}, Lorg/iq80/leveldb/util/SliceInput;->readBytes(I)Lorg/iq80/leveldb/util/Slice;

    move-result-object v6

    iput-object v6, p0, Lorg/iq80/leveldb/impl/LogReader;->currentChunk:Lorg/iq80/leveldb/util/Slice;

    .line 277
    iget-boolean v6, p0, Lorg/iq80/leveldb/impl/LogReader;->verifyChecksums:Z

    if-eqz v6, :cond_5

    .line 278
    iget-object v6, p0, Lorg/iq80/leveldb/impl/LogReader;->currentChunk:Lorg/iq80/leveldb/util/Slice;

    invoke-static {v2, v6}, Lorg/iq80/leveldb/impl/Logs;->getChunkChecksum(ILorg/iq80/leveldb/util/Slice;)I

    move-result v0

    .line 279
    .local v0, "actualChecksum":I
    if-eq v0, v4, :cond_5

    .line 284
    iget-object v6, p0, Lorg/iq80/leveldb/impl/LogReader;->currentBlock:Lorg/iq80/leveldb/util/SliceInput;

    invoke-virtual {v6}, Lorg/iq80/leveldb/util/SliceInput;->available()I

    move-result v6

    add-int/lit8 v3, v6, 0x7

    .line 285
    .restart local v3    # "dropSize":I
    sget-object v6, Lorg/iq80/leveldb/util/Slices;->EMPTY_SLICE:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v6}, Lorg/iq80/leveldb/util/Slice;->input()Lorg/iq80/leveldb/util/SliceInput;

    move-result-object v6

    iput-object v6, p0, Lorg/iq80/leveldb/impl/LogReader;->currentBlock:Lorg/iq80/leveldb/util/SliceInput;

    .line 286
    int-to-long v6, v3

    const-string v8, "Invalid chunk checksum"

    invoke-direct {p0, v6, v7, v8}, Lorg/iq80/leveldb/impl/LogReader;->reportCorruption(JLjava/lang/String;)V

    .line 287
    sget-object v1, Lorg/iq80/leveldb/impl/LogChunkType;->BAD_CHUNK:Lorg/iq80/leveldb/impl/LogChunkType;

    goto/16 :goto_0

    .line 293
    .end local v0    # "actualChecksum":I
    .end local v3    # "dropSize":I
    :cond_5
    sget-object v6, Lorg/iq80/leveldb/impl/LogChunkType;->UNKNOWN:Lorg/iq80/leveldb/impl/LogChunkType;

    if-ne v1, v6, :cond_0

    .line 294
    int-to-long v6, v5

    const-string v8, "Unknown chunk type %d"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/LogChunkType;->getPersistentId()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v6, v7, v8}, Lorg/iq80/leveldb/impl/LogReader;->reportCorruption(JLjava/lang/String;)V

    .line 295
    sget-object v1, Lorg/iq80/leveldb/impl/LogChunkType;->BAD_CHUNK:Lorg/iq80/leveldb/impl/LogChunkType;

    goto/16 :goto_0
.end method

.method private reportCorruption(JLjava/lang/String;)V
    .locals 1
    .param p1, "bytes"    # J
    .param p3, "reason"    # Ljava/lang/String;

    .prologue
    .line 339
    iget-object v0, p0, Lorg/iq80/leveldb/impl/LogReader;->monitor:Lorg/iq80/leveldb/impl/LogMonitor;

    if-eqz v0, :cond_0

    .line 340
    iget-object v0, p0, Lorg/iq80/leveldb/impl/LogReader;->monitor:Lorg/iq80/leveldb/impl/LogMonitor;

    invoke-interface {v0, p1, p2, p3}, Lorg/iq80/leveldb/impl/LogMonitor;->corruption(JLjava/lang/String;)V

    .line 342
    :cond_0
    return-void
.end method

.method private reportDrop(JLjava/lang/Throwable;)V
    .locals 1
    .param p1, "bytes"    # J
    .param p3, "reason"    # Ljava/lang/Throwable;

    .prologue
    .line 350
    iget-object v0, p0, Lorg/iq80/leveldb/impl/LogReader;->monitor:Lorg/iq80/leveldb/impl/LogMonitor;

    if-eqz v0, :cond_0

    .line 351
    iget-object v0, p0, Lorg/iq80/leveldb/impl/LogReader;->monitor:Lorg/iq80/leveldb/impl/LogMonitor;

    invoke-interface {v0, p1, p2, p3}, Lorg/iq80/leveldb/impl/LogMonitor;->corruption(JLjava/lang/Throwable;)V

    .line 353
    :cond_0
    return-void
.end method

.method private skipToInitialBlock()Z
    .locals 10

    .prologue
    const-wide/32 v8, 0x8000

    .line 108
    iget-wide v4, p0, Lorg/iq80/leveldb/impl/LogReader;->initialOffset:J

    rem-long/2addr v4, v8

    long-to-int v3, v4

    .line 109
    .local v3, "offsetInBlock":I
    iget-wide v4, p0, Lorg/iq80/leveldb/impl/LogReader;->initialOffset:J

    int-to-long v6, v3

    sub-long v0, v4, v6

    .line 112
    .local v0, "blockStartLocation":J
    const/16 v4, 0x7ffa

    if-le v3, v4, :cond_0

    .line 113
    add-long/2addr v0, v8

    .line 116
    :cond_0
    iput-wide v0, p0, Lorg/iq80/leveldb/impl/LogReader;->endOfBufferOffset:J

    .line 119
    const-wide/16 v4, 0x0

    cmp-long v4, v0, v4

    if-lez v4, :cond_1

    .line 121
    :try_start_0
    iget-object v4, p0, Lorg/iq80/leveldb/impl/LogReader;->fileChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v4, v0, v1}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    :cond_1
    const/4 v4, 0x1

    :goto_0
    return v4

    .line 123
    :catch_0
    move-exception v2

    .line 124
    .local v2, "e":Ljava/io/IOException;
    invoke-direct {p0, v0, v1, v2}, Lorg/iq80/leveldb/impl/LogReader;->reportDrop(JLjava/lang/Throwable;)V

    .line 125
    const/4 v4, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getLastRecordOffset()J
    .locals 2

    .prologue
    .line 96
    iget-wide v0, p0, Lorg/iq80/leveldb/impl/LogReader;->lastRecordOffset:J

    return-wide v0
.end method

.method public readNextBlock()Z
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v2, 0x0

    .line 303
    iget-boolean v3, p0, Lorg/iq80/leveldb/impl/LogReader;->eof:Z

    if-eqz v3, :cond_0

    .line 330
    :goto_0
    return v2

    .line 308
    :cond_0
    iget-object v3, p0, Lorg/iq80/leveldb/impl/LogReader;->blockScratch:Lorg/iq80/leveldb/util/SliceOutput;

    invoke-virtual {v3}, Lorg/iq80/leveldb/util/SliceOutput;->reset()V

    .line 311
    :goto_1
    iget-object v3, p0, Lorg/iq80/leveldb/impl/LogReader;->blockScratch:Lorg/iq80/leveldb/util/SliceOutput;

    invoke-virtual {v3}, Lorg/iq80/leveldb/util/SliceOutput;->writableBytes()I

    move-result v3

    if-lez v3, :cond_1

    .line 313
    :try_start_0
    iget-object v3, p0, Lorg/iq80/leveldb/impl/LogReader;->blockScratch:Lorg/iq80/leveldb/util/SliceOutput;

    iget-object v4, p0, Lorg/iq80/leveldb/impl/LogReader;->fileChannel:Ljava/nio/channels/FileChannel;

    iget-object v5, p0, Lorg/iq80/leveldb/impl/LogReader;->blockScratch:Lorg/iq80/leveldb/util/SliceOutput;

    invoke-virtual {v5}, Lorg/iq80/leveldb/util/SliceOutput;->writableBytes()I

    move-result v5

    invoke-virtual {v3, v4, v5}, Lorg/iq80/leveldb/util/SliceOutput;->writeBytes(Ljava/nio/channels/ScatteringByteChannel;I)I

    move-result v0

    .line 314
    .local v0, "bytesRead":I
    if-gez v0, :cond_2

    .line 316
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/iq80/leveldb/impl/LogReader;->eof:Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 329
    .end local v0    # "bytesRead":I
    :cond_1
    iget-object v2, p0, Lorg/iq80/leveldb/impl/LogReader;->blockScratch:Lorg/iq80/leveldb/util/SliceOutput;

    invoke-virtual {v2}, Lorg/iq80/leveldb/util/SliceOutput;->slice()Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    invoke-virtual {v2}, Lorg/iq80/leveldb/util/Slice;->input()Lorg/iq80/leveldb/util/SliceInput;

    move-result-object v2

    iput-object v2, p0, Lorg/iq80/leveldb/impl/LogReader;->currentBlock:Lorg/iq80/leveldb/util/SliceInput;

    .line 330
    iget-object v2, p0, Lorg/iq80/leveldb/impl/LogReader;->currentBlock:Lorg/iq80/leveldb/util/SliceInput;

    invoke-virtual {v2}, Lorg/iq80/leveldb/util/SliceInput;->isReadable()Z

    move-result v2

    goto :goto_0

    .line 319
    .restart local v0    # "bytesRead":I
    :cond_2
    :try_start_1
    iget-wide v4, p0, Lorg/iq80/leveldb/impl/LogReader;->endOfBufferOffset:J

    int-to-long v6, v0

    add-long/2addr v4, v6

    iput-wide v4, p0, Lorg/iq80/leveldb/impl/LogReader;->endOfBufferOffset:J
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 321
    .end local v0    # "bytesRead":I
    :catch_0
    move-exception v1

    .line 322
    .local v1, "e":Ljava/io/IOException;
    sget-object v3, Lorg/iq80/leveldb/util/Slices;->EMPTY_SLICE:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v3}, Lorg/iq80/leveldb/util/Slice;->input()Lorg/iq80/leveldb/util/SliceInput;

    move-result-object v3

    iput-object v3, p0, Lorg/iq80/leveldb/impl/LogReader;->currentBlock:Lorg/iq80/leveldb/util/SliceInput;

    .line 323
    const-wide/32 v4, 0x8000

    invoke-direct {p0, v4, v5, v1}, Lorg/iq80/leveldb/impl/LogReader;->reportDrop(JLjava/lang/Throwable;)V

    .line 324
    iput-boolean v8, p0, Lorg/iq80/leveldb/impl/LogReader;->eof:Z

    goto :goto_0
.end method

.method public readRecord()Lorg/iq80/leveldb/util/Slice;
    .locals 13

    .prologue
    const/4 v3, 0x0

    .line 134
    iget-object v8, p0, Lorg/iq80/leveldb/impl/LogReader;->recordScratch:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v8}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->reset()V

    .line 137
    iget-wide v8, p0, Lorg/iq80/leveldb/impl/LogReader;->lastRecordOffset:J

    iget-wide v10, p0, Lorg/iq80/leveldb/impl/LogReader;->initialOffset:J

    cmp-long v8, v8, v10

    if-gez v8, :cond_1

    .line 138
    invoke-direct {p0}, Lorg/iq80/leveldb/impl/LogReader;->skipToInitialBlock()Z

    move-result v8

    if-nez v8, :cond_1

    .line 205
    :cond_0
    :goto_0
    return-object v3

    .line 144
    :cond_1
    const-wide/16 v6, 0x0

    .line 146
    .local v6, "prospectiveRecordOffset":J
    const/4 v2, 0x0

    .line 148
    .local v2, "inFragmentedRecord":Z
    :cond_2
    :goto_1
    iget-wide v8, p0, Lorg/iq80/leveldb/impl/LogReader;->endOfBufferOffset:J

    iget-object v10, p0, Lorg/iq80/leveldb/impl/LogReader;->currentChunk:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v10}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v10

    int-to-long v10, v10

    sub-long v4, v8, v10

    .line 149
    .local v4, "physicalRecordOffset":J
    invoke-direct {p0}, Lorg/iq80/leveldb/impl/LogReader;->readNextChunk()Lorg/iq80/leveldb/impl/LogChunkType;

    move-result-object v0

    .line 150
    .local v0, "chunkType":Lorg/iq80/leveldb/impl/LogChunkType;
    sget-object v8, Lorg/iq80/leveldb/impl/LogReader$1;->$SwitchMap$org$iq80$leveldb$impl$LogChunkType:[I

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/LogChunkType;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_0

    .line 216
    iget-object v8, p0, Lorg/iq80/leveldb/impl/LogReader;->currentChunk:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v8}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v1

    .line 217
    .local v1, "dropSize":I
    if-eqz v2, :cond_3

    .line 218
    iget-object v8, p0, Lorg/iq80/leveldb/impl/LogReader;->recordScratch:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v8}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->size()I

    move-result v8

    add-int/2addr v1, v8

    .line 220
    :cond_3
    int-to-long v8, v1

    const-string v10, "Unexpected chunk type %s"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v0, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v8, v9, v10}, Lorg/iq80/leveldb/impl/LogReader;->reportCorruption(JLjava/lang/String;)V

    .line 221
    const/4 v2, 0x0

    .line 222
    iget-object v8, p0, Lorg/iq80/leveldb/impl/LogReader;->recordScratch:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v8}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->reset()V

    goto :goto_1

    .line 152
    .end local v1    # "dropSize":I
    :pswitch_0
    if-eqz v2, :cond_4

    .line 153
    iget-object v3, p0, Lorg/iq80/leveldb/impl/LogReader;->recordScratch:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v3}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->size()I

    move-result v3

    int-to-long v8, v3

    const-string v3, "Partial record without end"

    invoke-direct {p0, v8, v9, v3}, Lorg/iq80/leveldb/impl/LogReader;->reportCorruption(JLjava/lang/String;)V

    .line 156
    :cond_4
    iget-object v3, p0, Lorg/iq80/leveldb/impl/LogReader;->recordScratch:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v3}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->reset()V

    .line 157
    move-wide v6, v4

    .line 158
    iput-wide v6, p0, Lorg/iq80/leveldb/impl/LogReader;->lastRecordOffset:J

    .line 159
    iget-object v3, p0, Lorg/iq80/leveldb/impl/LogReader;->currentChunk:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v3}, Lorg/iq80/leveldb/util/Slice;->copySlice()Lorg/iq80/leveldb/util/Slice;

    move-result-object v3

    goto :goto_0

    .line 162
    :pswitch_1
    if-eqz v2, :cond_5

    .line 163
    iget-object v8, p0, Lorg/iq80/leveldb/impl/LogReader;->recordScratch:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v8}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->size()I

    move-result v8

    int-to-long v8, v8

    const-string v10, "Partial record without end"

    invoke-direct {p0, v8, v9, v10}, Lorg/iq80/leveldb/impl/LogReader;->reportCorruption(JLjava/lang/String;)V

    .line 165
    iget-object v8, p0, Lorg/iq80/leveldb/impl/LogReader;->recordScratch:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v8}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->reset()V

    .line 167
    :cond_5
    move-wide v6, v4

    .line 168
    iget-object v8, p0, Lorg/iq80/leveldb/impl/LogReader;->recordScratch:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    iget-object v9, p0, Lorg/iq80/leveldb/impl/LogReader;->currentChunk:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v8, v9}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->writeBytes(Lorg/iq80/leveldb/util/Slice;)V

    .line 169
    const/4 v2, 0x1

    .line 170
    goto :goto_1

    .line 173
    :pswitch_2
    if-nez v2, :cond_6

    .line 174
    iget-object v8, p0, Lorg/iq80/leveldb/impl/LogReader;->recordScratch:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v8}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->size()I

    move-result v8

    int-to-long v8, v8

    const-string v10, "Missing start of fragmented record"

    invoke-direct {p0, v8, v9, v10}, Lorg/iq80/leveldb/impl/LogReader;->reportCorruption(JLjava/lang/String;)V

    .line 177
    iget-object v8, p0, Lorg/iq80/leveldb/impl/LogReader;->recordScratch:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v8}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->reset()V

    goto/16 :goto_1

    .line 180
    :cond_6
    iget-object v8, p0, Lorg/iq80/leveldb/impl/LogReader;->recordScratch:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    iget-object v9, p0, Lorg/iq80/leveldb/impl/LogReader;->currentChunk:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v8, v9}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->writeBytes(Lorg/iq80/leveldb/util/Slice;)V

    goto/16 :goto_1

    .line 185
    :pswitch_3
    if-nez v2, :cond_7

    .line 186
    iget-object v8, p0, Lorg/iq80/leveldb/impl/LogReader;->recordScratch:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v8}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->size()I

    move-result v8

    int-to-long v8, v8

    const-string v10, "Missing start of fragmented record"

    invoke-direct {p0, v8, v9, v10}, Lorg/iq80/leveldb/impl/LogReader;->reportCorruption(JLjava/lang/String;)V

    .line 189
    iget-object v8, p0, Lorg/iq80/leveldb/impl/LogReader;->recordScratch:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v8}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->reset()V

    goto/16 :goto_1

    .line 192
    :cond_7
    iget-object v3, p0, Lorg/iq80/leveldb/impl/LogReader;->recordScratch:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    iget-object v8, p0, Lorg/iq80/leveldb/impl/LogReader;->currentChunk:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v3, v8}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->writeBytes(Lorg/iq80/leveldb/util/Slice;)V

    .line 193
    iput-wide v6, p0, Lorg/iq80/leveldb/impl/LogReader;->lastRecordOffset:J

    .line 194
    iget-object v3, p0, Lorg/iq80/leveldb/impl/LogReader;->recordScratch:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v3}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->slice()Lorg/iq80/leveldb/util/Slice;

    move-result-object v3

    invoke-virtual {v3}, Lorg/iq80/leveldb/util/Slice;->copySlice()Lorg/iq80/leveldb/util/Slice;

    move-result-object v3

    goto/16 :goto_0

    .line 199
    :pswitch_4
    if-eqz v2, :cond_0

    .line 200
    iget-object v8, p0, Lorg/iq80/leveldb/impl/LogReader;->recordScratch:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v8}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->size()I

    move-result v8

    int-to-long v8, v8

    const-string v10, "Partial record without end"

    invoke-direct {p0, v8, v9, v10}, Lorg/iq80/leveldb/impl/LogReader;->reportCorruption(JLjava/lang/String;)V

    .line 203
    iget-object v8, p0, Lorg/iq80/leveldb/impl/LogReader;->recordScratch:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v8}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->reset()V

    goto/16 :goto_0

    .line 208
    :pswitch_5
    if-eqz v2, :cond_2

    .line 209
    iget-object v8, p0, Lorg/iq80/leveldb/impl/LogReader;->recordScratch:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v8}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->size()I

    move-result v8

    int-to-long v8, v8

    const-string v10, "Error in middle of record"

    invoke-direct {p0, v8, v9, v10}, Lorg/iq80/leveldb/impl/LogReader;->reportCorruption(JLjava/lang/String;)V

    .line 210
    const/4 v2, 0x0

    .line 211
    iget-object v8, p0, Lorg/iq80/leveldb/impl/LogReader;->recordScratch:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v8}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->reset()V

    goto/16 :goto_1

    .line 150
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method
