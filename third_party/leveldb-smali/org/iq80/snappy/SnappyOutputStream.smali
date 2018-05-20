.class public Lorg/iq80/snappy/SnappyOutputStream;
.super Lorg/iq80/snappy/AbstractSnappyOutputStream;
.source "SnappyOutputStream.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field static final MAX_BLOCK_SIZE:I = 0x8000

.field public static final MIN_COMPRESSION_RATIO:D = 0.875

.field static final STREAM_HEADER:[B


# instance fields
.field private final calculateChecksum:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 53
    const/4 v0, 0x7

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/iq80/snappy/SnappyOutputStream;->STREAM_HEADER:[B

    return-void

    nop

    :array_0
    .array-data 1
        0x73t
        0x6et
        0x61t
        0x70t
        0x70t
        0x79t
        0x0t
    .end array-data
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/iq80/snappy/SnappyOutputStream;-><init>(Ljava/io/OutputStream;Z)V

    .line 74
    return-void
.end method

.method private constructor <init>(Ljava/io/OutputStream;Z)V
    .locals 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "calculateChecksum"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    const v0, 0x8000

    const-wide/high16 v2, 0x3fec000000000000L    # 0.875

    invoke-direct {p0, p1, v0, v2, v3}, Lorg/iq80/snappy/AbstractSnappyOutputStream;-><init>(Ljava/io/OutputStream;ID)V

    .line 80
    iput-boolean p2, p0, Lorg/iq80/snappy/SnappyOutputStream;->calculateChecksum:Z

    .line 81
    return-void
.end method

.method public static newChecksumFreeBenchmarkOutputStream(Ljava/io/OutputStream;)Lorg/iq80/snappy/SnappyOutputStream;
    .locals 2
    .param p0, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    new-instance v0, Lorg/iq80/snappy/SnappyOutputStream;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/iq80/snappy/SnappyOutputStream;-><init>(Ljava/io/OutputStream;Z)V

    return-object v0
.end method


# virtual methods
.method protected calculateCRC32C([BII)I
    .locals 1
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 105
    iget-boolean v0, p0, Lorg/iq80/snappy/SnappyOutputStream;->calculateChecksum:Z

    if-eqz v0, :cond_0

    invoke-super {p0, p1, p2, p3}, Lorg/iq80/snappy/AbstractSnappyOutputStream;->calculateCRC32C([BII)I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic write(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 49
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
    .line 49
    invoke-super {p0, p1, p2, p3}, Lorg/iq80/snappy/AbstractSnappyOutputStream;->write([BII)V

    return-void
.end method

.method protected writeBlock(Ljava/io/OutputStream;[BIIZI)V
    .locals 1
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
    .line 113
    if-eqz p5, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 116
    ushr-int/lit8 v0, p4, 0x8

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 117
    invoke-virtual {p1, p4}, Ljava/io/OutputStream;->write(I)V

    .line 120
    ushr-int/lit8 v0, p6, 0x18

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 121
    ushr-int/lit8 v0, p6, 0x10

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 122
    ushr-int/lit8 v0, p6, 0x8

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 123
    invoke-virtual {p1, p6}, Ljava/io/OutputStream;->write(I)V

    .line 126
    invoke-virtual {p1, p2, p3, p4}, Ljava/io/OutputStream;->write([BII)V

    .line 127
    return-void

    .line 113
    :cond_0
    const/4 v0, 0x0

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
    .line 99
    sget-object v0, Lorg/iq80/snappy/SnappyOutputStream;->STREAM_HEADER:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 100
    return-void
.end method
