.class public Lorg/iq80/leveldb/impl/MMapLogWriter;
.super Ljava/lang/Object;
.source "MMapLogWriter.java"

# interfaces
.implements Lorg/iq80/leveldb/impl/LogWriter;


# static fields
.field private static final PAGE_SIZE:I = 0x100000


# instance fields
.field private blockOffset:I

.field private final closed:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final file:Ljava/io/File;

.field private final fileChannel:Ljava/nio/channels/FileChannel;

.field private final fileNumber:J

.field private fileOffset:J

.field private mappedByteBuffer:Ljava/nio/MappedByteBuffer;


# direct methods
.method public constructor <init>(Ljava/io/File;J)V
    .locals 6
    .param p1, "file"    # Ljava/io/File;
    .param p2, "fileNumber"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v2, 0x0

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 59
    const-string v0, "file is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    cmp-long v0, p2, v2

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    const-string v1, "fileNumber is negative"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 61
    iput-object p1, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->file:Ljava/io/File;

    .line 62
    iput-wide p2, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->fileNumber:J

    .line 63
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v1, "rw"

    invoke-direct {v0, p1, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->fileChannel:Ljava/nio/channels/FileChannel;

    .line 64
    iget-object v0, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->fileChannel:Ljava/nio/channels/FileChannel;

    sget-object v1, Ljava/nio/channels/FileChannel$MapMode;->READ_WRITE:Ljava/nio/channels/FileChannel$MapMode;

    const-wide/32 v4, 0x100000

    invoke-virtual/range {v0 .. v5}, Ljava/nio/channels/FileChannel;->map(Ljava/nio/channels/FileChannel$MapMode;JJ)Ljava/nio/MappedByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->mappedByteBuffer:Ljava/nio/MappedByteBuffer;

    .line 65
    return-void

    .line 60
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private destroyMappedByteBuffer()V
    .locals 4

    .prologue
    .line 101
    iget-object v0, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->mappedByteBuffer:Ljava/nio/MappedByteBuffer;

    if-eqz v0, :cond_0

    .line 102
    iget-wide v0, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->fileOffset:J

    iget-object v2, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->mappedByteBuffer:Ljava/nio/MappedByteBuffer;

    invoke-virtual {v2}, Ljava/nio/MappedByteBuffer;->position()I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->fileOffset:J

    .line 103
    invoke-direct {p0}, Lorg/iq80/leveldb/impl/MMapLogWriter;->unmap()V

    .line 105
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->mappedByteBuffer:Ljava/nio/MappedByteBuffer;

    .line 106
    return-void
.end method

.method private ensureCapacity(I)V
    .locals 6
    .param p1, "bytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 215
    iget-object v0, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->mappedByteBuffer:Ljava/nio/MappedByteBuffer;

    invoke-virtual {v0}, Ljava/nio/MappedByteBuffer;->remaining()I

    move-result v0

    if-ge v0, p1, :cond_0

    .line 217
    iget-wide v0, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->fileOffset:J

    iget-object v2, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->mappedByteBuffer:Ljava/nio/MappedByteBuffer;

    invoke-virtual {v2}, Ljava/nio/MappedByteBuffer;->position()I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->fileOffset:J

    .line 218
    invoke-direct {p0}, Lorg/iq80/leveldb/impl/MMapLogWriter;->unmap()V

    .line 220
    iget-object v0, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->fileChannel:Ljava/nio/channels/FileChannel;

    sget-object v1, Ljava/nio/channels/FileChannel$MapMode;->READ_WRITE:Ljava/nio/channels/FileChannel$MapMode;

    iget-wide v2, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->fileOffset:J

    const-wide/32 v4, 0x100000

    invoke-virtual/range {v0 .. v5}, Ljava/nio/channels/FileChannel;->map(Ljava/nio/channels/FileChannel$MapMode;JJ)Ljava/nio/MappedByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->mappedByteBuffer:Ljava/nio/MappedByteBuffer;

    .line 222
    :cond_0
    return-void
.end method

.method private static newLogRecordHeader(Lorg/iq80/leveldb/impl/LogChunkType;Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/util/Slice;
    .locals 7
    .param p0, "type"    # Lorg/iq80/leveldb/impl/LogChunkType;
    .param p1, "slice"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 231
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/LogChunkType;->getPersistentId()I

    move-result v3

    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->getRawArray()[B

    move-result-object v4

    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->getRawOffset()I

    move-result v5

    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v6

    invoke-static {v3, v4, v5, v6}, Lorg/iq80/leveldb/impl/Logs;->getChunkChecksum(I[BII)I

    move-result v0

    .line 234
    .local v0, "crc":I
    const/4 v3, 0x7

    invoke-static {v3}, Lorg/iq80/leveldb/util/Slices;->allocate(I)Lorg/iq80/leveldb/util/Slice;

    move-result-object v1

    .line 235
    .local v1, "header":Lorg/iq80/leveldb/util/Slice;
    invoke-virtual {v1}, Lorg/iq80/leveldb/util/Slice;->output()Lorg/iq80/leveldb/util/SliceOutput;

    move-result-object v2

    .line 236
    .local v2, "sliceOutput":Lorg/iq80/leveldb/util/SliceOutput;
    invoke-virtual {v2, v0}, Lorg/iq80/leveldb/util/SliceOutput;->writeInt(I)V

    .line 237
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v3

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    invoke-virtual {v2, v3}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 238
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v3

    ushr-int/lit8 v3, v3, 0x8

    int-to-byte v3, v3

    invoke-virtual {v2, v3}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 239
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/LogChunkType;->getPersistentId()I

    move-result v3

    int-to-byte v3, v3

    invoke-virtual {v2, v3}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 241
    return-object v1
.end method

.method private unmap()V
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->mappedByteBuffer:Ljava/nio/MappedByteBuffer;

    invoke-static {v0}, Lorg/iq80/leveldb/util/ByteBufferSupport;->unmap(Ljava/nio/MappedByteBuffer;)V

    .line 227
    return-void
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

    .line 198
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

    .line 199
    iget v1, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->blockOffset:I

    add-int/lit8 v1, v1, 0x7

    const v4, 0x8000

    if-gt v1, v4, :cond_1

    :goto_1
    invoke-static {v2}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 202
    invoke-static {p1, p2}, Lorg/iq80/leveldb/impl/MMapLogWriter;->newLogRecordHeader(Lorg/iq80/leveldb/impl/LogChunkType;Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    .line 205
    .local v0, "header":Lorg/iq80/leveldb/util/Slice;
    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v1

    invoke-virtual {p2}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v2

    add-int/2addr v1, v2

    invoke-direct {p0, v1}, Lorg/iq80/leveldb/impl/MMapLogWriter;->ensureCapacity(I)V

    .line 206
    iget-object v1, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->mappedByteBuffer:Ljava/nio/MappedByteBuffer;

    invoke-virtual {v0, v3, v1}, Lorg/iq80/leveldb/util/Slice;->getBytes(ILjava/nio/ByteBuffer;)V

    .line 207
    iget-object v1, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->mappedByteBuffer:Ljava/nio/MappedByteBuffer;

    invoke-virtual {p2, v3, v1}, Lorg/iq80/leveldb/util/Slice;->getBytes(ILjava/nio/ByteBuffer;)V

    .line 209
    iget v1, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->blockOffset:I

    invoke-virtual {p2}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x7

    add-int/2addr v1, v2

    iput v1, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->blockOffset:I

    .line 210
    return-void

    .end local v0    # "header":Lorg/iq80/leveldb/util/Slice;
    :cond_0
    move v1, v3

    .line 198
    goto :goto_0

    :cond_1
    move v2, v3

    .line 199
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

    .line 125
    monitor-enter p0

    :try_start_0
    iget-object v7, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v7

    if-nez v7, :cond_4

    move v7, v8

    :goto_0
    const-string v10, "Log has been closed"

    invoke-static {v7, v10}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 127
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->input()Lorg/iq80/leveldb/util/SliceInput;

    move-result-object v5

    .line 130
    .local v5, "sliceInput":Lorg/iq80/leveldb/util/SliceInput;
    const/4 v0, 0x1

    .line 136
    .local v0, "begin":Z
    :cond_0
    iget v7, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->blockOffset:I

    sub-int v2, v11, v7

    .line 137
    .local v2, "bytesRemainingInBlock":I
    if-ltz v2, :cond_5

    move v7, v8

    :goto_1
    invoke-static {v7}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 140
    const/4 v7, 0x7

    if-ge v2, v7, :cond_2

    .line 141
    if-lez v2, :cond_1

    .line 144
    invoke-direct {p0, v2}, Lorg/iq80/leveldb/impl/MMapLogWriter;->ensureCapacity(I)V

    .line 145
    iget-object v7, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->mappedByteBuffer:Ljava/nio/MappedByteBuffer;

    new-array v10, v2, [B

    invoke-virtual {v7, v10}, Ljava/nio/MappedByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 147
    :cond_1
    const/4 v7, 0x0

    iput v7, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->blockOffset:I

    .line 148
    iget v7, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->blockOffset:I

    sub-int v2, v11, v7

    .line 152
    :cond_2
    add-int/lit8 v1, v2, -0x7

    .line 153
    .local v1, "bytesAvailableInBlock":I
    if-ltz v1, :cond_6

    move v7, v8

    :goto_2
    invoke-static {v7}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 159
    invoke-virtual {v5}, Lorg/iq80/leveldb/util/SliceInput;->available()I

    move-result v7

    if-le v7, v1, :cond_7

    .line 160
    const/4 v3, 0x0

    .line 161
    .local v3, "end":Z
    move v4, v1

    .line 170
    .local v4, "fragmentLength":I
    :goto_3
    if-eqz v0, :cond_8

    if-eqz v3, :cond_8

    .line 171
    sget-object v6, Lorg/iq80/leveldb/impl/LogChunkType;->FULL:Lorg/iq80/leveldb/impl/LogChunkType;

    .line 184
    .local v6, "type":Lorg/iq80/leveldb/impl/LogChunkType;
    :goto_4
    invoke-virtual {v5, v4}, Lorg/iq80/leveldb/util/SliceInput;->readBytes(I)Lorg/iq80/leveldb/util/Slice;

    move-result-object v7

    invoke-direct {p0, v6, v7}, Lorg/iq80/leveldb/impl/MMapLogWriter;->writeChunk(Lorg/iq80/leveldb/impl/LogChunkType;Lorg/iq80/leveldb/util/Slice;)V

    .line 187
    const/4 v0, 0x0

    .line 188
    invoke-virtual {v5}, Lorg/iq80/leveldb/util/SliceInput;->isReadable()Z

    move-result v7

    if-nez v7, :cond_0

    .line 190
    if-eqz p2, :cond_3

    .line 191
    iget-object v7, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->mappedByteBuffer:Ljava/nio/MappedByteBuffer;

    invoke-virtual {v7}, Ljava/nio/MappedByteBuffer;->force()Ljava/nio/MappedByteBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 193
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

    .line 125
    goto :goto_0

    .restart local v0    # "begin":Z
    .restart local v2    # "bytesRemainingInBlock":I
    .restart local v5    # "sliceInput":Lorg/iq80/leveldb/util/SliceInput;
    :cond_5
    move v7, v9

    .line 137
    goto :goto_1

    .restart local v1    # "bytesAvailableInBlock":I
    :cond_6
    move v7, v9

    .line 153
    goto :goto_2

    .line 164
    :cond_7
    const/4 v3, 0x1

    .line 165
    .restart local v3    # "end":Z
    :try_start_1
    invoke-virtual {v5}, Lorg/iq80/leveldb/util/SliceInput;->available()I

    move-result v4

    .restart local v4    # "fragmentLength":I
    goto :goto_3

    .line 173
    :cond_8
    if-eqz v0, :cond_9

    .line 174
    sget-object v6, Lorg/iq80/leveldb/impl/LogChunkType;->FIRST:Lorg/iq80/leveldb/impl/LogChunkType;

    .restart local v6    # "type":Lorg/iq80/leveldb/impl/LogChunkType;
    goto :goto_4

    .line 176
    .end local v6    # "type":Lorg/iq80/leveldb/impl/LogChunkType;
    :cond_9
    if-eqz v3, :cond_a

    .line 177
    sget-object v6, Lorg/iq80/leveldb/impl/LogChunkType;->LAST:Lorg/iq80/leveldb/impl/LogChunkType;

    .restart local v6    # "type":Lorg/iq80/leveldb/impl/LogChunkType;
    goto :goto_4

    .line 180
    .end local v6    # "type":Lorg/iq80/leveldb/impl/LogChunkType;
    :cond_a
    sget-object v6, Lorg/iq80/leveldb/impl/LogChunkType;->MIDDLE:Lorg/iq80/leveldb/impl/LogChunkType;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .restart local v6    # "type":Lorg/iq80/leveldb/impl/LogChunkType;
    goto :goto_4

    .line 125
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
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 79
    invoke-direct {p0}, Lorg/iq80/leveldb/impl/MMapLogWriter;->destroyMappedByteBuffer()V

    .line 81
    iget-object v0, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->fileChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 82
    iget-object v0, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->fileChannel:Ljava/nio/channels/FileChannel;

    iget-wide v2, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->fileOffset:J

    invoke-virtual {v0, v2, v3}, Ljava/nio/channels/FileChannel;->truncate(J)Ljava/nio/channels/FileChannel;

    .line 86
    :cond_0
    iget-object v0, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->fileChannel:Ljava/nio/channels/FileChannel;

    invoke-static {v0}, Lorg/iq80/leveldb/util/Closeables;->closeQuietly(Ljava/io/Closeable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    monitor-exit p0

    return-void

    .line 77
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized delete()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/MMapLogWriter;->close()V

    .line 96
    iget-object v0, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    monitor-exit p0

    return-void

    .line 93
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->file:Ljava/io/File;

    return-object v0
.end method

.method public getFileNumber()J
    .locals 2

    .prologue
    .line 117
    iget-wide v0, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->fileNumber:J

    return-wide v0
.end method

.method public isClosed()Z
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lorg/iq80/leveldb/impl/MMapLogWriter;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method
