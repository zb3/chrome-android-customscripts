.class public final Lorg/xerial/snappy/SnappyFramedOutputStream;
.super Ljava/io/OutputStream;
.source "SnappyFramedOutputStream.java"

# interfaces
.implements Ljava/nio/channels/WritableByteChannel;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final DEFAULT_BLOCK_SIZE:I = 0x10000

.field public static final DEFAULT_MIN_COMPRESSION_RATIO:D = 0.85

.field public static final MAX_BLOCK_SIZE:I = 0x10000


# instance fields
.field private final buffer:Ljava/nio/ByteBuffer;

.field private closed:Z

.field private final directInputBuffer:Ljava/nio/ByteBuffer;

.field private final headerBuffer:Ljava/nio/ByteBuffer;

.field private final minCompressionRatio:D

.field private final out:Ljava/nio/channels/WritableByteChannel;

.field private final outputBuffer:Ljava/nio/ByteBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const-class v0, Lorg/xerial/snappy/SnappyFramedOutputStream;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/xerial/snappy/SnappyFramedOutputStream;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 83
    const/high16 v0, 0x10000

    const-wide v2, 0x3feb333333333333L    # 0.85

    invoke-direct {p0, p1, v0, v2, v3}, Lorg/xerial/snappy/SnappyFramedOutputStream;-><init>(Ljava/io/OutputStream;ID)V

    .line 84
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;ID)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    invoke-static {p1}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/OutputStream;)Ljava/nio/channels/WritableByteChannel;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3, p4}, Lorg/xerial/snappy/SnappyFramedOutputStream;-><init>(Ljava/nio/channels/WritableByteChannel;ID)V

    .line 103
    return-void
.end method

