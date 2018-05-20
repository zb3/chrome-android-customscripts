.class public abstract Lorg/iq80/leveldb/table/Table;
.super Ljava/lang/Object;
.source "Table.java"

# interfaces
.implements Lorg/iq80/leveldb/impl/SeekingIterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/iq80/leveldb/table/Table$Closer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/iq80/leveldb/impl/SeekingIterable",
        "<",
        "Lorg/iq80/leveldb/util/Slice;",
        "Lorg/iq80/leveldb/util/Slice;",
        ">;"
    }
.end annotation


# static fields
.field protected static uncompressedScratch:Ljava/nio/ByteBuffer;


# instance fields
.field protected final comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/iq80/leveldb/util/Slice;",
            ">;"
        }
    .end annotation
.end field

.field protected final fileChannel:Ljava/nio/channels/FileChannel;

.field protected final indexBlock:Lorg/iq80/leveldb/table/Block;

.field protected final metaindexBlockHandle:Lorg/iq80/leveldb/table/BlockHandle;

.field protected final name:Ljava/lang/String;

.field protected final verifyChecksums:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 86
    const/high16 v0, 0x400000

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    sput-object v0, Lorg/iq80/leveldb/table/Table;->uncompressedScratch:Ljava/nio/ByteBuffer;

    return-void
