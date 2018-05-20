.class public Lorg/iq80/leveldb/table/FileChannelTable;
.super Lorg/iq80/leveldb/table/Table;
.source "FileChannelTable.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/nio/channels/FileChannel;Ljava/util/Comparator;Z)V
    .locals 0
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
    .line 37
    .local p3, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lorg/iq80/leveldb/util/Slice;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/iq80/leveldb/table/Table;-><init>(Ljava/lang/String;Ljava/nio/channels/FileChannel;Ljava/util/Comparator;Z)V

    .line 38
    return-void
.end method

.method private read(JI)Ljava/nio/ByteBuffer;
    .locals 3
    .param p1, "offset"    # J
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-static {p3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 96
    .local v0, "uncompressedBuffer":Ljava/nio/ByteBuffer;
    iget-object v1, p0, Lorg/iq80/leveldb/table/FileChannelTable;->fileChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v1, v0, p1, p2}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;J)I

    .line 97
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 98
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Could not read all the data"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 100
    :cond_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 101
    return-object v0
.end method


# virtual methods
.method protected init()Lorg/iq80/leveldb/table/Footer;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    iget-object v1, p0, Lorg/iq80/leveldb/table/FileChannelTable;->fileChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v2

    .line 45
    .local v2, "size":J
    const-wide/16 v4, 0x30

    sub-long v4, v2, v4

    const/16 v1, 0x30

    invoke-direct {p0, v4, v5, v1}, Lorg/iq80/leveldb/table/FileChannelTable;->read(JI)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 46
    .local v0, "footerData":Ljava/nio/ByteBuffer;
    invoke-static {v0}, Lorg/iq80/leveldb/util/Slices;->copiedBuffer(Ljava/nio/ByteBuffer;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v1

    invoke-static {v1}, Lorg/iq80/leveldb/table/Footer;->readFooter(Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/table/Footer;

    move-result-object v1

    return-object v1
.end method

.method protected readBlock(Lorg/iq80/leveldb/table/BlockHandle;)Lorg/iq80/leveldb/table/Block;
    .locals 10
    .param p1, "blockHandle"    # Lorg/iq80/leveldb/table/BlockHandle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    invoke-virtual {p1}, Lorg/iq80/leveldb/table/BlockHandle;->getOffset()J

    move-result-wide v6

    invoke-virtual {p1}, Lorg/iq80/leveldb/table/BlockHandle;->getDataSize()I

    move-result v5

    int-to-long v8, v5

    add-long/2addr v6, v8

    const/4 v5, 0x5

    invoke-direct {p0, v6, v7, v5}, Lorg/iq80/leveldb/table/FileChannelTable;->read(JI)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 56
    .local v1, "trailerData":Ljava/nio/ByteBuffer;
    invoke-static {v1}, Lorg/iq80/leveldb/util/Slices;->copiedBuffer(Ljava/nio/ByteBuffer;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v5

    invoke-static {v5}, Lorg/iq80/leveldb/table/BlockTrailer;->readBlockTrailer(Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/table/BlockTrailer;

    move-result-object v0

    .line 71
    .local v0, "blockTrailer":Lorg/iq80/leveldb/table/BlockTrailer;
    invoke-virtual {p1}, Lorg/iq80/leveldb/table/BlockHandle;->getOffset()J

    move-result-wide v6

    invoke-virtual {p1}, Lorg/iq80/leveldb/table/BlockHandle;->getDataSize()I

    move-result v5

    invoke-direct {p0, v6, v7, v5}, Lorg/iq80/leveldb/table/FileChannelTable;->read(JI)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 73
    .local v2, "uncompressedBuffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Lorg/iq80/leveldb/table/BlockTrailer;->getCompressionType()Lorg/iq80/leveldb/CompressionType;

    move-result-object v5

    sget-object v6, Lorg/iq80/leveldb/CompressionType;->SNAPPY:Lorg/iq80/leveldb/CompressionType;

    if-ne v5, v6, :cond_1

    .line 74
    const-class v6, Lorg/iq80/leveldb/table/FileChannelTable;

    monitor-enter v6

    .line 75
    :try_start_0
    invoke-virtual {p0, v2}, Lorg/iq80/leveldb/table/FileChannelTable;->uncompressedLength(Ljava/nio/ByteBuffer;)I

    move-result v4

    .line 76
    .local v4, "uncompressedLength":I
    sget-object v5, Lorg/iq80/leveldb/table/FileChannelTable;->uncompressedScratch:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v5

    if-ge v5, v4, :cond_0

    .line 77
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    sput-object v5, Lorg/iq80/leveldb/table/FileChannelTable;->uncompressedScratch:Ljava/nio/ByteBuffer;

    .line 79
    :cond_0
    sget-object v5, Lorg/iq80/leveldb/table/FileChannelTable;->uncompressedScratch:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 81
    sget-object v5, Lorg/iq80/leveldb/table/FileChannelTable;->uncompressedScratch:Ljava/nio/ByteBuffer;

    invoke-static {v2, v5}, Lorg/iq80/leveldb/util/Snappy;->uncompress(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V

    .line 82
    sget-object v5, Lorg/iq80/leveldb/table/FileChannelTable;->uncompressedScratch:Ljava/nio/ByteBuffer;

    invoke-static {v5}, Lorg/iq80/leveldb/util/Slices;->copiedBuffer(Ljava/nio/ByteBuffer;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v3

    .line 83
    .local v3, "uncompressedData":Lorg/iq80/leveldb/util/Slice;
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    .end local v4    # "uncompressedLength":I
    :goto_0
    new-instance v5, Lorg/iq80/leveldb/table/Block;

    iget-object v6, p0, Lorg/iq80/leveldb/table/FileChannelTable;->comparator:Ljava/util/Comparator;

    invoke-direct {v5, v3, v6}, Lorg/iq80/leveldb/table/Block;-><init>(Lorg/iq80/leveldb/util/Slice;Ljava/util/Comparator;)V

    return-object v5

    .line 83
    .end local v3    # "uncompressedData":Lorg/iq80/leveldb/util/Slice;
    :catchall_0
    move-exception v5

    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5

    .line 86
    :cond_1
    invoke-static {v2}, Lorg/iq80/leveldb/util/Slices;->copiedBuffer(Ljava/nio/ByteBuffer;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v3

    .restart local v3    # "uncompressedData":Lorg/iq80/leveldb/util/Slice;
    goto :goto_0
.end method
