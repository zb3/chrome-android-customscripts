.class public final Lorg/iq80/leveldb/impl/Logs;
.super Ljava/lang/Object;
.source "Logs.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method

.method public static createLogWriter(Ljava/io/File;J)Lorg/iq80/leveldb/impl/LogWriter;
    .locals 1
    .param p0, "file"    # Ljava/io/File;
    .param p1, "fileNumber"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 35
    sget-boolean v0, Lorg/iq80/leveldb/impl/Iq80DBFactory;->USE_MMAP:Z

    if-eqz v0, :cond_0

    .line 36
    new-instance v0, Lorg/iq80/leveldb/impl/MMapLogWriter;

    invoke-direct {v0, p0, p1, p2}, Lorg/iq80/leveldb/impl/MMapLogWriter;-><init>(Ljava/io/File;J)V

    .line 39
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;

    invoke-direct {v0, p0, p1, p2}, Lorg/iq80/leveldb/impl/FileChannelLogWriter;-><init>(Ljava/io/File;J)V

    goto :goto_0
.end method

.method public static getChunkChecksum(ILorg/iq80/leveldb/util/Slice;)I
    .locals 3
    .param p0, "chunkTypeId"    # I
    .param p1, "slice"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 45
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->getRawArray()[B

    move-result-object v0

    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->getRawOffset()I

    move-result v1

    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v2

    invoke-static {p0, v0, v1, v2}, Lorg/iq80/leveldb/impl/Logs;->getChunkChecksum(I[BII)I

    move-result v0

    return v0
.end method

.method public static getChunkChecksum(I[BII)I
    .locals 2
    .param p0, "chunkTypeId"    # I
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 51
    new-instance v0, Lorg/iq80/leveldb/util/PureJavaCrc32C;

    invoke-direct {v0}, Lorg/iq80/leveldb/util/PureJavaCrc32C;-><init>()V

    .line 52
    .local v0, "crc32C":Lorg/iq80/leveldb/util/PureJavaCrc32C;
    invoke-virtual {v0, p0}, Lorg/iq80/leveldb/util/PureJavaCrc32C;->update(I)V

    .line 53
    invoke-virtual {v0, p1, p2, p3}, Lorg/iq80/leveldb/util/PureJavaCrc32C;->update([BII)V

    .line 54
    invoke-virtual {v0}, Lorg/iq80/leveldb/util/PureJavaCrc32C;->getMaskedValue()I

    move-result v1

    return v1
.end method