.end method

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
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const-string v1, "name is null"

    invoke-static {p1, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    const-string v1, "fileChannel is null"

    invoke-static {p2, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    invoke-virtual {p2}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v2

    .line 51
    .local v2, "size":J
    const-wide/16 v6, 0x30

    cmp-long v1, v2, v6

    if-ltz v1, :cond_0

    move v1, v4

    :goto_0
    const-string v6, "File is corrupt: size must be at least %s bytes"

    new-array v4, v4, [Ljava/lang/Object;

    const/16 v7, 0x30

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v4, v5

    invoke-static {v1, v6, v4}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 52
    const-string v1, "comparator is null"

    invoke-static {p3, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    iput-object p1, p0, Lorg/iq80/leveldb/table/Table;->name:Ljava/lang/String;

    .line 55
    iput-object p2, p0, Lorg/iq80/leveldb/table/Table;->fileChannel:Ljava/nio/channels/FileChannel;

    .line 56
    iput-boolean p4, p0, Lorg/iq80/leveldb/table/Table;->verifyChecksums:Z

    .line 57
    iput-object p3, p0, Lorg/iq80/leveldb/table/Table;->comparator:Ljava/util/Comparator;

    .line 59
    invoke-virtual {p0}, Lorg/iq80/leveldb/table/Table;->init()Lorg/iq80/leveldb/table/Footer;

    move-result-object v0

    .line 60
    .local v0, "footer":Lorg/iq80/leveldb/table/Footer;
    invoke-virtual {v0}, Lorg/iq80/leveldb/table/Footer;->getIndexBlockHandle()Lorg/iq80/leveldb/table/BlockHandle;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/iq80/leveldb/table/Table;->readBlock(Lorg/iq80/leveldb/table/BlockHandle;)Lorg/iq80/leveldb/table/Block;

    move-result-object v1

    iput-object v1, p0, Lorg/iq80/leveldb/table/Table;->indexBlock:Lorg/iq80/leveldb/table/Block;

    .line 61
    invoke-virtual {v0}, Lorg/iq80/leveldb/table/Footer;->getMetaindexBlockHandle()Lorg/iq80/leveldb/table/BlockHandle;

    move-result-object v1

    iput-object v1, p0, Lorg/iq80/leveldb/table/Table;->metaindexBlockHandle:Lorg/iq80/leveldb/table/BlockHandle;

    .line 62
    return-void

    .end local v0    # "footer":Lorg/iq80/leveldb/table/Footer;
    :cond_0
    move v1, v5

    .line 51
    goto :goto_0
.end method


# virtual methods
.method public closer()Ljava/util/concurrent/Callable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/Callable",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 135
    new-instance v0, Lorg/iq80/leveldb/table/Table$Closer;

    iget-object v1, p0, Lorg/iq80/leveldb/table/Table;->fileChannel:Ljava/nio/channels/FileChannel;

    invoke-direct {v0, v1}, Lorg/iq80/leveldb/table/Table$Closer;-><init>(Ljava/io/Closeable;)V

    return-object v0
.end method

.method public getApproximateOffsetOf(Lorg/iq80/leveldb/util/Slice;)J
    .locals 4
    .param p1, "key"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 108
    iget-object v2, p0, Lorg/iq80/leveldb/table/Table;->indexBlock:Lorg/iq80/leveldb/table/Block;

    invoke-virtual {v2}, Lorg/iq80/leveldb/table/Block;->iterator()Lorg/iq80/leveldb/table/BlockIterator;

    move-result-object v1

    .line 109
    .local v1, "iterator":Lorg/iq80/leveldb/table/BlockIterator;
    invoke-virtual {v1, p1}, Lorg/iq80/leveldb/table/BlockIterator;->seek(Lorg/iq80/leveldb/util/Slice;)V

    .line 110
    invoke-virtual {v1}, Lorg/iq80/leveldb/table/BlockIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 111
    invoke-virtual {v1}, Lorg/iq80/leveldb/table/BlockIterator;->next()Lorg/iq80/leveldb/table/BlockEntry;

    move-result-object v2

    invoke-virtual {v2}, Lorg/iq80/leveldb/table/BlockEntry;->getValue()Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    invoke-virtual {v2}, Lorg/iq80/leveldb/util/Slice;->input()Lorg/iq80/leveldb/util/SliceInput;

    move-result-object v2

    invoke-static {v2}, Lorg/iq80/leveldb/table/BlockHandle;->readBlockHandle(Lorg/iq80/leveldb/util/SliceInput;)Lorg/iq80/leveldb/table/BlockHandle;

    move-result-object v0

    .line 112
    .local v0, "blockHandle":Lorg/iq80/leveldb/table/BlockHandle;
    invoke-virtual {v0}, Lorg/iq80/leveldb/table/BlockHandle;->getOffset()J

    move-result-wide v2

    .line 118
    .end local v0    # "blockHandle":Lorg/iq80/leveldb/table/BlockHandle;
    :goto_0
    return-wide v2

    :cond_0
    iget-object v2, p0, Lorg/iq80/leveldb/table/Table;->metaindexBlockHandle:Lorg/iq80/leveldb/table/BlockHandle;

    invoke-virtual {v2}, Lorg/iq80/leveldb/table/BlockHandle;->getOffset()J

    move-result-wide v2

    goto :goto_0
.end method

.method protected abstract init()Lorg/iq80/leveldb/table/Footer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 35
    invoke-virtual {p0}, Lorg/iq80/leveldb/table/Table;->iterator()Lorg/iq80/leveldb/util/TableIterator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic iterator()Lorg/iq80/leveldb/impl/SeekingIterator;
    .locals 1

    .prologue
    .line 35
    invoke-virtual {p0}, Lorg/iq80/leveldb/table/Table;->iterator()Lorg/iq80/leveldb/util/TableIterator;

    move-result-object v0

    return-object v0
.end method

.method public iterator()Lorg/iq80/leveldb/util/TableIterator;
    .locals 2

    .prologue
    .line 70
    new-instance v0, Lorg/iq80/leveldb/util/TableIterator;

    iget-object v1, p0, Lorg/iq80/leveldb/table/Table;->indexBlock:Lorg/iq80/leveldb/table/Block;

    invoke-virtual {v1}, Lorg/iq80/leveldb/table/Block;->iterator()Lorg/iq80/leveldb/table/BlockIterator;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/iq80/leveldb/util/TableIterator;-><init>(Lorg/iq80/leveldb/table/Table;Lorg/iq80/leveldb/table/BlockIterator;)V

    return-object v0
.end method

.method public openBlock(Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/table/Block;
    .locals 4
    .param p1, "blockEntry"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 75
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->input()Lorg/iq80/leveldb/util/SliceInput;

    move-result-object v3

    invoke-static {v3}, Lorg/iq80/leveldb/table/BlockHandle;->readBlockHandle(Lorg/iq80/leveldb/util/SliceInput;)Lorg/iq80/leveldb/table/BlockHandle;

    move-result-object v0

    .line 78
    .local v0, "blockHandle":Lorg/iq80/leveldb/table/BlockHandle;
    :try_start_0
    invoke-virtual {p0, v0}, Lorg/iq80/leveldb/table/Table;->readBlock(Lorg/iq80/leveldb/table/BlockHandle;)Lorg/iq80/leveldb/table/Block;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 83
    .local v1, "dataBlock":Lorg/iq80/leveldb/table/Block;
    return-object v1

    .line 80
    .end local v1    # "dataBlock":Lorg/iq80/leveldb/table/Block;
    :catch_0
    move-exception v2

    .line 81
    .local v2, "e":Ljava/io/IOException;
    invoke-static {v2}, Lcom/google/common/base/Throwables;->propagate(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3
.end method

.method protected abstract readBlock(Lorg/iq80/leveldb/table/BlockHandle;)Lorg/iq80/leveldb/table/Block;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 124
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 125
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "Table"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    const-string v1, "{name=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/table/Table;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x27

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 127
    const-string v1, ", comparator="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/table/Table;->comparator:Ljava/util/Comparator;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 128
    const-string v1, ", verifyChecksums="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lorg/iq80/leveldb/table/Table;->verifyChecksums:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 129
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 130
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected uncompressedLength(Ljava/nio/ByteBuffer;)I
    .locals 2
    .param p1, "data"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-static {v1}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->readVariableLengthInt(Ljava/nio/ByteBuffer;)I

    move-result v0

    .line 95
    .local v0, "length":I
    return v0
.end method
