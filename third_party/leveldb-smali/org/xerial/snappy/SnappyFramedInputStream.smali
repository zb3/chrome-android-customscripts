.class public final Lorg/xerial/snappy/SnappyFramedInputStream;
.super Ljava/io/InputStream;
.source "SnappyFramedInputStream.java"

# interfaces
.implements Ljava/nio/channels/ReadableByteChannel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/xerial/snappy/SnappyFramedInputStream$FrameData;,
        Lorg/xerial/snappy/SnappyFramedInputStream$FrameMetaData;,
        Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private buffer:[B

.field private closed:Z

.field private eof:Z

.field private final frameHeader:Ljava/nio/ByteBuffer;

.field private input:Ljava/nio/ByteBuffer;

.field private position:I

.field private final rbc:Ljava/nio/channels/ReadableByteChannel;

.field private uncompressedDirect:Ljava/nio/ByteBuffer;

.field private valid:I

.field private final verifyChecksums:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-class v0, Lorg/xerial/snappy/SnappyFramedInputStream;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/xerial/snappy/SnappyFramedInputStream;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/xerial/snappy/SnappyFramedInputStream;-><init>(Ljava/io/InputStream;Z)V

    .line 90
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    invoke-static {p1}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/InputStream;)Ljava/nio/channels/ReadableByteChannel;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lorg/xerial/snappy/SnappyFramedInputStream;-><init>(Ljava/nio/channels/ReadableByteChannel;Z)V

    .line 103
    return-void
.end method

