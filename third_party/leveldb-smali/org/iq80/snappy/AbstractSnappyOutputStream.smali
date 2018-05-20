.class abstract Lorg/iq80/snappy/AbstractSnappyOutputStream;
.super Ljava/io/OutputStream;
.source "AbstractSnappyOutputStream.java"


# instance fields
.field private final blockSize:I

.field private final buffer:[B

.field private closed:Z

.field private final minCompressionRatio:D

.field private final out:Ljava/io/OutputStream;

.field private final outputBuffer:[B

.field private position:I

.field private final recycler:Lorg/iq80/snappy/BufferRecycler;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;ID)V
    .locals 7
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "blockSize"    # I
    .param p3, "minCompressionRatio"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 63
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 64
    const-string v0, "out is null"

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {p1, v0, v3}, Lorg/iq80/snappy/SnappyInternalUtils;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/OutputStream;

    iput-object v0, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->out:Ljava/io/OutputStream;

    .line 65
    const-wide/16 v4, 0x0

    cmpl-double v0, p3, v4

    if-lez v0, :cond_0

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    cmpg-double v0, p3, v4

    if-gtz v0, :cond_0

    move v0, v1

    :goto_0
    const-string v3, "minCompressionRatio %1s must be between (0,1.0]."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    aput-object v4, v1, v2

    invoke-static {v0, v3, v1}, Lorg/iq80/snappy/SnappyInternalUtils;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 66
    iput-wide p3, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->minCompressionRatio:D

    .line 67
    invoke-static {}, Lorg/iq80/snappy/BufferRecycler;->instance()Lorg/iq80/snappy/BufferRecycler;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->recycler:Lorg/iq80/snappy/BufferRecycler;

    .line 68
    iput p2, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->blockSize:I

    .line 69
    iget-object v0, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->recycler:Lorg/iq80/snappy/BufferRecycler;

    invoke-virtual {v0, p2}, Lorg/iq80/snappy/BufferRecycler;->allocOutputBuffer(I)[B

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->buffer:[B

    .line 70
    iget-object v0, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->recycler:Lorg/iq80/snappy/BufferRecycler;

    invoke-static {p2}, Lorg/iq80/snappy/Snappy;->maxCompressedLength(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/iq80/snappy/BufferRecycler;->allocEncodingBuffer(I)[B

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->outputBuffer:[B

    .line 72
    invoke-virtual {p0, p1}, Lorg/iq80/snappy/AbstractSnappyOutputStream;->writeHeader(Ljava/io/OutputStream;)V

    .line 73
    return-void

    :cond_0
    move v0, v2

    .line 65
    goto :goto_0
.end method

.method private copyToBuffer([BII)V
    .locals 2
    .param p1, "input"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 165
    iget-object v0, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->buffer:[B

    iget v1, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->position:I

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 166
    iget v0, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->position:I

    add-int/2addr v0, p3

    iput v0, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->position:I

    .line 167
    return-void
.end method

.method private flushBuffer()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 176
    iget v0, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->position:I

    if-lez v0, :cond_0

    .line 177
    iget-object v0, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->buffer:[B

    iget v1, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->position:I

    invoke-direct {p0, v0, v2, v1}, Lorg/iq80/snappy/AbstractSnappyOutputStream;->writeCompressed([BII)V

    .line 178
    iput v2, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->position:I

    .line 180
    :cond_0
    return-void
.end method

.method private writeCompressed([BII)V
    .locals 18
    .param p1, "input"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 196
    invoke-virtual/range {p0 .. p3}, Lorg/iq80/snappy/AbstractSnappyOutputStream;->calculateCRC32C([BII)I

    move-result v10

    .line 198
    .local v10, "crc32c":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->outputBuffer:[B

    const/4 v5, 0x0

    .line 199
    move-object/from16 v0, p1

    move/from16 v1, p2

    move/from16 v2, p3

    invoke-static {v0, v1, v2, v4, v5}, Lorg/iq80/snappy/Snappy;->compress([BII[BI)I

    move-result v8

    .line 202
    .local v8, "compressed":I
    int-to-double v4, v8

    move/from16 v0, p3

    int-to-double v6, v0

    div-double/2addr v4, v6

    move-object/from16 v0, p0

    iget-wide v6, v0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->minCompressionRatio:D

    cmpg-double v4, v4, v6

    if-gtz v4, :cond_0

    .line 203
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->out:Ljava/io/OutputStream;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->outputBuffer:[B

    const/4 v7, 0x0

    const/4 v9, 0x1

    move-object/from16 v4, p0

    invoke-virtual/range {v4 .. v10}, Lorg/iq80/snappy/AbstractSnappyOutputStream;->writeBlock(Ljava/io/OutputStream;[BIIZI)V

    .line 209
    :goto_0
    return-void

    .line 207
    :cond_0
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->out:Ljava/io/OutputStream;

    const/16 v16, 0x0

    move-object/from16 v11, p0

    move-object/from16 v13, p1

    move/from16 v14, p2

    move/from16 v15, p3

    move/from16 v17, v10

    invoke-virtual/range {v11 .. v17}, Lorg/iq80/snappy/AbstractSnappyOutputStream;->writeBlock(Ljava/io/OutputStream;[BIIZI)V

    goto :goto_0
.end method


# virtual methods
.method protected calculateCRC32C([BII)I
    .locals 1
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 222
    invoke-static {p1, p2, p3}, Lorg/iq80/snappy/Crc32C;->maskedCrc32c([BII)I

    move-result v0

    return v0
.end method

.method public final close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 149
    iget-boolean v0, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->closed:Z

    if-eqz v0, :cond_0

    .line 161
    :goto_0
    return-void

    .line 153
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lorg/iq80/snappy/AbstractSnappyOutputStream;->flush()V

    .line 154
    iget-object v0, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 157
    iput-boolean v1, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->closed:Z

    .line 158
    iget-object v0, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->recycler:Lorg/iq80/snappy/BufferRecycler;

    iget-object v1, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->outputBuffer:[B

    invoke-virtual {v0, v1}, Lorg/iq80/snappy/BufferRecycler;->releaseOutputBuffer([B)V

    .line 159
    iget-object v0, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->recycler:Lorg/iq80/snappy/BufferRecycler;

    iget-object v1, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->buffer:[B

    invoke-virtual {v0, v1}, Lorg/iq80/snappy/BufferRecycler;->releaseEncodeBuffer([B)V

    goto :goto_0

    .line 157
    :catchall_0
    move-exception v0

    iput-boolean v1, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->closed:Z

    .line 158
    iget-object v1, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->recycler:Lorg/iq80/snappy/BufferRecycler;

    iget-object v2, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->outputBuffer:[B

    invoke-virtual {v1, v2}, Lorg/iq80/snappy/BufferRecycler;->releaseOutputBuffer([B)V

    .line 159
    iget-object v1, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->recycler:Lorg/iq80/snappy/BufferRecycler;

    iget-object v2, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->buffer:[B

    invoke-virtual {v1, v2}, Lorg/iq80/snappy/BufferRecycler;->releaseEncodeBuffer([B)V

    throw v0
.end method

.method public final flush()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    iget-boolean v0, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->closed:Z

    if-eqz v0, :cond_0

    .line 139
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Stream is closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 141
    :cond_0
    invoke-direct {p0}, Lorg/iq80/snappy/AbstractSnappyOutputStream;->flushBuffer()V

    .line 142
    iget-object v0, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 143
    return-void
.end method

.method public write(I)V
    .locals 3
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    iget-boolean v0, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->closed:Z

    if-eqz v0, :cond_0

    .line 89
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Stream is closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 91
    :cond_0
    iget v0, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->position:I

    iget v1, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->blockSize:I

    if-lt v0, v1, :cond_1

    .line 92
    invoke-direct {p0}, Lorg/iq80/snappy/AbstractSnappyOutputStream;->flushBuffer()V

    .line 94
    :cond_1
    iget-object v0, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->buffer:[B

    iget v1, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->position:I

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 95
    return-void
.end method

.method public write([BII)V
    .locals 3
    .param p1, "input"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    const-string v1, "input is null"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1, v1, v2}, Lorg/iq80/snappy/SnappyInternalUtils;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    add-int v1, p2, p3

    array-length v2, p1

    invoke-static {p2, v1, v2}, Lorg/iq80/snappy/SnappyInternalUtils;->checkPositionIndexes(III)V

    .line 103
    iget-boolean v1, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->closed:Z

    if-eqz v1, :cond_0

    .line 104
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Stream is closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 107
    :cond_0
    iget v1, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->blockSize:I

    iget v2, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->position:I

    sub-int v0, v1, v2

    .line 110
    .local v0, "free":I
    if-lt v0, p3, :cond_1

    .line 111
    invoke-direct {p0, p1, p2, p3}, Lorg/iq80/snappy/AbstractSnappyOutputStream;->copyToBuffer([BII)V

    .line 132
    :goto_0
    return-void

    .line 116
    :cond_1
    iget v1, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->position:I

    if-lez v1, :cond_2

    .line 117
    invoke-direct {p0, p1, p2, v0}, Lorg/iq80/snappy/AbstractSnappyOutputStream;->copyToBuffer([BII)V

    .line 118
    invoke-direct {p0}, Lorg/iq80/snappy/AbstractSnappyOutputStream;->flushBuffer()V

    .line 119
    add-int/2addr p2, v0

    .line 120
    sub-int/2addr p3, v0

    .line 124
    :cond_2
    :goto_1
    iget v1, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->blockSize:I

    if-lt p3, v1, :cond_3

    .line 125
    iget v1, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->blockSize:I

    invoke-direct {p0, p1, p2, v1}, Lorg/iq80/snappy/AbstractSnappyOutputStream;->writeCompressed([BII)V

    .line 126
    iget v1, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->blockSize:I

    add-int/2addr p2, v1

    .line 127
    iget v1, p0, Lorg/iq80/snappy/AbstractSnappyOutputStream;->blockSize:I

    sub-int/2addr p3, v1

    goto :goto_1

    .line 131
    :cond_3
    invoke-direct {p0, p1, p2, p3}, Lorg/iq80/snappy/AbstractSnappyOutputStream;->copyToBuffer([BII)V

    goto :goto_0
.end method

.method protected abstract writeBlock(Ljava/io/OutputStream;[BIIZI)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract writeHeader(Ljava/io/OutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
