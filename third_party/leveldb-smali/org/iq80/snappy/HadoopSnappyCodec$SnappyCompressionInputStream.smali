.class Lorg/iq80/snappy/HadoopSnappyCodec$SnappyCompressionInputStream;
.super Lorg/apache/hadoop/io/compress/CompressionInputStream;
.source "HadoopSnappyCodec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/snappy/HadoopSnappyCodec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SnappyCompressionInputStream"
.end annotation


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    new-instance v0, Lorg/iq80/snappy/SnappyInputStream;

    invoke-direct {v0, p1}, Lorg/iq80/snappy/SnappyInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {p0, v0}, Lorg/apache/hadoop/io/compress/CompressionInputStream;-><init>(Ljava/io/InputStream;)V

    .line 136
    return-void
.end method


# virtual methods
.method public read()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 156
    iget-object v0, p0, Lorg/iq80/snappy/HadoopSnappyCodec$SnappyCompressionInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 1
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 142
    iget-object v0, p0, Lorg/iq80/snappy/HadoopSnappyCodec$SnappyCompressionInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public resetState()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "resetState not supported for Snappy"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
