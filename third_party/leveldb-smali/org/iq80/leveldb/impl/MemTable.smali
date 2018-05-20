.class public Lorg/iq80/leveldb/impl/MemTable;
.super Ljava/lang/Object;
.source "MemTable.java"

# interfaces
.implements Lorg/iq80/leveldb/impl/SeekingIterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/iq80/leveldb/impl/SeekingIterable",
        "<",
        "Lorg/iq80/leveldb/impl/InternalKey;",
        "Lorg/iq80/leveldb/util/Slice;",
        ">;"
    }
.end annotation


# instance fields
.field private final approximateMemoryUsage:Ljava/util/concurrent/atomic/AtomicLong;

.field private final table:Ljava/util/concurrent/ConcurrentSkipListMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentSkipListMap",
            "<",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            "Lorg/iq80/leveldb/util/Slice;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/impl/InternalKeyComparator;)V
    .locals 1
    .param p1, "internalKeyComparator"    # Lorg/iq80/leveldb/impl/InternalKeyComparator;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/iq80/leveldb/impl/MemTable;->approximateMemoryUsage:Ljava/util/concurrent/atomic/AtomicLong;

    .line 40
    new-instance v0, Ljava/util/concurrent/ConcurrentSkipListMap;

    invoke-direct {v0, p1}, Ljava/util/concurrent/ConcurrentSkipListMap;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Lorg/iq80/leveldb/impl/MemTable;->table:Ljava/util/concurrent/ConcurrentSkipListMap;

    .line 41
    return-void
.end method

.method static synthetic access$000(Lorg/iq80/leveldb/impl/MemTable;)Ljava/util/concurrent/ConcurrentSkipListMap;
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/MemTable;

    .prologue
    .line 32
    iget-object v0, p0, Lorg/iq80/leveldb/impl/MemTable;->table:Ljava/util/concurrent/ConcurrentSkipListMap;

    return-object v0
.end method


# virtual methods
.method public add(JLorg/iq80/leveldb/impl/ValueType;Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)V
    .locals 5
    .param p1, "sequenceNumber"    # J
    .param p3, "valueType"    # Lorg/iq80/leveldb/impl/ValueType;
    .param p4, "key"    # Lorg/iq80/leveldb/util/Slice;
    .param p5, "value"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 55
    const-string v1, "valueType is null"

    invoke-static {p3, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    const-string v1, "key is null"

    invoke-static {p4, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    const-string v1, "valueType is null"

    invoke-static {p3, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    new-instance v0, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-direct {v0, p4, p1, p2, p3}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;JLorg/iq80/leveldb/impl/ValueType;)V

    .line 60
    .local v0, "internalKey":Lorg/iq80/leveldb/impl/InternalKey;
    iget-object v1, p0, Lorg/iq80/leveldb/impl/MemTable;->table:Ljava/util/concurrent/ConcurrentSkipListMap;

    invoke-virtual {v1, v0, p5}, Ljava/util/concurrent/ConcurrentSkipListMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    iget-object v1, p0, Lorg/iq80/leveldb/impl/MemTable;->approximateMemoryUsage:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {p4}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x8

    invoke-virtual {p5}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v3

    add-int/2addr v2, v3

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 63
    return-void
.end method

.method public approximateMemoryUsage()J
    .locals 2

    .prologue
    .line 50
    iget-object v0, p0, Lorg/iq80/leveldb/impl/MemTable;->approximateMemoryUsage:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method public get(Lorg/iq80/leveldb/impl/LookupKey;)Lorg/iq80/leveldb/impl/LookupResult;
    .locals 6
    .param p1, "key"    # Lorg/iq80/leveldb/impl/LookupKey;

    .prologue
    const/4 v3, 0x0

    .line 67
    const-string v4, "key is null"

    invoke-static {p1, v4}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/LookupKey;->getInternalKey()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v2

    .line 70
    .local v2, "internalKey":Lorg/iq80/leveldb/impl/InternalKey;
    iget-object v4, p0, Lorg/iq80/leveldb/impl/MemTable;->table:Ljava/util/concurrent/ConcurrentSkipListMap;

    invoke-virtual {v4, v2}, Ljava/util/concurrent/ConcurrentSkipListMap;->ceilingEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v0

    .line 71
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/util/Slice;>;"
    if-nez v0, :cond_1

    .line 84
    :cond_0
    :goto_0
    return-object v3

    .line 75
    :cond_1
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/impl/InternalKey;

    .line 76
    .local v1, "entryKey":Lorg/iq80/leveldb/impl/InternalKey;
    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v4

    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/LookupKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/iq80/leveldb/util/Slice;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 77
    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/InternalKey;->getValueType()Lorg/iq80/leveldb/impl/ValueType;

    move-result-object v3

    sget-object v4, Lorg/iq80/leveldb/impl/ValueType;->DELETION:Lorg/iq80/leveldb/impl/ValueType;

    if-ne v3, v4, :cond_2

    .line 78
    invoke-static {p1}, Lorg/iq80/leveldb/impl/LookupResult;->deleted(Lorg/iq80/leveldb/impl/LookupKey;)Lorg/iq80/leveldb/impl/LookupResult;

    move-result-object v3

    goto :goto_0

    .line 81
    :cond_2
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/iq80/leveldb/util/Slice;

    invoke-static {p1, v3}, Lorg/iq80/leveldb/impl/LookupResult;->ok(Lorg/iq80/leveldb/impl/LookupKey;Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/impl/LookupResult;

    move-result-object v3

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lorg/iq80/leveldb/impl/MemTable;->table:Ljava/util/concurrent/ConcurrentSkipListMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentSkipListMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 32
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/MemTable;->iterator()Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    move-result-object v0

    return-object v0
.end method

.method public iterator()Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;
    .locals 1

    .prologue
    .line 90
    new-instance v0, Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    invoke-direct {v0, p0}, Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;-><init>(Lorg/iq80/leveldb/impl/MemTable;)V

    return-object v0
.end method

.method public bridge synthetic iterator()Lorg/iq80/leveldb/impl/SeekingIterator;
    .locals 1

    .prologue
    .line 32
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/MemTable;->iterator()Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    move-result-object v0

    return-object v0
.end method
