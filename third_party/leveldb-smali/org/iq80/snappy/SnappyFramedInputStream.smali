.class public Lorg/iq80/snappy/SnappyFramedInputStream;
.super Lorg/iq80/snappy/AbstractSnappyInputStream;
.source "SnappyFramedInputStream.java"


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Z)V
    .locals 6
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "verifyChecksums"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 38
    const/high16 v2, 0x10000

    const/4 v3, 0x4

    sget-object v5, Lorg/iq80/snappy/SnappyFramed;->HEADER_BYTES:[B

    move-object v0, p0

    move-object v1, p1

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lorg/iq80/snappy/AbstractSnappyInputStream;-><init>(Ljava/io/InputStream;IIZ[B)V

    .line 39
    return-void
.end method


# virtual methods
.method public bridge synthetic available()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 32
    invoke-super {p0}, Lorg/iq80/snappy/AbstractSnappyInputStream;->available()I

    move-result v0

    return v0
.end method

.method public bridge synthetic close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 32
    invoke-super {p0}, Lorg/iq80/snappy/AbstractSnappyInputStream;->close()V

    return-void
.end method

.method protected getFrameData([B[BI)Lorg/iq80/snappy/AbstractSnappyInputStream$FrameData;
    .locals 3
    .param p1, "frameHeader"    # [B
    .param p2, "content"    # [B
    .param p3, "length"    # I

    .prologue
    .line 90
    const/4 v1, 0x3

    aget-byte v1, p2, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    const/4 v2, 0x2

    aget-byte v2, p2, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x10

    or-int/2addr v1, v2

    const/4 v2, 0x1

    aget-byte v2, p2, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v1, v2

    const/4 v2, 0x0

    aget-byte v2, p2, v2

    and-int/lit16 v2, v2, 0xff

    or-int v0, v1, v2

    .line 95
    .local v0, "crc32c":I
    new-instance v1, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameData;

    const/4 v2, 0x4

    invoke-direct {v1, v0, v2}, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameData;-><init>(II)V

    return-object v1
.end method

.method protected getFrameMetaData([B)Lorg/iq80/snappy/AbstractSnappyInputStream$FrameMetaData;
    .locals 7
    .param p1, "frameHeader"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    const/4 v4, 0x1

    aget-byte v4, p1, v4

    and-int/lit16 v2, v4, 0xff

    .line 46
    .local v2, "length":I
    const/4 v4, 0x2

    aget-byte v4, p1, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x8

    or-int/2addr v2, v4

    .line 47
    const/4 v4, 0x3

    aget-byte v4, p1, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x10

    or-int/2addr v2, v4

    .line 51
    const/4 v4, 0x0

    aget-byte v4, p1, v4

    and-int/lit16 v0, v4, 0xff

    .line 52
    .local v0, "flag":I
    sparse-switch v0, :sswitch_data_0

    .line 70
    const/16 v4, 0x7f

    if-gt v0, v4, :cond_1

    .line 71
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "unsupported unskippable chunk: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 54
    :sswitch_0
    sget-object v1, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;->UNCOMPRESS:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    .line 55
    .local v1, "frameAction":Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;
    const/4 v3, 0x5

    .line 79
    .local v3, "minLength":I
    :goto_0
    if-ge v2, v3, :cond_2

    .line 80
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "invalid length: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " for chunk flag: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 58
    .end local v1    # "frameAction":Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;
    .end local v3    # "minLength":I
    :sswitch_1
    sget-object v1, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;->RAW:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    .line 59
    .restart local v1    # "frameAction":Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;
    const/4 v3, 0x5

    .line 60
    .restart local v3    # "minLength":I
    goto :goto_0

    .line 62
    .end local v1    # "frameAction":Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;
    .end local v3    # "minLength":I
    :sswitch_2
    const/4 v4, 0x6

    if-eq v2, v4, :cond_0

    .line 63
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "stream identifier chunk with invalid length: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 65
    :cond_0
    sget-object v1, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;->SKIP:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    .line 66
    .restart local v1    # "frameAction":Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;
    const/4 v3, 0x6

    .line 67
    .restart local v3    # "minLength":I
    goto :goto_0

    .line 75
    .end local v1    # "frameAction":Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;
    .end local v3    # "minLength":I
    :cond_1
    sget-object v1, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;->SKIP:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    .line 76
    .restart local v1    # "frameAction":Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;
    const/4 v3, 0x0

    .restart local v3    # "minLength":I
    goto :goto_0

    .line 83
    :cond_2
    new-instance v4, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameMetaData;

    invoke-direct {v4, v1, v2}, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameMetaData;-><init>(Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;I)V

    return-object v4

    .line 52
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0xff -> :sswitch_2
    .end sparse-switch
.end method

.method public bridge synthetic read()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 32
    invoke-super {p0}, Lorg/iq80/snappy/AbstractSnappyInputStream;->read()I

    move-result v0

    return v0
.end method

.method public bridge synthetic read([BII)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 32
    invoke-super {p0, p1, p2, p3}, Lorg/iq80/snappy/AbstractSnappyInputStream;->read([BII)I

    move-result v0

    return v0
.end method
