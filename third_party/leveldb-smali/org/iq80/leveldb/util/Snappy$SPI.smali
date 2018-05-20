.class public interface abstract Lorg/iq80/leveldb/util/Snappy$SPI;
.super Ljava/lang/Object;
.source "Snappy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/util/Snappy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "SPI"
.end annotation


# virtual methods
.method public abstract compress([BII[BI)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract compress(Ljava/lang/String;)[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract maxCompressedLength(I)I
.end method

.method public abstract uncompress(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract uncompress([BII[BI)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
