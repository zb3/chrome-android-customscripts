.class public Lorg/iq80/leveldb/impl/Iq80DBFactory;
.super Ljava/lang/Object;
.source "Iq80DBFactory.java"

# interfaces
.implements Lorg/iq80/leveldb/DBFactory;


# static fields
.field public static final CPU_DATA_MODEL:I

.field public static final USE_MMAP:Z

.field public static final VERSION:Ljava/lang/String;

.field public static final factory:Lorg/iq80/leveldb/impl/Iq80DBFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/16 v6, 0x20

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 42
    const-string v5, "os.name"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v7, "Windows"

    invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 43
    const-string v5, "ProgramFiles(x86)"

    invoke-static {v5}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_0

    move v1, v3

    .line 48
    .local v1, "is64bit":Z
    :goto_0
    if-eqz v1, :cond_2

    const/16 v5, 0x40

    :goto_1
    sput v5, Lorg/iq80/leveldb/impl/Iq80DBFactory;->CPU_DATA_MODEL:I

    .line 54
    const-string v5, "leveldb.mmap"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, ""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget v8, Lorg/iq80/leveldb/impl/Iq80DBFactory;->CPU_DATA_MODEL:I

    if-le v8, v6, :cond_3

    :goto_2
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v3

    sput-boolean v3, Lorg/iq80/leveldb/impl/Iq80DBFactory;->USE_MMAP:Z

    .line 59
    const-string v2, "unknown"

    .line 60
    .local v2, "v":Ljava/lang/String;
    const-class v3, Lorg/iq80/leveldb/impl/Iq80DBFactory;

    const-string v4, "version.txt"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 62
    .local v0, "is":Ljava/io/InputStream;
    :try_start_0
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    const-string v5, "UTF-8"

    invoke-direct {v4, v0, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 68
    :try_start_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2

    .line 73
    :goto_3
    sput-object v2, Lorg/iq80/leveldb/impl/Iq80DBFactory;->VERSION:Ljava/lang/String;

    .line 76
    new-instance v3, Lorg/iq80/leveldb/impl/Iq80DBFactory;

    invoke-direct {v3}, Lorg/iq80/leveldb/impl/Iq80DBFactory;-><init>()V

    sput-object v3, Lorg/iq80/leveldb/impl/Iq80DBFactory;->factory:Lorg/iq80/leveldb/impl/Iq80DBFactory;

    return-void

    .end local v0    # "is":Ljava/io/InputStream;
    .end local v1    # "is64bit":Z
    .end local v2    # "v":Ljava/lang/String;
    :cond_0
    move v1, v4

    .line 43
    goto :goto_0

    .line 46
    :cond_1
    const-string v5, "os.arch"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v7, "64"

    invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    .restart local v1    # "is64bit":Z
    goto :goto_0

    :cond_2
    move v5, v6

    .line 48
    goto :goto_1

    :cond_3
    move v3, v4

    .line 54
    goto :goto_2

    .line 64
    .restart local v0    # "is":Ljava/io/InputStream;
    .restart local v2    # "v":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 68
    :try_start_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_3

    .line 70
    :catch_1
    move-exception v3

    goto :goto_3

    .line 67
    :catchall_0
    move-exception v3

    .line 68
    :try_start_3
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_3

    .line 72
    :goto_4
    throw v3

    .line 70
    :catch_2
    move-exception v3

    goto :goto_3

    :catch_3
    move-exception v4

    goto :goto_4
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static asString([B)Ljava/lang/String;
    .locals 3
    .param p0, "value"    # [B

    .prologue
    .line 121
    if-nez p0, :cond_0

    .line 122
    const/4 v1, 0x0

    .line 125
    :goto_0
    return-object v1

    :cond_0
    :try_start_0
    new-instance v1, Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-direct {v1, p0, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 127
    :catch_0
    move-exception v0

    .line 128
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static bytes(Ljava/lang/String;)[B
    .locals 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 108
    if-nez p0, :cond_0

    .line 109
    const/4 v1, 0x0

    .line 112
    :goto_0
    return-object v1

    :cond_0
    :try_start_0
    const-string v1, "UTF-8"

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 114
    :catch_0
    move-exception v0

    .line 115
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public destroy(Ljava/io/File;Lorg/iq80/leveldb/Options;)V
    .locals 0
    .param p1, "path"    # Ljava/io/File;
    .param p2, "options"    # Lorg/iq80/leveldb/Options;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    invoke-static {p1}, Lorg/iq80/leveldb/util/FileUtils;->deleteRecursively(Ljava/io/File;)Z

    .line 91
    return-void
.end method

.method public open(Ljava/io/File;Lorg/iq80/leveldb/Options;)Lorg/iq80/leveldb/DB;
    .locals 1
    .param p1, "path"    # Ljava/io/File;
    .param p2, "options"    # Lorg/iq80/leveldb/Options;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    new-instance v0, Lorg/iq80/leveldb/impl/DbImpl;

    invoke-direct {v0, p2, p1}, Lorg/iq80/leveldb/impl/DbImpl;-><init>(Lorg/iq80/leveldb/Options;Ljava/io/File;)V

    return-object v0
.end method

.method public repair(Ljava/io/File;Lorg/iq80/leveldb/Options;)V
    .locals 1
    .param p1, "path"    # Ljava/io/File;
    .param p2, "options"    # Lorg/iq80/leveldb/Options;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 103
    const-string v0, "iq80 leveldb version %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    sget-object v3, Lorg/iq80/leveldb/impl/Iq80DBFactory;->VERSION:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
