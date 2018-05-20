.class public final Lorg/iq80/leveldb/util/VariableLengthQuantity;
.super Ljava/lang/Object;
.source "VariableLengthQuantity.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    return-void
.end method

.method public static readVariableLengthInt(Ljava/nio/ByteBuffer;)I
    .locals 5
    .param p0, "sliceInput"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 107
    const/4 v1, 0x0

    .line 108
    .local v1, "result":I
    const/4 v2, 0x0

    .local v2, "shift":I
    :goto_0
    const/16 v3, 0x1c

    if-gt v2, v3, :cond_1

    .line 109
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    .line 112
    .local v0, "b":I
    and-int/lit8 v3, v0, 0x7f

    shl-int/2addr v3, v2

    or-int/2addr v1, v3

    .line 115
    and-int/lit16 v3, v0, 0x80

    if-nez v3, :cond_0

    .line 116
    return v1

    .line 108
    :cond_0
    add-int/lit8 v2, v2, 0x7

    goto :goto_0

    .line 119
    .end local v0    # "b":I
    :cond_1
    new-instance v3, Ljava/lang/NumberFormatException;

    const-string v4, "last byte of variable length int has high bit set"

    invoke-direct {v3, v4}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public static readVariableLengthInt(Lorg/iq80/leveldb/util/SliceInput;)I
    .locals 5
    .param p0, "sliceInput"    # Lorg/iq80/leveldb/util/SliceInput;

    .prologue
    .line 90
    const/4 v1, 0x0

    .line 91
    .local v1, "result":I
    const/4 v2, 0x0

    .local v2, "shift":I
    :goto_0
    const/16 v3, 0x1c

    if-gt v2, v3, :cond_1

    .line 92
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/SliceInput;->readUnsignedByte()I

    move-result v0

    .line 95
    .local v0, "b":I
    and-int/lit8 v3, v0, 0x7f

    shl-int/2addr v3, v2

    or-int/2addr v1, v3

    .line 98
    and-int/lit16 v3, v0, 0x80

    if-nez v3, :cond_0

    .line 99
    return v1

    .line 91
    :cond_0
    add-int/lit8 v2, v2, 0x7

    goto :goto_0

    .line 102
    .end local v0    # "b":I
    :cond_1
    new-instance v3, Ljava/lang/NumberFormatException;

    const-string v4, "last byte of variable length int has high bit set"

    invoke-direct {v3, v4}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public static readVariableLengthLong(Lorg/iq80/leveldb/util/SliceInput;)J
    .locals 10
    .param p0, "sliceInput"    # Lorg/iq80/leveldb/util/SliceInput;

    .prologue
    .line 124
    const-wide/16 v2, 0x0

    .line 125
    .local v2, "result":J
    const/4 v4, 0x0

    .local v4, "shift":I
    :goto_0
    const/16 v5, 0x3f

    if-gt v4, v5, :cond_1

    .line 126
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/SliceInput;->readUnsignedByte()I

    move-result v5

    int-to-long v0, v5

    .line 129
    .local v0, "b":J
    const-wide/16 v6, 0x7f

    and-long/2addr v6, v0

    shl-long/2addr v6, v4

    or-long/2addr v2, v6

    .line 132
    const-wide/16 v6, 0x80

    and-long/2addr v6, v0

    const-wide/16 v8, 0x0

    cmp-long v5, v6, v8

    if-nez v5, :cond_0

    .line 133
    return-wide v2

    .line 125
    :cond_0
    add-int/lit8 v4, v4, 0x7

    goto :goto_0

    .line 136
    .end local v0    # "b":J
    :cond_1
    new-instance v5, Ljava/lang/NumberFormatException;

    const-string v6, "last byte of variable length int has high bit set"

    invoke-direct {v5, v6}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public static variableLengthSize(I)I
    .locals 2
    .param p0, "value"    # I

    .prologue
    .line 30
    const/4 v0, 0x1

    .line 31
    .local v0, "size":I
    :goto_0
    and-int/lit8 v1, p0, -0x80

    if-eqz v1, :cond_0

    .line 32
    ushr-int/lit8 p0, p0, 0x7

    .line 33
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 35
    :cond_0
    return v0
