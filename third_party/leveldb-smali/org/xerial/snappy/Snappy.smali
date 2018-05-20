.class public Lorg/xerial/snappy/Snappy;
.super Ljava/lang/Object;
.source "Snappy.java"


# static fields
.field private static impl:Lorg/xerial/snappy/SnappyNative;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 47
    :try_start_0
    invoke-static {}, Lorg/xerial/snappy/SnappyLoader;->load()Lorg/xerial/snappy/SnappyNative;

    move-result-object v0

    sput-object v0, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    return-void

    .line 49
    :catch_0
    move-exception v0

    .line 50
    new-instance v1, Ljava/lang/ExceptionInInitializerError;

    invoke-direct {v1, v0}, Ljava/lang/ExceptionInInitializerError;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static arrayCopy(Ljava/lang/Object;IILjava/lang/Object;I)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    sget-object v0, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lorg/xerial/snappy/SnappyNative;->arrayCopy(Ljava/lang/Object;IILjava/lang/Object;I)V

    .line 86
    return-void
.end method

.method public static cleanUp()V
    .locals 1

    .prologue
    .line 68
    invoke-static {}, Lorg/xerial/snappy/SnappyLoader;->cleanUpExtractedNativeLib()V

    .line 69
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/xerial/snappy/SnappyLoader;->setApi(Lorg/xerial/snappy/SnappyNative;)V

    .line 70
    return-void
.end method