.method public constructor <init>(Ljava/nio/channels/WritableByteChannel;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 117
    const/high16 v0, 0x10000

    const-wide v2, 0x3feb333333333333L    # 0.85

    invoke-direct {p0, p1, v0, v2, v3}, Lorg/xerial/snappy/SnappyFramedOutputStream;-><init>(Ljava/nio/channels/WritableByteChannel;ID)V

    .line 118
    return-void
.end method

.method public constructor <init>(Ljava/nio/channels/WritableByteChannel;ID)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 136
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 60
    const/16 v0, 0x8

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->headerBuffer:Ljava/nio/ByteBuffer;

    .line 137
    if-nez p1, :cond_0

    .line 138
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 141
    :cond_0
    const-wide/16 v0, 0x0

    cmpg-double v0, p3, v0

    if-lez v0, :cond_1

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    cmpl-double v0, p3, v0

    if-lez v0, :cond_2

    .line 142
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "minCompressionRatio "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3, p4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " must be in (0,1.0]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 146
    :cond_2
    if-lez p2, :cond_3

    const/high16 v0, 0x10000

    if-le p2, v0, :cond_4

    .line 147
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "block size "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " must be in (0, 65536]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 151
    :cond_4
    iput-object p1, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->out:Ljava/nio/channels/WritableByteChannel;

    .line 152
    iput-wide p3, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->minCompressionRatio:D

    .line 153
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    .line 154
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->directInputBuffer:Ljava/nio/ByteBuffer;

    .line 156
    invoke-static {p2}, Lorg/xerial/snappy/Snappy;->maxCompressedLength(I)I

    move-result v0

    .line 155
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->outputBuffer:Ljava/nio/ByteBuffer;

    .line 158
    invoke-direct {p0, p1}, Lorg/xerial/snappy/SnappyFramedOutputStream;->writeHeader(Ljava/nio/channels/WritableByteChannel;)V

    .line 159
    return-void
.end method

.method private flushBuffer()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 388
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    if-lez v0, :cond_0

    .line 389
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 390
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-direct {p0, v0}, Lorg/xerial/snappy/SnappyFramedOutputStream;->writeCompressed(Ljava/nio/ByteBuffer;)V

    .line 391
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 393
    :cond_0
    return-void
.end method

.method private writeBlock(Ljava/nio/channels/WritableByteChannel;Ljava/nio/ByteBuffer;ZI)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 451
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->headerBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 452
    iget-object v1, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->headerBuffer:Ljava/nio/ByteBuffer;

    if-eqz p3, :cond_0

    const/4 v0, 0x0

    :goto_0
    int-to-byte v0, v0

    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 457
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    add-int/lit8 v0, v0, 0x4

    .line 460
    iget-object v1, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->headerBuffer:Ljava/nio/ByteBuffer;

    int-to-byte v2, v0

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 461
    iget-object v1, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->headerBuffer:Ljava/nio/ByteBuffer;

    ushr-int/lit8 v2, v0, 0x8

    int-to-byte v2, v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 462
    iget-object v1, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->headerBuffer:Ljava/nio/ByteBuffer;

    ushr-int/lit8 v0, v0, 0x10

    int-to-byte v0, v0

    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 465
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->headerBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p4}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 467
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->headerBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 470
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->headerBuffer:Ljava/nio/ByteBuffer;

    invoke-interface {p1, v0}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 472
    invoke-interface {p1, p2}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 473
    return-void

    .line 452
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private writeCompressed(Ljava/nio/ByteBuffer;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 408
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    .line 409
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    .line 412
    invoke-static {v0, v6, v1}, Lorg/xerial/snappy/SnappyFramed;->maskedCrc32c([BII)I

    move-result v0

    .line 414
    iget-object v2, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->directInputBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 415
    iget-object v2, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->directInputBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 416
    iget-object v2, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->directInputBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 418
    iget-object v2, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->outputBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 419
    iget-object v2, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->directInputBuffer:Ljava/nio/ByteBuffer;

    iget-object v3, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->outputBuffer:Ljava/nio/ByteBuffer;

    invoke-static {v2, v3}, Lorg/xerial/snappy/Snappy;->compress(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I

    .line 421
    iget-object v2, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->outputBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    .line 425
    int-to-double v2, v2

    int-to-double v4, v1

    div-double/2addr v2, v4

    iget-wide v4, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->minCompressionRatio:D

    cmpg-double v1, v2, v4

    if-gtz v1, :cond_0

    .line 426
    iget-object v1, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->out:Ljava/nio/channels/WritableByteChannel;

    iget-object v2, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->outputBuffer:Ljava/nio/ByteBuffer;

    const/4 v3, 0x1

    invoke-direct {p0, v1, v2, v3, v0}, Lorg/xerial/snappy/SnappyFramedOutputStream;->writeBlock(Ljava/nio/channels/WritableByteChannel;Ljava/nio/ByteBuffer;ZI)V

    .line 433
    :goto_0
    return-void

    .line 430
    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 431
    iget-object v1, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->out:Ljava/nio/channels/WritableByteChannel;

    invoke-direct {p0, v1, p1, v6, v0}, Lorg/xerial/snappy/SnappyFramedOutputStream;->writeBlock(Ljava/nio/channels/WritableByteChannel;Ljava/nio/ByteBuffer;ZI)V

    goto :goto_0
.end method

.method private writeHeader(Ljava/nio/channels/WritableByteChannel;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 171
    sget-object v0, Lorg/xerial/snappy/SnappyFramed;->HEADER_BYTES:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 172
    return-void
.end method


# virtual methods
.method public final close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 364
    iget-boolean v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->closed:Z

    if-eqz v0, :cond_0

    .line 377
    :goto_0
    return-void

    .line 368
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lorg/xerial/snappy/SnappyFramedOutputStream;->flush()V

    .line 369
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->out:Ljava/nio/channels/WritableByteChannel;

    invoke-interface {v0}, Ljava/nio/channels/WritableByteChannel;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 372
    iput-boolean v1, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->closed:Z

    .line 374
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->directInputBuffer:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Lorg/xerial/snappy/SnappyFramed;->releaseDirectByteBuffer(Ljava/nio/ByteBuffer;)V

    .line 375
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->outputBuffer:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Lorg/xerial/snappy/SnappyFramed;->releaseDirectByteBuffer(Ljava/nio/ByteBuffer;)V

    goto :goto_0

    .line 372
    :catchall_0
    move-exception v0

    iput-boolean v1, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->closed:Z

    .line 374
    iget-object v1, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->directInputBuffer:Ljava/nio/ByteBuffer;

    invoke-static {v1}, Lorg/xerial/snappy/SnappyFramed;->releaseDirectByteBuffer(Ljava/nio/ByteBuffer;)V

    .line 375
    iget-object v1, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->outputBuffer:Ljava/nio/ByteBuffer;

    invoke-static {v1}, Lorg/xerial/snappy/SnappyFramed;->releaseDirectByteBuffer(Ljava/nio/ByteBuffer;)V

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
    .line 354
    iget-boolean v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->closed:Z

    if-eqz v0, :cond_0

    .line 355
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Stream is closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 357
    :cond_0
    invoke-direct {p0}, Lorg/xerial/snappy/SnappyFramedOutputStream;->flushBuffer()V

    .line 358
    return-void
.end method

.method public isOpen()Z
    .locals 1

    .prologue
    .line 180
    iget-boolean v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public transferFrom(Ljava/io/InputStream;)J
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 280
    iget-boolean v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->closed:Z

    if-eqz v0, :cond_0

    .line 281
    new-instance v0, Ljava/nio/channels/ClosedChannelException;

    invoke-direct {v0}, Ljava/nio/channels/ClosedChannelException;-><init>()V

    throw v0

    .line 284
    :cond_0
    if-nez p1, :cond_1

    .line 285
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 288
    :cond_1
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-nez v0, :cond_2

    .line 289
    invoke-direct {p0}, Lorg/xerial/snappy/SnappyFramedOutputStream;->flushBuffer()V

    .line 292
    :cond_2
    sget-boolean v0, Lorg/xerial/snappy/SnappyFramedOutputStream;->$assertionsDisabled:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasArray()Z

    move-result v0

    if-nez v0, :cond_3

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 293
    :cond_3
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    .line 295
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v3

    .line 296
    const-wide/16 v0, 0x0

    .line 298
    :goto_0
    iget-object v4, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    add-int/2addr v4, v3

    iget-object v5, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    .line 299
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    .line 298
    invoke-virtual {p1, v2, v4, v5}, Ljava/io/InputStream;->read([BII)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_5

    .line 300
    iget-object v5, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    iget-object v6, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->position()I

    move-result v6

    add-int/2addr v6, v4

    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 302
    iget-object v5, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    if-nez v5, :cond_4

    .line 303
    invoke-direct {p0}, Lorg/xerial/snappy/SnappyFramedOutputStream;->flushBuffer()V

    .line 306
    :cond_4
    int-to-long v4, v4

    add-long/2addr v0, v4

    goto :goto_0

    .line 309
    :cond_5
    return-wide v0
.end method

.method public transferFrom(Ljava/nio/channels/ReadableByteChannel;)J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 325
    iget-boolean v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->closed:Z

    if-eqz v0, :cond_0

    .line 326
    new-instance v0, Ljava/nio/channels/ClosedChannelException;

    invoke-direct {v0}, Ljava/nio/channels/ClosedChannelException;-><init>()V

    throw v0

    .line 329
    :cond_0
    if-nez p1, :cond_1

    .line 330
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 333
    :cond_1
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-nez v0, :cond_2

    .line 334
    invoke-direct {p0}, Lorg/xerial/snappy/SnappyFramedOutputStream;->flushBuffer()V

    .line 337
    :cond_2
    const-wide/16 v0, 0x0

    .line 339
    :goto_0
    iget-object v2, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-interface {p1, v2}, Ljava/nio/channels/ReadableByteChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_4

    .line 340
    iget-object v3, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    if-nez v3, :cond_3

    .line 341
    invoke-direct {p0}, Lorg/xerial/snappy/SnappyFramedOutputStream;->flushBuffer()V

    .line 344
    :cond_3
    int-to-long v2, v2

    add-long/2addr v0, v2

    goto :goto_0

    .line 347
    :cond_4
    return-wide v0
.end method

.method public write(Ljava/nio/ByteBuffer;)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 232
    iget-boolean v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->closed:Z

    if-eqz v0, :cond_0

    .line 233
    new-instance v0, Ljava/nio/channels/ClosedChannelException;

    invoke-direct {v0}, Ljava/nio/channels/ClosedChannelException;-><init>()V

    throw v0

    .line 236
    :cond_0
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-gtz v0, :cond_1

    .line 237
    invoke-direct {p0}, Lorg/xerial/snappy/SnappyFramedOutputStream;->flushBuffer()V

    .line 240
    :cond_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    .line 243
    iget-object v1, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    if-lt v1, v2, :cond_2

    .line 244
    iget-object v1, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 264
    :goto_0
    return v0

    .line 249
    :cond_2
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    add-int/2addr v1, v2

    .line 251
    :goto_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    iget-object v3, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    add-int/2addr v2, v3

    if-gt v2, v1, :cond_3

    .line 253
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    iget-object v3, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    add-int/2addr v2, v3

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 254
    iget-object v2, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 255
    invoke-direct {p0}, Lorg/xerial/snappy/SnappyFramedOutputStream;->flushBuffer()V

    goto :goto_1

    .line 259
    :cond_3
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 262
    iget-object v1, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    goto :goto_0
.end method

.method public write(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 187
    iget-boolean v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->closed:Z

    if-eqz v0, :cond_0

    .line 188
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Stream is closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 190
    :cond_0
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-gtz v0, :cond_1

    .line 191
    invoke-direct {p0}, Lorg/xerial/snappy/SnappyFramedOutputStream;->flushBuffer()V

    .line 193
    :cond_1
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    int-to-byte v1, p1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 194
    return-void
.end method

.method public write([BII)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 200
    iget-boolean v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->closed:Z

    if-eqz v0, :cond_0

    .line 201
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Stream is closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 204
    :cond_0
    if-nez p1, :cond_1

    .line 205
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 207
    :cond_1
    if-ltz p2, :cond_2

    array-length v0, p1

    if-gt p2, v0, :cond_2

    if-ltz p3, :cond_2

    add-int v0, p2, p3

    array-length v1, p1

    if-gt v0, v1, :cond_2

    add-int v0, p2, p3

    if-gez v0, :cond_3

    .line 210
    :cond_2
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 213
    :cond_3
    :goto_0
    if-lez p3, :cond_5

    .line 214
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-gtz v0, :cond_4

    .line 215
    invoke-direct {p0}, Lorg/xerial/snappy/SnappyFramedOutputStream;->flushBuffer()V

    .line 218
    :cond_4
    iget-object v0, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 219
    iget-object v1, p0, Lorg/xerial/snappy/SnappyFramedOutputStream;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, p1, p2, v0}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 220
    add-int/2addr p2, v0

    .line 221
    sub-int/2addr p3, v0

    .line 222
    goto :goto_0

    .line 223
    :cond_5
    return-void
.end method
