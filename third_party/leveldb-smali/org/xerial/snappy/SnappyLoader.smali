.class public Lorg/xerial/snappy/SnappyLoader;
.super Ljava/lang/Object;
.source "SnappyLoader.java"


# static fields
.field public static final KEY_SNAPPY_DISABLE_BUNDLED_LIBS:Ljava/lang/String; = "org.xerial.snappy.disable.bundled.libs"

.field public static final KEY_SNAPPY_LIB_NAME:Ljava/lang/String; = "org.xerial.snappy.lib.name"

.field public static final KEY_SNAPPY_LIB_PATH:Ljava/lang/String; = "org.xerial.snappy.lib.path"

.field public static final KEY_SNAPPY_TEMPDIR:Ljava/lang/String; = "org.xerial.snappy.tempdir"

.field public static final KEY_SNAPPY_USE_SYSTEMLIB:Ljava/lang/String; = "org.xerial.snappy.use.systemlib"

.field public static final SNAPPY_SYSTEM_PROPERTIES_FILE:Ljava/lang/String; = "org-xerial-snappy.properties"

.field private static volatile api:Lorg/xerial/snappy/SnappyNative;

.field private static volatile isLoaded:Z

.field private static nativeLibFile:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 82
    const/4 v0, 0x0

    sput-boolean v0, Lorg/xerial/snappy/SnappyLoader;->isLoaded:Z

    .line 83
    sput-object v1, Lorg/xerial/snappy/SnappyLoader;->api:Lorg/xerial/snappy/SnappyNative;

    .line 85
    sput-object v1, Lorg/xerial/snappy/SnappyLoader;->nativeLibFile:Ljava/io/File;

    .line 142
    invoke-static {}, Lorg/xerial/snappy/SnappyLoader;->loadSnappySystemProperties()V

    .line 143
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static cleanUpExtractedNativeLib()V
    .locals 1

    .prologue
    .line 89
    sget-object v0, Lorg/xerial/snappy/SnappyLoader;->nativeLibFile:Ljava/io/File;

    if-eqz v0, :cond_0

    sget-object v0, Lorg/xerial/snappy/SnappyLoader;->nativeLibFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 90
    sget-object v0, Lorg/xerial/snappy/SnappyLoader;->nativeLibFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    .line 91
    if-nez v0, :cond_0

    .line 95
    :cond_0
    return-void
.end method

