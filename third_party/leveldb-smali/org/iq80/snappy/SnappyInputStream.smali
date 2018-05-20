.class public Lorg/iq80/snappy/SnappyInputStream;
.super Lorg/iq80/snappy/AbstractSnappyInputStream;
.source "SnappyInputStream.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final HEADER_LENGTH:I = 0x7


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/iq80/snappy/SnappyInputStream;-><init>(Ljava/io/InputStream;Z)V

    .line 54
    return-void
.end method

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
    .line 65
    const v2, 0x8000

    const/4 v3, 0x7

    sget-object v5, Lorg/iq80/snappy/SnappyOutputStream;->STREAM_HEADER:[B

    move-object v0, p0

    move-object v1, p1

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lorg/iq80/snappy/AbstractSnappyInputStream;-><init>(Ljava/io/InputStream;IIZ[B)V

    .line 66
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
    .line 39
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
    .line 39
    invoke-super {p0}, Lorg/iq80/snappy/AbstractSnappyInputStream;->close()V

    return-void
.end method

.method protected getFrameData([B[BI)Lorg/iq80/snappy/AbstractSnappyInputStream$FrameData;
    .locals 3
    .param p1, "frameHeader"    # [B
    .param p2, "content"    # [B
    .param p3, "length"    # I

    .prologue
    .line 108
    const/4 v1, 0x3

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    const/4 v2, 0x4

    aget-byte v2, p1, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x10

    or-int/2addr v1, v2

    const/4 v2, 0x5

    aget-byte v2, p1, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v1, v2

    const/4 v2, 0x6

    aget-byte v2, p1, v2

    and-int/lit16 v2, v2, 0xff

    or-int v0, v1, v2

    .line 113
    .local v0, "crc32c":I
    new-instance v1, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameData;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameData;-><init>(II)V

    return-object v1
.end method

.method protected getFrameMetaData([B)Lorg/iq80/snappy/AbstractSnappyInputStream$FrameMetaData;
    .locals 10
    .param p1, "frameHeader"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v9, 0x0

    .line 72
    aget-byte v5, p1, v9

    and-int/lit16 v4, v5, 0xff

    .line 74
    .local v4, "x":I
    aget-byte v5, p1, v7

    and-int/lit16 v0, v5, 0xff

    .line 75
    .local v0, "a":I
    const/4 v5, 0x2

    aget-byte v5, p1, v5

    and-int/lit16 v2, v5, 0xff

    .line 76
    .local v2, "b":I
    shl-int/lit8 v5, v0, 0x8

    or-int v3, v5, v2

    .line 79
    .local v3, "length":I
    sparse-switch v4, :sswitch_data_0

    .line 94
    new-instance v5, Ljava/io/IOException;

    const-string v6, "invalid compressed flag in header: 0x%02x"

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 81
    :sswitch_0
    sget-object v1, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;->RAW:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    .line 97
    .local v1, "action":Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;
    :goto_0
    if-lez v3, :cond_0

    const v5, 0x8000

    if-le v3, v5, :cond_2

    :cond_0
    sget-object v5, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;->SKIP:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    if-eq v1, v5, :cond_2

    .line 98
    new-instance v5, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "invalid block size in header: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 84
    .end local v1    # "action":Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;
    :sswitch_1
    sget-object v1, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;->UNCOMPRESS:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    .line 85
    .restart local v1    # "action":Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;
    goto :goto_0

    .line 87
    .end local v1    # "action":Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;
    :sswitch_2
    sget-object v5, Lorg/iq80/snappy/SnappyOutputStream;->STREAM_HEADER:[B

    invoke-static {v5, p1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v5

    if-nez v5, :cond_1

    .line 88
    new-instance v5, Ljava/io/IOException;

    const-string v6, "invalid compressed flag in header: 0x%02x"

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 90
    :cond_1
    sget-object v1, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;->SKIP:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    .line 91
    .restart local v1    # "action":Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;
    const/4 v3, 0x0

    .line 92
    goto :goto_0

    .line 101
    :cond_2
    new-instance v5, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameMetaData;

    invoke-direct {v5, v1, v3}, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameMetaData;-><init>(Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;I)V

    return-object v5

    .line 79
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0x73 -> :sswitch_2
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
    .line 39
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
    .line 39
    invoke-super {p0, p1, p2, p3}, Lorg/iq80/snappy/AbstractSnappyInputStream;->read([BII)I

    move-result v0

    return v0
.end method