.method public static compress(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 136
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v0

    if-nez v0, :cond_0

    .line 137
    new-instance v0, Lorg/xerial/snappy/SnappyError;

    sget-object v1, Lorg/xerial/snappy/SnappyErrorCode;->NOT_A_DIRECT_BUFFER:Lorg/xerial/snappy/SnappyErrorCode;

    const-string v2, "input is not a direct buffer"

    invoke-direct {v0, v1, v2}, Lorg/xerial/snappy/SnappyError;-><init>(Lorg/xerial/snappy/SnappyErrorCode;Ljava/lang/String;)V

    throw v0

    .line 139
    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v0

    if-nez v0, :cond_1

    .line 140
    new-instance v0, Lorg/xerial/snappy/SnappyError;

    sget-object v1, Lorg/xerial/snappy/SnappyErrorCode;->NOT_A_DIRECT_BUFFER:Lorg/xerial/snappy/SnappyErrorCode;

    const-string v2, "destination is not a direct buffer"

    invoke-direct {v0, v1, v2}, Lorg/xerial/snappy/SnappyError;-><init>(Lorg/xerial/snappy/SnappyErrorCode;Ljava/lang/String;)V

    throw v0

    .line 145
    :cond_1
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    .line 146
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    .line 147
    sget-object v0, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;

    .line 148
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    move-object v1, p0

    move-object v4, p1

    .line 147
    invoke-virtual/range {v0 .. v5}, Lorg/xerial/snappy/SnappyNative;->rawCompress(Ljava/nio/ByteBuffer;IILjava/nio/ByteBuffer;I)I

    move-result v0

    .line 152
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 154
    return v0
.end method

.method public static compress([BII[BI)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    invoke-static {p0, p1, p2, p3, p4}, Lorg/xerial/snappy/Snappy;->rawCompress(Ljava/lang/Object;II[BI)I

    move-result v0

    return v0
.end method

.method public static compress(Ljava/lang/String;)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 240
    :try_start_0
    const-string v0, "UTF-8"

    invoke-static {p0, v0}, Lorg/xerial/snappy/Snappy;->compress(Ljava/lang/String;Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    .line 242
    :catch_0
    move-exception v0

    .line 243
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "UTF-8 encoder is not found"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static compress(Ljava/lang/String;Ljava/lang/String;)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 259
    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 260
    invoke-static {v0}, Lorg/xerial/snappy/Snappy;->compress([B)[B

    move-result-object v0

    return-object v0
.end method

.method public static compress(Ljava/lang/String;Ljava/nio/charset/Charset;)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 275
    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 276
    invoke-static {v0}, Lorg/xerial/snappy/Snappy;->compress([B)[B

    move-result-object v0

    return-object v0
.end method

.method public static compress([B)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    array-length v0, p0

    invoke-static {p0, v0}, Lorg/xerial/snappy/Snappy;->rawCompress(Ljava/lang/Object;I)[B

    move-result-object v0

    return-object v0
.end method

.method public static compress([C)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 166
    array-length v0, p0

    mul-int/lit8 v0, v0, 0x2

    invoke-static {p0, v0}, Lorg/xerial/snappy/Snappy;->rawCompress(Ljava/lang/Object;I)[B

    move-result-object v0

    return-object v0
.end method

.method public static compress([D)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 178
    array-length v0, p0

    mul-int/lit8 v0, v0, 0x8

    invoke-static {p0, v0}, Lorg/xerial/snappy/Snappy;->rawCompress(Ljava/lang/Object;I)[B

    move-result-object v0

    return-object v0
.end method

.method public static compress([F)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 190
    array-length v0, p0

    mul-int/lit8 v0, v0, 0x4

    invoke-static {p0, v0}, Lorg/xerial/snappy/Snappy;->rawCompress(Ljava/lang/Object;I)[B

    move-result-object v0

    return-object v0
.end method

.method public static compress([I)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 202
    array-length v0, p0

    mul-int/lit8 v0, v0, 0x4

    invoke-static {p0, v0}, Lorg/xerial/snappy/Snappy;->rawCompress(Ljava/lang/Object;I)[B

    move-result-object v0

    return-object v0
.end method

.method public static compress([J)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 214
    array-length v0, p0

    mul-int/lit8 v0, v0, 0x8

    invoke-static {p0, v0}, Lorg/xerial/snappy/Snappy;->rawCompress(Ljava/lang/Object;I)[B

    move-result-object v0

    return-object v0
.end method

.method public static compress([S)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 226
    array-length v0, p0

    mul-int/lit8 v0, v0, 0x2

    invoke-static {p0, v0}, Lorg/xerial/snappy/Snappy;->rawCompress(Ljava/lang/Object;I)[B

    move-result-object v0

    return-object v0
.end method

.method public static getNativeLibraryVersion()Ljava/lang/String;
    .locals 6

    .prologue
    .line 286
    const-class v0, Lorg/xerial/snappy/SnappyLoader;

    const-string v1, "/org/xerial/snappy/VERSION"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v1

    .line 288
    const-string v0, "unknown"

    .line 290
    if-eqz v1, :cond_1

    .line 291
    const/4 v2, 0x0

    .line 293
    :try_start_0
    new-instance v3, Ljava/util/Properties;

    invoke-direct {v3}, Ljava/util/Properties;-><init>()V

    .line 294
    invoke-virtual {v1}, Ljava/net/URL;->openStream()Ljava/io/InputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 295
    :try_start_1
    invoke-virtual {v3, v2}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 296
    const-string v1, "version"

    invoke-virtual {v3, v1, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v1

    .line 297
    :try_start_2
    const-string v0, "unknown"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 298
    const-string v0, "VERSION"

    invoke-virtual {v3, v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 300
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v3, "[^0-9\\.]"

    const-string v4, ""

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-result-object v0

    .line 303
    if-eqz v2, :cond_1

    .line 304
    :try_start_3
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 312
    :cond_1
    :goto_0
    return-object v0

    .line 303
    :catchall_0
    move-exception v1

    move-object v5, v1

    move-object v1, v2

    move-object v2, v0

    move-object v0, v5

    :goto_1
    if-eqz v1, :cond_2

    .line 304
    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    :cond_2
    throw v0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 309
    :catch_0
    move-exception v0

    move-object v1, v0

    move-object v0, v2

    .line 310
    :goto_2
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 309
    :catch_1
    move-exception v1

    goto :goto_2

    .line 303
    :catchall_1
    move-exception v1

    move-object v5, v1

    move-object v1, v2

    move-object v2, v0

    move-object v0, v5

    goto :goto_1

    :catchall_2
    move-exception v0

    move-object v5, v2

    move-object v2, v1

    move-object v1, v5

    goto :goto_1
.end method

.method public static isValidCompressedBuffer(JJJ)Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 364
    sget-object v1, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;

    move-wide v2, p0

    move-wide v4, p2

    move-wide v6, p4

    invoke-virtual/range {v1 .. v7}, Lorg/xerial/snappy/SnappyNative;->isValidCompressedBuffer(JJJ)Z

    move-result v0

    return v0
.end method

.method public static isValidCompressedBuffer(Ljava/nio/ByteBuffer;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 351
    sget-object v0, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    .line 352
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    .line 351
    invoke-virtual {v0, p0, v1, v2}, Lorg/xerial/snappy/SnappyNative;->isValidCompressedBuffer(Ljava/nio/ByteBuffer;II)Z

    move-result v0

    return v0
.end method

.method public static isValidCompressedBuffer([B)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 339
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lorg/xerial/snappy/Snappy;->isValidCompressedBuffer([BII)Z

    move-result v0

    return v0
.end method

.method public static isValidCompressedBuffer([BII)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 324
    if-nez p0, :cond_0

    .line 325
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "input is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 327
    :cond_0
    sget-object v0, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;

    invoke-virtual {v0, p0, p1, p2}, Lorg/xerial/snappy/SnappyNative;->isValidCompressedBuffer(Ljava/lang/Object;II)Z

    move-result v0

    return v0
.end method

.method public static maxCompressedLength(I)I
    .locals 1

    .prologue
    .line 376
    sget-object v0, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;

    invoke-virtual {v0, p0}, Lorg/xerial/snappy/SnappyNative;->maxCompressedLength(I)I

    move-result v0

    return v0
.end method

.method public static rawCompress(Ljava/lang/Object;II[BI)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 441
    if-eqz p0, :cond_0

    if-nez p3, :cond_1

    .line 442
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "input or output is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 445
    :cond_1
    sget-object v0, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move v5, p4

    .line 446
    invoke-virtual/range {v0 .. v5}, Lorg/xerial/snappy/SnappyNative;->rawCompress(Ljava/lang/Object;IILjava/lang/Object;I)I

    move-result v0

    .line 447
    return v0
.end method

.method public static rawCompress(JJJ)J
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 391
    sget-object v1, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;

    move-wide v2, p0

    move-wide v4, p2

    move-wide v6, p4

    invoke-virtual/range {v1 .. v7}, Lorg/xerial/snappy/SnappyNative;->rawCompress(JJJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public static rawCompress(Ljava/lang/Object;I)[B
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 419
    invoke-static {p1}, Lorg/xerial/snappy/Snappy;->maxCompressedLength(I)I

    move-result v0

    new-array v4, v0, [B

    .line 420
    sget-object v0, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;

    move-object v1, p0

    move v3, p1

    move v5, v2

    invoke-virtual/range {v0 .. v5}, Lorg/xerial/snappy/SnappyNative;->rawCompress(Ljava/lang/Object;IILjava/lang/Object;I)I

    move-result v0

    .line 421
    new-array v1, v0, [B

    .line 422
    invoke-static {v4, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 423
    return-object v1
.end method

.method public static rawUncompress([BIILjava/lang/Object;I)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 471
    if-eqz p0, :cond_0

    if-nez p3, :cond_1

    .line 472
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "input or output is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 474
    :cond_1
    sget-object v0, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lorg/xerial/snappy/SnappyNative;->rawUncompress(Ljava/lang/Object;IILjava/lang/Object;I)I

    move-result v0

    return v0
.end method

.method public static rawUncompress(JJJ)J
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 406
    sget-object v1, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;

    move-wide v2, p0

    move-wide v4, p2

    move-wide v6, p4

    invoke-virtual/range {v1 .. v7}, Lorg/xerial/snappy/SnappyNative;->rawUncompress(JJJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public static uncompress(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 535
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v0

    if-nez v0, :cond_0

    .line 536
    new-instance v0, Lorg/xerial/snappy/SnappyError;

    sget-object v1, Lorg/xerial/snappy/SnappyErrorCode;->NOT_A_DIRECT_BUFFER:Lorg/xerial/snappy/SnappyErrorCode;

    const-string v2, "input is not a direct buffer"

    invoke-direct {v0, v1, v2}, Lorg/xerial/snappy/SnappyError;-><init>(Lorg/xerial/snappy/SnappyErrorCode;Ljava/lang/String;)V

    throw v0

    .line 538
    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v0

    if-nez v0, :cond_1

    .line 539
    new-instance v0, Lorg/xerial/snappy/SnappyError;

    sget-object v1, Lorg/xerial/snappy/SnappyErrorCode;->NOT_A_DIRECT_BUFFER:Lorg/xerial/snappy/SnappyErrorCode;

    const-string v2, "destination is not a direct buffer"

    invoke-direct {v0, v1, v2}, Lorg/xerial/snappy/SnappyError;-><init>(Lorg/xerial/snappy/SnappyErrorCode;Ljava/lang/String;)V

    throw v0

    .line 542
    :cond_1
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    .line 543
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    .line 547
    sget-object v0, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;

    .line 548
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    move-object v1, p0

    move-object v4, p1

    .line 547
    invoke-virtual/range {v0 .. v5}, Lorg/xerial/snappy/SnappyNative;->rawUncompress(Ljava/nio/ByteBuffer;IILjava/nio/ByteBuffer;I)I

    move-result v0

    .line 549
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 551
    return v0
.end method

.method public static uncompress([BII[BI)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 513
    invoke-static {p0, p1, p2, p3, p4}, Lorg/xerial/snappy/Snappy;->rawUncompress([BIILjava/lang/Object;I)I

    move-result v0

    return v0
.end method

.method public static uncompress([B)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 487
    invoke-static {p0}, Lorg/xerial/snappy/Snappy;->uncompressedLength([B)I

    move-result v0

    new-array v0, v0, [B

    .line 488
    array-length v1, p0

    invoke-static {p0, v2, v1, v0, v2}, Lorg/xerial/snappy/Snappy;->uncompress([BII[BI)I

    .line 489
    return-object v0
.end method

.method public static uncompressCharArray([B)[C
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 564
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lorg/xerial/snappy/Snappy;->uncompressCharArray([BII)[C

    move-result-object v0

    return-object v0
.end method

.method public static uncompressCharArray([BII)[C
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 579
    invoke-static {p0, p1, p2}, Lorg/xerial/snappy/Snappy;->uncompressedLength([BII)I

    move-result v0

    .line 580
    div-int/lit8 v0, v0, 0x2

    new-array v4, v0, [C

    .line 581
    sget-object v0, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;

    const/4 v5, 0x0

    move-object v1, p0

    move v2, p1

    move v3, p2

    invoke-virtual/range {v0 .. v5}, Lorg/xerial/snappy/SnappyNative;->rawUncompress(Ljava/lang/Object;IILjava/lang/Object;I)I

    .line 582
    return-object v4
.end method

.method public static uncompressDoubleArray([B)[D
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 595
    array-length v0, p0

    invoke-static {p0, v2, v0}, Lorg/xerial/snappy/Snappy;->uncompressedLength([BII)I

    move-result v0

    .line 596
    div-int/lit8 v0, v0, 0x8

    new-array v4, v0, [D

    .line 597
    sget-object v0, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;

    array-length v3, p0

    move-object v1, p0

    move v5, v2

    invoke-virtual/range {v0 .. v5}, Lorg/xerial/snappy/SnappyNative;->rawUncompress(Ljava/lang/Object;IILjava/lang/Object;I)I

    .line 598
    return-object v4
.end method

.method public static uncompressFloatArray([B)[F
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 682
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lorg/xerial/snappy/Snappy;->uncompressFloatArray([BII)[F

    move-result-object v0

    return-object v0
.end method

.method public static uncompressFloatArray([BII)[F
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 697
    invoke-static {p0, p1, p2}, Lorg/xerial/snappy/Snappy;->uncompressedLength([BII)I

    move-result v0

    .line 698
    div-int/lit8 v0, v0, 0x4

    new-array v4, v0, [F

    .line 699
    sget-object v0, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;

    const/4 v5, 0x0

    move-object v1, p0

    move v2, p1

    move v3, p2

    invoke-virtual/range {v0 .. v5}, Lorg/xerial/snappy/SnappyNative;->rawUncompress(Ljava/lang/Object;IILjava/lang/Object;I)I

    .line 700
    return-object v4
.end method

.method public static uncompressIntArray([B)[I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 713
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lorg/xerial/snappy/Snappy;->uncompressIntArray([BII)[I

    move-result-object v0

    return-object v0
.end method

.method public static uncompressIntArray([BII)[I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 728
    invoke-static {p0, p1, p2}, Lorg/xerial/snappy/Snappy;->uncompressedLength([BII)I

    move-result v0

    .line 729
    div-int/lit8 v0, v0, 0x4

    new-array v4, v0, [I

    .line 730
    sget-object v0, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;

    const/4 v5, 0x0

    move-object v1, p0

    move v2, p1

    move v3, p2

    invoke-virtual/range {v0 .. v5}, Lorg/xerial/snappy/SnappyNative;->rawUncompress(Ljava/lang/Object;IILjava/lang/Object;I)I

    .line 731
    return-object v4
.end method

.method public static uncompressLongArray([B)[J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 744
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lorg/xerial/snappy/Snappy;->uncompressLongArray([BII)[J

    move-result-object v0

    return-object v0
.end method

.method public static uncompressLongArray([BII)[J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 759
    invoke-static {p0, p1, p2}, Lorg/xerial/snappy/Snappy;->uncompressedLength([BII)I

    move-result v0

    .line 760
    div-int/lit8 v0, v0, 0x8

    new-array v4, v0, [J

    .line 761
    sget-object v0, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;

    const/4 v5, 0x0

    move-object v1, p0

    move v2, p1

    move v3, p2

    invoke-virtual/range {v0 .. v5}, Lorg/xerial/snappy/SnappyNative;->rawUncompress(Ljava/lang/Object;IILjava/lang/Object;I)I

    .line 762
    return-object v4
.end method

.method public static uncompressShortArray([B)[S
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 775
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lorg/xerial/snappy/Snappy;->uncompressShortArray([BII)[S

    move-result-object v0

    return-object v0
.end method

.method public static uncompressShortArray([BII)[S
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 790
    invoke-static {p0, p1, p2}, Lorg/xerial/snappy/Snappy;->uncompressedLength([BII)I

    move-result v0

    .line 791
    div-int/lit8 v0, v0, 0x2

    new-array v4, v0, [S

    .line 792
    sget-object v0, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;

    const/4 v5, 0x0

    move-object v1, p0

    move v2, p1

    move v3, p2

    invoke-virtual/range {v0 .. v5}, Lorg/xerial/snappy/SnappyNative;->rawUncompress(Ljava/lang/Object;IILjava/lang/Object;I)I

    .line 793
    return-object v4
.end method

.method public static uncompressString([B)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 807
    :try_start_0
    const-string v0, "UTF-8"

    invoke-static {p0, v0}, Lorg/xerial/snappy/Snappy;->uncompressString([BLjava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    .line 809
    :catch_0
    move-exception v0

    .line 810
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "UTF-8 decoder is not found"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static uncompressString([BII)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 827
    :try_start_0
    const-string v0, "UTF-8"

    invoke-static {p0, p1, p2, v0}, Lorg/xerial/snappy/Snappy;->uncompressString([BIILjava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    .line 829
    :catch_0
    move-exception v0

    .line 830
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "UTF-8 decoder is not found"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static uncompressString([BIILjava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 849
    invoke-static {p0, p1, p2}, Lorg/xerial/snappy/Snappy;->uncompressedLength([BII)I

    move-result v0

    new-array v0, v0, [B

    .line 850
    const/4 v1, 0x0

    invoke-static {p0, p1, p2, v0, v1}, Lorg/xerial/snappy/Snappy;->uncompress([BII[BI)I

    .line 851
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0, p3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v1
.end method

.method public static uncompressString([BIILjava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 869
    invoke-static {p0, p1, p2}, Lorg/xerial/snappy/Snappy;->uncompressedLength([BII)I

    move-result v0

    new-array v0, v0, [B

    .line 870
    const/4 v1, 0x0

    invoke-static {p0, p1, p2, v0, v1}, Lorg/xerial/snappy/Snappy;->uncompress([BII[BI)I

    .line 871
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0, p3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v1
.end method

.method public static uncompressString([BLjava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 887
    invoke-static {p0}, Lorg/xerial/snappy/Snappy;->uncompress([B)[B

    move-result-object v0

    .line 888
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v1
.end method

.method public static uncompressString([BLjava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 903
    invoke-static {p0}, Lorg/xerial/snappy/Snappy;->uncompress([B)[B

    move-result-object v0

    .line 904
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0, p1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v1
.end method

.method public static uncompressedLength(Ljava/nio/ByteBuffer;)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 650
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v0

    if-nez v0, :cond_0

    .line 651
    new-instance v0, Lorg/xerial/snappy/SnappyError;

    sget-object v1, Lorg/xerial/snappy/SnappyErrorCode;->NOT_A_DIRECT_BUFFER:Lorg/xerial/snappy/SnappyErrorCode;

    const-string v2, "input is not a direct buffer"

    invoke-direct {v0, v1, v2}, Lorg/xerial/snappy/SnappyError;-><init>(Lorg/xerial/snappy/SnappyErrorCode;Ljava/lang/String;)V

    throw v0

    .line 654
    :cond_0
    sget-object v0, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-virtual {v0, p0, v1, v2}, Lorg/xerial/snappy/SnappyNative;->uncompressedLength(Ljava/nio/ByteBuffer;II)I

    move-result v0

    return v0
.end method

.method public static uncompressedLength([B)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 613
    sget-object v0, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;

    const/4 v1, 0x0

    array-length v2, p0

    invoke-virtual {v0, p0, v1, v2}, Lorg/xerial/snappy/SnappyNative;->uncompressedLength(Ljava/lang/Object;II)I

    move-result v0

    return v0
.end method

.method public static uncompressedLength([BII)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 630
    if-nez p0, :cond_0

    .line 631
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "input is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 634
    :cond_0
    sget-object v0, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;

    invoke-virtual {v0, p0, p1, p2}, Lorg/xerial/snappy/SnappyNative;->uncompressedLength(Ljava/lang/Object;II)I

    move-result v0

    return v0
.end method

.method public static uncompressedLength(JJ)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 669
    sget-object v0, Lorg/xerial/snappy/Snappy;->impl:Lorg/xerial/snappy/SnappyNative;

    invoke-virtual {v0, p0, p1, p2, p3}, Lorg/xerial/snappy/SnappyNative;->uncompressedLength(JJ)J

    move-result-wide v0

    return-wide v0
.end method