.method private static contentsEquals(Ljava/io/InputStream;Ljava/io/InputStream;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    const/4 v3, -0x1

    .line 185
    instance-of v0, p0, Ljava/io/BufferedInputStream;

    if-nez v0, :cond_0

    .line 186
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, p0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    move-object p0, v0

    .line 188
    :cond_0
    instance-of v0, p1, Ljava/io/BufferedInputStream;

    if-nez v0, :cond_1

    .line 189
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    move-object p1, v0

    .line 192
    :cond_1
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 193
    :goto_0
    if-eq v0, v3, :cond_3

    .line 194
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v2

    .line 195
    if-eq v0, v2, :cond_2

    .line 201
    :goto_1
    return v1

    .line 198
    :cond_2
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    goto :goto_0

    .line 200
    :cond_3
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 201
    if-ne v0, v3, :cond_4

    const/4 v0, 0x1

    :goto_2
    move v1, v0

    goto :goto_1

    :cond_4
    move v0, v1

    goto :goto_2
.end method

.method private static extractLibraryFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 11

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v0, 0x1

    .line 214
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 217
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    .line 218
    const-string v4, "snappy-%s-%s-%s"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {}, Lorg/xerial/snappy/SnappyLoader;->getVersion()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v1

    aput-object v3, v6, v0

    const/4 v3, 0x2

    aput-object p1, v6, v3

    invoke-static {v4, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 219
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, p2, v6}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    :try_start_0
    const-class v3, Lorg/xerial/snappy/SnappyLoader;

    invoke-virtual {v3, v5}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    move-result-object v4

    .line 228
    :try_start_1
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_6

    .line 230
    const/16 v8, 0x2000

    :try_start_2
    new-array v8, v8, [B

    .line 232
    :goto_0
    invoke-virtual {v4, v8}, Ljava/io/InputStream;->read([B)I

    move-result v9

    const/4 v10, -0x1

    if-eq v9, v10, :cond_2

    .line 233
    const/4 v10, 0x0

    invoke-virtual {v3, v8, v10, v9}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 237
    :catchall_0
    move-exception v0

    move-object v1, v3

    :goto_1
    if-eqz v1, :cond_0

    .line 238
    :try_start_3
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    :cond_0
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 243
    :catchall_1
    move-exception v0

    move-object v1, v4

    :goto_2
    if-eqz v1, :cond_1

    .line 244
    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 248
    :cond_1
    invoke-virtual {v7}, Ljava/io/File;->deleteOnExit()V

    throw v0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 283
    :catch_0
    move-exception v0

    .line 284
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, v1}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V

    move-object v0, v2

    .line 285
    :goto_3
    return-object v0

    .line 237
    :cond_2
    if-eqz v3, :cond_3

    .line 238
    :try_start_5
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 243
    :cond_3
    if-eqz v4, :cond_4

    .line 244
    :try_start_6
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 248
    :cond_4
    invoke-virtual {v7}, Ljava/io/File;->deleteOnExit()V

    .line 252
    const/4 v3, 0x1

    invoke-virtual {v7, v3}, Ljava/io/File;->setReadable(Z)Z

    move-result v3

    if-eqz v3, :cond_8

    const/4 v3, 0x1

    const/4 v4, 0x1

    .line 253
    invoke-virtual {v7, v3, v4}, Ljava/io/File;->setWritable(ZZ)Z

    move-result v3

    if-eqz v3, :cond_8

    const/4 v3, 0x1

    .line 254
    invoke-virtual {v7, v3}, Ljava/io/File;->setExecutable(Z)Z
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    move-result v3

    if-eqz v3, :cond_8

    .line 255
    :goto_4
    if-nez v0, :cond_5

    .line 264
    :cond_5
    :try_start_7
    const-class v0, Lorg/xerial/snappy/SnappyLoader;

    invoke-virtual {v0, v5}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    move-result-object v3

    .line 265
    :try_start_8
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, v7}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 267
    :try_start_9
    invoke-static {v3, v1}, Lorg/xerial/snappy/SnappyLoader;->contentsEquals(Ljava/io/InputStream;Ljava/io/InputStream;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 268
    new-instance v0, Lorg/xerial/snappy/SnappyError;

    sget-object v4, Lorg/xerial/snappy/SnappyErrorCode;->FAILED_TO_LOAD_NATIVE_LIBRARY:Lorg/xerial/snappy/SnappyErrorCode;

    const-string v5, "Failed to write a native library file at %s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v4, v5}, Lorg/xerial/snappy/SnappyError;-><init>(Lorg/xerial/snappy/SnappyErrorCode;Ljava/lang/String;)V

    throw v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 272
    :catchall_2
    move-exception v0

    :goto_5
    if-eqz v3, :cond_6

    .line 273
    :try_start_a
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 275
    :cond_6
    if-eqz v1, :cond_7

    .line 276
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    :cond_7
    throw v0

    :cond_8
    move v0, v1

    .line 254
    goto :goto_4

    .line 272
    :cond_9
    if-eqz v3, :cond_a

    .line 273
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 275
    :cond_a
    if-eqz v1, :cond_b

    .line 276
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 281
    :cond_b
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2, v6}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_0

    goto :goto_3

    .line 272
    :catchall_3
    move-exception v0

    move-object v1, v2

    move-object v3, v2

    goto :goto_5

    :catchall_4
    move-exception v0

    move-object v1, v2

    goto :goto_5

    .line 243
    :catchall_5
    move-exception v0

    move-object v1, v2

    goto/16 :goto_2

    .line 237
    :catchall_6
    move-exception v0

    move-object v1, v2

    goto/16 :goto_1
.end method

.method static findNativeLibrary()Ljava/io/File;
    .locals 7

    .prologue
    const/4 v1, 0x1

    .line 292
    const-string v0, "org.xerial.snappy.use.systemlib"

    const-string v2, "false"

    invoke-static {v0, v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    .line 293
    const-string v2, "org.xerial.snappy.disable.bundled.libs"

    const-string v3, "false"

    .line 294
    invoke-static {v2, v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v2

    .line 295
    if-nez v0, :cond_0

    if-eqz v2, :cond_2

    .line 296
    :cond_0
    const/4 v0, 0x0

    .line 344
    :cond_1
    :goto_0
    return-object v0

    .line 300
    :cond_2
    const-string v0, "org.xerial.snappy.lib.path"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 301
    const-string v0, "org.xerial.snappy.lib.name"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 304
    if-nez v3, :cond_3

    .line 305
    const-string v0, "snappyjava"

    invoke-static {v0}, Ljava/lang/System;->mapLibraryName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 308
    :cond_3
    if-eqz v2, :cond_4

    .line 309
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 310
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 316
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/org/xerial/snappy/native/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lorg/xerial/snappy/OSInfo;->getNativeLibFolderPathForCurrentOS()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 317
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/xerial/snappy/SnappyLoader;->hasResource(Ljava/lang/String;)Z

    move-result v0

    .line 318
    if-nez v0, :cond_7

    .line 319
    invoke-static {}, Lorg/xerial/snappy/OSInfo;->getOSName()Ljava/lang/String;

    move-result-object v2

    const-string v5, "Mac"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 321
    const-string v2, "libsnappyjava.jnilib"

    .line 322
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/xerial/snappy/SnappyLoader;->hasResource(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7

    move v0, v1

    .line 329
    :goto_1
    if-nez v0, :cond_5

    .line 330
    const-string v0, "no native library is found for os.name=%s and os.arch=%s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {}, Lorg/xerial/snappy/OSInfo;->getOSName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {}, Lorg/xerial/snappy/OSInfo;->getArchName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 331
    new-instance v1, Lorg/xerial/snappy/SnappyError;

    sget-object v2, Lorg/xerial/snappy/SnappyErrorCode;->FAILED_TO_LOAD_NATIVE_LIBRARY:Lorg/xerial/snappy/SnappyErrorCode;

    invoke-direct {v1, v2, v0}, Lorg/xerial/snappy/SnappyError;-><init>(Lorg/xerial/snappy/SnappyErrorCode;Ljava/lang/String;)V

    throw v1

    .line 335
    :cond_5
    new-instance v0, Ljava/io/File;

    const-string v1, "org.xerial.snappy.tempdir"

    const-string v3, "java.io.tmpdir"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 336
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_6

    .line 337
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    .line 338
    if-nez v1, :cond_6

    .line 344
    :cond_6
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v2, v0}, Lorg/xerial/snappy/SnappyLoader;->extractLibraryFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    goto/16 :goto_0

    :cond_7
    move-object v2, v3

    goto :goto_1
.end method

.method public static getVersion()Ljava/lang/String;
    .locals 5

    .prologue
    .line 362
    const-class v0, Lorg/xerial/snappy/SnappyLoader;

    const-string v1, "/META-INF/maven/org.xerial.snappy/snappy-java/pom.properties"

    .line 363
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 364
    if-nez v0, :cond_0

    .line 365
    const-class v0, Lorg/xerial/snappy/SnappyLoader;

    const-string v1, "/org/xerial/snappy/VERSION"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 368
    :cond_0
    const-string v1, "unknown"

    .line 370
    if-eqz v0, :cond_2

    .line 371
    :try_start_0
    new-instance v2, Ljava/util/Properties;

    invoke-direct {v2}, Ljava/util/Properties;-><init>()V

    .line 372
    invoke-virtual {v0}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 373
    const-string v0, "version"

    invoke-virtual {v2, v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 374
    const-string v0, "unknown"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 375
    const-string v0, "VERSION"

    invoke-virtual {v2, v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 377
    :cond_1
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v2, "[^0-9M\\.]"

    const-string v3, ""

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 383
    :goto_0
    return-object v0

    .line 380
    :catch_0
    move-exception v0

    move-object v4, v0

    move-object v0, v1

    move-object v1, v4

    .line 381
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v2, v1}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    move-object v0, v1

    goto :goto_0
.end method

.method private static hasResource(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 349
    const-class v0, Lorg/xerial/snappy/SnappyLoader;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static declared-synchronized load()Lorg/xerial/snappy/SnappyNative;
    .locals 4

    .prologue
    .line 147
    const-class v1, Lorg/xerial/snappy/SnappyLoader;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/xerial/snappy/SnappyLoader;->api:Lorg/xerial/snappy/SnappyNative;

    if-eqz v0, :cond_0

    .line 148
    sget-object v0, Lorg/xerial/snappy/SnappyLoader;->api:Lorg/xerial/snappy/SnappyNative;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 162
    :goto_0
    monitor-exit v1

    return-object v0

    .line 152
    :cond_0
    :try_start_1
    invoke-static {}, Lorg/xerial/snappy/SnappyLoader;->loadNativeLibrary()V

    .line 154
    new-instance v0, Lorg/xerial/snappy/SnappyNative;

    invoke-direct {v0}, Lorg/xerial/snappy/SnappyNative;-><init>()V

    invoke-static {v0}, Lorg/xerial/snappy/SnappyLoader;->setApi(Lorg/xerial/snappy/SnappyNative;)V

    .line 155
    const/4 v0, 0x1

    sput-boolean v0, Lorg/xerial/snappy/SnappyLoader;->isLoaded:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 162
    :try_start_2
    sget-object v0, Lorg/xerial/snappy/SnappyLoader;->api:Lorg/xerial/snappy/SnappyNative;

    goto :goto_0

    .line 157
    :catch_0
    move-exception v0

    .line 158
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 159
    new-instance v2, Lorg/xerial/snappy/SnappyError;

    sget-object v3, Lorg/xerial/snappy/SnappyErrorCode;->FAILED_TO_LOAD_NATIVE_LIBRARY:Lorg/xerial/snappy/SnappyErrorCode;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v3, v0}, Lorg/xerial/snappy/SnappyError;-><init>(Lorg/xerial/snappy/SnappyErrorCode;Ljava/lang/String;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 147
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static loadNativeLibrary()V
    .locals 1

    .prologue
    .line 171
    invoke-static {}, Lorg/xerial/snappy/SnappyLoader;->findNativeLibrary()Ljava/io/File;

    move-result-object v0

    sput-object v0, Lorg/xerial/snappy/SnappyLoader;->nativeLibFile:Ljava/io/File;

    .line 172
    sget-object v0, Lorg/xerial/snappy/SnappyLoader;->nativeLibFile:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 174
    sget-object v0, Lorg/xerial/snappy/SnappyLoader;->nativeLibFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/System;->load(Ljava/lang/String;)V

    .line 180
    :goto_0
    return-void

    .line 178
    :cond_0
    const-string v0, "snappyjava"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static loadSnappySystemProperties()V
    .locals 4

    .prologue
    .line 114
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    const-string v1, "org-xerial-snappy.properties"

    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 117
    if-nez v0, :cond_1

    .line 139
    :cond_0
    :goto_0
    return-void

    .line 122
    :cond_1
    new-instance v1, Ljava/util/Properties;

    invoke-direct {v1}, Ljava/util/Properties;-><init>()V

    .line 123
    invoke-virtual {v1, v0}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 124
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 125
    invoke-virtual {v1}, Ljava/util/Properties;->propertyNames()Ljava/util/Enumeration;

    move-result-object v2

    .line 126
    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 127
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 128
    const-string v3, "org.xerial.snappy."

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 129
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_2

    .line 130
    invoke-virtual {v1, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 135
    :catch_0
    move-exception v0

    .line 136
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not load \'org-xerial-snappy.properties\' from classpath: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 137
    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 136
    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method static declared-synchronized setApi(Lorg/xerial/snappy/SnappyNative;)V
    .locals 2

    .prologue
    .line 104
    const-class v0, Lorg/xerial/snappy/SnappyLoader;

    monitor-enter v0

    :try_start_0
    sput-object p0, Lorg/xerial/snappy/SnappyLoader;->api:Lorg/xerial/snappy/SnappyNative;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 105
    monitor-exit v0

    return-void

    .line 104
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method
