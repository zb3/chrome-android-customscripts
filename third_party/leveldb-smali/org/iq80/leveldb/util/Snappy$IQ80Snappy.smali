.class public Lorg/iq80/leveldb/util/Snappy$IQ80Snappy;
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
    name = "IQ80Snappy"
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 116
    :try_start_0
    new-instance v1, Lorg/iq80/leveldb/util/Snappy$IQ80Snappy;

    invoke-direct {v1}, Lorg/iq80/leveldb/util/Snappy$IQ80Snappy;-><init>()V

    const-string v2, "test"

    invoke-virtual {v1, v2}, Lorg/iq80/leveldb/util/Snappy$IQ80Snappy;->compress(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 121
    return-void

    .line 118
    :catch_0
    move-exception v0

    .line 119
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 110
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
    .line 179
    invoke-static {p1, p2, p3, p4, p5}, Lorg/iq80/snappy/Snappy;->compress([BII[BI)I

    move-result v0

    return v0
.end method

.method public compress(Ljava/lang/String;)[B
    .locals 8
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 186
    const-string v0, "UTF-8"

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 187
    .local v1, "uncomressed":[B
    array-length v0, v1

    invoke-virtual {p0, v0}, Lorg/iq80/leveldb/util/Snappy$IQ80Snappy;->maxCompressedLength(I)I

    move-result v0

    new-array v4, v0, [B

    .line 188
    .local v4, "compressedOut":[B
    array-length v3, v1

    move-object v0, p0

    move v5, v2

    invoke-virtual/range {v0 .. v5}, Lorg/iq80/leveldb/util/Snappy$IQ80Snappy;->compress([BII[BI)I

    move-result v6

    .line 189
    .local v6, "compressedSize":I
    new-array v7, v6, [B

    .line 190
    .local v7, "trimmedBuffer":[B
    invoke-static {v4, v2, v7, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 191
    return-object v7
.end method

.method public maxCompressedLength(I)I
    .locals 1
    .param p1, "length"    # I

    .prologue
    .line 197
    invoke-static {p1}, Lorg/iq80/snappy/Snappy;->maxCompressedLength(I)I

    move-result v0

    return v0
.end method

.method public uncompress(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I
    .locals 10
    .param p1, "compressed"    # Ljava/nio/ByteBuffer;
    .param p2, "uncompressed"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasArray()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 133
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    .line 134
    .local v1, "input":[B
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v8

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v9

    add-int v2, v8, v9

    .line 135
    .local v2, "inputOffset":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    .line 145
    .local v3, "length":I
    :goto_0
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->hasArray()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 146
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    .line 147
    .local v4, "output":[B
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v8

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->position()I

    move-result v9

    add-int v5, v8, v9

    .line 155
    .local v5, "outputOffset":I
    :goto_1
    invoke-static {v1, v2, v3, v4, v5}, Lorg/iq80/snappy/Snappy;->uncompress([BII[BI)I

    move-result v0

    .line 156
    .local v0, "count":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->hasArray()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 157
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->position()I

    move-result v8

    add-int/2addr v8, v0

    invoke-virtual {p2, v8}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 165
    :goto_2
    return v0

    .line 138
    .end local v0    # "count":I
    .end local v1    # "input":[B
    .end local v2    # "inputOffset":I
    .end local v3    # "length":I
    .end local v4    # "output":[B
    .end local v5    # "outputOffset":I
    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v8

    new-array v1, v8, [B

    .line 139
    .restart local v1    # "input":[B
    const/4 v2, 0x0

    .line 140
    .restart local v2    # "inputOffset":I
    array-length v3, v1

    .line 141
    .restart local v3    # "length":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->mark()Ljava/nio/Buffer;

    .line 142
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 143
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->reset()Ljava/nio/Buffer;

    goto :goto_0

    .line 150
    :cond_1
    invoke-static {v1, v2}, Lorg/iq80/snappy/Snappy;->getUncompressedLength([BI)I

    move-result v7

    .line 151
    .local v7, "t":I
    new-array v4, v7, [B

    .line 152
    .restart local v4    # "output":[B
    const/4 v5, 0x0

    .restart local v5    # "outputOffset":I
    goto :goto_1

    .line 160
    .end local v7    # "t":I
    .restart local v0    # "count":I
    :cond_2
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->position()I

    move-result v6

    .line 161
    .local v6, "p":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v8

    invoke-virtual {p2, v8}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 162
    const/4 v8, 0x0

    invoke-virtual {p2, v4, v8, v0}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 163
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/nio/Buffer;->position(I)Ljava/nio/Buffer;

    goto :goto_2
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
    .line 172
    invoke-static {p1, p2, p3, p4, p5}, Lorg/iq80/snappy/Snappy;->uncompress([BII[BI)I

    move-result v0

    return v0
.end method
