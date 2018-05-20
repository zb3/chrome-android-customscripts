.class abstract Lorg/iq80/snappy/AbstractSnappyInputStream;
.super Ljava/io/InputStream;
.source "AbstractSnappyInputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/iq80/snappy/AbstractSnappyInputStream$FrameData;,
        Lorg/iq80/snappy/AbstractSnappyInputStream$FrameMetaData;,
        Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;
    }
.end annotation


# instance fields
.field private buffer:[B

.field private closed:Z

.field private eof:Z

.field private final frameHeader:[B

.field private final in:Ljava/io/InputStream;

.field private input:[B

.field private position:I

.field private final recycler:Lorg/iq80/snappy/BufferRecycler;

.field private uncompressed:[B

.field private valid:I

.field private final verifyChecksums:Z


# direct methods
.method public constructor <init>(Ljava/io/InputStream;IIZ[B)V
    .locals 4
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "maxBlockSize"    # I
    .param p3, "frameHeaderSize"    # I
    .param p4, "verifyChecksums"    # Z
    .param p5, "expectedHeader"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 89
    iput-object p1, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->in:Ljava/io/InputStream;

    .line 90
    iput-boolean p4, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->verifyChecksums:Z

    .line 91
    invoke-static {}, Lorg/iq80/snappy/BufferRecycler;->instance()Lorg/iq80/snappy/BufferRecycler;

    move-result-object v2

    iput-object v2, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->recycler:Lorg/iq80/snappy/BufferRecycler;

    .line 92
    add-int/lit8 v2, p2, 0x5

    invoke-direct {p0, v2}, Lorg/iq80/snappy/AbstractSnappyInputStream;->allocateBuffersBasedOnSize(I)V

    .line 93
    new-array v2, p3, [B

    iput-object v2, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->frameHeader:[B

    .line 96
    array-length v2, p5

    new-array v0, v2, [B

    .line 98
    .local v0, "actualHeader":[B
    const/4 v2, 0x0

    array-length v3, v0

    invoke-static {p1, v0, v2, v3}, Lorg/iq80/snappy/SnappyInternalUtils;->readBytes(Ljava/io/InputStream;[BII)I

    move-result v1

    .line 99
    .local v1, "read":I
    array-length v2, p5

    if-ge v1, v2, :cond_0

    .line 100
    new-instance v2, Ljava/io/EOFException;

    const-string v3, "encountered EOF while reading stream header"

    invoke-direct {v2, v3}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 102
    :cond_0
    invoke-static {p5, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-nez v2, :cond_1

    .line 103
    new-instance v2, Ljava/io/IOException;

    const-string v3, "invalid stream header"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 105
    :cond_1
    return-void
.end method

.method private allocateBuffersBasedOnSize(I)V
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 109
    iget-object v0, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->recycler:Lorg/iq80/snappy/BufferRecycler;

    invoke-virtual {v0, p1}, Lorg/iq80/snappy/BufferRecycler;->allocInputBuffer(I)[B

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->input:[B

    .line 110
    iget-object v0, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->recycler:Lorg/iq80/snappy/BufferRecycler;

    invoke-virtual {v0, p1}, Lorg/iq80/snappy/BufferRecycler;->allocDecodeBuffer(I)[B

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->uncompressed:[B

    .line 111
    return-void
.end method

.method private ensureBuffer()Z
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 211
    invoke-virtual {p0}, Lorg/iq80/snappy/AbstractSnappyInputStream;->available()I

    move-result v7

    if-lez v7, :cond_1

    .line 271
    :cond_0
    :goto_0
    return v5

    .line 214
    :cond_1
    iget-boolean v7, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->eof:Z

    if-eqz v7, :cond_2

    move v5, v6

    .line 215
    goto :goto_0

    .line 218
    :cond_2
    invoke-direct {p0}, Lorg/iq80/snappy/AbstractSnappyInputStream;->readBlockHeader()Z

    move-result v7

    if-nez v7, :cond_3

    .line 219
    iput-boolean v5, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->eof:Z

    move v5, v6

    .line 220
    goto :goto_0

    .line 224
    :cond_3
    iget-object v7, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->frameHeader:[B

    invoke-virtual {p0, v7}, Lorg/iq80/snappy/AbstractSnappyInputStream;->getFrameMetaData([B)Lorg/iq80/snappy/AbstractSnappyInputStream$FrameMetaData;

    move-result-object v3

    .line 226
    .local v3, "frameMetaData":Lorg/iq80/snappy/AbstractSnappyInputStream$FrameMetaData;
    sget-object v7, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;->SKIP:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    iget-object v8, v3, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameMetaData;->frameAction:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    if-ne v7, v8, :cond_4

    .line 227
    iget-object v5, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->in:Ljava/io/InputStream;

    iget v6, v3, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameMetaData;->length:I

    invoke-static {v5, v6}, Lorg/iq80/snappy/SnappyInternalUtils;->skip(Ljava/io/InputStream;I)I

    .line 228
    invoke-direct {p0}, Lorg/iq80/snappy/AbstractSnappyInputStream;->ensureBuffer()Z

    move-result v5

    goto :goto_0

    .line 231
    :cond_4
    iget v7, v3, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameMetaData;->length:I

    iget-object v8, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->input:[B

    array-length v8, v8

    if-le v7, v8, :cond_5

    .line 232
    iget v7, v3, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameMetaData;->length:I

    invoke-direct {p0, v7}, Lorg/iq80/snappy/AbstractSnappyInputStream;->allocateBuffersBasedOnSize(I)V

    .line 235
    :cond_5
    iget-object v7, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->in:Ljava/io/InputStream;

    iget-object v8, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->input:[B

    iget v9, v3, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameMetaData;->length:I

    invoke-static {v7, v8, v6, v9}, Lorg/iq80/snappy/SnappyInternalUtils;->readBytes(Ljava/io/InputStream;[BII)I

    move-result v1

    .line 236
    .local v1, "actualRead":I
    iget v7, v3, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameMetaData;->length:I

    if-eq v1, v7, :cond_6

    .line 237
    new-instance v5, Ljava/io/EOFException;

    const-string v6, "unexpectd EOF when reading frame"

    invoke-direct {v5, v6}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 240
    :cond_6
    iget-object v7, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->frameHeader:[B

    iget-object v8, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->input:[B

    invoke-virtual {p0, v7, v8, v1}, Lorg/iq80/snappy/AbstractSnappyInputStream;->getFrameData([B[BI)Lorg/iq80/snappy/AbstractSnappyInputStream$FrameData;

    move-result-object v2

    .line 242
    .local v2, "frameData":Lorg/iq80/snappy/AbstractSnappyInputStream$FrameData;
    sget-object v7, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;->UNCOMPRESS:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    iget-object v8, v3, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameMetaData;->frameAction:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    if-ne v7, v8, :cond_8

    .line 243
    iget-object v7, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->input:[B

    iget v8, v2, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameData;->offset:I

    invoke-static {v7, v8}, Lorg/iq80/snappy/Snappy;->getUncompressedLength([BI)I

    move-result v4

    .line 246
    .local v4, "uncompressedLength":I
    iget-object v7, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->uncompressed:[B

    array-length v7, v7

    if-le v4, v7, :cond_7

    .line 247
    iget-object v7, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->recycler:Lorg/iq80/snappy/BufferRecycler;

    invoke-virtual {v7, v4}, Lorg/iq80/snappy/BufferRecycler;->allocDecodeBuffer(I)[B

    move-result-object v7

    iput-object v7, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->uncompressed:[B

    .line 250
    :cond_7
    iget-object v7, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->input:[B

    iget v8, v2, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameData;->offset:I

    iget v9, v2, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameData;->offset:I

    sub-int v9, v1, v9

    iget-object v10, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->uncompressed:[B

    invoke-static {v7, v8, v9, v10, v6}, Lorg/iq80/snappy/Snappy;->uncompress([BII[BI)I

    move-result v7

    iput v7, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->valid:I

    .line 252
    iget-object v7, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->uncompressed:[B

    iput-object v7, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->buffer:[B

    .line 253
    iput v6, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->position:I

    .line 264
    .end local v4    # "uncompressedLength":I
    :goto_1
    iget-boolean v6, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->verifyChecksums:Z

    if-eqz v6, :cond_0

    .line 265
    iget-object v6, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->buffer:[B

    iget v7, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->position:I

    iget v8, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->valid:I

    iget v9, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->position:I

    sub-int/2addr v8, v9

    invoke-static {v6, v7, v8}, Lorg/iq80/snappy/Crc32C;->maskedCrc32c([BII)I

    move-result v0

    .line 266
    .local v0, "actualCrc32c":I
    iget v6, v2, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameData;->checkSum:I

    if-eq v6, v0, :cond_0

    .line 267
    new-instance v5, Ljava/io/IOException;

    const-string v6, "Corrupt input: invalid checksum"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 257
    .end local v0    # "actualCrc32c":I
    :cond_8
    iget v6, v2, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameData;->offset:I

    iput v6, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->position:I

    .line 258
    iget-object v6, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->input:[B

    iput-object v6, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->buffer:[B

    .line 261
    iput v1, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->valid:I

    goto :goto_1
.end method

.method private readBlockHeader()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 295
    iget-object v2, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->in:Ljava/io/InputStream;

    iget-object v3, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->frameHeader:[B

    iget-object v4, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->frameHeader:[B

    array-length v4, v4

    invoke-static {v2, v3, v1, v4}, Lorg/iq80/snappy/SnappyInternalUtils;->readBytes(Ljava/io/InputStream;[BII)I

    move-result v0

    .line 297
    .local v0, "read":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    .line 305
    :goto_0
    return v1

    .line 301
    :cond_0
    iget-object v1, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->frameHeader:[B

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 302
    new-instance v1, Ljava/io/EOFException;

    const-string v2, "encountered EOF while reading block header"

    invoke-direct {v1, v2}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 305
    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method public available()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 153
    iget-boolean v0, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->closed:Z

    if-eqz v0, :cond_0

    .line 154
    const/4 v0, 0x0

    .line 156
    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->valid:I

    iget v1, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->position:I

    sub-int/2addr v0, v1

    goto :goto_0
.end method

.method public close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 164
    :try_start_0
    iget-object v0, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 167
    iget-boolean v0, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->closed:Z

    if-nez v0, :cond_0

    .line 168
    iput-boolean v2, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->closed:Z

    .line 169
    iget-object v0, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->recycler:Lorg/iq80/snappy/BufferRecycler;

    iget-object v1, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->input:[B

    invoke-virtual {v0, v1}, Lorg/iq80/snappy/BufferRecycler;->releaseInputBuffer([B)V

    .line 170
    iget-object v0, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->recycler:Lorg/iq80/snappy/BufferRecycler;

    iget-object v1, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->uncompressed:[B

    invoke-virtual {v0, v1}, Lorg/iq80/snappy/BufferRecycler;->releaseDecodeBuffer([B)V

    .line 173
    :cond_0
    return-void

    .line 167
    :catchall_0
    move-exception v0

    iget-boolean v1, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->closed:Z

    if-nez v1, :cond_1

    .line 168
    iput-boolean v2, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->closed:Z

    .line 169
    iget-object v1, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->recycler:Lorg/iq80/snappy/BufferRecycler;

    iget-object v2, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->input:[B

    invoke-virtual {v1, v2}, Lorg/iq80/snappy/BufferRecycler;->releaseInputBuffer([B)V

    .line 170
    iget-object v1, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->recycler:Lorg/iq80/snappy/BufferRecycler;

    iget-object v2, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->uncompressed:[B

    invoke-virtual {v1, v2}, Lorg/iq80/snappy/BufferRecycler;->releaseDecodeBuffer([B)V

    :cond_1
    throw v0
.end method

.method protected abstract getFrameData([B[BI)Lorg/iq80/snappy/AbstractSnappyInputStream$FrameData;
.end method

.method protected abstract getFrameMetaData([B)Lorg/iq80/snappy/AbstractSnappyInputStream$FrameMetaData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, -0x1

    .line 117
    iget-boolean v1, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->closed:Z

    if-eqz v1, :cond_1

    .line 123
    :cond_0
    :goto_0
    return v0

    .line 120
    :cond_1
    invoke-direct {p0}, Lorg/iq80/snappy/AbstractSnappyInputStream;->ensureBuffer()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 123
    iget-object v0, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->buffer:[B

    iget v1, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->position:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    goto :goto_0
.end method

.method public read([BII)I
    .locals 3
    .param p1, "output"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 130
    const-string v1, "output is null"

    new-array v2, v0, [Ljava/lang/Object;

    invoke-static {p1, v1, v2}, Lorg/iq80/snappy/SnappyInternalUtils;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    add-int v1, p2, p3

    array-length v2, p1

    invoke-static {p2, v1, v2}, Lorg/iq80/snappy/SnappyInternalUtils;->checkPositionIndexes(III)V

    .line 132
    iget-boolean v1, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->closed:Z

    if-eqz v1, :cond_0

    .line 133
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Stream is closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 136
    :cond_0
    if-nez p3, :cond_1

    .line 146
    :goto_0
    return v0

    .line 139
    :cond_1
    invoke-direct {p0}, Lorg/iq80/snappy/AbstractSnappyInputStream;->ensureBuffer()Z

    move-result v1

    if-nez v1, :cond_2

    .line 140
    const/4 v0, -0x1

    goto :goto_0

    .line 143
    :cond_2
    invoke-virtual {p0}, Lorg/iq80/snappy/AbstractSnappyInputStream;->available()I

    move-result v1

    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 144
    .local v0, "size":I
    iget-object v1, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->buffer:[B

    iget v2, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->position:I

    invoke-static {v1, v2, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 145
    iget v1, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->position:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/iq80/snappy/AbstractSnappyInputStream;->position:I

    goto :goto_0
.end method