.method public constructor <init>(Ljava/nio/channels/ReadableByteChannel;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 114
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/xerial/snappy/SnappyFramedInputStream;-><init>(Ljava/nio/channels/ReadableByteChannel;Z)V

    .line 115
    return-void
.end method

.method public constructor <init>(Ljava/nio/channels/ReadableByteChannel;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 128
    if-nez p1, :cond_0

    .line 129
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "in is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 132
    :cond_0
    iput-object p1, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->rbc:Ljava/nio/channels/ReadableByteChannel;

    .line 133
    iput-boolean p2, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->verifyChecksums:Z

    .line 135
    const v0, 0x10005

    invoke-direct {p0, v0}, Lorg/xerial/snappy/SnappyFramedInputStream;->allocateBuffersBasedOnSize(I)V

    .line 136
    const/4 v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->frameHeader:Ljava/nio/ByteBuffer;

    .line 139
    sget-object v0, Lorg/xerial/snappy/SnappyFramed;->HEADER_BYTES:[B

    .line 140
    array-length v1, v0

    new-array v1, v1, [B

    .line 141
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 143
    invoke-static {p1, v2}, Lorg/xerial/snappy/SnappyFramed;->readBytes(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)I

    move-result v2

    .line 144
    array-length v3, v0

    if-ge v2, v3, :cond_1

    .line 145
    new-instance v0, Ljava/io/EOFException;

    const-string v1, "encountered EOF while reading stream header"

    invoke-direct {v0, v1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 148
    :cond_1
    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_2

    .line 149
    new-instance v0, Ljava/io/IOException;

    const-string v1, "invalid stream header"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 151
    :cond_2
    return-void
.end method

.method private allocateBuffersBasedOnSize(I)V
    .locals 2

    .prologue
    .line 159
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->input:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    .line 160
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->input:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Lorg/xerial/snappy/SnappyFramed;->releaseDirectByteBuffer(Ljava/nio/ByteBuffer;)V

    .line 163
    :cond_0
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->uncompressedDirect:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_1

    .line 164
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->uncompressedDirect:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Lorg/xerial/snappy/SnappyFramed;->releaseDirectByteBuffer(Ljava/nio/ByteBuffer;)V

    .line 167
    :cond_1
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->input:Ljava/nio/ByteBuffer;

    .line 168
    invoke-static {p1}, Lorg/xerial/snappy/Snappy;->maxCompressedLength(I)I

    move-result v0

    .line 169
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    iput-object v1, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->uncompressedDirect:Ljava/nio/ByteBuffer;

    .line 170
    new-array v0, v0, [B

    iput-object v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->buffer:[B

    .line 171
    return-void
.end method

.method private ensureBuffer()Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 416
    invoke-virtual {p0}, Lorg/xerial/snappy/SnappyFramedInputStream;->available()I

    move-result v2

    if-lez v2, :cond_1

    .line 487
    :cond_0
    :goto_0
    return v0

    .line 419
    :cond_1
    iget-boolean v2, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->eof:Z

    if-eqz v2, :cond_2

    move v0, v1

    .line 420
    goto :goto_0

    .line 423
    :cond_2
    invoke-direct {p0}, Lorg/xerial/snappy/SnappyFramedInputStream;->readBlockHeader()Z

    move-result v2

    if-nez v2, :cond_3

    .line 424
    iput-boolean v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->eof:Z

    move v0, v1

    .line 425
    goto :goto_0

    .line 429
    :cond_3
    iget-object v2, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->frameHeader:Ljava/nio/ByteBuffer;

    invoke-direct {p0, v2}, Lorg/xerial/snappy/SnappyFramedInputStream;->getFrameMetaData(Ljava/nio/ByteBuffer;)Lorg/xerial/snappy/SnappyFramedInputStream$FrameMetaData;

    move-result-object v2

    .line 431
    sget-object v3, Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;->SKIP:Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    iget-object v4, v2, Lorg/xerial/snappy/SnappyFramedInputStream$FrameMetaData;->frameAction:Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    if-ne v3, v4, :cond_4

    .line 432
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->rbc:Ljava/nio/channels/ReadableByteChannel;

    iget v1, v2, Lorg/xerial/snappy/SnappyFramedInputStream$FrameMetaData;->length:I

    iget-object v2, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->buffer:[B

    .line 433
    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 432
    invoke-static {v0, v1, v2}, Lorg/xerial/snappy/SnappyFramed;->skip(Ljava/nio/channels/ReadableByteChannel;ILjava/nio/ByteBuffer;)I

    .line 434
    invoke-direct {p0}, Lorg/xerial/snappy/SnappyFramedInputStream;->ensureBuffer()Z

    move-result v0

    goto :goto_0

    .line 437
    :cond_4
    iget v3, v2, Lorg/xerial/snappy/SnappyFramedInputStream$FrameMetaData;->length:I

    iget-object v4, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->input:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v4

    if-le v3, v4, :cond_5

    .line 438
    iget v3, v2, Lorg/xerial/snappy/SnappyFramedInputStream$FrameMetaData;->length:I

    invoke-direct {p0, v3}, Lorg/xerial/snappy/SnappyFramedInputStream;->allocateBuffersBasedOnSize(I)V

    .line 441
    :cond_5
    iget-object v3, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->input:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 442
    iget-object v3, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->input:Ljava/nio/ByteBuffer;

    iget v4, v2, Lorg/xerial/snappy/SnappyFramedInputStream$FrameMetaData;->length:I

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 444
    iget-object v3, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->rbc:Ljava/nio/channels/ReadableByteChannel;

    iget-object v4, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->input:Ljava/nio/ByteBuffer;

    invoke-static {v3, v4}, Lorg/xerial/snappy/SnappyFramed;->readBytes(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)I

    move-result v3

    .line 445
    iget v4, v2, Lorg/xerial/snappy/SnappyFramedInputStream$FrameMetaData;->length:I

    if-eq v3, v4, :cond_6

    .line 446
    new-instance v0, Ljava/io/EOFException;

    const-string v1, "unexpectd EOF when reading frame"

    invoke-direct {v0, v1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 448
    :cond_6
    iget-object v3, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->input:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 450
    iget-object v3, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->input:Ljava/nio/ByteBuffer;

    invoke-direct {p0, v3}, Lorg/xerial/snappy/SnappyFramedInputStream;->getFrameData(Ljava/nio/ByteBuffer;)Lorg/xerial/snappy/SnappyFramedInputStream$FrameData;

    move-result-object v3

    .line 452
    sget-object v4, Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;->UNCOMPRESS:Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    iget-object v2, v2, Lorg/xerial/snappy/SnappyFramedInputStream$FrameMetaData;->frameAction:Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    if-ne v4, v2, :cond_8

    .line 454
    iget-object v2, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->input:Ljava/nio/ByteBuffer;

    iget v4, v3, Lorg/xerial/snappy/SnappyFramedInputStream$FrameData;->offset:I

    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 456
    iget-object v2, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->input:Ljava/nio/ByteBuffer;

    invoke-static {v2}, Lorg/xerial/snappy/Snappy;->uncompressedLength(Ljava/nio/ByteBuffer;)I

    move-result v2

    .line 458
    iget-object v4, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->uncompressedDirect:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v4

    if-le v2, v4, :cond_7

    .line 460
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    iput-object v4, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->uncompressedDirect:Ljava/nio/ByteBuffer;

    .line 461
    iget-object v4, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->input:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v4

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    new-array v2, v2, [B

    iput-object v2, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->buffer:[B

    .line 464
    :cond_7
    iget-object v2, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->uncompressedDirect:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 466
    iget-object v2, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->input:Ljava/nio/ByteBuffer;

    iget-object v4, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->uncompressedDirect:Ljava/nio/ByteBuffer;

    invoke-static {v2, v4}, Lorg/xerial/snappy/Snappy;->uncompress(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->valid:I

    .line 468
    iget-object v2, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->uncompressedDirect:Ljava/nio/ByteBuffer;

    iget-object v4, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->buffer:[B

    iget v5, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->valid:I

    invoke-virtual {v2, v4, v1, v5}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 469
    iput v1, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->position:I

    .line 479
    :goto_1
    iget-boolean v1, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->verifyChecksums:Z

    if-eqz v1, :cond_0

    .line 480
    iget-object v1, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->buffer:[B

    iget v2, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->position:I

    iget v4, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->valid:I

    iget v5, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->position:I

    sub-int/2addr v4, v5

    invoke-static {v1, v2, v4}, Lorg/xerial/snappy/SnappyFramed;->maskedCrc32c([BII)I

    move-result v1

    .line 482
    iget v2, v3, Lorg/xerial/snappy/SnappyFramedInputStream$FrameData;->checkSum:I

    if-eq v2, v1, :cond_0

    .line 483
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Corrupt input: invalid checksum"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 473
    :cond_8
    iget-object v2, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->input:Ljava/nio/ByteBuffer;

    iget v4, v3, Lorg/xerial/snappy/SnappyFramedInputStream$FrameData;->offset:I

    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 474
    iput v1, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->position:I

    .line 475
    iget-object v2, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->input:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    iput v2, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->valid:I

    .line 476
    iget-object v2, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->input:Ljava/nio/ByteBuffer;

    iget-object v4, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->buffer:[B

    iget-object v5, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->input:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    invoke-virtual {v2, v4, v1, v5}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    goto :goto_1
.end method

.method private getCrc32c(Ljava/nio/ByteBuffer;)I
    .locals 3

    .prologue
    .line 581
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    .line 583
    add-int/lit8 v1, v0, 0x3

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    add-int/lit8 v2, v0, 0x2

    .line 584
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x10

    or-int/2addr v1, v2

    add-int/lit8 v2, v0, 0x1

    .line 585
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v1, v2

    .line 586
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method private getFrameData(Ljava/nio/ByteBuffer;)Lorg/xerial/snappy/SnappyFramedInputStream$FrameData;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 575
    new-instance v0, Lorg/xerial/snappy/SnappyFramedInputStream$FrameData;

    invoke-direct {p0, p1}, Lorg/xerial/snappy/SnappyFramedInputStream;->getCrc32c(Ljava/nio/ByteBuffer;)I

    move-result v1

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lorg/xerial/snappy/SnappyFramedInputStream$FrameData;-><init>(II)V

    return-object v0
.end method

.method private getFrameMetaData(Ljava/nio/ByteBuffer;)Lorg/xerial/snappy/SnappyFramedInputStream$FrameMetaData;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x6

    const/4 v1, 0x5

    const/4 v3, 0x0

    .line 517
    sget-boolean v0, Lorg/xerial/snappy/SnappyFramedInputStream;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasArray()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 519
    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    .line 521
    const/4 v4, 0x1

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    .line 522
    const/4 v5, 0x2

    aget-byte v5, v0, v5

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x8

    or-int/2addr v4, v5

    .line 523
    const/4 v5, 0x3

    aget-byte v5, v0, v5

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x10

    or-int/2addr v4, v5

    .line 527
    aget-byte v0, v0, v3

    and-int/lit16 v5, v0, 0xff

    .line 528
    sparse-switch v5, :sswitch_data_0

    .line 548
    const/16 v0, 0x7f

    if-gt v5, v0, :cond_2

    .line 549
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unsupported unskippable chunk: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 550
    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 530
    :sswitch_0
    sget-object v0, Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;->UNCOMPRESS:Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    .line 559
    :goto_0
    if-ge v4, v1, :cond_3

    .line 560
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " for chunk flag: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 561
    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 534
    :sswitch_1
    sget-object v0, Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;->RAW:Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    goto :goto_0

    .line 538
    :sswitch_2
    if-eq v4, v2, :cond_1

    .line 539
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "stream identifier chunk with invalid length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 543
    :cond_1
    sget-object v0, Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;->SKIP:Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    move v1, v2

    .line 545
    goto :goto_0

    .line 555
    :cond_2
    sget-object v0, Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;->SKIP:Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    move v1, v3

    .line 556
    goto :goto_0

    .line 564
    :cond_3
    new-instance v1, Lorg/xerial/snappy/SnappyFramedInputStream$FrameMetaData;

    invoke-direct {v1, v0, v4}, Lorg/xerial/snappy/SnappyFramedInputStream$FrameMetaData;-><init>(Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;I)V

    return-object v1

    .line 528
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0xff -> :sswitch_2
    .end sparse-switch
.end method

.method private readBlockHeader()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 493
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->frameHeader:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 494
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->rbc:Ljava/nio/channels/ReadableByteChannel;

    iget-object v1, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->frameHeader:Ljava/nio/ByteBuffer;

    invoke-static {v0, v1}, Lorg/xerial/snappy/SnappyFramed;->readBytes(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)I

    move-result v0

    .line 496
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 497
    const/4 v0, 0x0

    .line 505
    :goto_0
    return v0

    .line 500
    :cond_0
    iget-object v1, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->frameHeader:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 501
    new-instance v0, Ljava/io/EOFException;

    const-string v1, "encountered EOF while reading block header"

    invoke-direct {v0, v1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 503
    :cond_1
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->frameHeader:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 505
    const/4 v0, 0x1

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
    .line 221
    iget-boolean v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->closed:Z

    if-eqz v0, :cond_0

    .line 222
    const/4 v0, 0x0

    .line 224
    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->valid:I

    iget v1, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->position:I

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

    .line 357
    :try_start_0
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->rbc:Ljava/nio/channels/ReadableByteChannel;

    invoke-interface {v0}, Ljava/nio/channels/ReadableByteChannel;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 360
    iget-boolean v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->closed:Z

    if-nez v0, :cond_0

    .line 361
    iput-boolean v2, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->closed:Z

    .line 364
    :cond_0
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->input:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_1

    .line 365
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->input:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Lorg/xerial/snappy/SnappyFramed;->releaseDirectByteBuffer(Ljava/nio/ByteBuffer;)V

    .line 368
    :cond_1
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->uncompressedDirect:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_2

    .line 369
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->uncompressedDirect:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Lorg/xerial/snappy/SnappyFramed;->releaseDirectByteBuffer(Ljava/nio/ByteBuffer;)V

    .line 372
    :cond_2
    return-void

    .line 360
    :catchall_0
    move-exception v0

    iget-boolean v1, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->closed:Z

    if-nez v1, :cond_3

    .line 361
    iput-boolean v2, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->closed:Z

    .line 364
    :cond_3
    iget-object v1, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->input:Ljava/nio/ByteBuffer;

    if-eqz v1, :cond_4

    .line 365
    iget-object v1, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->input:Ljava/nio/ByteBuffer;

    invoke-static {v1}, Lorg/xerial/snappy/SnappyFramed;->releaseDirectByteBuffer(Ljava/nio/ByteBuffer;)V

    .line 368
    :cond_4
    iget-object v1, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->uncompressedDirect:Ljava/nio/ByteBuffer;

    if-eqz v1, :cond_5

    .line 369
    iget-object v1, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->uncompressedDirect:Ljava/nio/ByteBuffer;

    invoke-static {v1}, Lorg/xerial/snappy/SnappyFramed;->releaseDirectByteBuffer(Ljava/nio/ByteBuffer;)V

    :cond_5
    throw v0
.end method

.method public isOpen()Z
    .locals 1

    .prologue
    .line 233
    iget-boolean v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

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
    const/4 v0, -0x1

    .line 177
    iget-boolean v1, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->closed:Z

    if-eqz v1, :cond_1

    .line 183
    :cond_0
    :goto_0
    return v0

    .line 180
    :cond_1
    invoke-direct {p0}, Lorg/xerial/snappy/SnappyFramedInputStream;->ensureBuffer()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 183
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->buffer:[B

    iget v1, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->position:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    goto :goto_0
.end method

.method public read(Ljava/nio/ByteBuffer;)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 244
    if-nez p1, :cond_0

    .line 245
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "dst is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 248
    :cond_0
    iget-boolean v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->closed:Z

    if-eqz v0, :cond_1

    .line 249
    new-instance v0, Ljava/nio/channels/ClosedChannelException;

    invoke-direct {v0}, Ljava/nio/channels/ClosedChannelException;-><init>()V

    throw v0

    .line 252
    :cond_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-nez v0, :cond_2

    .line 253
    const/4 v0, 0x0

    .line 262
    :goto_0
    return v0

    .line 255
    :cond_2
    invoke-direct {p0}, Lorg/xerial/snappy/SnappyFramedInputStream;->ensureBuffer()Z

    move-result v0

    if-nez v0, :cond_3

    .line 256
    const/4 v0, -0x1

    goto :goto_0

    .line 259
    :cond_3
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-virtual {p0}, Lorg/xerial/snappy/SnappyFramedInputStream;->available()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 260
    iget-object v1, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->buffer:[B

    iget v2, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->position:I

    invoke-virtual {p1, v1, v2, v0}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 261
    iget v1, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->position:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->position:I

    goto :goto_0
.end method

.method public read([BII)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 191
    if-nez p1, :cond_0

    .line 192
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "output is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 195
    :cond_0
    if-ltz p2, :cond_1

    if-ltz p3, :cond_1

    add-int v0, p2, p3

    array-length v1, p1

    if-le v0, v1, :cond_2

    .line 196
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid offset ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] and length ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 200
    :cond_2
    iget-boolean v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->closed:Z

    if-eqz v0, :cond_3

    .line 201
    new-instance v0, Ljava/nio/channels/ClosedChannelException;

    invoke-direct {v0}, Ljava/nio/channels/ClosedChannelException;-><init>()V

    throw v0

    .line 204
    :cond_3
    if-nez p3, :cond_4

    .line 205
    const/4 v0, 0x0

    .line 214
    :goto_0
    return v0

    .line 207
    :cond_4
    invoke-direct {p0}, Lorg/xerial/snappy/SnappyFramedInputStream;->ensureBuffer()Z

    move-result v0

    if-nez v0, :cond_5

    .line 208
    const/4 v0, -0x1

    goto :goto_0

    .line 211
    :cond_5
    invoke-virtual {p0}, Lorg/xerial/snappy/SnappyFramedInputStream;->available()I

    move-result v0

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 212
    iget-object v1, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->buffer:[B

    iget v2, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->position:I

    invoke-static {v1, v2, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 213
    iget v1, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->position:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->position:I

    goto :goto_0
.end method

.method public transferTo(Ljava/io/OutputStream;)J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 284
    if-nez p1, :cond_0

    .line 285
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "os is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 288
    :cond_0
    iget-boolean v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->closed:Z

    if-eqz v0, :cond_1

    .line 289
    new-instance v0, Ljava/nio/channels/ClosedChannelException;

    invoke-direct {v0}, Ljava/nio/channels/ClosedChannelException;-><init>()V

    throw v0

    .line 292
    :cond_1
    const-wide/16 v0, 0x0

    .line 294
    :goto_0
    invoke-direct {p0}, Lorg/xerial/snappy/SnappyFramedInputStream;->ensureBuffer()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 295
    invoke-virtual {p0}, Lorg/xerial/snappy/SnappyFramedInputStream;->available()I

    move-result v2

    .line 296
    iget-object v3, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->buffer:[B

    iget v4, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->position:I

    invoke-virtual {p1, v3, v4, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 297
    iget v3, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->position:I

    add-int/2addr v3, v2

    iput v3, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->position:I

    .line 298
    int-to-long v2, v2

    add-long/2addr v0, v2

    .line 299
    goto :goto_0

    .line 301
    :cond_2
    return-wide v0
.end method

.method public transferTo(Ljava/nio/channels/WritableByteChannel;)J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 324
    if-nez p1, :cond_0

    .line 325
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "wbc is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 328
    :cond_0
    iget-boolean v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->closed:Z

    if-eqz v0, :cond_1

    .line 329
    new-instance v0, Ljava/nio/channels/ClosedChannelException;

    invoke-direct {v0}, Ljava/nio/channels/ClosedChannelException;-><init>()V

    throw v0

    .line 332
    :cond_1
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->buffer:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 334
    const-wide/16 v0, 0x0

    .line 336
    :goto_0
    invoke-direct {p0}, Lorg/xerial/snappy/SnappyFramedInputStream;->ensureBuffer()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 337
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 338
    iget v3, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->position:I

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 339
    iget v3, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->position:I

    invoke-virtual {p0}, Lorg/xerial/snappy/SnappyFramedInputStream;->available()I

    move-result v4

    add-int/2addr v3, v4

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 341
    invoke-interface {p1, v2}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 343
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    iget v4, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->position:I

    sub-int/2addr v3, v4

    .line 344
    iget v4, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->position:I

    add-int/2addr v4, v3

    iput v4, p0, Lorg/xerial/snappy/SnappyFramedInputStream;->position:I

    .line 346
    int-to-long v4, v3

    add-long/2addr v0, v4

    .line 347
    goto :goto_0

    .line 349
    :cond_2
    return-wide v0
.end method
