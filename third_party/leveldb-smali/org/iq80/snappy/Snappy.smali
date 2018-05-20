.class public final Lorg/iq80/snappy/Snappy;
.super Ljava/lang/Object;
.source "Snappy.java"


# static fields
.field static final COPY_1_BYTE_OFFSET:I = 0x1

.field static final COPY_2_BYTE_OFFSET:I = 0x2

.field static final COPY_4_BYTE_OFFSET:I = 0x3

.field static final LITERAL:I

.field private static final MAX_HEADER_LENGTH:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 32
    sget-object v0, Lorg/iq80/snappy/SnappyOutputStream;->STREAM_HEADER:[B

    array-length v0, v0

    sget-object v1, Lorg/iq80/snappy/SnappyFramed;->HEADER_BYTES:[B

    array-length v1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    sput v0, Lorg/iq80/snappy/Snappy;->MAX_HEADER_LENGTH:I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    return-void
.end method

.method public static compress([BII[BI)I
    .locals 1
    .param p0, "uncompressed"    # [B
    .param p1, "uncompressedOffset"    # I
    .param p2, "uncompressedLength"    # I
    .param p3, "compressed"    # [B
    .param p4, "compressedOffset"    # I

    .prologue
    .line 106
    invoke-static {p0, p1, p2, p3, p4}, Lorg/iq80/snappy/SnappyCompressor;->compress([BII[BI)I

    move-result v0

    return v0
.end method

.method public static compress([B)[B
    .locals 5
    .param p0, "data"    # [B

    .prologue
    const/4 v4, 0x0

    .line 116
    array-length v3, p0

    invoke-static {v3}, Lorg/iq80/snappy/Snappy;->maxCompressedLength(I)I

    move-result v3

    new-array v0, v3, [B

    .line 117
    .local v0, "compressedOut":[B
    array-length v3, p0

    invoke-static {p0, v4, v3, v0, v4}, Lorg/iq80/snappy/Snappy;->compress([BII[BI)I

    move-result v1

    .line 118
    .local v1, "compressedSize":I
    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v2

    .line 119
    .local v2, "trimmedBuffer":[B
    return-object v2
.end method

.method public static determineSnappyInputStream(Ljava/io/InputStream;Z)Ljava/io/InputStream;
    .locals 6
    .param p0, "source"    # Ljava/io/InputStream;
    .param p1, "verifyChecksums"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 53
    const-string v2, "source is null"

    new-array v3, v5, [Ljava/lang/Object;

    invoke-static {p0, v2, v3}, Lorg/iq80/snappy/SnappyInternalUtils;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    invoke-virtual {p0}, Ljava/io/InputStream;->markSupported()Z

    move-result v2

    const-string v3, "source does not support mark/reset"

    new-array v4, v5, [Ljava/lang/Object;

    invoke-static {v2, v3, v4}, Lorg/iq80/snappy/SnappyInternalUtils;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 57
    sget v2, Lorg/iq80/snappy/Snappy;->MAX_HEADER_LENGTH:I

    invoke-virtual {p0, v2}, Ljava/io/InputStream;->mark(I)V

    .line 58
    sget v2, Lorg/iq80/snappy/Snappy;->MAX_HEADER_LENGTH:I

    new-array v0, v2, [B

    .line 59
    .local v0, "buffer":[B
    sget v2, Lorg/iq80/snappy/Snappy;->MAX_HEADER_LENGTH:I

    invoke-static {p0, v0, v5, v2}, Lorg/iq80/snappy/SnappyInternalUtils;->readBytes(Ljava/io/InputStream;[BII)I

    move-result v1

    .line 60
    .local v1, "read":I
    invoke-virtual {p0}, Ljava/io/InputStream;->reset()V

    .line 62
    sget-object v2, Lorg/iq80/snappy/SnappyOutputStream;->STREAM_HEADER:[B

    array-length v2, v2

    if-ne v1, v2, :cond_0

    sget-object v2, Lorg/iq80/snappy/SnappyFramed;->HEADER_BYTES:[B

    array-length v2, v2

    if-eq v1, v2, :cond_1

    .line 63
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "invalid header"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 66
    :cond_1
    aget-byte v2, v0, v5

    sget-object v3, Lorg/iq80/snappy/SnappyFramed;->HEADER_BYTES:[B

    aget-byte v3, v3, v5

    if-ne v2, v3, :cond_2

    .line 67
    sget-object v2, Lorg/iq80/snappy/SnappyFramed;->HEADER_BYTES:[B

    array-length v2, v2

    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v2

    sget-object v3, Lorg/iq80/snappy/SnappyFramed;->HEADER_BYTES:[B

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    const-string v3, "invalid header"

    new-array v4, v5, [Ljava/lang/Object;

    invoke-static {v2, v3, v4}, Lorg/iq80/snappy/SnappyInternalUtils;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 68
    new-instance v2, Lorg/iq80/snappy/SnappyFramedInputStream;

    invoke-direct {v2, p0, p1}, Lorg/iq80/snappy/SnappyFramedInputStream;-><init>(Ljava/io/InputStream;Z)V

    .line 72
    :goto_0
    return-object v2

    .line 71
    :cond_2
    sget-object v2, Lorg/iq80/snappy/SnappyOutputStream;->STREAM_HEADER:[B

    array-length v2, v2

    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v2

    sget-object v3, Lorg/iq80/snappy/SnappyOutputStream;->STREAM_HEADER:[B

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    const-string v3, "invalid header"

    new-array v4, v5, [Ljava/lang/Object;

    invoke-static {v2, v3, v4}, Lorg/iq80/snappy/SnappyInternalUtils;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 72
    new-instance v2, Lorg/iq80/snappy/SnappyInputStream;

    invoke-direct {v2, p0, p1}, Lorg/iq80/snappy/SnappyInputStream;-><init>(Ljava/io/InputStream;Z)V

    goto :goto_0
.end method

.method public static getUncompressedLength([BI)I
    .locals 1
    .param p0, "compressed"    # [B
    .param p1, "compressedOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/snappy/CorruptionException;
        }
    .end annotation

    .prologue
    .line 79
    invoke-static {p0, p1}, Lorg/iq80/snappy/SnappyDecompressor;->getUncompressedLength([BI)I

    move-result v0

    return v0
.end method

.method public static maxCompressedLength(I)I
    .locals 1
    .param p0, "sourceLength"    # I

    .prologue
    .line 96
    invoke-static {p0}, Lorg/iq80/snappy/SnappyCompressor;->maxCompressedLength(I)I

    move-result v0

    return v0
.end method

.method public static uncompress([BII[BI)I
    .locals 1
    .param p0, "compressed"    # [B
    .param p1, "compressedOffset"    # I
    .param p2, "compressedSize"    # I
    .param p3, "uncompressed"    # [B
    .param p4, "uncompressedOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/snappy/CorruptionException;
        }
    .end annotation

    .prologue
    .line 91
    invoke-static {p0, p1, p2, p3, p4}, Lorg/iq80/snappy/SnappyDecompressor;->uncompress([BII[BI)I

    move-result v0

    return v0
.end method

.method public static uncompress([BII)[B
    .locals 1
    .param p0, "compressed"    # [B
    .param p1, "compressedOffset"    # I
    .param p2, "compressedSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/snappy/CorruptionException;
        }
    .end annotation

    .prologue
    .line 85
    invoke-static {p0, p1, p2}, Lorg/iq80/snappy/SnappyDecompressor;->uncompress([BII)[B

    move-result-object v0

    return-object v0
.end method