.end method

.method public static variableLengthSize(J)I
    .locals 6
    .param p0, "value"    # J

    .prologue
    .line 40
    const/4 v0, 0x1

    .line 41
    .local v0, "size":I
    :goto_0
    const-wide/16 v2, -0x80

    and-long/2addr v2, p0

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 42
    const/4 v1, 0x7

    ushr-long/2addr p0, v1

    .line 43
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 45
    :cond_0
    return v0
.end method

.method public static writeVariableLengthInt(ILorg/iq80/leveldb/util/SliceOutput;)V
    .locals 2
    .param p0, "value"    # I
    .param p1, "sliceOutput"    # Lorg/iq80/leveldb/util/SliceOutput;

    .prologue
    .line 50
    const/16 v0, 0x80

    .line 51
    .local v0, "highBitMask":I
    const/16 v1, 0x80

    if-ge p0, v1, :cond_0

    if-ltz p0, :cond_0

    .line 52
    invoke-virtual {p1, p0}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 76
    :goto_0
    return-void

    .line 54
    :cond_0
    const/16 v1, 0x4000

    if-ge p0, v1, :cond_1

    if-lez p0, :cond_1

    .line 55
    or-int v1, p0, v0

    invoke-virtual {p1, v1}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 56
    ushr-int/lit8 v1, p0, 0x7

    invoke-virtual {p1, v1}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    goto :goto_0

    .line 58
    :cond_1
    const/high16 v1, 0x200000

    if-ge p0, v1, :cond_2

    if-lez p0, :cond_2

    .line 59
    or-int v1, p0, v0

    invoke-virtual {p1, v1}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 60
    ushr-int/lit8 v1, p0, 0x7

    or-int/2addr v1, v0

    invoke-virtual {p1, v1}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 61
    ushr-int/lit8 v1, p0, 0xe

    invoke-virtual {p1, v1}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    goto :goto_0

    .line 63
    :cond_2
    const/high16 v1, 0x10000000

    if-ge p0, v1, :cond_3

    if-lez p0, :cond_3

    .line 64
    or-int v1, p0, v0

    invoke-virtual {p1, v1}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 65
    ushr-int/lit8 v1, p0, 0x7

    or-int/2addr v1, v0

    invoke-virtual {p1, v1}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 66
    ushr-int/lit8 v1, p0, 0xe

    or-int/2addr v1, v0

    invoke-virtual {p1, v1}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 67
    ushr-int/lit8 v1, p0, 0x15

    invoke-virtual {p1, v1}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    goto :goto_0

    .line 70
    :cond_3
    or-int v1, p0, v0

    invoke-virtual {p1, v1}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 71
    ushr-int/lit8 v1, p0, 0x7

    or-int/2addr v1, v0

    invoke-virtual {p1, v1}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 72
    ushr-int/lit8 v1, p0, 0xe

    or-int/2addr v1, v0

    invoke-virtual {p1, v1}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 73
    ushr-int/lit8 v1, p0, 0x15

    or-int/2addr v1, v0

    invoke-virtual {p1, v1}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 74
    ushr-int/lit8 v1, p0, 0x1c

    invoke-virtual {p1, v1}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    goto :goto_0
.end method

.method public static writeVariableLengthLong(JLorg/iq80/leveldb/util/SliceOutput;)V
    .locals 4
    .param p0, "value"    # J
    .param p2, "sliceOutput"    # Lorg/iq80/leveldb/util/SliceOutput;

    .prologue
    .line 81
    :goto_0
    const-wide/16 v0, -0x80

    and-long/2addr v0, p0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 82
    const-wide/16 v0, 0x7f

    and-long/2addr v0, p0

    const-wide/16 v2, 0x80

    or-long/2addr v0, v2

    long-to-int v0, v0

    invoke-virtual {p2, v0}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 83
    const/4 v0, 0x7

    ushr-long/2addr p0, v0

    goto :goto_0

    .line 85
    :cond_0
    long-to-int v0, p0

    invoke-virtual {p2, v0}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 86
    return-void
.end method
