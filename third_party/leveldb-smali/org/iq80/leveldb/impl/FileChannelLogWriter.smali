.class public Lorg/iq80/leveldb/impl/FileChannelLogWriter;
.super Ljava/lang/Object;
.source "FileChannelLogWriter.java"

# interfaces
.implements Lorg/iq80/leveldb/impl/LogWriter;


# instance fields
.field private blockOffset:I

.field private final closed:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final file:Ljava/io/File;

.field private final fileChannel:Ljava/nio/channels/FileChannel;

.field private final fileNumber:J


# direct methods
.method public constructor <init>(Ljava/io/File;J)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;
    .param p2, "fileNumber"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 54
    const-string v0, "file is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    const-string v1, "fileNumber is negative"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 57
    iput-object p1, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->file:Ljava/io/File;

    .line 58
    iput-wide p2, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->fileNumber:J

    .line 59
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->fileChannel:Ljava/nio/channels/FileChannel;

    .line 60
    return-void

    .line 55
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private newLogRecordHeader(Lorg/iq80/leveldb/impl/LogChunkType;Lorg/iq80/leveldb/util/Slice;I)Lorg/iq80/leveldb/util/Slice;
    .locals 5
    .param p1, "type"    # Lorg/iq80/leveldb/impl/LogChunkType;
    .param p2, "slice"    # Lorg/iq80/leveldb/util/Slice;
    .param p3, "length"    # I

    .prologue
    .line 200
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/LogChunkType;->getPersistentId()I

    move-result v2

    invoke-virtual {p2}, Lorg/iq80/leveldb/util/Slice;->getRawArray()[B

    move-result-object v3

    invoke-virtual {p2}, Lorg/iq80/leveldb/util/Slice;->getRawOffset()I

    move-result v4

    invoke-static {v2, v3, v4, p3}, Lorg/iq80/leveldb/impl/Logs;->getChunkChecksum(I[BII)I

    move-result v0

    .line 203
    .local v0, "crc":I
    const/4 v2, 0x7

    invoke-static {v2}, Lorg/iq80/leveldb/util/Slices;->allocate(I)Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    invoke-virtual {v2}, Lorg/iq80/leveldb/util/Slice;->output()Lorg/iq80/leveldb/util/SliceOutput;

    move-result-object v1

    .line 204
    .local v1, "header":Lorg/iq80/leveldb/util/SliceOutput;
    invoke-virtual {v1, v0}, Lorg/iq80/leveldb/util/SliceOutput;->writeInt(I)V

    .line 205
    and-int/lit16 v2, p3, 0xff

    int-to-byte v2, v2

    invoke-virtual {v1, v2}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 206
    ushr-int/lit8 v2, p3, 0x8

    int-to-byte v2, v2

    invoke-virtual {v1, v2}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 207
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/LogChunkType;->getPersistentId()I

    move-result v2

    int-to-byte v2, v2

    invoke-virtual {v1, v2}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 209
    invoke-virtual {v1}, Lorg/iq80/leveldb/util/SliceOutput;->slice()Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    return-object v2
.end method

.method private writeChunk(Lorg/iq80/leveldb/impl/LogChunkType;Lorg/iq80/leveldb/util/Slice;)V
    .locals 7
    .param p1, "type"    # Lorg/iq80/leveldb/impl/LogChunkType;
    .param p2, "slice"    # Lorg/iq80/leveldb/util/Slice;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 185
    invoke-virtual {p2}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v1

    const v4, 0xffff

    if-gt v1, v4, :cond_0

    move v1, v2

    :goto_0
    const-string v4, "length %s is larger than two bytes"

    new-array v5, v2, [Ljava/lang/Object;

    invoke-virtual {p2}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v3

    invoke-static {v1, v4, v5}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 186
    iget v1, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->blockOffset:I

    add-int/lit8 v1, v1, 0x7

    const v4, 0x8000

    if-gt v1, v4, :cond_1

    :goto_1
    invoke-static {v2}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 189
    invoke-virtual {p2}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v1

    invoke-direct {p0, p1, p2, v1}, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->newLogRecordHeader(Lorg/iq80/leveldb/impl/LogChunkType;Lorg/iq80/leveldb/util/Slice;I)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    .line 192
    .local v0, "header":Lorg/iq80/leveldb/util/Slice;
    iget-object v1, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->fileChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v2

    invoke-virtual {v0, v3, v1, v2}, Lorg/iq80/leveldb/util/Slice;->getBytes(ILjava/nio/channels/GatheringByteChannel;I)I

    .line 193
    iget-object v1, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->fileChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {p2}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v2

    invoke-virtual {p2, v3, v1, v2}, Lorg/iq80/leveldb/util/Slice;->getBytes(ILjava/nio/channels/GatheringByteChannel;I)I

    .line 195
    iget v1, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->blockOffset:I

    invoke-virtual {p2}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x7

    add-int/2addr v1, v2

    iput v1, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->blockOffset:I

    .line 196
    return-void

    .end local v0    # "header":Lorg/iq80/leveldb/util/Slice;
    :cond_0
    move v1, v3

    .line 185
    goto :goto_0

    :cond_1
    move v2, v3

    .line 186
    goto :goto_1
.end method


# virtual methods
.method public declared-synchronized addRecord(Lorg/iq80/leveldb/util/Slice;Z)V
    .locals 12
    .param p1, "record"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "force"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const v11, 0x8000

    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 113
    monitor-enter p0

    :try_start_0
    iget-object v7, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v7

    if-nez v7, :cond_4

    move v7, v8

    :goto_0
    const-string v10, "Log has been closed"

    invoke-static {v7, v10}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 115
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->input()Lorg/iq80/leveldb/util/SliceInput;

    move-result-object v5

    .line 118
    .local v5, "sliceInput":Lorg/iq80/leveldb/util/SliceInput;
    const/4 v0, 0x1

    .line 124
    .local v0, "begin":Z
    :cond_0
    iget v7, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->blockOffset:I

    sub-int v2, v11, v7

    .line 125
    .local v2, "bytesRemainingInBlock":I
    if-ltz v2, :cond_5

    move v7, v8

    :goto_1
    invoke-static {v7}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 128
    const/4 v7, 0x7

    if-ge v2, v7, :cond_2

    .line 129
    if-lez v2, :cond_1

    .line 132
    iget-object v7, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->fileChannel:Ljava/nio/channels/FileChannel;

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/nio/channels/FileChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 134
    :cond_1
    const/4 v7, 0x0

    iput v7, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->blockOffset:I

    .line 135
    iget v7, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->blockOffset:I

    sub-int v2, v11, v7

    .line 139
    :cond_2
    add-int/lit8 v1, v2, -0x7

    .line 140
    .local v1, "bytesAvailableInBlock":I
    if-ltz v1, :cond_6

    move v7, v8

    :goto_2
    invoke-static {v7}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 146
    invoke-virtual {v5}, Lorg/iq80/leveldb/util/SliceInput;->available()I

    move-result v7

    if-le v7, v1, :cond_7

    .line 147
    const/4 v3, 0x0

    .line 148
    .local v3, "end":Z
    move v4, v1

    .line 157
    .local v4, "fragmentLength":I
    :goto_3
    if-eqz v0, :cond_8

    if-eqz v3, :cond_8

    .line 158
    sget-object v6, Lorg/iq80/leveldb/impl/LogChunkType;->FULL:Lorg/iq80/leveldb/impl/LogChunkType;

    .line 171
    .local v6, "type":Lorg/iq80/leveldb/impl/LogChunkType;
    :goto_4
    invoke-virtual {v5, v4}, Lorg/iq80/leveldb/util/SliceInput;->readSlice(I)Lorg/iq80/leveldb/util/Slice;

    move-result-object v7

    invoke-direct {p0, v6, v7}, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->writeChunk(Lorg/iq80/leveldb/impl/LogChunkType;Lorg/iq80/leveldb/util/Slice;)V

    .line 174
    const/4 v0, 0x0

    .line 175
    invoke-virtual {v5}, Lorg/iq80/leveldb/util/SliceInput;->isReadable()Z

    move-result v7

    if-nez v7, :cond_0

    .line 177
    if-eqz p2, :cond_3

    .line 178
    iget-object v7, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->fileChannel:Ljava/nio/channels/FileChannel;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljava/nio/channels/FileChannel;->force(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 180
    :cond_3
    monitor-exit p0

    return-void

    .end local v0    # "begin":Z
    .end local v1    # "bytesAvailableInBlock":I
    .end local v2    # "bytesRemainingInBlock":I
    .end local v3    # "end":Z
    .end local v4    # "fragmentLength":I
    .end local v5    # "sliceInput":Lorg/iq80/leveldb/util/SliceInput;
    .end local v6    # "type":Lorg/iq80/leveldb/impl/LogChunkType;
    :cond_4
    move v7, v9

    .line 113
    goto :goto_0

    .restart local v0    # "begin":Z
    .restart local v2    # "bytesRemainingInBlock":I
    .restart local v5    # "sliceInput":Lorg/iq80/leveldb/util/SliceInput;
    :cond_5
    move v7, v9

    .line 125
    goto :goto_1

    .restart local v1    # "bytesAvailableInBlock":I
    :cond_6
    move v7, v9

    .line 140
    goto :goto_2

    .line 151
    :cond_7
    const/4 v3, 0x1

    .line 152
    .restart local v3    # "end":Z
    :try_start_1
    invoke-virtual {v5}, Lorg/iq80/leveldb/util/SliceInput;->available()I

    move-result v4

    .restart local v4    # "fragmentLength":I
    goto :goto_3

    .line 160
    :cond_8
    if-eqz v0, :cond_9

    .line 161
    sget-object v6, Lorg/iq80/leveldb/impl/LogChunkType;->FIRST:Lorg/iq80/leveldb/impl/LogChunkType;

    .restart local v6    # "type":Lorg/iq80/leveldb/impl/LogChunkType;
    goto :goto_4

    .line 163
    .end local v6    # "type":Lorg/iq80/leveldb/impl/LogChunkType;
    :cond_9
    if-eqz v3, :cond_a

    .line 164
    sget-object v6, Lorg/iq80/leveldb/impl/LogChunkType;->LAST:Lorg/iq80/leveldb/impl/LogChunkType;

    .restart local v6    # "type":Lorg/iq80/leveldb/impl/LogChunkType;
    goto :goto_4

    .line 167
    .end local v6    # "type":Lorg/iq80/leveldb/impl/LogChunkType;
    :cond_a
    sget-object v6, Lorg/iq80/leveldb/impl/LogChunkType;->MIDDLE:Lorg/iq80/leveldb/impl/LogChunkType;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .restart local v6    # "type":Lorg/iq80/leveldb/impl/LogChunkType;
    goto :goto_4

    .line 113
    .end local v0    # "begin":Z
    .end local v1    # "bytesAvailableInBlock":I
    .end local v2    # "bytesRemainingInBlock":I
    .end local v3    # "end":Z
    .end local v4    # "fragmentLength":I
    .end local v5    # "sliceInput":Lorg/iq80/leveldb/util/SliceInput;
    .end local v6    # "type":Lorg/iq80/leveldb/impl/LogChunkType;
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7
.end method

.method public declared-synchronized close()V
    .locals 2

    .prologue
    .line 71
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    :try_start_1
    iget-object v0, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->fileChannel:Ljava/nio/channels/FileChannel;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/nio/channels/FileChannel;->force(Z)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 81
    :goto_0
    :try_start_2
    iget-object v0, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->fileChannel:Ljava/nio/channels/FileChannel;

    invoke-static {v0}, Lorg/iq80/leveldb/util/Closeables;->closeQuietly(Ljava/io/Closeable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 82
    monitor-exit p0

    return-void

    .line 71
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 77
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public declared-synchronized delete()V
    .locals 2

    .prologue
    .line 87
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 90
    iget-object v0, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->fileChannel:Ljava/nio/channels/FileChannel;

    invoke-static {v0}, Lorg/iq80/leveldb/util/Closeables;->closeQuietly(Ljava/io/Closeable;)V

    .line 93
    iget-object v0, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    monitor-exit p0

    return-void

    .line 87
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->file:Ljava/io/File;

    return-object v0
.end method

.method public getFileNumber()J
    .locals 2

    .prologue
    .line 105
    iget-wide v0, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->fileNumber:J

    return-wide v0
.end method

.method public isClosed()Z
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lorg/iq80/leveldb/impl/FileChannelLogWriter;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method
