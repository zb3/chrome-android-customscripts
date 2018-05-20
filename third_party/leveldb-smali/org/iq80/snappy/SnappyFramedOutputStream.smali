.class public final Lorg/iq80/snappy/SnappyFramedOutputStream;
.super Lorg/iq80/snappy/AbstractSnappyOutputStream;
.source "SnappyFramedOutputStream.java"


# static fields
.field public static final DEFAULT_BLOCK_SIZE:I = 0x10000

.field public static final DEFAULT_MIN_COMPRESSION_RATIO:D = 0.85

.field public static final MAX_BLOCK_SIZE:I = 0x10000


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    const/high16 v0, 0x10000

    const-wide v2, 0x3feb333333333333L    # 0.85

    invoke-direct {p0, p1, v0, v2, v3}, Lorg/iq80/snappy/SnappyFramedOutputStream;-><init>(Ljava/io/OutputStream;ID)V

    .line 49
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;ID)V
    .locals 5
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

    .line 55
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/iq80/snappy/AbstractSnappyOutputStream;-><init>(Ljava/io/OutputStream;ID)V

    .line 56
    if-lez p2, :cond_0

    const/high16 v0, 0x10000

    if-gt p2, v0, :cond_0

    move v0, v1

    :goto_0
    const-string v3, "blockSize must be in (0, 65536]"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v1, v2

    invoke-static {v0, v3, v1}, Lorg/iq80/snappy/SnappyInternalUtils;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 57
    return-void

    :cond_0
    move v0, v2

    .line 56
    goto :goto_0
.end method


# virtual methods
.method public bridge synthetic write(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 31
    invoke-super {p0, p1}, Lorg/iq80/snappy/AbstractSnappyOutputStream;->write(I)V

    return-void
.end method

.method public bridge synthetic write([BII)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 31
    invoke-super {p0, p1, p2, p3}, Lorg/iq80/snappy/AbstractSnappyOutputStream;->write([BII)V

    return-void
.end method

.method protected writeBlock(Ljava/io/OutputStream;[BIIZI)V
    .locals 2
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "data"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I
    .param p5, "compressed"    # Z
    .param p6, "crc32c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    if-eqz p5, :cond_0

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write(I)V

    .line 80
    add-int/lit8 v0, p4, 0x4

    .line 83
    .local v0, "headerLength":I
    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 84
    ushr-int/lit8 v1, v0, 0x8

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write(I)V

    .line 85
    ushr-int/lit8 v1, v0, 0x10

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write(I)V

    .line 88
    invoke-virtual {p1, p6}, Ljava/io/OutputStream;->write(I)V

    .line 89
    ushr-int/lit8 v1, p6, 0x8

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write(I)V

    .line 90
    ushr-int/lit8 v1, p6, 0x10

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write(I)V

    .line 91
    ushr-int/lit8 v1, p6, 0x18

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write(I)V

    .line 94
    invoke-virtual {p1, p2, p3, p4}, Ljava/io/OutputStream;->write([BII)V

    .line 95
    return-void

    .line 76
    .end local v0    # "headerLength":I
    :cond_0
    const/4 v1, 0x1

    goto :goto_0
.end method

.method protected writeHeader(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    sget-object v0, Lorg/iq80/snappy/SnappyFramed;->HEADER_BYTES:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 64
    return-void
.end method
