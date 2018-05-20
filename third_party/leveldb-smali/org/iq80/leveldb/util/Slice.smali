.class public final Lorg/iq80/leveldb/util/Slice;
.super Ljava/lang/Object;
.source "Slice.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/iq80/leveldb/util/Slice;",
        ">;"
    }
.end annotation


# instance fields
.field private final data:[B

.field private hash:I

.field private final length:I

.field private final offset:I


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "length"    # I

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-array v0, p1, [B

    iput-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    .line 54
    const/4 v0, 0x0

    iput v0, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    .line 55
    iput p1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    .line 56
    return-void
.end method

.method public constructor <init>([B)V
    .locals 1
    .param p1, "data"    # [B

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    const-string v0, "array is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    iput-object p1, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    .line 62
    const/4 v0, 0x0

    iput v0, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    .line 63
    array-length v0, p1

    iput v0, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    .line 64
    return-void
.end method

.method public constructor <init>([BII)V
    .locals 1
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    const-string v0, "array is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    iput-object p1, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    .line 70
    iput p2, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    .line 71
    iput p3, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    .line 72
    return-void
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 42
    check-cast p1, Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/util/Slice;->compareTo(Lorg/iq80/leveldb/util/Slice;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/iq80/leveldb/util/Slice;)I
    .locals 7
    .param p1, "that"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    const/4 v4, 0x0

    .line 673
    if-ne p0, p1, :cond_1

    .line 688
    :cond_0
    :goto_0
    return v4

    .line 676
    :cond_1
    iget-object v5, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    iget-object v6, p1, Lorg/iq80/leveldb/util/Slice;->data:[B

    if-ne v5, v6, :cond_2

    iget v5, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    iget v6, p1, Lorg/iq80/leveldb/util/Slice;->length:I

    if-ne v5, v6, :cond_2

    iget v5, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    iget v6, p1, Lorg/iq80/leveldb/util/Slice;->offset:I

    if-eq v5, v6, :cond_0

    .line 680
    :cond_2
    iget v4, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    iget v5, p1, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 681
    .local v1, "minLength":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_4

    .line 682
    iget-object v4, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    iget v5, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr v5, v0

    aget-byte v4, v4, v5

    and-int/lit16 v3, v4, 0xff

    .line 683
    .local v3, "thisByte":I
    iget-object v4, p1, Lorg/iq80/leveldb/util/Slice;->data:[B

    iget v5, p1, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr v5, v0

    aget-byte v4, v4, v5

    and-int/lit16 v2, v4, 0xff

    .line 684
    .local v2, "thatByte":I
    if-eq v3, v2, :cond_3

    .line 685
    sub-int v4, v3, v2

    goto :goto_0

    .line 681
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 688
    .end local v2    # "thatByte":I
    .end local v3    # "thisByte":I
    :cond_4
    iget v4, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    iget v5, p1, Lorg/iq80/leveldb/util/Slice;->length:I

    sub-int/2addr v4, v5

    goto :goto_0
.end method

.method public copyBytes()[B
    .locals 2

    .prologue
    .line 538
    const/4 v0, 0x0

    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-virtual {p0, v0, v1}, Lorg/iq80/leveldb/util/Slice;->copyBytes(II)[B

    move-result-object v0

    return-object v0
.end method

.method public copyBytes(II)[B
    .locals 3
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 543
    add-int v1, p1, p2

    iget v2, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-static {p1, v1, v2}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 544
    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr p1, v1

    .line 545
    if-nez p1, :cond_0

    .line 546
    iget-object v1, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    invoke-static {v1, p2}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v0

    .line 551
    :goto_0
    return-object v0

    .line 549
    :cond_0
    new-array v0, p2, [B

    .line 550
    .local v0, "value":[B
    iget-object v1, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    const/4 v2, 0x0

    invoke-static {v1, p1, v0, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public copySlice()Lorg/iq80/leveldb/util/Slice;
    .locals 2

    .prologue
    .line 519
    const/4 v0, 0x0

    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-virtual {p0, v0, v1}, Lorg/iq80/leveldb/util/Slice;->copySlice(II)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    return-object v0
.end method

.method public copySlice(II)Lorg/iq80/leveldb/util/Slice;
    .locals 3
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 528
    add-int v1, p1, p2

    iget v2, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-static {p1, v1, v2}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 530
    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr p1, v1

    .line 531
    new-array v0, p2, [B

    .line 532
    .local v0, "copiedArray":[B
    iget-object v1, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    const/4 v2, 0x0

    invoke-static {v1, p1, v0, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 533
    new-instance v1, Lorg/iq80/leveldb/util/Slice;

    invoke-direct {v1, v0}, Lorg/iq80/leveldb/util/Slice;-><init>([B)V

    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 622
    if-ne p0, p1, :cond_1

    .line 645
    :cond_0
    :goto_0
    return v2

    .line 625
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    if-eq v4, v5, :cond_3

    :cond_2
    move v2, v3

    .line 626
    goto :goto_0

    :cond_3
    move-object v1, p1

    .line 629
    check-cast v1, Lorg/iq80/leveldb/util/Slice;

    .line 632
    .local v1, "slice":Lorg/iq80/leveldb/util/Slice;
    iget v4, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    iget v5, v1, Lorg/iq80/leveldb/util/Slice;->length:I

    if-eq v4, v5, :cond_4

    move v2, v3

    .line 633
    goto :goto_0

    .line 637
    :cond_4
    iget v4, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    iget v5, v1, Lorg/iq80/leveldb/util/Slice;->offset:I

    if-ne v4, v5, :cond_5

    iget-object v4, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    iget-object v5, v1, Lorg/iq80/leveldb/util/Slice;->data:[B

    if-eq v4, v5, :cond_0

    .line 640
    :cond_5
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v4, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    if-ge v0, v4, :cond_0

    .line 641
    iget-object v4, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    iget v5, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr v5, v0

    aget-byte v4, v4, v5

    iget-object v5, v1, Lorg/iq80/leveldb/util/Slice;->data:[B

    iget v6, v1, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr v6, v0

    aget-byte v5, v5, v6

    if-eq v4, v5, :cond_6

    move v2, v3

    .line 642
    goto :goto_0

    .line 640
    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public getByte(I)B
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 106
    add-int/lit8 v0, p1, 0x1

    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-static {p1, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 107
    iget v0, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr p1, v0

    .line 108
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    aget-byte v0, v0, p1

    return v0
.end method

.method public getBytes(ILjava/nio/channels/GatheringByteChannel;I)I
    .locals 2
    .param p1, "index"    # I
    .param p2, "out"    # Ljava/nio/channels/GatheringByteChannel;
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 280
    add-int v0, p1, p3

    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-static {p1, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 281
    iget v0, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr p1, v0

    .line 282
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    invoke-static {v0, p1, p3}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/nio/channels/GatheringByteChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v0

    return v0
.end method

.method public getBytes(ILjava/io/OutputStream;I)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "out"    # Ljava/io/OutputStream;
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 261
    add-int v0, p1, p3

    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-static {p1, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 262
    iget v0, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr p1, v0

    .line 263
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    invoke-virtual {p2, v0, p1, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 264
    return-void
.end method

.method public getBytes(ILjava/nio/ByteBuffer;)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "destination"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 243
    iget v0, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkPositionIndex(II)I

    .line 244
    iget v0, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr p1, v0

    .line 245
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-virtual {p2, v0, p1, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 246
    return-void
.end method

.method public getBytes(ILorg/iq80/leveldb/util/Slice;II)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "dst"    # Lorg/iq80/leveldb/util/Slice;
    .param p3, "dstIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 190
    iget-object v0, p2, Lorg/iq80/leveldb/util/Slice;->data:[B

    invoke-virtual {p0, p1, v0, p3, p4}, Lorg/iq80/leveldb/util/Slice;->getBytes(I[BII)V

    .line 191
    return-void
.end method

.method public getBytes(I[BII)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "destination"    # [B
    .param p3, "destinationIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 208
    add-int v0, p1, p4

    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-static {p1, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 209
    add-int v0, p3, p4

    array-length v1, p2

    invoke-static {p3, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 210
    iget v0, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr p1, v0

    .line 211
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    invoke-static {v0, p1, p2, p3, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 212
    return-void
.end method

.method public getBytes()[B
    .locals 2

    .prologue
    .line 216
    const/4 v0, 0x0

    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-virtual {p0, v0, v1}, Lorg/iq80/leveldb/util/Slice;->getBytes(II)[B

    move-result-object v0

    return-object v0
.end method

.method public getBytes(II)[B
    .locals 3
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 221
    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr p1, v1

    .line 222
    if-nez p1, :cond_0

    .line 223
    iget-object v1, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    invoke-static {v1, p2}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v0

    .line 228
    :goto_0
    return-object v0

    .line 226
    :cond_0
    new-array v0, p2, [B

    .line 227
    .local v0, "value":[B
    iget-object v1, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    const/4 v2, 0x0

    invoke-static {v1, p1, v0, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public getInt(I)I
    .locals 3
    .param p1, "index"    # I

    .prologue
    .line 146
    add-int/lit8 v0, p1, 0x4

    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-static {p1, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 147
    iget v0, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr p1, v0

    .line 148
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    aget-byte v0, v0, p1

    and-int/lit16 v0, v0, 0xff

    iget-object v1, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    add-int/lit8 v2, p1, 0x1

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    iget-object v1, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    add-int/lit8 v2, p1, 0x2

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    iget-object v1, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    add-int/lit8 v2, p1, 0x3

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    or-int/2addr v0, v1

    return v0
.end method

.method public getLong(I)J
    .locals 8
    .param p1, "index"    # I

    .prologue
    const-wide/16 v6, 0xff

    .line 163
    add-int/lit8 v0, p1, 0x8

    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-static {p1, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 164
    iget v0, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr p1, v0

    .line 165
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    aget-byte v0, v0, p1

    int-to-long v0, v0

    and-long/2addr v0, v6

    iget-object v2, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    add-int/lit8 v3, p1, 0x1

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x8

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    add-int/lit8 v3, p1, 0x2

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    add-int/lit8 v3, p1, 0x3

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x18

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    add-int/lit8 v3, p1, 0x4

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    add-int/lit8 v3, p1, 0x5

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x28

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    add-int/lit8 v3, p1, 0x6

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x30

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    add-int/lit8 v3, p1, 0x7

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x38

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public getRawArray()[B
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    return-object v0
.end method

.method public getRawOffset()I
    .locals 1

    .prologue
    .line 95
    iget v0, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    return v0
.end method

.method public getShort(I)S
    .locals 3
    .param p1, "index"    # I

    .prologue
    .line 132
    add-int/lit8 v0, p1, 0x2

    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-static {p1, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 133
    iget v0, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr p1, v0

    .line 134
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    aget-byte v0, v0, p1

    and-int/lit16 v0, v0, 0xff

    iget-object v1, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    add-int/lit8 v2, p1, 0x1

    aget-byte v1, v1, v2

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    int-to-short v0, v0

    return v0
.end method

.method public getUnsignedByte(I)S
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 120
    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/util/Slice;->getByte(I)B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    int-to-short v0, v0

    return v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    .line 651
    iget v2, p0, Lorg/iq80/leveldb/util/Slice;->hash:I

    if-eqz v2, :cond_0

    .line 652
    iget v2, p0, Lorg/iq80/leveldb/util/Slice;->hash:I

    .line 663
    :goto_0
    return v2

    .line 655
    :cond_0
    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    .line 656
    .local v1, "result":I
    iget v0, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    .local v0, "i":I
    :goto_1
    iget v2, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    iget v3, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    add-int/2addr v2, v3

    if-ge v0, v2, :cond_1

    .line 657
    mul-int/lit8 v2, v1, 0x1f

    iget-object v3, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    aget-byte v3, v3, v0

    add-int v1, v2, v3

    .line 656
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 659
    :cond_1
    if-nez v1, :cond_2

    .line 660
    const/4 v1, 0x1

    .line 662
    :cond_2
    iput v1, p0, Lorg/iq80/leveldb/util/Slice;->hash:I

    .line 663
    iget v2, p0, Lorg/iq80/leveldb/util/Slice;->hash:I

    goto :goto_0
.end method

.method public input()Lorg/iq80/leveldb/util/SliceInput;
    .locals 1

    .prologue
    .line 588
    new-instance v0, Lorg/iq80/leveldb/util/SliceInput;

    invoke-direct {v0, p0}, Lorg/iq80/leveldb/util/SliceInput;-><init>(Lorg/iq80/leveldb/util/Slice;)V

    return-object v0
.end method

.method public length()I
    .locals 1

    .prologue
    .line 79
    iget v0, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    return v0
.end method

.method public output()Lorg/iq80/leveldb/util/SliceOutput;
    .locals 1

    .prologue
    .line 596
    new-instance v0, Lorg/iq80/leveldb/util/BasicSliceOutput;

    invoke-direct {v0, p0}, Lorg/iq80/leveldb/util/BasicSliceOutput;-><init>(Lorg/iq80/leveldb/util/Slice;)V

    return-object v0
.end method

.method public setByte(II)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 348
    add-int/lit8 v0, p1, 0x1

    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-static {p1, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 349
    iget v0, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr p1, v0

    .line 350
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    int-to-byte v1, p2

    aput-byte v1, v0, p1

    .line 351
    return-void
.end method

.method public setBytes(ILjava/io/InputStream;I)I
    .locals 4
    .param p1, "index"    # I
    .param p2, "in"    # Ljava/io/InputStream;
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 419
    add-int v2, p1, p3

    iget v3, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-static {p1, v2, v3}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 420
    iget v2, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr p1, v2

    .line 421
    const/4 v1, 0x0

    .line 423
    .local v1, "readBytes":I
    :cond_0
    iget-object v2, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    invoke-virtual {p2, v2, p1, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 424
    .local v0, "localReadBytes":I
    if-gez v0, :cond_1

    .line 425
    if-nez v1, :cond_2

    .line 426
    const/4 v2, -0x1

    .line 437
    :goto_0
    return v2

    .line 432
    :cond_1
    add-int/2addr v1, v0

    .line 433
    add-int/2addr p1, v0

    .line 434
    sub-int/2addr p3, v0

    .line 435
    if-gtz p3, :cond_0

    :cond_2
    move v2, v1

    .line 437
    goto :goto_0
.end method

.method public setBytes(ILjava/nio/channels/FileChannel;II)I
    .locals 6
    .param p1, "index"    # I
    .param p2, "in"    # Ljava/nio/channels/FileChannel;
    .param p3, "position"    # I
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 487
    add-int v4, p1, p4

    iget v5, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-static {p1, v4, v5}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 488
    iget v4, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr p1, v4

    .line 489
    iget-object v4, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    invoke-static {v4, p1, p4}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 490
    .local v0, "buf":Ljava/nio/ByteBuffer;
    const/4 v3, 0x0

    .line 495
    .local v3, "readBytes":I
    :cond_0
    add-int v4, p3, v3

    int-to-long v4, v4

    :try_start_0
    invoke-virtual {p2, v0, v4, v5}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;J)I
    :try_end_0
    .catch Ljava/nio/channels/ClosedChannelException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 500
    .local v2, "localReadBytes":I
    :goto_0
    if-gez v2, :cond_1

    .line 501
    if-nez v3, :cond_2

    .line 502
    const/4 v4, -0x1

    .line 514
    :goto_1
    return v4

    .line 497
    .end local v2    # "localReadBytes":I
    :catch_0
    move-exception v1

    .line 498
    .local v1, "e":Ljava/nio/channels/ClosedChannelException;
    const/4 v2, -0x1

    .restart local v2    # "localReadBytes":I
    goto :goto_0

    .line 508
    .end local v1    # "e":Ljava/nio/channels/ClosedChannelException;
    :cond_1
    if-nez v2, :cond_3

    :cond_2
    :goto_2
    move v4, v3

    .line 514
    goto :goto_1

    .line 511
    :cond_3
    add-int/2addr v3, v2

    .line 512
    if-lt v3, p4, :cond_0

    goto :goto_2
.end method

.method public setBytes(ILjava/nio/channels/ScatteringByteChannel;I)I
    .locals 6
    .param p1, "index"    # I
    .param p2, "in"    # Ljava/nio/channels/ScatteringByteChannel;
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 454
    add-int v4, p1, p3

    iget v5, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-static {p1, v4, v5}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 455
    iget v4, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr p1, v4

    .line 456
    iget-object v4, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    invoke-static {v4, p1, p3}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 457
    .local v0, "buf":Ljava/nio/ByteBuffer;
    const/4 v3, 0x0

    .line 462
    .local v3, "readBytes":I
    :cond_0
    :try_start_0
    invoke-interface {p2, v0}, Ljava/nio/channels/ScatteringByteChannel;->read(Ljava/nio/ByteBuffer;)I
    :try_end_0
    .catch Ljava/nio/channels/ClosedChannelException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 467
    .local v2, "localReadBytes":I
    :goto_0
    if-gez v2, :cond_1

    .line 468
    if-nez v3, :cond_2

    .line 469
    const/4 v4, -0x1

    .line 481
    :goto_1
    return v4

    .line 464
    .end local v2    # "localReadBytes":I
    :catch_0
    move-exception v1

    .line 465
    .local v1, "e":Ljava/nio/channels/ClosedChannelException;
    const/4 v2, -0x1

    .restart local v2    # "localReadBytes":I
    goto :goto_0

    .line 475
    .end local v1    # "e":Ljava/nio/channels/ClosedChannelException;
    :cond_1
    if-nez v2, :cond_3

    :cond_2
    :goto_2
    move v4, v3

    .line 481
    goto :goto_1

    .line 478
    :cond_3
    add-int/2addr v3, v2

    .line 479
    if-lt v3, p3, :cond_0

    goto :goto_2
.end method

.method public setBytes(ILjava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "source"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 400
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    add-int/2addr v0, p1

    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-static {p1, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 401
    iget v0, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr p1, v0

    .line 402
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    invoke-virtual {p2, v0, p1, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 403
    return-void
.end method

.method public setBytes(ILorg/iq80/leveldb/util/Slice;II)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "src"    # Lorg/iq80/leveldb/util/Slice;
    .param p3, "srcIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 368
    iget-object v0, p2, Lorg/iq80/leveldb/util/Slice;->data:[B

    iget v1, p2, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr v1, p3

    invoke-virtual {p0, p1, v0, v1, p4}, Lorg/iq80/leveldb/util/Slice;->setBytes(I[BII)V

    .line 369
    return-void
.end method

.method public setBytes(I[BII)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "source"    # [B
    .param p3, "sourceIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 383
    add-int v0, p1, p4

    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-static {p1, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 384
    add-int v0, p3, p4

    array-length v1, p2

    invoke-static {p3, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 385
    iget v0, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr p1, v0

    .line 386
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    invoke-static {p2, p3, v0, p1, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 387
    return-void
.end method

.method public setInt(II)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 310
    add-int/lit8 v0, p1, 0x4

    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-static {p1, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 311
    iget v0, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr p1, v0

    .line 312
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    int-to-byte v1, p2

    aput-byte v1, v0, p1

    .line 313
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    add-int/lit8 v1, p1, 0x1

    ushr-int/lit8 v2, p2, 0x8

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 314
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    add-int/lit8 v1, p1, 0x2

    ushr-int/lit8 v2, p2, 0x10

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 315
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    add-int/lit8 v1, p1, 0x3

    ushr-int/lit8 v2, p2, 0x18

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 316
    return-void
.end method

.method public setLong(IJ)V
    .locals 4
    .param p1, "index"    # I
    .param p2, "value"    # J

    .prologue
    .line 327
    add-int/lit8 v0, p1, 0x8

    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-static {p1, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 328
    iget v0, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr p1, v0

    .line 329
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    long-to-int v1, p2

    int-to-byte v1, v1

    aput-byte v1, v0, p1

    .line 330
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    add-int/lit8 v1, p1, 0x1

    const/16 v2, 0x8

    ushr-long v2, p2, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 331
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    add-int/lit8 v1, p1, 0x2

    const/16 v2, 0x10

    ushr-long v2, p2, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 332
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    add-int/lit8 v1, p1, 0x3

    const/16 v2, 0x18

    ushr-long v2, p2, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 333
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    add-int/lit8 v1, p1, 0x4

    const/16 v2, 0x20

    ushr-long v2, p2, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 334
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    add-int/lit8 v1, p1, 0x5

    const/16 v2, 0x28

    ushr-long v2, p2, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 335
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    add-int/lit8 v1, p1, 0x6

    const/16 v2, 0x30

    ushr-long v2, p2, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 336
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    add-int/lit8 v1, p1, 0x7

    const/16 v2, 0x38

    ushr-long v2, p2, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 337
    return-void
.end method

.method public setShort(II)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 295
    add-int/lit8 v0, p1, 0x2

    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-static {p1, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 296
    iget v0, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr p1, v0

    .line 297
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    int-to-byte v1, p2

    aput-byte v1, v0, p1

    .line 298
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    add-int/lit8 v1, p1, 0x1

    ushr-int/lit8 v2, p2, 0x8

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 299
    return-void
.end method

.method public slice()Lorg/iq80/leveldb/util/Slice;
    .locals 2

    .prologue
    .line 562
    const/4 v0, 0x0

    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-virtual {p0, v0, v1}, Lorg/iq80/leveldb/util/Slice;->slice(II)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    return-object v0
.end method

.method public slice(II)Lorg/iq80/leveldb/util/Slice;
    .locals 3
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 572
    if-nez p1, :cond_0

    iget v0, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    if-ne p2, v0, :cond_0

    .line 580
    .end local p0    # "this":Lorg/iq80/leveldb/util/Slice;
    :goto_0
    return-object p0

    .line 576
    .restart local p0    # "this":Lorg/iq80/leveldb/util/Slice;
    :cond_0
    add-int v0, p1, p2

    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-static {p1, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 577
    if-ltz p1, :cond_1

    if-nez p2, :cond_1

    .line 578
    sget-object p0, Lorg/iq80/leveldb/util/Slices;->EMPTY_SLICE:Lorg/iq80/leveldb/util/Slice;

    goto :goto_0

    .line 580
    :cond_1
    new-instance v0, Lorg/iq80/leveldb/util/Slice;

    iget-object v1, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    iget v2, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr v2, p1

    invoke-direct {v0, v1, v2, p2}, Lorg/iq80/leveldb/util/Slice;-><init>([BII)V

    move-object p0, v0

    goto :goto_0
.end method

.method public toByteBuffer()Ljava/nio/ByteBuffer;
    .locals 2

    .prologue
    .line 605
    const/4 v0, 0x0

    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-virtual {p0, v0, v1}, Lorg/iq80/leveldb/util/Slice;->toByteBuffer(II)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public toByteBuffer(II)Ljava/nio/ByteBuffer;
    .locals 2
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 614
    add-int v0, p1, p2

    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-static {p1, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 615
    iget v0, p0, Lorg/iq80/leveldb/util/Slice;->offset:I

    add-int/2addr p1, v0

    .line 616
    iget-object v0, p0, Lorg/iq80/leveldb/util/Slice;->data:[B

    invoke-static {v0, p1, p2}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 715
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "length="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 716
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 715
    return-object v0
.end method

.method public toString(IILjava/nio/charset/Charset;)Ljava/lang/String;
    .locals 1
    .param p1, "index"    # I
    .param p2, "length"    # I
    .param p3, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 706
    if-nez p2, :cond_0

    .line 707
    const-string v0, ""

    .line 710
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/iq80/leveldb/util/Slice;->toByteBuffer(II)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {v0, p3}, Lorg/iq80/leveldb/util/Slices;->decodeString(Ljava/nio/ByteBuffer;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public toString(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 697
    const/4 v0, 0x0

    iget v1, p0, Lorg/iq80/leveldb/util/Slice;->length:I

    invoke-virtual {p0, v0, v1, p1}, Lorg/iq80/leveldb/util/Slice;->toString(IILjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
