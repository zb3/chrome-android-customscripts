.class Lorg/iq80/snappy/HadoopSnappyCodec$SnappyCompressionOutputStream;
.super Lorg/apache/hadoop/io/compress/CompressionOutputStream;
.source "HadoopSnappyCodec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/snappy/HadoopSnappyCodec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SnappyCompressionOutputStream"
.end annotation


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    new-instance v0, Lorg/iq80/snappy/SnappyOutputStream;

    invoke-direct {v0, p1}, Lorg/iq80/snappy/SnappyOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {p0, v0}, Lorg/apache/hadoop/io/compress/CompressionOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 98
    return-void
.end method


# virtual methods
.method public finish()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    iget-object v0, p0, Lorg/iq80/snappy/HadoopSnappyCodec$SnappyCompressionOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 112
    return-void
.end method

.method public resetState()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    iget-object v0, p0, Lorg/iq80/snappy/HadoopSnappyCodec$SnappyCompressionOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 119
    return-void
.end method

.method public write(I)V
    .locals 1
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    iget-object v0, p0, Lorg/iq80/snappy/HadoopSnappyCodec$SnappyCompressionOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 126
    return-void
.end method

.method public write([BII)V
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
    .line 104
    iget-object v0, p0, Lorg/iq80/snappy/HadoopSnappyCodec$SnappyCompressionOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 105
    return-void
.end method
