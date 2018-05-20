.class Lorg/iq80/snappy/SlowMemory;
.super Ljava/lang/Object;
.source "SlowMemory.java"

# interfaces
.implements Lorg/iq80/snappy/Memory;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public copyLong([BI[BI)V
    .locals 3
    .param p1, "src"    # [B
    .param p2, "srcIndex"    # I
    .param p3, "dest"    # [B
    .param p4, "destIndex"    # I

    .prologue
    .line 53
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v1, 0x8

    if-ge v0, v1, :cond_0

    .line 54
    add-int v1, p4, v0

    add-int v2, p2, v0

    aget-byte v2, p1, v2

    aput-byte v2, p3, v1

    .line 53
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 56
    :cond_0
    return-void
.end method

.method public copyMemory([BI[BII)V
    .locals 0
    .param p1, "input"    # [B
    .param p2, "inputIndex"    # I
    .param p3, "output"    # [B
    .param p4, "outputIndex"    # I
    .param p5, "length"    # I

    .prologue
    .line 74
    invoke-static {p1, p2, p3, p4, p5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 75
    return-void
.end method

.method public fastAccessSupported()Z
    .locals 1

    .prologue
    .line 26
    const/4 v0, 0x0

    return v0
.end method

.method public loadByte([BI)I
    .locals 1
    .param p1, "data"    # [B
    .param p2, "index"    # I

    .prologue
    .line 38
    aget-byte v0, p1, p2

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method public loadInt([BI)I
    .locals 2
    .param p1, "data"    # [B
    .param p2, "index"    # I

    .prologue
    .line 44
    aget-byte v0, p1, p2

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v1, p2, 0x1

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    add-int/lit8 v1, p2, 0x2

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    add-int/lit8 v1, p2, 0x3

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    or-int/2addr v0, v1

    return v0
.end method

.method public loadLong([BI)J
    .locals 8
    .param p1, "data"    # [B
    .param p2, "index"    # I

    .prologue
    const-wide/16 v6, 0xff

    .line 61
    aget-byte v0, p1, p2

    int-to-long v0, v0

    and-long/2addr v0, v6

    add-int/lit8 v2, p2, 0x1

    aget-byte v2, p1, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x8

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p2, 0x2

    aget-byte v2, p1, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p2, 0x3

    aget-byte v2, p1, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x18

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p2, 0x4

    aget-byte v2, p1, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p2, 0x5

    aget-byte v2, p1, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x28

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p2, 0x6

    aget-byte v2, p1, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x30

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p2, 0x7

    aget-byte v2, p1, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x38

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public lookupShort([SI)I
    .locals 2
    .param p1, "data"    # [S
    .param p2, "index"    # I

    .prologue
    .line 32
    aget-short v0, p1, p2

    const v1, 0xffff

    and-int/2addr v0, v1

    return v0
.end method
