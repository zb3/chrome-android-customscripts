.class public Lorg/xerial/snappy/SnappyInputStream;
.super Ljava/io/InputStream;
.source "SnappyInputStream.java"


# instance fields
.field private compressed:[B

.field private finishedReading:Z

.field private header:[B

.field protected final in:Ljava/io/InputStream;

.field private uncompressed:[B

.field private uncompressedCursor:I

.field private uncompressedLimit:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 57
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 39
    iput-boolean v0, p0, Lorg/xerial/snappy/SnappyInputStream;->finishedReading:Z

    .line 44
    iput v0, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedCursor:I

    .line 45
    iput v0, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedLimit:I

    .line 47
    invoke-static {}, Lorg/xerial/snappy/SnappyCodec;->headerSize()I

    move-result v0

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/xerial/snappy/SnappyInputStream;->header:[B

    .line 58
    iput-object p1, p0, Lorg/xerial/snappy/SnappyInputStream;->in:Ljava/io/InputStream;

    .line 59
    invoke-virtual {p0}, Lorg/xerial/snappy/SnappyInputStream;->readHeader()V

    .line 60
    return-void
.end method

.method private static isValidHeader([B)Z
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 107
    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-static {v2}, Lorg/xerial/snappy/SnappyCodec;->readHeader(Ljava/io/InputStream;)Lorg/xerial/snappy/SnappyCodec;

    move-result-object v2

    .line 108
    invoke-virtual {v2}, Lorg/xerial/snappy/SnappyCodec;->isValidMagicHeader()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 110
    iget v3, v2, Lorg/xerial/snappy/SnappyCodec;->version:I

    if-ge v3, v0, :cond_1

    .line 111
    new-instance v3, Lorg/xerial/snappy/SnappyIOException;

    sget-object v4, Lorg/xerial/snappy/SnappyErrorCode;->INCOMPATIBLE_VERSION:Lorg/xerial/snappy/SnappyErrorCode;

    const-string v5, "Compressed with an incompatible codec version %d. At least version %d is required"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    iget v2, v2, Lorg/xerial/snappy/SnappyCodec;->version:I

    .line 113
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v6, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v6, v0

    .line 111
    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v4, v0}, Lorg/xerial/snappy/SnappyIOException;-><init>(Lorg/xerial/snappy/SnappyErrorCode;Ljava/lang/String;)V

    throw v3

    :cond_0
    move v0, v1

    .line 118
    :cond_1
    return v0
.end method

.method private readNext([BII)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 376
    const/4 v0, 0x0

    .line 377
    :goto_0
    if-ge v0, p3, :cond_0

    .line 378
    iget-object v1, p0, Lorg/xerial/snappy/SnappyInputStream;->in:Ljava/io/InputStream;

    add-int v2, v0, p2

    sub-int v3, p3, v0

    invoke-virtual {v1, p1, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 379
    const/4 v2, -0x1

    if-ne v1, v2, :cond_1

    .line 380
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/xerial/snappy/SnappyInputStream;->finishedReading:Z

    .line 385
    :cond_0
    return v0

    .line 383
    :cond_1
    add-int/2addr v0, v1

    .line 384
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
    .line 482
    iget v0, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedCursor:I

    iget v1, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedLimit:I

    if-ge v0, v1, :cond_0

    .line 483
    iget v0, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedLimit:I

    iget v1, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedCursor:I

    sub-int/2addr v0, v1

    .line 490
    :goto_0
    return v0

    .line 486
    :cond_0
    invoke-virtual {p0}, Lorg/xerial/snappy/SnappyInputStream;->hasNextChunk()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 487
    iget v0, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedLimit:I

    iget v1, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedCursor:I

    sub-int/2addr v0, v1

    goto :goto_0

    .line 490
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 72
    iput-object v0, p0, Lorg/xerial/snappy/SnappyInputStream;->compressed:[B

    .line 73
    iput-object v0, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressed:[B

    .line 74
    iget-object v0, p0, Lorg/xerial/snappy/SnappyInputStream;->in:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    .line 75
    iget-object v0, p0, Lorg/xerial/snappy/SnappyInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 77
    :cond_0
    return-void
.end method

.method protected hasNextChunk()Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v4, 0x4

    const/4 v0, 0x0

    .line 391
    iget-boolean v2, p0, Lorg/xerial/snappy/SnappyInputStream;->finishedReading:Z

    if-eqz v2, :cond_1

    .line 445
    :cond_0
    :goto_0
    return v0

    .line 395
    :cond_1
    iput v0, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedCursor:I

    .line 396
    iput v0, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedLimit:I

    .line 398
    iget-object v2, p0, Lorg/xerial/snappy/SnappyInputStream;->header:[B

    invoke-direct {p0, v2, v0, v4}, Lorg/xerial/snappy/SnappyInputStream;->readNext([BII)I

    move-result v2

    .line 399
    if-lt v2, v4, :cond_0

    .line 403
    iget-object v2, p0, Lorg/xerial/snappy/SnappyInputStream;->header:[B

    invoke-static {v2, v0}, Lorg/xerial/snappy/SnappyOutputStream;->readInt([BI)I

    move-result v3

    .line 404
    sget v2, Lorg/xerial/snappy/SnappyCodec;->MAGIC_HEADER_HEAD:I

    if-ne v3, v2, :cond_3

    .line 406
    invoke-static {}, Lorg/xerial/snappy/SnappyCodec;->headerSize()I

    move-result v1

    add-int/lit8 v1, v1, -0x4

    .line 407
    iget-object v2, p0, Lorg/xerial/snappy/SnappyInputStream;->header:[B

    invoke-direct {p0, v2, v4, v1}, Lorg/xerial/snappy/SnappyInputStream;->readNext([BII)I

    move-result v2

    .line 408
    if-ge v2, v1, :cond_2

    .line 409
    new-instance v1, Lorg/xerial/snappy/SnappyIOException;

    sget-object v2, Lorg/xerial/snappy/SnappyErrorCode;->FAILED_TO_UNCOMPRESS:Lorg/xerial/snappy/SnappyErrorCode;

    const-string v3, "Insufficient header size in a concatenated block"

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v2, v0}, Lorg/xerial/snappy/SnappyIOException;-><init>(Lorg/xerial/snappy/SnappyErrorCode;Ljava/lang/String;)V

    throw v1

    .line 412
    :cond_2
    iget-object v1, p0, Lorg/xerial/snappy/SnappyInputStream;->header:[B

    invoke-static {v1}, Lorg/xerial/snappy/SnappyInputStream;->isValidHeader([B)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 413
    invoke-virtual {p0}, Lorg/xerial/snappy/SnappyInputStream;->hasNextChunk()Z

    move-result v0

    goto :goto_0

    .line 421
    :cond_3
    iget-object v2, p0, Lorg/xerial/snappy/SnappyInputStream;->compressed:[B

    if-eqz v2, :cond_4

    iget-object v2, p0, Lorg/xerial/snappy/SnappyInputStream;->compressed:[B

    array-length v2, v2

    if-le v3, v2, :cond_5

    .line 422
    :cond_4
    new-array v2, v3, [B

    iput-object v2, p0, Lorg/xerial/snappy/SnappyInputStream;->compressed:[B

    :cond_5
    move v2, v0

    .line 425
    :goto_1
    if-ge v2, v3, :cond_6

    .line 426
    iget-object v4, p0, Lorg/xerial/snappy/SnappyInputStream;->in:Ljava/io/InputStream;

    iget-object v5, p0, Lorg/xerial/snappy/SnappyInputStream;->compressed:[B

    sub-int v6, v3, v2

    invoke-virtual {v4, v5, v2, v6}, Ljava/io/InputStream;->read([BII)I

    move-result v4

    .line 427
    const/4 v5, -0x1

    if-ne v4, v5, :cond_7

    .line 432
    :cond_6
    if-ge v2, v3, :cond_8

    .line 433
    new-instance v0, Ljava/io/IOException;

    const-string v1, "failed to read chunk"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 430
    :cond_7
    add-int/2addr v2, v4

    .line 431
    goto :goto_1

    .line 435
    :cond_8
    iget-object v2, p0, Lorg/xerial/snappy/SnappyInputStream;->compressed:[B

    invoke-static {v2, v0, v3}, Lorg/xerial/snappy/Snappy;->uncompressedLength([BII)I

    move-result v2

    .line 436
    iget-object v4, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressed:[B

    if-eqz v4, :cond_9

    iget-object v4, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressed:[B

    array-length v4, v4

    if-le v2, v4, :cond_a

    .line 437
    :cond_9
    new-array v4, v2, [B

    iput-object v4, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressed:[B

    .line 439
    :cond_a
    iget-object v4, p0, Lorg/xerial/snappy/SnappyInputStream;->compressed:[B

    iget-object v5, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressed:[B

    invoke-static {v4, v0, v3, v5, v0}, Lorg/xerial/snappy/Snappy;->uncompress([BII[BI)I

    move-result v3

    .line 440
    if-eq v2, v3, :cond_b

    .line 441
    new-instance v4, Lorg/xerial/snappy/SnappyIOException;

    sget-object v5, Lorg/xerial/snappy/SnappyErrorCode;->INVALID_CHUNK_SIZE:Lorg/xerial/snappy/SnappyErrorCode;

    const-string v6, "expected %,d bytes, but decompressed chunk has %,d bytes"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v7, v0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v7, v1

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v5, v0}, Lorg/xerial/snappy/SnappyIOException;-><init>(Lorg/xerial/snappy/SnappyErrorCode;Ljava/lang/String;)V

    throw v4

    .line 443
    :cond_b
    iput v3, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedLimit:I

    move v0, v1

    .line 445
    goto/16 :goto_0
.end method

.method public rawRead(Ljava/lang/Object;II)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 195
    const/4 v0, 0x0

    .line 196
    :cond_0
    :goto_0
    if-ge v0, p3, :cond_1

    .line 198
    iget v1, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedCursor:I

    iget v2, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedLimit:I

    if-lt v1, v2, :cond_2

    .line 199
    invoke-virtual {p0}, Lorg/xerial/snappy/SnappyInputStream;->hasNextChunk()Z

    move-result v1

    if-nez v1, :cond_0

    .line 203
    if-nez v0, :cond_1

    const/4 v0, -0x1

    .line 212
    :cond_1
    return v0

    .line 206
    :cond_2
    iget v1, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedLimit:I

    iget v2, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedCursor:I

    sub-int/2addr v1, v2

    sub-int v2, p3, v0

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 207
    iget-object v2, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressed:[B

    iget v3, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedCursor:I

    add-int v4, p2, v0

    invoke-static {v2, v3, v1, p1, v4}, Lorg/xerial/snappy/Snappy;->arrayCopy(Ljava/lang/Object;IILjava/lang/Object;I)V

    .line 208
    add-int/2addr v0, v1

    .line 209
    iget v2, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedCursor:I

    add-int/2addr v1, v2

    iput v1, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedCursor:I

    goto :goto_0
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 462
    iget v0, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedCursor:I

    iget v1, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedLimit:I

    if-ge v0, v1, :cond_0

    .line 463
    iget-object v0, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressed:[B

    iget v1, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedCursor:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedCursor:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    .line 470
    :goto_0
    return v0

    .line 466
    :cond_0
    invoke-virtual {p0}, Lorg/xerial/snappy/SnappyInputStream;->hasNextChunk()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 467
    invoke-virtual {p0}, Lorg/xerial/snappy/SnappyInputStream;->read()I

    move-result v0

    goto :goto_0

    .line 470
    :cond_1
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public read([BII)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 163
    const/4 v0, 0x0

    .line 164
    :cond_0
    :goto_0
    if-ge v0, p3, :cond_1

    .line 166
    iget v1, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedCursor:I

    iget v2, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedLimit:I

    if-lt v1, v2, :cond_2

    .line 167
    invoke-virtual {p0}, Lorg/xerial/snappy/SnappyInputStream;->hasNextChunk()Z

    move-result v1

    if-nez v1, :cond_0

    .line 171
    if-nez v0, :cond_1

    const/4 v0, -0x1

    .line 180
    :cond_1
    return v0

    .line 174
    :cond_2
    iget v1, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedLimit:I

    iget v2, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedCursor:I

    sub-int/2addr v1, v2

    sub-int v2, p3, v0

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 175
    iget-object v2, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressed:[B

    iget v3, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedCursor:I

    add-int v4, p2, v0

    invoke-static {v2, v3, p1, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 176
    add-int/2addr v0, v1

    .line 177
    iget v2, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedCursor:I

    add-int/2addr v1, v2

    iput v1, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedCursor:I

    goto :goto_0
.end method

.method public read([D)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 272
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/xerial/snappy/SnappyInputStream;->read([DII)I

    move-result v0

    return v0
.end method

.method public read([DII)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 258
    mul-int/lit8 v0, p2, 0x8

    mul-int/lit8 v1, p3, 0x8

    invoke-virtual {p0, p1, v0, v1}, Lorg/xerial/snappy/SnappyInputStream;->rawRead(Ljava/lang/Object;II)I

    move-result v0

    return v0
.end method

.method public read([F)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 332
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/xerial/snappy/SnappyInputStream;->read([FII)I

    move-result v0

    return v0
.end method

.method public read([FII)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 318
    mul-int/lit8 v0, p2, 0x4

    mul-int/lit8 v1, p3, 0x4

    invoke-virtual {p0, p1, v0, v1}, Lorg/xerial/snappy/SnappyInputStream;->rawRead(Ljava/lang/Object;II)I

    move-result v0

    return v0
.end method

.method public read([I)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 286
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/xerial/snappy/SnappyInputStream;->read([III)I

    move-result v0

    return v0
.end method

.method public read([III)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 302
    mul-int/lit8 v0, p2, 0x4

    mul-int/lit8 v1, p3, 0x4

    invoke-virtual {p0, p1, v0, v1}, Lorg/xerial/snappy/SnappyInputStream;->rawRead(Ljava/lang/Object;II)I

    move-result v0

    return v0
.end method

.method public read([J)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 242
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/xerial/snappy/SnappyInputStream;->read([JII)I

    move-result v0

    return v0
.end method

.method public read([JII)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 228
    mul-int/lit8 v0, p2, 0x8

    mul-int/lit8 v1, p3, 0x8

    invoke-virtual {p0, p1, v0, v1}, Lorg/xerial/snappy/SnappyInputStream;->rawRead(Ljava/lang/Object;II)I

    move-result v0

    return v0
.end method

.method public read([S)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 362
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/xerial/snappy/SnappyInputStream;->read([SII)I

    move-result v0

    return v0
.end method

.method public read([SII)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 348
    mul-int/lit8 v0, p2, 0x2

    mul-int/lit8 v1, p3, 0x2

    invoke-virtual {p0, p1, v0, v1}, Lorg/xerial/snappy/SnappyInputStream;->rawRead(Ljava/lang/Object;II)I

    move-result v0

    return v0
.end method

.method protected readFully([BI)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 125
    if-nez p2, :cond_0

    .line 126
    iput-boolean v4, p0, Lorg/xerial/snappy/SnappyInputStream;->finishedReading:Z

    .line 150
    :goto_0
    return-void

    .line 130
    :cond_0
    const/16 v0, 0x2000

    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result v0

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/xerial/snappy/SnappyInputStream;->compressed:[B

    .line 131
    iget-object v0, p0, Lorg/xerial/snappy/SnappyInputStream;->compressed:[B

    invoke-static {p1, v3, v0, v3, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 133
    :cond_1
    :goto_1
    iget-object v0, p0, Lorg/xerial/snappy/SnappyInputStream;->in:Ljava/io/InputStream;

    iget-object v1, p0, Lorg/xerial/snappy/SnappyInputStream;->compressed:[B

    iget-object v2, p0, Lorg/xerial/snappy/SnappyInputStream;->compressed:[B

    array-length v2, v2

    sub-int/2addr v2, p2

    invoke-virtual {v0, v1, p2, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 134
    add-int/2addr p2, v0

    .line 135
    iget-object v0, p0, Lorg/xerial/snappy/SnappyInputStream;->compressed:[B

    array-length v0, v0

    if-lt p2, v0, :cond_1

    .line 136
    iget-object v0, p0, Lorg/xerial/snappy/SnappyInputStream;->compressed:[B

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x2

    new-array v0, v0, [B

    .line 137
    iget-object v1, p0, Lorg/xerial/snappy/SnappyInputStream;->compressed:[B

    iget-object v2, p0, Lorg/xerial/snappy/SnappyInputStream;->compressed:[B

    array-length v2, v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 138
    iput-object v0, p0, Lorg/xerial/snappy/SnappyInputStream;->compressed:[B

    goto :goto_1

    .line 142
    :cond_2
    iput-boolean v4, p0, Lorg/xerial/snappy/SnappyInputStream;->finishedReading:Z

    .line 145
    iget-object v0, p0, Lorg/xerial/snappy/SnappyInputStream;->compressed:[B

    invoke-static {v0, v3, p2}, Lorg/xerial/snappy/Snappy;->uncompressedLength([BII)I

    move-result v0

    .line 146
    new-array v1, v0, [B

    iput-object v1, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressed:[B

    .line 147
    iget-object v1, p0, Lorg/xerial/snappy/SnappyInputStream;->compressed:[B

    iget-object v2, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressed:[B

    invoke-static {v1, v3, p2, v2, v3}, Lorg/xerial/snappy/Snappy;->uncompress([BII[BI)I

    .line 148
    iput v3, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedCursor:I

    .line 149
    iput v0, p0, Lorg/xerial/snappy/SnappyInputStream;->uncompressedLimit:I

    goto :goto_0
.end method

.method protected readHeader()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    const/4 v0, 0x0

    .line 83
    :goto_0
    iget-object v1, p0, Lorg/xerial/snappy/SnappyInputStream;->header:[B

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 84
    iget-object v1, p0, Lorg/xerial/snappy/SnappyInputStream;->in:Ljava/io/InputStream;

    iget-object v2, p0, Lorg/xerial/snappy/SnappyInputStream;->header:[B

    iget-object v3, p0, Lorg/xerial/snappy/SnappyInputStream;->header:[B

    array-length v3, v3

    sub-int/2addr v3, v0

    invoke-virtual {v1, v2, v0, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 85
    const/4 v2, -0x1

    if-ne v1, v2, :cond_1

    .line 92
    :cond_0
    if-nez v0, :cond_2

    .line 94
    new-instance v0, Lorg/xerial/snappy/SnappyIOException;

    sget-object v1, Lorg/xerial/snappy/SnappyErrorCode;->EMPTY_INPUT:Lorg/xerial/snappy/SnappyErrorCode;

    const-string v2, "Cannot decompress empty stream"

    invoke-direct {v0, v1, v2}, Lorg/xerial/snappy/SnappyIOException;-><init>(Lorg/xerial/snappy/SnappyErrorCode;Ljava/lang/String;)V

    throw v0

    .line 88
    :cond_1
    add-int/2addr v0, v1

    .line 89
    goto :goto_0

    .line 96
    :cond_2
    iget-object v1, p0, Lorg/xerial/snappy/SnappyInputStream;->header:[B

    array-length v1, v1

    if-lt v0, v1, :cond_3

    iget-object v1, p0, Lorg/xerial/snappy/SnappyInputStream;->header:[B

    invoke-static {v1}, Lorg/xerial/snappy/SnappyCodec;->hasMagicHeaderPrefix([B)Z

    move-result v1

    if-nez v1, :cond_4

    .line 99
    :cond_3
    iget-object v1, p0, Lorg/xerial/snappy/SnappyInputStream;->header:[B

    invoke-virtual {p0, v1, v0}, Lorg/xerial/snappy/SnappyInputStream;->readFully([BI)V

    .line 102
    :cond_4
    return-void
.end method
