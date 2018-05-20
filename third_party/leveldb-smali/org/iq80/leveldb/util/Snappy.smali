.class public final Lorg/iq80/leveldb/util/Snappy;
.super Ljava/lang/Object;
.source "Snappy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/iq80/leveldb/util/Snappy$IQ80Snappy;,
        Lorg/iq80/leveldb/util/Snappy$XerialSnappy;,
        Lorg/iq80/leveldb/util/Snappy$SPI;
    }
.end annotation


# static fields
.field private static final SNAPPY:Lorg/iq80/leveldb/util/Snappy$SPI;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    .line 204
    const/4 v1, 0x0

    .line 205
    .local v1, "attempt":Lorg/iq80/leveldb/util/Snappy$SPI;
    const-string v5, "leveldb.snappy"

    const-string v6, "iq80,xerial"

    invoke-static {v5, v6}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 206
    .local v2, "factories":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v5, v2

    if-ge v3, v5, :cond_2

    if-nez v1, :cond_2

    .line 207
    aget-object v4, v2, v3

    .line 209
    .local v4, "name":Ljava/lang/String;
    :try_start_0
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 210
    const-string v5, "xerial"

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 211
    const-string v4, "org.iq80.leveldb.util.Snappy$XerialSnappy"

    .line 216
    :cond_0
    :goto_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Lorg/iq80/leveldb/util/Snappy$SPI;

    move-object v1, v0

    .line 206
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 213
    :cond_1
    const-string v5, "iq80"

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 214
    const-string v4, "org.iq80.leveldb.util.Snappy$IQ80Snappy"
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 221
    .end local v4    # "name":Ljava/lang/String;
    :cond_2
    sput-object v1, Lorg/iq80/leveldb/util/Snappy;->SNAPPY:Lorg/iq80/leveldb/util/Snappy$SPI;

    .line 222
    return-void

    .line 218
    .restart local v4    # "name":Ljava/lang/String;
    :catch_0
    move-exception v5

    goto :goto_2
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    return-void
.end method

.method public static available()Z
    .locals 1

    .prologue
    .line 226
    sget-object v0, Lorg/iq80/leveldb/util/Snappy;->SNAPPY:Lorg/iq80/leveldb/util/Snappy$SPI;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static compress([BII[BI)I
    .locals 6
    .param p0, "input"    # [B
    .param p1, "inputOffset"    # I
    .param p2, "length"    # I
    .param p3, "output"    # [B
    .param p4, "outputOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 244
    sget-object v0, Lorg/iq80/leveldb/util/Snappy;->SNAPPY:Lorg/iq80/leveldb/util/Snappy$SPI;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move v5, p4

    invoke-interface/range {v0 .. v5}, Lorg/iq80/leveldb/util/Snappy$SPI;->compress([BII[BI)I

    move-result v0

    return v0
.end method

.method public static compress(Ljava/lang/String;)[B
    .locals 1
    .param p0, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 250
    sget-object v0, Lorg/iq80/leveldb/util/Snappy;->SNAPPY:Lorg/iq80/leveldb/util/Snappy$SPI;

    invoke-interface {v0, p0}, Lorg/iq80/leveldb/util/Snappy$SPI;->compress(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public static maxCompressedLength(I)I
    .locals 1
    .param p0, "length"    # I

    .prologue
    .line 255
    sget-object v0, Lorg/iq80/leveldb/util/Snappy;->SNAPPY:Lorg/iq80/leveldb/util/Snappy$SPI;

    invoke-interface {v0, p0}, Lorg/iq80/leveldb/util/Snappy$SPI;->maxCompressedLength(I)I

    move-result v0

    return v0
.end method

.method public static uncompress(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p0, "compressed"    # Ljava/nio/ByteBuffer;
    .param p1, "uncompressed"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 232
    sget-object v0, Lorg/iq80/leveldb/util/Snappy;->SNAPPY:Lorg/iq80/leveldb/util/Snappy$SPI;

    invoke-interface {v0, p0, p1}, Lorg/iq80/leveldb/util/Snappy$SPI;->uncompress(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I

    .line 233
    return-void
.end method

.method public static uncompress([BII[BI)V
    .locals 6
    .param p0, "input"    # [B
    .param p1, "inputOffset"    # I
    .param p2, "length"    # I
    .param p3, "output"    # [B
    .param p4, "outputOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 238
    sget-object v0, Lorg/iq80/leveldb/util/Snappy;->SNAPPY:Lorg/iq80/leveldb/util/Snappy$SPI;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move v5, p4

    invoke-interface/range {v0 .. v5}, Lorg/iq80/leveldb/util/Snappy$SPI;->uncompress([BII[BI)I

    .line 239
    return-void
.end method
