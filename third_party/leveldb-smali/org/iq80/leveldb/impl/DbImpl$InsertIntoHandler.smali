.class Lorg/iq80/leveldb/impl/DbImpl$InsertIntoHandler;
.super Ljava/lang/Object;
.source "DbImpl.java"

# interfaces
.implements Lorg/iq80/leveldb/impl/WriteBatchImpl$Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/impl/DbImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InsertIntoHandler"
.end annotation


# instance fields
.field private final memTable:Lorg/iq80/leveldb/impl/MemTable;

.field private sequence:J


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/impl/MemTable;J)V
    .locals 0
    .param p1, "memTable"    # Lorg/iq80/leveldb/impl/MemTable;
    .param p2, "sequenceBegin"    # J

    .prologue
    .line 1361
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1362
    iput-object p1, p0, Lorg/iq80/leveldb/impl/DbImpl$InsertIntoHandler;->memTable:Lorg/iq80/leveldb/impl/MemTable;

    .line 1363
    iput-wide p2, p0, Lorg/iq80/leveldb/impl/DbImpl$InsertIntoHandler;->sequence:J

    .line 1364
    return-void
.end method


# virtual methods
.method public delete(Lorg/iq80/leveldb/util/Slice;)V
    .locals 7
    .param p1, "key"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 1375
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl$InsertIntoHandler;->memTable:Lorg/iq80/leveldb/impl/MemTable;

    iget-wide v2, p0, Lorg/iq80/leveldb/impl/DbImpl$InsertIntoHandler;->sequence:J

    const-wide/16 v4, 0x1

    add-long/2addr v4, v2

    iput-wide v4, p0, Lorg/iq80/leveldb/impl/DbImpl$InsertIntoHandler;->sequence:J

    sget-object v4, Lorg/iq80/leveldb/impl/ValueType;->DELETION:Lorg/iq80/leveldb/impl/ValueType;

    sget-object v6, Lorg/iq80/leveldb/util/Slices;->EMPTY_SLICE:Lorg/iq80/leveldb/util/Slice;

    move-object v5, p1

    invoke-virtual/range {v1 .. v6}, Lorg/iq80/leveldb/impl/MemTable;->add(JLorg/iq80/leveldb/impl/ValueType;Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)V

    .line 1376
    return-void
.end method

.method public put(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)V
    .locals 7
    .param p1, "key"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "value"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 1369
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl$InsertIntoHandler;->memTable:Lorg/iq80/leveldb/impl/MemTable;

    iget-wide v2, p0, Lorg/iq80/leveldb/impl/DbImpl$InsertIntoHandler;->sequence:J

    const-wide/16 v4, 0x1

    add-long/2addr v4, v2

    iput-wide v4, p0, Lorg/iq80/leveldb/impl/DbImpl$InsertIntoHandler;->sequence:J

    sget-object v4, Lorg/iq80/leveldb/impl/ValueType;->VALUE:Lorg/iq80/leveldb/impl/ValueType;

    move-object v5, p1

    move-object v6, p2

    invoke-virtual/range {v1 .. v6}, Lorg/iq80/leveldb/impl/MemTable;->add(JLorg/iq80/leveldb/impl/ValueType;Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)V

    .line 1370
    return-void
.end method
