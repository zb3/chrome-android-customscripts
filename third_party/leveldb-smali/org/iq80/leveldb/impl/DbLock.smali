.class public Lorg/iq80/leveldb/impl/DbLock;
.super Ljava/lang/Object;
.source "DbLock.java"


# instance fields
.field private final channel:Ljava/nio/channels/FileChannel;

.field private final lock:Ljava/nio/channels/FileLock;

.field private final lockFile:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 6
    .param p1, "lockFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const-string v1, "lockFile is null"

    invoke-static {p1, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    iput-object p1, p0, Lorg/iq80/leveldb/impl/DbLock;->lockFile:Ljava/io/File;

    .line 45
    new-instance v1, Ljava/io/RandomAccessFile;

    const-string v2, "rw"

    invoke-direct {v1, p1, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    iput-object v1, p0, Lorg/iq80/leveldb/impl/DbLock;->channel:Ljava/nio/channels/FileChannel;

    .line 47
    :try_start_0
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbLock;->channel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->tryLock()Ljava/nio/channels/FileLock;

    move-result-object v1

    iput-object v1, p0, Lorg/iq80/leveldb/impl/DbLock;->lock:Ljava/nio/channels/FileLock;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbLock;->lock:Ljava/nio/channels/FileLock;

    if-nez v1, :cond_0

    .line 55
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Unable to acquire lock on \'%s\'"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 49
    :catch_0
    move-exception v0

    .line 50
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbLock;->channel:Ljava/nio/channels/FileChannel;

    invoke-static {v1}, Lorg/iq80/leveldb/util/Closeables;->closeQuietly(Ljava/io/Closeable;)V

    .line 51
    throw v0

    .line 57
    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
    return-void
.end method


# virtual methods
.method public isValid()Z
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbLock;->lock:Ljava/nio/channels/FileLock;

    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->isValid()Z

    move-result v0

    return v0
.end method

.method public release()V
    .locals 3

    .prologue
    .line 67
    :try_start_0
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbLock;->lock:Ljava/nio/channels/FileLock;

    invoke-virtual {v1}, Ljava/nio/channels/FileLock;->release()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbLock;->channel:Ljava/nio/channels/FileChannel;

    invoke-static {v1}, Lorg/iq80/leveldb/util/Closeables;->closeQuietly(Ljava/io/Closeable;)V

    .line 75
    :goto_0
    return-void

    .line 69
    :catch_0
    move-exception v0

    .line 70
    .local v0, "e":Ljava/io/IOException;
    :try_start_1
    invoke-static {v0}, Lcom/google/common/base/Throwables;->propagate(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 73
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbLock;->channel:Ljava/nio/channels/FileChannel;

    invoke-static {v1}, Lorg/iq80/leveldb/util/Closeables;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_0

    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/DbLock;->channel:Ljava/nio/channels/FileChannel;

    invoke-static {v2}, Lorg/iq80/leveldb/util/Closeables;->closeQuietly(Ljava/io/Closeable;)V

    .line 74
    throw v1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 80
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "DbLock"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    const-string v1, "{lockFile="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/DbLock;->lockFile:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 83
    const-string v1, ", lock="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/DbLock;->lock:Ljava/nio/channels/FileLock;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 84
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 85
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
