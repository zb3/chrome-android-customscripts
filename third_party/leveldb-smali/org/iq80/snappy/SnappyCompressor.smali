.class final Lorg/iq80/snappy/SnappyCompressor;
.super Ljava/lang/Object;
.source "SnappyCompressor.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final BLOCK_LOG:I = 0xf

.field private static final BLOCK_SIZE:I = 0x8000

.field private static final INPUT_MARGIN_BYTES:I = 0xf

.field private static final MAX_HASH_TABLE_BITS:I = 0xe

.field private static final MAX_HASH_TABLE_SIZE:I = 0x4000

.field private static final NATIVE_LITTLE_ENDIAN:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 27
    const-class v0, Lorg/iq80/snappy/SnappyCompressor;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    sput-boolean v0, Lorg/iq80/snappy/SnappyCompressor;->$assertionsDisabled:Z

    .line 29
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v0, v3, :cond_1

    :goto_1
    sput-boolean v1, Lorg/iq80/snappy/SnappyCompressor;->NATIVE_LITTLE_ENDIAN:Z

    return-void

    :cond_0
    move v0, v2

    .line 27
    goto :goto_0

    :cond_1
    move v1, v2

    .line 29
    goto :goto_1
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static bytesBetweenHashLookups(I)I
    .locals 1
    .param p0, "skip"    # I

    .prologue
    .line 223
    ushr-int/lit8 v0, p0, 0x5

    return v0
.end method

