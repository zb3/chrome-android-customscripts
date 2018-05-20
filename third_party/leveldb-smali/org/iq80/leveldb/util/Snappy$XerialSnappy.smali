.class public Lorg/iq80/leveldb/util/Snappy$XerialSnappy;
.super Ljava/lang/Object;
.source "Snappy.java"

# interfaces
.implements Lorg/iq80/leveldb/util/Snappy$SPI;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/util/Snappy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "XerialSnappy"
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 68
    :try_start_0
    const-string v1, "test"

    invoke-static {v1}, Lorg/xerial/snappy/Snappy;->compress(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    return-void

    .line 70
    :catch_0
    move-exception v0

    .line 71
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compress([BII[BI)I
    .locals 1
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "length"    # I
    .param p4, "output"    # [B
    .param p5, "outputOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    invoke-static {p1, p2, p3, p4, p5}, Lorg/xerial/snappy/Snappy;->compress([BII[BI)I

    move-result v0

    return v0
.end method

.method public compress(Ljava/lang/String;)[B
    .locals 1
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    invoke-static {p1}, Lorg/xerial/snappy/Snappy;->compress(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public maxCompressedLength(I)I
    .locals 1
    .param p1, "length"    # I

    .prologue
    .line 106
    invoke-static {p1}, Lorg/xerial/snappy/Snappy;->maxCompressedLength(I)I

    move-result v0

    return v0
.end method

.method public uncompress(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I
    .locals 1
    .param p1, "compressed"    # Ljava/nio/ByteBuffer;
    .param p2, "uncompressed"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    invoke-static {p1, p2}, Lorg/xerial/snappy/Snappy;->uncompress(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I

    move-result v0

    return v0
.end method

.method public uncompress([BII[BI)I
    .locals 1
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "length"    # I
    .param p4, "output"    # [B
    .param p5, "outputOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    invoke-static {p1, p2, p3, p4, p5}, Lorg/xerial/snappy/Snappy;->uncompress([BII[BI)I

    move-result v0

    return v0
.end method
