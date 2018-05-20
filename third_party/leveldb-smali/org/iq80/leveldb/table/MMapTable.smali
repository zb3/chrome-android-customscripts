.class public Lorg/iq80/leveldb/table/MMapTable;
.super Lorg/iq80/leveldb/table/Table;
.source "MMapTable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/iq80/leveldb/table/MMapTable$Closer;
    }
.end annotation


# instance fields
.field private data:Ljava/nio/MappedByteBuffer;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/nio/channels/FileChannel;Ljava/util/Comparator;Z)V
    .locals 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "fileChannel"    # Ljava/nio/channels/FileChannel;
    .param p4, "verifyChecksums"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/nio/channels/FileChannel;",
            "Ljava/util/Comparator",
            "<",
            "Lorg/iq80/leveldb/util/Slice;",
            ">;Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p3, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lorg/iq80/leveldb/util/Slice;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 47
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/iq80/leveldb/table/Table;-><init>(Ljava/lang/String;Ljava/nio/channels/FileChannel;Ljava/util/Comparator;Z)V

    .line 48
    invoke-virtual {p2}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v4

    const-wide/32 v6, 0x7fffffff

    cmp-long v0, v4, v6

    if-gtz v0, :cond_0

    move v0, v1

    :goto_0
    const-string v3, "File must be smaller than %s bytes"

    new-array v1, v1, [Ljava/lang/Object;

    const v4, 0x7fffffff

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v1, v2

    invoke-static {v0, v3, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 49
    return-void

    :cond_0
    move v0, v2

    .line 48
    goto :goto_0
.end method

.method public static read(Ljava/nio/MappedByteBuffer;II)Ljava/nio/ByteBuffer;
    .locals 4
    .param p0, "data"    # Ljava/nio/MappedByteBuffer;
    .param p1, "offset"    # I
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    invoke-virtual {p0}, Ljava/nio/MappedByteBuffer;->position()I

    move-result v2

    add-int v1, v2, p1

    .line 136
    .local v1, "newPosition":I
    invoke-virtual {p0}, Ljava/nio/MappedByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v2

    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    move-result-object v2

    add-int v3, v1, p2

    invoke-virtual {v2, v3}, Ljava/nio/Buffer;->limit(I)Ljava/nio/Buffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/nio/Buffer;->position(I)Ljava/nio/Buffer;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 137
    .local v0, "block":Ljava/nio/ByteBuffer;
    return-object v0
.end method


# virtual methods
.method public closer()Ljava/util/concurrent/Callable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/Callable",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 64
    new-instance v0, Lorg/iq80/leveldb/table/MMapTable$Closer;

    iget-object v1, p0, Lorg/iq80/leveldb/table/MMapTable;->name:Ljava/lang/String;

    iget-object v2, p0, Lorg/iq80/leveldb/table/MMapTable;->fileChannel:Ljava/nio/channels/FileChannel;

    iget-object v3, p0, Lorg/iq80/leveldb/table/MMapTable;->data:Ljava/nio/MappedByteBuffer;

    invoke-direct {v0, v1, v2, v3}, Lorg/iq80/leveldb/table/MMapTable$Closer;-><init>(Ljava/lang/String;Ljava/io/Closeable;Ljava/nio/MappedByteBuffer;)V

    return-object v0
.end method

.method protected init()Lorg/iq80/leveldb/table/Footer;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    iget-object v0, p0, Lorg/iq80/leveldb/table/MMapTable;->fileChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v4

    .line 56
    .local v4, "size":J
    iget-object v0, p0, Lorg/iq80/leveldb/table/MMapTable;->fileChannel:Ljava/nio/channels/FileChannel;

    sget-object v1, Ljava/nio/channels/FileChannel$MapMode;->READ_ONLY:Ljava/nio/channels/FileChannel$MapMode;

    const-wide/16 v2, 0x0

    invoke-virtual/range {v0 .. v5}, Ljava/nio/channels/FileChannel;->map(Ljava/nio/channels/FileChannel$MapMode;JJ)Ljava/nio/MappedByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/table/MMapTable;->data:Ljava/nio/MappedByteBuffer;

    .line 57
    iget-object v0, p0, Lorg/iq80/leveldb/table/MMapTable;->data:Ljava/nio/MappedByteBuffer;

    long-to-int v1, v4

    add-int/lit8 v1, v1, -0x30

    const/16 v2, 0x30

    invoke-static {v0, v1, v2}, Lorg/iq80/leveldb/util/Slices;->copiedBuffer(Ljava/nio/ByteBuffer;II)Lorg/iq80/leveldb/util/Slice;

    move-result-object v6

    .line 58
    .local v6, "footerSlice":Lorg/iq80/leveldb/util/Slice;
    invoke-static {v6}, Lorg/iq80/leveldb/table/Footer;->readFooter(Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/table/Footer;

    move-result-object v0

    return-object v0
.end method

.method protected readBlock(Lorg/iq80/leveldb/table/BlockHandle;)Lorg/iq80/leveldb/table/Block;
    .locals 8
    .param p1, "blockHandle"    # Lorg/iq80/leveldb/table/BlockHandle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    iget-object v4, p0, Lorg/iq80/leveldb/table/MMapTable;->data:Ljava/nio/MappedByteBuffer;

    .line 96
    invoke-virtual {p1}, Lorg/iq80/leveldb/table/BlockHandle;->getOffset()J

    move-result-wide v6

    long-to-int v5, v6

    invoke-virtual {p1}, Lorg/iq80/leveldb/table/BlockHandle;->getDataSize()I

    move-result v6

    add-int/2addr v5, v6

    const/4 v6, 0x5

    .line 95
    invoke-static {v4, v5, v6}, Lorg/iq80/leveldb/util/Slices;->copiedBuffer(Ljava/nio/ByteBuffer;II)Lorg/iq80/leveldb/util/Slice;

    move-result-object v4

    invoke-static {v4}, Lorg/iq80/leveldb/table/BlockTrailer;->readBlockTrailer(Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/table/BlockTrailer;

    move-result-object v0

    .line 112
    .local v0, "blockTrailer":Lorg/iq80/leveldb/table/BlockTrailer;
    iget-object v4, p0, Lorg/iq80/leveldb/table/MMapTable;->data:Ljava/nio/MappedByteBuffer;

    invoke-virtual {p1}, Lorg/iq80/leveldb/table/BlockHandle;->getOffset()J

    move-result-wide v6

    long-to-int v5, v6

    invoke-virtual {p1}, Lorg/iq80/leveldb/table/BlockHandle;->getDataSize()I

    move-result v6

    invoke-static {v4, v5, v6}, Lorg/iq80/leveldb/table/MMapTable;->read(Ljava/nio/MappedByteBuffer;II)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 113
    .local v1, "uncompressedBuffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Lorg/iq80/leveldb/table/BlockTrailer;->getCompressionType()Lorg/iq80/leveldb/CompressionType;

    move-result-object v4

    sget-object v5, Lorg/iq80/leveldb/CompressionType;->SNAPPY:Lorg/iq80/leveldb/CompressionType;

    if-ne v4, v5, :cond_1

    .line 114
    const-class v5, Lorg/iq80/leveldb/table/MMapTable;

    monitor-enter v5

    .line 115
    :try_start_0
    invoke-virtual {p0, v1}, Lorg/iq80/leveldb/table/MMapTable;->uncompressedLength(Ljava/nio/ByteBuffer;)I

    move-result v3

    .line 116
    .local v3, "uncompressedLength":I
    sget-object v4, Lorg/iq80/leveldb/table/MMapTable;->uncompressedScratch:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v4

    if-ge v4, v3, :cond_0

    .line 117
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    sput-object v4, Lorg/iq80/leveldb/table/MMapTable;->uncompressedScratch:Ljava/nio/ByteBuffer;

    .line 119
    :cond_0
    sget-object v4, Lorg/iq80/leveldb/table/MMapTable;->uncompressedScratch:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 121
    sget-object v4, Lorg/iq80/leveldb/table/MMapTable;->uncompressedScratch:Ljava/nio/ByteBuffer;

    invoke-static {v1, v4}, Lorg/iq80/leveldb/util/Snappy;->uncompress(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V

    .line 122
    sget-object v4, Lorg/iq80/leveldb/table/MMapTable;->uncompressedScratch:Ljava/nio/ByteBuffer;

    invoke-static {v4}, Lorg/iq80/leveldb/util/Slices;->copiedBuffer(Ljava/nio/ByteBuffer;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    .line 123
    .local v2, "uncompressedData":Lorg/iq80/leveldb/util/Slice;
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 129
    .end local v3    # "uncompressedLength":I
    :goto_0
    new-instance v4, Lorg/iq80/leveldb/table/Block;

    iget-object v5, p0, Lorg/iq80/leveldb/table/MMapTable;->comparator:Ljava/util/Comparator;

    invoke-direct {v4, v2, v5}, Lorg/iq80/leveldb/table/Block;-><init>(Lorg/iq80/leveldb/util/Slice;Ljava/util/Comparator;)V

    return-object v4

    .line 123
    .end local v2    # "uncompressedData":Lorg/iq80/leveldb/util/Slice;
    :catchall_0
    move-exception v4

    :try_start_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4

    .line 126
    :cond_1
    invoke-static {v1}, Lorg/iq80/leveldb/util/Slices;->copiedBuffer(Ljava/nio/ByteBuffer;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    .restart local v2    # "uncompressedData":Lorg/iq80/leveldb/util/Slice;
    goto :goto_0
.end method
