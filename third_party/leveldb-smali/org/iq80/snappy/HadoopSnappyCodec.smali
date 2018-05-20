.class public Lorg/iq80/snappy/HadoopSnappyCodec;
.super Ljava/lang/Object;
.source "HadoopSnappyCodec.java"

# interfaces
.implements Lorg/apache/hadoop/io/compress/CompressionCodec;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/iq80/snappy/HadoopSnappyCodec$SnappyCompressionInputStream;,
        Lorg/iq80/snappy/HadoopSnappyCodec$SnappyCompressionOutputStream;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 129
    return-void
.end method


# virtual methods
.method public createCompressor()Lorg/apache/hadoop/io/compress/Compressor;
    .locals 2

    .prologue
    .line 56
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Snappy Compressor is not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createDecompressor()Lorg/apache/hadoop/io/compress/Decompressor;
    .locals 2

    .prologue
    .line 82
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Snappy Decompressor is not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createInputStream(Ljava/io/InputStream;)Lorg/apache/hadoop/io/compress/CompressionInputStream;
    .locals 1
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    new-instance v0, Lorg/iq80/snappy/HadoopSnappyCodec$SnappyCompressionInputStream;

    invoke-direct {v0, p1}, Lorg/iq80/snappy/HadoopSnappyCodec$SnappyCompressionInputStream;-><init>(Ljava/io/InputStream;)V

    return-object v0
.end method

.method public createInputStream(Ljava/io/InputStream;Lorg/apache/hadoop/io/compress/Decompressor;)Lorg/apache/hadoop/io/compress/CompressionInputStream;
    .locals 2
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "decompressor"    # Lorg/apache/hadoop/io/compress/Decompressor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Snappy Decompressor is not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createOutputStream(Ljava/io/OutputStream;)Lorg/apache/hadoop/io/compress/CompressionOutputStream;
    .locals 1
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 37
    new-instance v0, Lorg/iq80/snappy/HadoopSnappyCodec$SnappyCompressionOutputStream;

    invoke-direct {v0, p1}, Lorg/iq80/snappy/HadoopSnappyCodec$SnappyCompressionOutputStream;-><init>(Ljava/io/OutputStream;)V

    return-object v0
.end method

.method public createOutputStream(Ljava/io/OutputStream;Lorg/apache/hadoop/io/compress/Compressor;)Lorg/apache/hadoop/io/compress/CompressionOutputStream;
    .locals 2
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .param p2, "compressor"    # Lorg/apache/hadoop/io/compress/Compressor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Snappy Compressor is not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getCompressorType()Ljava/lang/Class;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Lorg/apache/hadoop/io/compress/Compressor;",
            ">;"
        }
    .end annotation

    .prologue
    .line 50
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Snappy Compressor is not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDecompressorType()Ljava/lang/Class;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Lorg/apache/hadoop/io/compress/Decompressor;",
            ">;"
        }
    .end annotation

    .prologue
    .line 76
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Snappy Decompressor is not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDefaultExtension()Ljava/lang/String;
    .locals 1

    .prologue
    .line 88
    const-string v0, ".snappy"

    return-object v0
.end method