.method public static compress([BII[BI)I
    .locals 10
    .param p0, "uncompressed"    # [B
    .param p1, "uncompressedOffset"    # I
    .param p2, "uncompressedLength"    # I
    .param p3, "compressed"    # [B
    .param p4, "compressedOffset"    # I

    .prologue
    const v9, 0x8000

    .line 80
    invoke-static {p3, p4, p2}, Lorg/iq80/snappy/SnappyCompressor;->writeUncompressedLength([BII)I

    move-result v4

    .line 82
    .local v4, "compressedIndex":I
    invoke-static {p2}, Lorg/iq80/snappy/SnappyCompressor;->getHashTableSize(I)I

    move-result v6

    .line 83
    .local v6, "hashTableSize":I
    invoke-static {}, Lorg/iq80/snappy/BufferRecycler;->instance()Lorg/iq80/snappy/BufferRecycler;

    move-result-object v8

    .line 84
    .local v8, "recycler":Lorg/iq80/snappy/BufferRecycler;
    invoke-virtual {v8, v6}, Lorg/iq80/snappy/BufferRecycler;->allocEncodingHash(I)[S

    move-result-object v5

    .line 86
    .local v5, "table":[S
    const/4 v7, 0x0

    .local v7, "read":I
    :goto_0
    if-ge v7, p2, :cond_0

    .line 88
    const/4 v0, 0x0

    invoke-static {v5, v0}, Ljava/util/Arrays;->fill([SS)V

    .line 90
    add-int v1, p1, v7

    sub-int v0, p2, v7

    .line 93
    invoke-static {v0, v9}, Ljava/lang/Math;->min(II)I

    move-result v2

    move-object v0, p0

    move-object v3, p3

    .line 90
    invoke-static/range {v0 .. v5}, Lorg/iq80/snappy/SnappyCompressor;->compressFragment([BII[BI[S)I

    move-result v4

    .line 86
    add-int/2addr v7, v9

    goto :goto_0

    .line 99
    :cond_0
    invoke-virtual {v8, v5}, Lorg/iq80/snappy/BufferRecycler;->releaseEncodingHash([S)V

    .line 101
    sub-int v0, v4, p4

    return v0
.end method

.method private static compressFragment([BII[BI[S)I
    .locals 25
    .param p0, "input"    # [B
    .param p1, "inputOffset"    # I
    .param p2, "inputSize"    # I
    .param p3, "output"    # [B
    .param p4, "outputIndex"    # I
    .param p5, "table"    # [S

    .prologue
    .line 112
    move/from16 v2, p1

    .line 113
    .local v2, "ipIndex":I
    sget-boolean v1, Lorg/iq80/snappy/SnappyCompressor;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    const v1, 0x8000

    move/from16 v0, p2

    if-le v0, v1, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 114
    :cond_0
    add-int v24, p1, p2

    .line 116
    .local v24, "ipEndIndex":I
    invoke-static/range {p2 .. p2}, Lorg/iq80/snappy/SnappyCompressor;->getHashTableSize(I)I

    move-result v22

    .line 118
    .local v22, "hashTableSize":I
    invoke-static/range {v22 .. v22}, Lorg/iq80/snappy/SnappyCompressor;->log2Floor(I)I

    move-result v1

    rsub-int/lit8 v5, v1, 0x20

    .line 119
    .local v5, "shift":I
    sget-boolean v1, Lorg/iq80/snappy/SnappyCompressor;->$assertionsDisabled:Z

    if-nez v1, :cond_1

    add-int/lit8 v1, v22, -0x1

    and-int v1, v1, v22

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/AssertionError;

    const-string v4, "table must be power of two"

    invoke-direct {v1, v4}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 120
    :cond_1
    sget-boolean v1, Lorg/iq80/snappy/SnappyCompressor;->$assertionsDisabled:Z

    if-nez v1, :cond_2

    const/4 v1, -0x1

    ushr-int/2addr v1, v5

    add-int/lit8 v4, v22, -0x1

    if-eq v1, v4, :cond_2

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 124
    :cond_2
    move v11, v2

    .line 126
    .local v11, "nextEmitIndex":I
    const/16 v1, 0xf

    move/from16 v0, p2

    if-lt v0, v1, :cond_4

    .line 127
    add-int v1, p1, p2

    add-int/lit8 v3, v1, -0xf

    .line 128
    .local v3, "ipLimit":I
    :goto_0
    if-gt v2, v3, :cond_4

    .line 129
    sget-boolean v1, Lorg/iq80/snappy/SnappyCompressor;->$assertionsDisabled:Z

    if-nez v1, :cond_3

    if-le v11, v2, :cond_3

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 156
    :cond_3
    const/16 v7, 0x20

    .local v7, "skip":I
    move-object/from16 v1, p0

    move/from16 v4, p1

    move-object/from16 v6, p5

    .line 158
    invoke-static/range {v1 .. v7}, Lorg/iq80/snappy/SnappyCompressor;->findCandidate([BIIII[SI)[I

    move-result-object v21

    .line 159
    .local v21, "candidateResult":[I
    const/4 v1, 0x0

    aget v2, v21, v1

    .line 160
    const/4 v1, 0x1

    aget v20, v21, v1

    .line 161
    .local v20, "candidateIndex":I
    const/4 v1, 0x2

    aget v7, v21, v1

    .line 162
    invoke-static {v7}, Lorg/iq80/snappy/SnappyCompressor;->bytesBetweenHashLookups(I)I

    move-result v1

    add-int/2addr v1, v2

    if-le v1, v3, :cond_6

    .line 188
    .end local v3    # "ipLimit":I
    .end local v7    # "skip":I
    .end local v20    # "candidateIndex":I
    .end local v21    # "candidateResult":[I
    :cond_4
    move/from16 v0, v24

    if-ge v11, v0, :cond_5

    .line 190
    sub-int v12, v24, v11

    const/4 v13, 0x0

    move-object/from16 v8, p3

    move/from16 v9, p4

    move-object/from16 v10, p0

    invoke-static/range {v8 .. v13}, Lorg/iq80/snappy/SnappyCompressor;->emitLiteral([BI[BIIZ)I

    move-result p4

    .line 192
    :cond_5
    return p4

    .line 169
    .restart local v3    # "ipLimit":I
    .restart local v7    # "skip":I
    .restart local v20    # "candidateIndex":I
    .restart local v21    # "candidateResult":[I
    :cond_6
    sget-boolean v1, Lorg/iq80/snappy/SnappyCompressor;->$assertionsDisabled:Z

    if-nez v1, :cond_7

    add-int/lit8 v1, v11, 0x10

    move/from16 v0, v24

    if-le v1, v0, :cond_7

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 170
    :cond_7
    sub-int v12, v2, v11

    const/4 v13, 0x1

    move-object/from16 v8, p3

    move/from16 v9, p4

    move-object/from16 v10, p0

    invoke-static/range {v8 .. v13}, Lorg/iq80/snappy/SnappyCompressor;->emitLiteral([BI[BIIZ)I

    move-result p4

    move-object/from16 v12, p0

    move/from16 v13, p1

    move/from16 v14, p2

    move v15, v2

    move-object/from16 v16, p3

    move/from16 v17, p4

    move-object/from16 v18, p5

    move/from16 v19, v5

    .line 180
    invoke-static/range {v12 .. v20}, Lorg/iq80/snappy/SnappyCompressor;->emitCopies([BIII[BI[SII)[I

    move-result-object v23

    .line 181
    .local v23, "indexes":[I
    const/4 v1, 0x0

    aget v2, v23, v1

    .line 182
    const/4 v1, 0x1

    aget p4, v23, v1

    .line 183
    move v11, v2

    .line 184
    goto :goto_0
.end method

.method private static emitCopies([BIII[BI[SII)[I
    .locals 13
    .param p0, "input"    # [B
    .param p1, "inputOffset"    # I
    .param p2, "inputSize"    # I
    .param p3, "ipIndex"    # I
    .param p4, "output"    # [B
    .param p5, "outputIndex"    # I
    .param p6, "table"    # [S
    .param p7, "shift"    # I
    .param p8, "candidateIndex"    # I

    .prologue
    .line 249
    :cond_0
    add-int/lit8 v10, p8, 0x4

    add-int/lit8 v11, p3, 0x4

    add-int v12, p1, p2

    invoke-static {p0, v10, p0, v11, v12}, Lorg/iq80/snappy/SnappyCompressor;->findMatchLength([BI[BII)I

    move-result v10

    add-int/lit8 v6, v10, 0x4

    .line 250
    .local v6, "matched":I
    sub-int v7, p3, p8

    .line 251
    .local v7, "offset":I
    sget-boolean v10, Lorg/iq80/snappy/SnappyCompressor;->$assertionsDisabled:Z

    if-nez v10, :cond_1

    move/from16 v0, p3

    move/from16 v1, p8

    invoke-static {p0, v0, p0, v1, v6}, Lorg/iq80/snappy/SnappyInternalUtils;->equals([BI[BII)Z

    move-result v10

    if-nez v10, :cond_1

    new-instance v10, Ljava/lang/AssertionError;

    invoke-direct {v10}, Ljava/lang/AssertionError;-><init>()V

    throw v10

    .line 252
    :cond_1
    add-int p3, p3, v6

    .line 255
    move-object/from16 v0, p4

    move/from16 v1, p5

    invoke-static {v0, v1, v7, v6}, Lorg/iq80/snappy/SnappyCompressor;->emitCopy([BIII)I

    move-result p5

    .line 258
    add-int v10, p1, p2

    add-int/lit8 v10, v10, -0xf

    move/from16 v0, p3

    if-lt v0, v10, :cond_2

    .line 259
    const/4 v10, 0x2

    new-array v10, v10, [I

    const/4 v11, 0x0

    aput p3, v10, v11

    const/4 v11, 0x1

    aput p5, v10, v11

    .line 286
    :goto_0
    return-object v10

    .line 265
    :cond_2
    sget-boolean v10, Lorg/iq80/snappy/SnappyInternalUtils;->HAS_UNSAFE:Z

    if-eqz v10, :cond_3

    .line 266
    add-int/lit8 v10, p3, -0x1

    invoke-static {p0, v10}, Lorg/iq80/snappy/SnappyInternalUtils;->loadLong([BI)J

    move-result-wide v4

    .line 267
    .local v4, "foo":J
    long-to-int v9, v4

    .line 268
    .local v9, "prevInt":I
    const/16 v10, 0x8

    ushr-long v10, v4, v10

    long-to-int v3, v10

    .line 276
    .end local v4    # "foo":J
    .local v3, "inputBytes":I
    :goto_1
    move/from16 v0, p7

    invoke-static {v9, v0}, Lorg/iq80/snappy/SnappyCompressor;->hashBytes(II)I

    move-result v8

    .line 277
    .local v8, "prevHash":I
    sub-int v10, p3, p1

    add-int/lit8 v10, v10, -0x1

    int-to-short v10, v10

    aput-short v10, p6, v8

    .line 280
    move/from16 v0, p7

    invoke-static {v3, v0}, Lorg/iq80/snappy/SnappyCompressor;->hashBytes(II)I

    move-result v2

    .line 282
    .local v2, "curHash":I
    aget-short v10, p6, v2

    add-int p8, p1, v10

    .line 283
    sub-int v10, p3, p1

    int-to-short v10, v10

    aput-short v10, p6, v2

    .line 285
    move/from16 v0, p8

    invoke-static {p0, v0}, Lorg/iq80/snappy/SnappyInternalUtils;->loadInt([BI)I

    move-result v10

    if-eq v3, v10, :cond_0

    .line 286
    const/4 v10, 0x2

    new-array v10, v10, [I

    const/4 v11, 0x0

    aput p3, v10, v11

    const/4 v11, 0x1

    aput p5, v10, v11

    goto :goto_0

    .line 271
    .end local v2    # "curHash":I
    .end local v3    # "inputBytes":I
    .end local v8    # "prevHash":I
    .end local v9    # "prevInt":I
    :cond_3
    add-int/lit8 v10, p3, -0x1

    invoke-static {p0, v10}, Lorg/iq80/snappy/SnappyInternalUtils;->loadInt([BI)I

    move-result v9

    .line 272
    .restart local v9    # "prevInt":I
    move/from16 v0, p3

    invoke-static {p0, v0}, Lorg/iq80/snappy/SnappyInternalUtils;->loadInt([BI)I

    move-result v3

    .restart local v3    # "inputBytes":I
    goto :goto_1
.end method

.method private static emitCopy([BIII)I
    .locals 2
    .param p0, "output"    # [B
    .param p1, "outputIndex"    # I
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    const/16 v1, 0x40

    .line 383
    :goto_0
    const/16 v0, 0x44

    if-lt p3, v0, :cond_0

    .line 384
    invoke-static {p0, p1, p2, v1}, Lorg/iq80/snappy/SnappyCompressor;->emitCopyLessThan64([BIII)I

    move-result p1

    .line 385
    add-int/lit8 p3, p3, -0x40

    goto :goto_0

    .line 389
    :cond_0
    if-le p3, v1, :cond_1

    .line 390
    const/16 v0, 0x3c

    invoke-static {p0, p1, p2, v0}, Lorg/iq80/snappy/SnappyCompressor;->emitCopyLessThan64([BIII)I

    move-result p1

    .line 391
    add-int/lit8 p3, p3, -0x3c

    .line 395
    :cond_1
    invoke-static {p0, p1, p2, p3}, Lorg/iq80/snappy/SnappyCompressor;->emitCopyLessThan64([BIII)I

    move-result p1

    .line 396
    return p1
.end method

.method private static emitCopyLessThan64([BIII)I
    .locals 4
    .param p0, "output"    # [B
    .param p1, "outputIndex"    # I
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 357
    sget-boolean v2, Lorg/iq80/snappy/SnappyCompressor;->$assertionsDisabled:Z

    if-nez v2, :cond_0

    if-gez p2, :cond_0

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 358
    :cond_0
    sget-boolean v2, Lorg/iq80/snappy/SnappyCompressor;->$assertionsDisabled:Z

    if-nez v2, :cond_1

    const/16 v2, 0x40

    if-le p3, v2, :cond_1

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 359
    :cond_1
    sget-boolean v2, Lorg/iq80/snappy/SnappyCompressor;->$assertionsDisabled:Z

    if-nez v2, :cond_2

    const/4 v2, 0x4

    if-ge p3, v2, :cond_2

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 360
    :cond_2
    sget-boolean v2, Lorg/iq80/snappy/SnappyCompressor;->$assertionsDisabled:Z

    if-nez v2, :cond_3

    const/high16 v2, 0x10000

    if-lt p2, v2, :cond_3

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 362
    :cond_3
    const/16 v2, 0xc

    if-ge p3, v2, :cond_5

    const/16 v2, 0x800

    if-ge p2, v2, :cond_5

    .line 363
    add-int/lit8 v0, p3, -0x4

    .line 364
    .local v0, "lenMinus4":I
    sget-boolean v2, Lorg/iq80/snappy/SnappyCompressor;->$assertionsDisabled:Z

    if-nez v2, :cond_4

    const/16 v2, 0x8

    if-lt v0, v2, :cond_4

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 365
    :cond_4
    add-int/lit8 v1, p1, 0x1

    .end local p1    # "outputIndex":I
    .local v1, "outputIndex":I
    shl-int/lit8 v2, v0, 0x2

    or-int/lit8 v2, v2, 0x1

    ushr-int/lit8 v3, p2, 0x8

    shl-int/lit8 v3, v3, 0x5

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, p0, p1

    .line 366
    add-int/lit8 p1, v1, 0x1

    .end local v1    # "outputIndex":I
    .restart local p1    # "outputIndex":I
    int-to-byte v2, p2

    aput-byte v2, p0, v1

    .line 373
    .end local v0    # "lenMinus4":I
    :goto_0
    return p1

    .line 369
    :cond_5
    add-int/lit8 v1, p1, 0x1

    .end local p1    # "outputIndex":I
    .restart local v1    # "outputIndex":I
    add-int/lit8 v2, p3, -0x1

    shl-int/lit8 v2, v2, 0x2

    or-int/lit8 v2, v2, 0x2

    int-to-byte v2, v2

    aput-byte v2, p0, p1

    .line 370
    add-int/lit8 p1, v1, 0x1

    .end local v1    # "outputIndex":I
    .restart local p1    # "outputIndex":I
    int-to-byte v2, p2

    aput-byte v2, p0, v1

    .line 371
    add-int/lit8 v1, p1, 0x1

    .end local p1    # "outputIndex":I
    .restart local v1    # "outputIndex":I
    ushr-int/lit8 v2, p2, 0x8

    int-to-byte v2, v2

    aput-byte v2, p0, p1

    move p1, v1

    .end local v1    # "outputIndex":I
    .restart local p1    # "outputIndex":I
    goto :goto_0
.end method

.method private static emitLiteral([BI[BIIZ)I
    .locals 4
    .param p0, "output"    # [B
    .param p1, "outputIndex"    # I
    .param p2, "literal"    # [B
    .param p3, "literalIndex"    # I
    .param p4, "length"    # I
    .param p5, "allowFastPath"    # Z

    .prologue
    .line 297
    add-int v2, p3, p4

    array-length v3, p2

    invoke-static {p3, v2, v3}, Lorg/iq80/snappy/SnappyInternalUtils;->checkPositionIndexes(III)V

    .line 299
    add-int/lit8 v0, p4, -0x1

    .line 300
    .local v0, "n":I
    const/16 v2, 0x3c

    if-ge v0, v2, :cond_0

    .line 302
    add-int/lit8 v1, p1, 0x1

    .end local p1    # "outputIndex":I
    .local v1, "outputIndex":I
    shl-int/lit8 v2, v0, 0x2

    or-int/lit8 v2, v2, 0x0

    int-to-byte v2, v2

    aput-byte v2, p0, p1

    .line 314
    if-eqz p5, :cond_4

    const/16 v2, 0x10

    if-gt p4, v2, :cond_4

    .line 315
    invoke-static {p2, p3, p0, v1}, Lorg/iq80/snappy/SnappyInternalUtils;->copyLong([BI[BI)V

    .line 316
    add-int/lit8 v2, p3, 0x8

    add-int/lit8 v3, v1, 0x8

    invoke-static {p2, v2, p0, v3}, Lorg/iq80/snappy/SnappyInternalUtils;->copyLong([BI[BI)V

    .line 317
    add-int p1, v1, p4

    .end local v1    # "outputIndex":I
    .restart local p1    # "outputIndex":I
    move v1, p1

    .line 348
    .end local p1    # "outputIndex":I
    .restart local v1    # "outputIndex":I
    :goto_0
    return v1

    .line 321
    .end local v1    # "outputIndex":I
    .restart local p1    # "outputIndex":I
    :cond_0
    const/16 v2, 0x100

    if-ge v0, v2, :cond_1

    .line 322
    add-int/lit8 v1, p1, 0x1

    .end local p1    # "outputIndex":I
    .restart local v1    # "outputIndex":I
    const/16 v2, -0x10

    aput-byte v2, p0, p1

    .line 323
    add-int/lit8 p1, v1, 0x1

    .end local v1    # "outputIndex":I
    .restart local p1    # "outputIndex":I
    int-to-byte v2, v0

    aput-byte v2, p0, v1

    .line 344
    :goto_1
    add-int v2, p3, p4

    array-length v3, p2

    invoke-static {p3, v2, v3}, Lorg/iq80/snappy/SnappyInternalUtils;->checkPositionIndexes(III)V

    .line 346
    invoke-static {p2, p3, p0, p1, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 347
    add-int/2addr p1, p4

    move v1, p1

    .line 348
    .end local p1    # "outputIndex":I
    .restart local v1    # "outputIndex":I
    goto :goto_0

    .line 325
    .end local v1    # "outputIndex":I
    .restart local p1    # "outputIndex":I
    :cond_1
    const/high16 v2, 0x10000

    if-ge v0, v2, :cond_2

    .line 326
    add-int/lit8 v1, p1, 0x1

    .end local p1    # "outputIndex":I
    .restart local v1    # "outputIndex":I
    const/16 v2, -0xc

    aput-byte v2, p0, p1

    .line 327
    add-int/lit8 p1, v1, 0x1

    .end local v1    # "outputIndex":I
    .restart local p1    # "outputIndex":I
    int-to-byte v2, v0

    aput-byte v2, p0, v1

    .line 328
    add-int/lit8 v1, p1, 0x1

    .end local p1    # "outputIndex":I
    .restart local v1    # "outputIndex":I
    ushr-int/lit8 v2, v0, 0x8

    int-to-byte v2, v2

    aput-byte v2, p0, p1

    move p1, v1

    .end local v1    # "outputIndex":I
    .restart local p1    # "outputIndex":I
    goto :goto_1

    .line 330
    :cond_2
    const/high16 v2, 0x1000000

    if-ge v0, v2, :cond_3

    .line 331
    add-int/lit8 v1, p1, 0x1

    .end local p1    # "outputIndex":I
    .restart local v1    # "outputIndex":I
    const/4 v2, -0x8

    aput-byte v2, p0, p1

    .line 332
    add-int/lit8 p1, v1, 0x1

    .end local v1    # "outputIndex":I
    .restart local p1    # "outputIndex":I
    int-to-byte v2, v0

    aput-byte v2, p0, v1

    .line 333
    add-int/lit8 v1, p1, 0x1

    .end local p1    # "outputIndex":I
    .restart local v1    # "outputIndex":I
    ushr-int/lit8 v2, v0, 0x8

    int-to-byte v2, v2

    aput-byte v2, p0, p1

    .line 334
    add-int/lit8 p1, v1, 0x1

    .end local v1    # "outputIndex":I
    .restart local p1    # "outputIndex":I
    ushr-int/lit8 v2, v0, 0x10

    int-to-byte v2, v2

    aput-byte v2, p0, v1

    goto :goto_1

    .line 337
    :cond_3
    add-int/lit8 v1, p1, 0x1

    .end local p1    # "outputIndex":I
    .restart local v1    # "outputIndex":I
    const/4 v2, -0x4

    aput-byte v2, p0, p1

    .line 338
    add-int/lit8 p1, v1, 0x1

    .end local v1    # "outputIndex":I
    .restart local p1    # "outputIndex":I
    int-to-byte v2, v0

    aput-byte v2, p0, v1

    .line 339
    add-int/lit8 v1, p1, 0x1

    .end local p1    # "outputIndex":I
    .restart local v1    # "outputIndex":I
    ushr-int/lit8 v2, v0, 0x8

    int-to-byte v2, v2

    aput-byte v2, p0, p1

    .line 340
    add-int/lit8 p1, v1, 0x1

    .end local v1    # "outputIndex":I
    .restart local p1    # "outputIndex":I
    ushr-int/lit8 v2, v0, 0x10

    int-to-byte v2, v2

    aput-byte v2, p0, v1

    .line 341
    add-int/lit8 v1, p1, 0x1

    .end local p1    # "outputIndex":I
    .restart local v1    # "outputIndex":I
    ushr-int/lit8 v2, v0, 0x18

    int-to-byte v2, v2

    aput-byte v2, p0, p1

    :cond_4
    move p1, v1

    .end local v1    # "outputIndex":I
    .restart local p1    # "outputIndex":I
    goto :goto_1
.end method

.method private static findCandidate([BIIII[SI)[I
    .locals 6
    .param p0, "input"    # [B
    .param p1, "ipIndex"    # I
    .param p2, "ipLimit"    # I
    .param p3, "inputOffset"    # I
    .param p4, "shift"    # I
    .param p5, "table"    # [S
    .param p6, "skip"    # I

    .prologue
    .line 198
    const/4 v0, 0x0

    .line 199
    .local v0, "candidateIndex":I
    add-int/lit8 p1, p1, 0x1

    :goto_0
    invoke-static {p6}, Lorg/iq80/snappy/SnappyCompressor;->bytesBetweenHashLookups(I)I

    move-result v4

    add-int/2addr v4, p1

    if-gt v4, p2, :cond_2

    .line 201
    invoke-static {p0, p1}, Lorg/iq80/snappy/SnappyInternalUtils;->loadInt([BI)I

    move-result v1

    .line 202
    .local v1, "currentInt":I
    invoke-static {v1, p4}, Lorg/iq80/snappy/SnappyCompressor;->hashBytes(II)I

    move-result v2

    .line 205
    .local v2, "hash":I
    aget-short v4, p5, v2

    add-int v0, p3, v4

    .line 206
    sget-boolean v4, Lorg/iq80/snappy/SnappyCompressor;->$assertionsDisabled:Z

    if-nez v4, :cond_0

    if-gez v0, :cond_0

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 207
    :cond_0
    sget-boolean v4, Lorg/iq80/snappy/SnappyCompressor;->$assertionsDisabled:Z

    if-nez v4, :cond_1

    if-lt v0, p1, :cond_1

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 210
    :cond_1
    sub-int v4, p1, p3

    int-to-short v4, v4

    aput-short v4, p5, v2

    .line 214
    invoke-static {p0, v0}, Lorg/iq80/snappy/SnappyInternalUtils;->loadInt([BI)I

    move-result v4

    if-ne v1, v4, :cond_3

    .line 218
    .end local v1    # "currentInt":I
    .end local v2    # "hash":I
    :cond_2
    const/4 v4, 0x3

    new-array v4, v4, [I

    const/4 v5, 0x0

    aput p1, v4, v5

    const/4 v5, 0x1

    aput v0, v4, v5

    const/4 v5, 0x2

    aput p6, v4, v5

    return-object v4

    .line 199
    .restart local v1    # "currentInt":I
    .restart local v2    # "hash":I
    :cond_3
    add-int/lit8 v3, p6, 0x1

    .end local p6    # "skip":I
    .local v3, "skip":I
    invoke-static {p6}, Lorg/iq80/snappy/SnappyCompressor;->bytesBetweenHashLookups(I)I

    move-result v4

    add-int/2addr p1, v4

    move p6, v3

    .end local v3    # "skip":I
    .restart local p6    # "skip":I
    goto :goto_0
.end method

.method private static findMatchLength([BI[BII)I
    .locals 6
    .param p0, "s1"    # [B
    .param p1, "s1Index"    # I
    .param p2, "s2"    # [B
    .param p3, "s2Index"    # I
    .param p4, "s2Limit"    # I

    .prologue
    .line 406
    sget-boolean v4, Lorg/iq80/snappy/SnappyCompressor;->$assertionsDisabled:Z

    if-nez v4, :cond_0

    if-ge p4, p3, :cond_0

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 408
    :cond_0
    sget-boolean v4, Lorg/iq80/snappy/SnappyInternalUtils;->HAS_UNSAFE:Z

    if-eqz v4, :cond_4

    .line 409
    const/4 v1, 0x0

    .line 411
    .local v1, "matched":I
    :goto_0
    add-int v4, p3, v1

    add-int/lit8 v5, p4, -0x4

    if-gt v4, v5, :cond_1

    add-int v4, p3, v1

    invoke-static {p2, v4}, Lorg/iq80/snappy/SnappyInternalUtils;->loadInt([BI)I

    move-result v4

    add-int v5, p1, v1

    invoke-static {p0, v5}, Lorg/iq80/snappy/SnappyInternalUtils;->loadInt([BI)I

    move-result v5

    if-ne v4, v5, :cond_1

    .line 412
    add-int/lit8 v1, v1, 0x4

    goto :goto_0

    .line 415
    :cond_1
    sget-boolean v4, Lorg/iq80/snappy/SnappyCompressor;->NATIVE_LITTLE_ENDIAN:Z

    if-eqz v4, :cond_3

    add-int v4, p3, v1

    add-int/lit8 v5, p4, -0x4

    if-gt v4, v5, :cond_3

    .line 416
    add-int v4, p3, v1

    invoke-static {p2, v4}, Lorg/iq80/snappy/SnappyInternalUtils;->loadInt([BI)I

    move-result v4

    add-int v5, p1, v1

    invoke-static {p0, v5}, Lorg/iq80/snappy/SnappyInternalUtils;->loadInt([BI)I

    move-result v5

    xor-int v3, v4, v5

    .line 417
    .local v3, "x":I
    invoke-static {v3}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result v2

    .line 418
    .local v2, "matchingBits":I
    shr-int/lit8 v4, v2, 0x3

    add-int/2addr v1, v4

    .line 434
    .end local v1    # "matched":I
    .end local v2    # "matchingBits":I
    .end local v3    # "x":I
    :cond_2
    :goto_1
    return v1

    .line 421
    .restart local v1    # "matched":I
    :cond_3
    :goto_2
    add-int v4, p3, v1

    if-ge v4, p4, :cond_2

    add-int v4, p1, v1

    aget-byte v4, p0, v4

    add-int v5, p3, v1

    aget-byte v5, p2, v5

    if-ne v4, v5, :cond_2

    .line 422
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 428
    .end local v1    # "matched":I
    :cond_4
    sub-int v0, p4, p3

    .line 429
    .local v0, "length":I
    const/4 v1, 0x0

    .restart local v1    # "matched":I
    :goto_3
    if-ge v1, v0, :cond_5

    .line 430
    add-int v4, p1, v1

    aget-byte v4, p0, v4

    add-int v5, p3, v1

    aget-byte v5, p2, v5

    if-ne v4, v5, :cond_2

    .line 429
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_5
    move v1, v0

    .line 434
    goto :goto_1
.end method

.method private static getHashTableSize(I)I
    .locals 3
    .param p0, "inputSize"    # I

    .prologue
    const/16 v2, 0x4000

    .line 446
    const/16 v0, 0x100

    .line 447
    .local v0, "hashTableSize":I
    :goto_0
    if-ge v0, v2, :cond_0

    if-ge v0, p0, :cond_0

    .line 448
    shl-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 450
    :cond_0
    sget-boolean v1, Lorg/iq80/snappy/SnappyCompressor;->$assertionsDisabled:Z

    if-nez v1, :cond_1

    add-int/lit8 v1, v0, -0x1

    and-int/2addr v1, v0

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "hash must be power of two"

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 451
    :cond_1
    sget-boolean v1, Lorg/iq80/snappy/SnappyCompressor;->$assertionsDisabled:Z

    if-nez v1, :cond_2

    if-le v0, v2, :cond_2

    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "hash table too large"

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 452
    :cond_2
    return v0
.end method

.method private static hashBytes(II)I
    .locals 2
    .param p0, "bytes"    # I
    .param p1, "shift"    # I

    .prologue
    .line 477
    const v0, 0x1e35a7bd

    .line 478
    .local v0, "kMul":I
    mul-int v1, p0, v0

    ushr-int/2addr v1, p1

    return v1
.end method

.method private static log2Floor(I)I
    .locals 1
    .param p0, "n"    # I

    .prologue
    .line 483
    if-nez p0, :cond_0

    const/4 v0, -0x1

    :goto_0
    return v0

    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    move-result v0

    xor-int/lit8 v0, v0, 0x1f

    goto :goto_0
.end method

.method public static maxCompressedLength(I)I
    .locals 2
    .param p0, "sourceLength"    # I

    .prologue
    .line 69
    add-int/lit8 v0, p0, 0x20

    div-int/lit8 v1, p0, 0x6

    add-int/2addr v0, v1

    return v0
.end method

.method private static writeUncompressedLength([BII)I
    .locals 3
    .param p0, "compressed"    # [B
    .param p1, "compressedOffset"    # I
    .param p2, "uncompressedLength"    # I

    .prologue
    .line 491
    const/16 v1, 0x80

    .line 492
    .local v1, "highBitMask":I
    const/16 v2, 0x80

    if-ge p2, v2, :cond_0

    if-ltz p2, :cond_0

    .line 493
    add-int/lit8 v0, p1, 0x1

    .end local p1    # "compressedOffset":I
    .local v0, "compressedOffset":I
    int-to-byte v2, p2

    aput-byte v2, p0, p1

    move p1, v0

    .line 517
    .end local v0    # "compressedOffset":I
    .restart local p1    # "compressedOffset":I
    :goto_0
    return p1

    .line 495
    :cond_0
    const/16 v2, 0x4000

    if-ge p2, v2, :cond_1

    if-lez p2, :cond_1

    .line 496
    add-int/lit8 v0, p1, 0x1

    .end local p1    # "compressedOffset":I
    .restart local v0    # "compressedOffset":I
    or-int v2, p2, v1

    int-to-byte v2, v2

    aput-byte v2, p0, p1

    .line 497
    add-int/lit8 p1, v0, 0x1

    .end local v0    # "compressedOffset":I
    .restart local p1    # "compressedOffset":I
    ushr-int/lit8 v2, p2, 0x7

    int-to-byte v2, v2

    aput-byte v2, p0, v0

    goto :goto_0

    .line 499
    :cond_1
    const/high16 v2, 0x200000

    if-ge p2, v2, :cond_2

    if-lez p2, :cond_2

    .line 500
    add-int/lit8 v0, p1, 0x1

    .end local p1    # "compressedOffset":I
    .restart local v0    # "compressedOffset":I
    or-int v2, p2, v1

    int-to-byte v2, v2

    aput-byte v2, p0, p1

    .line 501
    add-int/lit8 p1, v0, 0x1

    .end local v0    # "compressedOffset":I
    .restart local p1    # "compressedOffset":I
    ushr-int/lit8 v2, p2, 0x7

    or-int/2addr v2, v1

    int-to-byte v2, v2

    aput-byte v2, p0, v0

    .line 502
    add-int/lit8 v0, p1, 0x1

    .end local p1    # "compressedOffset":I
    .restart local v0    # "compressedOffset":I
    ushr-int/lit8 v2, p2, 0xe

    int-to-byte v2, v2

    aput-byte v2, p0, p1

    move p1, v0

    .end local v0    # "compressedOffset":I
    .restart local p1    # "compressedOffset":I
    goto :goto_0

    .line 504
    :cond_2
    const/high16 v2, 0x10000000

    if-ge p2, v2, :cond_3

    if-lez p2, :cond_3

    .line 505
    add-int/lit8 v0, p1, 0x1

    .end local p1    # "compressedOffset":I
    .restart local v0    # "compressedOffset":I
    or-int v2, p2, v1

    int-to-byte v2, v2

    aput-byte v2, p0, p1

    .line 506
    add-int/lit8 p1, v0, 0x1

    .end local v0    # "compressedOffset":I
    .restart local p1    # "compressedOffset":I
    ushr-int/lit8 v2, p2, 0x7

    or-int/2addr v2, v1

    int-to-byte v2, v2

    aput-byte v2, p0, v0

    .line 507
    add-int/lit8 v0, p1, 0x1

    .end local p1    # "compressedOffset":I
    .restart local v0    # "compressedOffset":I
    ushr-int/lit8 v2, p2, 0xe

    or-int/2addr v2, v1

    int-to-byte v2, v2

    aput-byte v2, p0, p1

    .line 508
    add-int/lit8 p1, v0, 0x1

    .end local v0    # "compressedOffset":I
    .restart local p1    # "compressedOffset":I
    ushr-int/lit8 v2, p2, 0x15

    int-to-byte v2, v2

    aput-byte v2, p0, v0

    goto :goto_0

    .line 511
    :cond_3
    add-int/lit8 v0, p1, 0x1

    .end local p1    # "compressedOffset":I
    .restart local v0    # "compressedOffset":I
    or-int v2, p2, v1

    int-to-byte v2, v2

    aput-byte v2, p0, p1

    .line 512
    add-int/lit8 p1, v0, 0x1

    .end local v0    # "compressedOffset":I
    .restart local p1    # "compressedOffset":I
    ushr-int/lit8 v2, p2, 0x7

    or-int/2addr v2, v1

    int-to-byte v2, v2

    aput-byte v2, p0, v0

    .line 513
    add-int/lit8 v0, p1, 0x1

    .end local p1    # "compressedOffset":I
    .restart local v0    # "compressedOffset":I
    ushr-int/lit8 v2, p2, 0xe

    or-int/2addr v2, v1

    int-to-byte v2, v2

    aput-byte v2, p0, p1

    .line 514
    add-int/lit8 p1, v0, 0x1

    .end local v0    # "compressedOffset":I
    .restart local p1    # "compressedOffset":I
    ushr-int/lit8 v2, p2, 0x15

    or-int/2addr v2, v1

    int-to-byte v2, v2

    aput-byte v2, p0, v0

    .line 515
    add-int/lit8 v0, p1, 0x1

    .end local p1    # "compressedOffset":I
    .restart local v0    # "compressedOffset":I
    ushr-int/lit8 v2, p2, 0x1c

    int-to-byte v2, v2

    aput-byte v2, p0, p1

    move p1, v0

    .end local v0    # "compressedOffset":I
    .restart local p1    # "compressedOffset":I
    goto :goto_0
.end method
