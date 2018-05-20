.class final Lorg/iq80/snappy/SnappyDecompressor;
.super Ljava/lang/Object;
.source "SnappyDecompressor.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final MAX_INCREMENT_COPY_OVERFLOW:I = 0x14

.field private static final opLookupTable:[S

.field private static final wordmask:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const-class v0, Lorg/iq80/snappy/SnappyDecompressor;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/iq80/snappy/SnappyDecompressor;->$assertionsDisabled:Z

    .line 350
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lorg/iq80/snappy/SnappyDecompressor;->wordmask:[I

    .line 365
    const/16 v0, 0x100

    new-array v0, v0, [S

    fill-array-data v0, :array_1

    sput-object v0, Lorg/iq80/snappy/SnappyDecompressor;->opLookupTable:[S

    return-void

    .line 24
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 350
    nop

    :array_0
    .array-data 4
        0x0
        0xff
        0xffff
        0xffffff
        -0x1
    .end array-data

    .line 365
    :array_1
    .array-data 2
        0x1s
        0x804s
        0x1001s
        0x2001s
        0x2s
        0x805s
        0x1002s
        0x2002s
        0x3s
        0x806s
        0x1003s
        0x2003s
        0x4s
        0x807s
        0x1004s
        0x2004s
        0x5s
        0x808s
        0x1005s
        0x2005s
        0x6s
        0x809s
        0x1006s
        0x2006s
        0x7s
        0x80as
        0x1007s
        0x2007s
        0x8s
        0x80bs
        0x1008s
        0x2008s
        0x9s
        0x904s
        0x1009s
        0x2009s
        0xas
        0x905s
        0x100as
        0x200as
        0xbs
        0x906s
        0x100bs
        0x200bs
        0xcs
        0x907s
        0x100cs
        0x200cs
        0xds
        0x908s
        0x100ds
        0x200ds
        0xes
        0x909s
        0x100es
        0x200es
        0xfs
        0x90as
        0x100fs
        0x200fs
        0x10s
        0x90bs
        0x1010s
        0x2010s
        0x11s
        0xa04s
        0x1011s
        0x2011s
        0x12s
        0xa05s
        0x1012s
        0x2012s
        0x13s
        0xa06s
        0x1013s
        0x2013s
        0x14s
        0xa07s
        0x1014s
        0x2014s
        0x15s
        0xa08s
        0x1015s
        0x2015s
        0x16s
        0xa09s
        0x1016s
        0x2016s
        0x17s
        0xa0as
        0x1017s
        0x2017s
        0x18s
        0xa0bs
        0x1018s
        0x2018s
        0x19s
        0xb04s
        0x1019s
        0x2019s
        0x1as
        0xb05s
        0x101as
        0x201as
        0x1bs
        0xb06s
        0x101bs
        0x201bs
        0x1cs
        0xb07s
        0x101cs
        0x201cs
        0x1ds
        0xb08s
        0x101ds
        0x201ds
        0x1es
        0xb09s
        0x101es
        0x201es
        0x1fs
        0xb0as
        0x101fs
        0x201fs
        0x20s
        0xb0bs
        0x1020s
        0x2020s
        0x21s
        0xc04s
        0x1021s
        0x2021s
        0x22s
        0xc05s
        0x1022s
        0x2022s
        0x23s
        0xc06s
        0x1023s
        0x2023s
        0x24s
        0xc07s
        0x1024s
        0x2024s
        0x25s
        0xc08s
        0x1025s
        0x2025s
        0x26s
        0xc09s
        0x1026s
        0x2026s
        0x27s
        0xc0as
        0x1027s
        0x2027s
        0x28s
        0xc0bs
        0x1028s
        0x2028s
        0x29s
        0xd04s
        0x1029s
        0x2029s
        0x2as
        0xd05s
        0x102as
        0x202as
        0x2bs
        0xd06s
        0x102bs
        0x202bs
        0x2cs
        0xd07s
        0x102cs
        0x202cs
        0x2ds
        0xd08s
        0x102ds
        0x202ds
        0x2es
        0xd09s
        0x102es
        0x202es
        0x2fs
        0xd0as
        0x102fs
        0x202fs
        0x30s
        0xd0bs
        0x1030s
        0x2030s
        0x31s
        0xe04s
        0x1031s
        0x2031s
        0x32s
        0xe05s
        0x1032s
        0x2032s
        0x33s
        0xe06s
        0x1033s
        0x2033s
        0x34s
        0xe07s
        0x1034s
        0x2034s
        0x35s
        0xe08s
        0x1035s
        0x2035s
        0x36s
        0xe09s
        0x1036s
        0x2036s
        0x37s
        0xe0as
        0x1037s
        0x2037s
        0x38s
        0xe0bs
        0x1038s
        0x2038s
        0x39s
        0xf04s
        0x1039s
        0x2039s
        0x3as
        0xf05s
        0x103as
        0x203as
        0x3bs
        0xf06s
        0x103bs
        0x203bs
        0x3cs
        0xf07s
        0x103cs
        0x203cs
        0x801s
        0xf08s
        0x103ds
        0x203ds
        0x1001s
        0xf09s
        0x103es
        0x203es
        0x1801s
        0xf0as
        0x103fs
        0x203fs
        0x2001s
        0xf0bs
        0x1040s
        0x2040s
    .end array-data
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static copyLiteral([BI[BII)V
    .locals 7
    .param p0, "input"    # [B
    .param p1, "ipIndex"    # I
    .param p2, "output"    # [B
    .param p3, "opIndex"    # I
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/snappy/CorruptionException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x10

    .line 277
    sget-boolean v5, Lorg/iq80/snappy/SnappyDecompressor;->$assertionsDisabled:Z

    if-nez v5, :cond_0

    if-gtz p4, :cond_0

    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5

    .line 278
    :cond_0
    sget-boolean v5, Lorg/iq80/snappy/SnappyDecompressor;->$assertionsDisabled:Z

    if-nez v5, :cond_1

    if-gez p1, :cond_1

    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5

    .line 279
    :cond_1
    sget-boolean v5, Lorg/iq80/snappy/SnappyDecompressor;->$assertionsDisabled:Z

    if-nez v5, :cond_2

    if-gez p3, :cond_2

    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5

    .line 281
    :cond_2
    array-length v5, p2

    sub-int v4, v5, p3

    .line 282
    .local v4, "spaceLeft":I
    array-length v5, p0

    sub-int v2, v5, p1

    .line 284
    .local v2, "readableBytes":I
    if-lt v2, p4, :cond_3

    if-ge v4, p4, :cond_4

    .line 285
    :cond_3
    new-instance v5, Lorg/iq80/snappy/CorruptionException;

    const-string v6, "Corrupt literal length"

    invoke-direct {v5, v6}, Lorg/iq80/snappy/CorruptionException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 288
    :cond_4
    if-gt p4, v6, :cond_6

    if-lt v4, v6, :cond_6

    if-lt v2, v6, :cond_6

    .line 289
    invoke-static {p0, p1, p2, p3}, Lorg/iq80/snappy/SnappyInternalUtils;->copyLong([BI[BI)V

    .line 290
    add-int/lit8 v5, p1, 0x8

    add-int/lit8 v6, p3, 0x8

    invoke-static {p0, v5, p2, v6}, Lorg/iq80/snappy/SnappyInternalUtils;->copyLong([BI[BI)V

    .line 313
    :cond_5
    :goto_0
    return-void

    .line 293
    :cond_6
    and-int/lit8 v0, p4, -0x8

    .line 294
    .local v0, "fastLength":I
    const/16 v5, 0x40

    if-gt v0, v5, :cond_8

    .line 296
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v0, :cond_7

    .line 297
    add-int v5, p1, v1

    add-int v6, p3, v1

    invoke-static {p0, v5, p2, v6}, Lorg/iq80/snappy/SnappyInternalUtils;->copyLong([BI[BI)V

    .line 296
    add-int/lit8 v1, v1, 0x8

    goto :goto_1

    .line 301
    :cond_7
    and-int/lit8 v3, p4, 0x7

    .line 305
    .local v3, "slowLength":I
    const/4 v1, 0x0

    :goto_2
    if-ge v1, v3, :cond_5

    .line 306
    add-int v5, p3, v0

    add-int/2addr v5, v1

    add-int v6, p1, v0

    add-int/2addr v6, v1

    aget-byte v6, p0, v6

    aput-byte v6, p2, v5

    .line 305
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 310
    .end local v1    # "i":I
    .end local v3    # "slowLength":I
    :cond_8
    invoke-static {p0, p1, p2, p3, p4}, Lorg/iq80/snappy/SnappyInternalUtils;->copyMemory([BI[BII)V

    goto :goto_0
.end method

.method private static decompressAllTags([BII[BI)I
    .locals 21
    .param p0, "input"    # [B
    .param p1, "inputOffset"    # I
    .param p2, "inputSize"    # I
    .param p3, "output"    # [B
    .param p4, "outputOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/snappy/CorruptionException;
        }
    .end annotation

    .prologue
    .line 100
    move-object/from16 v0, p3

    array-length v6, v0

    .line 102
    .local v6, "outputLimit":I
    add-int v12, p1, p2

    .line 103
    .local v12, "ipLimit":I
    move/from16 v8, p4

    .line 104
    .local v8, "opIndex":I
    move/from16 v4, p1

    .local v4, "ipIndex":I
    move v11, v4

    .line 106
    .end local v4    # "ipIndex":I
    .local v11, "ipIndex":I
    :goto_0
    add-int/lit8 v3, v12, -0x5

    if-ge v11, v3, :cond_5

    .line 107
    add-int/lit8 v4, v11, 0x1

    .end local v11    # "ipIndex":I
    .restart local v4    # "ipIndex":I
    move-object/from16 v0, p0

    invoke-static {v0, v11}, Lorg/iq80/snappy/SnappyInternalUtils;->loadByte([BI)I

    move-result v15

    .line 108
    .local v15, "opCode":I
    sget-object v3, Lorg/iq80/snappy/SnappyDecompressor;->opLookupTable:[S

    invoke-static {v3, v15}, Lorg/iq80/snappy/SnappyInternalUtils;->lookupShort([SI)I

    move-result v10

    .line 109
    .local v10, "entry":I
    ushr-int/lit8 v20, v10, 0xb

    .line 110
    .local v20, "trailerBytes":I
    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-static {v0, v4, v1}, Lorg/iq80/snappy/SnappyDecompressor;->readTrailer([BII)I

    move-result v19

    .line 113
    .local v19, "trailer":I
    ushr-int/lit8 v3, v10, 0xb

    add-int/2addr v4, v3

    .line 114
    and-int/lit16 v13, v10, 0xff

    .line 116
    .local v13, "length":I
    and-int/lit8 v3, v15, 0x3

    if-nez v3, :cond_0

    .line 117
    add-int v14, v13, v19

    .line 118
    .local v14, "literalLength":I
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-static {v0, v4, v1, v8, v14}, Lorg/iq80/snappy/SnappyDecompressor;->copyLiteral([BI[BII)V

    .line 119
    add-int/2addr v4, v14

    .line 120
    add-int/2addr v8, v14

    .end local v14    # "literalLength":I
    :goto_1
    move v11, v4

    .line 182
    .end local v4    # "ipIndex":I
    .restart local v11    # "ipIndex":I
    goto :goto_0

    .line 126
    .end local v11    # "ipIndex":I
    .restart local v4    # "ipIndex":I
    :cond_0
    and-int/lit16 v9, v10, 0x700

    .line 127
    .local v9, "copyOffset":I
    add-int v9, v9, v19

    .line 162
    sub-int v17, v6, v8

    .line 163
    .local v17, "spaceLeft":I
    sub-int v18, v8, v9

    .line 164
    .local v18, "srcIndex":I
    move/from16 v0, v18

    move/from16 v1, p4

    if-ge v0, v1, :cond_1

    .line 165
    new-instance v3, Lorg/iq80/snappy/CorruptionException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Invalid copy offset for opcode starting at "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sub-int v7, v4, v20

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Lorg/iq80/snappy/CorruptionException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 168
    :cond_1
    const/16 v3, 0x10

    if-gt v13, v3, :cond_2

    const/16 v3, 0x8

    if-lt v9, v3, :cond_2

    const/16 v3, 0x10

    move/from16 v0, v17

    if-lt v0, v3, :cond_2

    .line 170
    move-object/from16 v0, p3

    move/from16 v1, v18

    move-object/from16 v2, p3

    invoke-static {v0, v1, v2, v8}, Lorg/iq80/snappy/SnappyInternalUtils;->copyLong([BI[BI)V

    .line 171
    add-int/lit8 v3, v18, 0x8

    add-int/lit8 v5, v8, 0x8

    move-object/from16 v0, p3

    move-object/from16 v1, p3

    invoke-static {v0, v3, v1, v5}, Lorg/iq80/snappy/SnappyInternalUtils;->copyLong([BI[BI)V

    .line 180
    :goto_2
    add-int/2addr v8, v13

    goto :goto_1

    .line 173
    :cond_2
    add-int/lit8 v3, v13, 0x14

    move/from16 v0, v17

    if-lt v0, v3, :cond_3

    .line 174
    move-object/from16 v0, p3

    move/from16 v1, v18

    invoke-static {v0, v1, v8, v13}, Lorg/iq80/snappy/SnappyDecompressor;->incrementalCopyFastPath([BIII)V

    goto :goto_2

    .line 177
    :cond_3
    move-object/from16 v0, p3

    move/from16 v1, v18

    move-object/from16 v2, p3

    invoke-static {v0, v1, v2, v8, v13}, Lorg/iq80/snappy/SnappyDecompressor;->incrementalCopy([BI[BII)V

    goto :goto_2

    .line 185
    .end local v9    # "copyOffset":I
    .end local v10    # "entry":I
    .end local v13    # "length":I
    .end local v15    # "opCode":I
    .end local v17    # "spaceLeft":I
    .end local v18    # "srcIndex":I
    .end local v19    # "trailer":I
    .end local v20    # "trailerBytes":I
    :goto_3
    if-ge v4, v12, :cond_4

    move-object/from16 v3, p0

    move-object/from16 v5, p3

    move/from16 v7, p4

    .line 186
    invoke-static/range {v3 .. v8}, Lorg/iq80/snappy/SnappyDecompressor;->decompressTagSlow([BI[BIII)[I

    move-result-object v16

    .line 187
    .local v16, "result":[I
    const/4 v3, 0x0

    aget v4, v16, v3

    .line 188
    const/4 v3, 0x1

    aget v8, v16, v3

    .line 189
    goto :goto_3

    .line 191
    .end local v16    # "result":[I
    :cond_4
    sub-int v3, v8, p4

    return v3

    .end local v4    # "ipIndex":I
    .restart local v11    # "ipIndex":I
    :cond_5
    move v4, v11

    .end local v11    # "ipIndex":I
    .restart local v4    # "ipIndex":I
    goto :goto_3
.end method

.method private static decompressTagSlow([BI[BIII)[I
    .locals 17
    .param p0, "input"    # [B
    .param p1, "ipIndex"    # I
    .param p2, "output"    # [B
    .param p3, "outputLimit"    # I
    .param p4, "outputOffset"    # I
    .param p5, "opIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/snappy/CorruptionException;
        }
    .end annotation

    .prologue
    .line 208
    add-int/lit8 v6, p1, 0x1

    .end local p1    # "ipIndex":I
    .local v6, "ipIndex":I
    invoke-static/range {p0 .. p1}, Lorg/iq80/snappy/SnappyInternalUtils;->loadByte([BI)I

    move-result v9

    .line 209
    .local v9, "opCode":I
    sget-object v14, Lorg/iq80/snappy/SnappyDecompressor;->opLookupTable:[S

    invoke-static {v14, v9}, Lorg/iq80/snappy/SnappyInternalUtils;->lookupShort([SI)I

    move-result v5

    .line 210
    .local v5, "entry":I
    ushr-int/lit8 v13, v5, 0xb

    .line 214
    .local v13, "trailerBytes":I
    const/4 v12, 0x0

    .line 215
    .local v12, "trailer":I
    packed-switch v13, :pswitch_data_0

    .line 227
    :goto_0
    add-int p1, v6, v13

    .line 228
    .end local v6    # "ipIndex":I
    .restart local p1    # "ipIndex":I
    and-int/lit16 v7, v5, 0xff

    .line 230
    .local v7, "length":I
    and-int/lit8 v14, v9, 0x3

    if-nez v14, :cond_0

    .line 231
    add-int v8, v7, v12

    .line 232
    .local v8, "literalLength":I
    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p5

    invoke-static {v0, v1, v2, v3, v8}, Lorg/iq80/snappy/SnappyDecompressor;->copyLiteral([BI[BII)V

    .line 233
    add-int p1, p1, v8

    .line 234
    add-int p5, p5, v8

    .line 266
    .end local v8    # "literalLength":I
    :goto_1
    const/4 v14, 0x2

    new-array v14, v14, [I

    const/4 v15, 0x0

    aput p1, v14, v15

    const/4 v15, 0x1

    aput p5, v14, v15

    return-object v14

    .line 217
    .end local v7    # "length":I
    .end local p1    # "ipIndex":I
    .restart local v6    # "ipIndex":I
    :pswitch_0
    add-int/lit8 v14, v6, 0x3

    aget-byte v14, p0, v14

    and-int/lit16 v14, v14, 0xff

    shl-int/lit8 v12, v14, 0x18

    .line 219
    :pswitch_1
    add-int/lit8 v14, v6, 0x2

    aget-byte v14, p0, v14

    and-int/lit16 v14, v14, 0xff

    shl-int/lit8 v14, v14, 0x10

    or-int/2addr v12, v14

    .line 221
    :pswitch_2
    add-int/lit8 v14, v6, 0x1

    aget-byte v14, p0, v14

    and-int/lit16 v14, v14, 0xff

    shl-int/lit8 v14, v14, 0x8

    or-int/2addr v12, v14

    .line 223
    :pswitch_3
    aget-byte v14, p0, v6

    and-int/lit16 v14, v14, 0xff

    or-int/2addr v12, v14

    goto :goto_0

    .line 240
    .end local v6    # "ipIndex":I
    .restart local v7    # "length":I
    .restart local p1    # "ipIndex":I
    :cond_0
    and-int/lit16 v4, v5, 0x700

    .line 241
    .local v4, "copyOffset":I
    add-int/2addr v4, v12

    .line 245
    sub-int v10, p3, p5

    .line 246
    .local v10, "spaceLeft":I
    sub-int v11, p5, v4

    .line 248
    .local v11, "srcIndex":I
    move/from16 v0, p4

    if-ge v11, v0, :cond_1

    .line 249
    new-instance v14, Lorg/iq80/snappy/CorruptionException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Invalid copy offset for opcode starting at "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sub-int v16, p1, v13

    add-int/lit8 v16, v16, -0x1

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lorg/iq80/snappy/CorruptionException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 252
    :cond_1
    const/16 v14, 0x10

    if-gt v7, v14, :cond_2

    const/16 v14, 0x8

    if-lt v4, v14, :cond_2

    const/16 v14, 0x10

    if-lt v10, v14, :cond_2

    .line 254
    move-object/from16 v0, p2

    move-object/from16 v1, p2

    move/from16 v2, p5

    invoke-static {v0, v11, v1, v2}, Lorg/iq80/snappy/SnappyInternalUtils;->copyLong([BI[BI)V

    .line 255
    add-int/lit8 v14, v11, 0x8

    add-int/lit8 v15, p5, 0x8

    move-object/from16 v0, p2

    move-object/from16 v1, p2

    invoke-static {v0, v14, v1, v15}, Lorg/iq80/snappy/SnappyInternalUtils;->copyLong([BI[BI)V

    .line 264
    :goto_2
    add-int p5, p5, v7

    goto :goto_1

    .line 257
    :cond_2
    add-int/lit8 v14, v7, 0x14

    if-lt v10, v14, :cond_3

    .line 258
    move-object/from16 v0, p2

    move/from16 v1, p5

    invoke-static {v0, v11, v1, v7}, Lorg/iq80/snappy/SnappyDecompressor;->incrementalCopyFastPath([BIII)V

    goto :goto_2

    .line 261
    :cond_3
    move-object/from16 v0, p2

    move-object/from16 v1, p2

    move/from16 v2, p5

    invoke-static {v0, v11, v1, v2, v7}, Lorg/iq80/snappy/SnappyDecompressor;->incrementalCopy([BI[BII)V

    goto :goto_2

    .line 215
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getUncompressedLength([BI)I
    .locals 2
    .param p0, "compressed"    # [B
    .param p1, "compressedOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/snappy/CorruptionException;
        }
    .end annotation

    .prologue
    .line 31
    invoke-static {p0, p1}, Lorg/iq80/snappy/SnappyDecompressor;->readUncompressedLength([BI)[I

    move-result-object v0

    const/4 v1, 0x0

    aget v0, v0, v1

    return v0
.end method

.method private static incrementalCopy([BI[BII)V
    .locals 3
    .param p0, "src"    # [B
    .param p1, "srcIndex"    # I
    .param p2, "op"    # [B
    .param p3, "opIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 332
    :goto_0
    add-int/lit8 v0, p3, 0x1

    .end local p3    # "opIndex":I
    .local v0, "opIndex":I
    add-int/lit8 v1, p1, 0x1

    .end local p1    # "srcIndex":I
    .local v1, "srcIndex":I
    aget-byte v2, p0, p1

    aput-byte v2, p2, p3

    .line 333
    add-int/lit8 p4, p4, -0x1

    if-gtz p4, :cond_0

    .line 334
    return-void

    :cond_0
    move p3, v0

    .end local v0    # "opIndex":I
    .restart local p3    # "opIndex":I
    move p1, v1

    .end local v1    # "srcIndex":I
    .restart local p1    # "srcIndex":I
    goto :goto_0
.end method

.method private static incrementalCopyFastPath([BIII)V
    .locals 4
    .param p0, "output"    # [B
    .param p1, "srcIndex"    # I
    .param p2, "opIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 338
    const/4 v0, 0x0

    .line 339
    .local v0, "copiedLength":I
    :goto_0
    add-int v2, p2, v0

    sub-int/2addr v2, p1

    const/16 v3, 0x8

    if-ge v2, v3, :cond_0

    .line 340
    add-int v2, p2, v0

    invoke-static {p0, p1, p0, v2}, Lorg/iq80/snappy/SnappyInternalUtils;->copyLong([BI[BI)V

    .line 341
    add-int v2, p2, v0

    sub-int/2addr v2, p1

    add-int/2addr v0, v2

    goto :goto_0

    .line 344
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    sub-int v2, p3, v0

    if-ge v1, v2, :cond_1

    .line 345
    add-int v2, p1, v1

    add-int v3, p2, v0

    add-int/2addr v3, v1

    invoke-static {p0, v2, p0, v3}, Lorg/iq80/snappy/SnappyInternalUtils;->copyLong([BI[BI)V

    .line 344
    add-int/lit8 v1, v1, 0x8

    goto :goto_1

    .line 347
    :cond_1
    return-void
.end method

.method private static readTrailer([BII)I
    .locals 2
    .param p0, "data"    # [B
    .param p1, "index"    # I
    .param p2, "bytes"    # I

    .prologue
    .line 271
    invoke-static {p0, p1}, Lorg/iq80/snappy/SnappyInternalUtils;->loadInt([BI)I

    move-result v0

    sget-object v1, Lorg/iq80/snappy/SnappyDecompressor;->wordmask:[I

    aget v1, v1, p2

    and-int/2addr v0, v1

    return v0
.end method

.method private static readUncompressedLength([BI)[I
    .locals 6
    .param p0, "compressed"    # [B
    .param p1, "compressedOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/snappy/CorruptionException;
        }
    .end annotation

    .prologue
    .line 408
    const/4 v1, 0x0

    .line 410
    .local v1, "bytesRead":I
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "bytesRead":I
    .local v2, "bytesRead":I
    add-int v4, p1, v1

    aget-byte v4, p0, v4

    and-int/lit16 v0, v4, 0xff

    .line 411
    .local v0, "b":I
    and-int/lit8 v3, v0, 0x7f

    .line 412
    .local v3, "result":I
    and-int/lit16 v4, v0, 0x80

    if-eqz v4, :cond_0

    .line 413
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "bytesRead":I
    .restart local v1    # "bytesRead":I
    add-int/lit8 v4, p1, 0x1

    aget-byte v4, p0, v4

    and-int/lit16 v0, v4, 0xff

    .line 414
    and-int/lit8 v4, v0, 0x7f

    shl-int/lit8 v4, v4, 0x7

    or-int/2addr v3, v4

    .line 415
    and-int/lit16 v4, v0, 0x80

    if-eqz v4, :cond_1

    .line 416
    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v4, p1, 0x2

    aget-byte v4, p0, v4

    and-int/lit16 v0, v4, 0xff

    .line 417
    and-int/lit8 v4, v0, 0x7f

    shl-int/lit8 v4, v4, 0xe

    or-int/2addr v3, v4

    .line 418
    and-int/lit16 v4, v0, 0x80

    if-eqz v4, :cond_1

    .line 419
    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v4, p1, 0x3

    aget-byte v4, p0, v4

    and-int/lit16 v0, v4, 0xff

    .line 420
    and-int/lit8 v4, v0, 0x7f

    shl-int/lit8 v4, v4, 0x15

    or-int/2addr v3, v4

    .line 421
    and-int/lit16 v4, v0, 0x80

    if-eqz v4, :cond_1

    .line 422
    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v4, p1, 0x4

    aget-byte v4, p0, v4

    and-int/lit16 v0, v4, 0xff

    .line 423
    and-int/lit8 v4, v0, 0x7f

    shl-int/lit8 v4, v4, 0x1c

    or-int/2addr v3, v4

    .line 424
    and-int/lit16 v4, v0, 0x80

    if-eqz v4, :cond_1

    .line 425
    new-instance v4, Lorg/iq80/snappy/CorruptionException;

    const-string v5, "last byte of compressed length int has high bit set"

    invoke-direct {v4, v5}, Lorg/iq80/snappy/CorruptionException;-><init>(Ljava/lang/String;)V

    throw v4

    .end local v1    # "bytesRead":I
    .restart local v2    # "bytesRead":I
    :cond_0
    move v1, v2

    .line 432
    .end local v2    # "bytesRead":I
    .restart local v1    # "bytesRead":I
    :cond_1
    const/4 v4, 0x2

    new-array v4, v4, [I

    const/4 v5, 0x0

    aput v3, v4, v5

    const/4 v5, 0x1

    aput v1, v4, v5

    return-object v4
.end method

.method public static uncompress([BII[BI)I
    .locals 10
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
    const/4 v9, 0x2

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 67
    invoke-static {p0, p1}, Lorg/iq80/snappy/SnappyDecompressor;->readUncompressedLength([BI)[I

    move-result-object v2

    .line 68
    .local v2, "varInt":[I
    aget v0, v2, v5

    .line 69
    .local v0, "expectedLength":I
    aget v3, v2, v4

    add-int/2addr p1, v3

    .line 70
    aget v3, v2, v4

    sub-int/2addr p2, v3

    .line 72
    array-length v3, p3

    sub-int/2addr v3, p4

    if-gt v0, v3, :cond_0

    move v3, v4

    :goto_0
    const-string v6, "Uncompressed length %s must be less than %s"

    new-array v7, v9, [Ljava/lang/Object;

    .line 73
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v5

    array-length v8, p3

    sub-int/2addr v8, p4

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v4

    .line 72
    invoke-static {v3, v6, v7}, Lorg/iq80/snappy/SnappyInternalUtils;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 76
    invoke-static {p0, p1, p2, p3, p4}, Lorg/iq80/snappy/SnappyDecompressor;->decompressAllTags([BII[BI)I

    move-result v1

    .line 83
    .local v1, "uncompressedSize":I
    if-eq v0, v1, :cond_1

    .line 84
    new-instance v3, Lorg/iq80/snappy/CorruptionException;

    const-string v6, "Recorded length is %s bytes but actual length after decompression is %s bytes "

    new-array v7, v9, [Ljava/lang/Object;

    .line 85
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v5

    .line 86
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v7, v4

    .line 84
    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/iq80/snappy/CorruptionException;-><init>(Ljava/lang/String;)V

    throw v3

    .end local v1    # "uncompressedSize":I
    :cond_0
    move v3, v5

    .line 72
    goto :goto_0

    .line 89
    .restart local v1    # "uncompressedSize":I
    :cond_1
    return v0
.end method

.method public static uncompress([BII)[B
    .locals 10
    .param p0, "compressed"    # [B
    .param p1, "compressedOffset"    # I
    .param p2, "compressedSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/snappy/CorruptionException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 38
    invoke-static {p0, p1}, Lorg/iq80/snappy/SnappyDecompressor;->readUncompressedLength([BI)[I

    move-result-object v3

    .line 39
    .local v3, "varInt":[I
    aget v0, v3, v8

    .line 40
    .local v0, "expectedLength":I
    aget v4, v3, v9

    add-int/2addr p1, v4

    .line 41
    aget v4, v3, v9

    sub-int/2addr p2, v4

    .line 44
    new-array v1, v0, [B

    .line 47
    .local v1, "uncompressed":[B
    invoke-static {p0, p1, p2, v1, v8}, Lorg/iq80/snappy/SnappyDecompressor;->decompressAllTags([BII[BI)I

    move-result v2

    .line 54
    .local v2, "uncompressedSize":I
    if-eq v0, v2, :cond_0

    .line 55
    new-instance v4, Lorg/iq80/snappy/CorruptionException;

    const-string v5, "Recorded length is %s bytes but actual length after decompression is %s bytes "

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    .line 56
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    .line 57
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v9

    .line 55
    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/iq80/snappy/CorruptionException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 60
    :cond_0
    return-object v1
.end method
