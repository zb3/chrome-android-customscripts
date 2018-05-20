.class public Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;
.super Ljava/lang/Object;
.source "MemTable.java"

# interfaces
.implements Lorg/iq80/leveldb/util/InternalIterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/impl/MemTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MemTableIterator"
.end annotation


# instance fields
.field private iterator:Lcom/google/common/collect/PeekingIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/PeekingIterator",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            "Lorg/iq80/leveldb/util/Slice;",
            ">;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lorg/iq80/leveldb/impl/MemTable;


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/impl/MemTable;)V
    .locals 1
    .param p1, "this$0"    # Lorg/iq80/leveldb/impl/MemTable;

    .prologue
    .line 99
    iput-object p1, p0, Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;->this$0:Lorg/iq80/leveldb/impl/MemTable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    # getter for: Lorg/iq80/leveldb/impl/MemTable;->table:Ljava/util/concurrent/ConcurrentSkipListMap;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/MemTable;->access$000(Lorg/iq80/leveldb/impl/MemTable;)Ljava/util/concurrent/ConcurrentSkipListMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentSkipListMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/collect/Iterators;->peekingIterator(Ljava/util/Iterator;)Lcom/google/common/collect/PeekingIterator;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;->iterator:Lcom/google/common/collect/PeekingIterator;

    .line 101
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;->iterator:Lcom/google/common/collect/PeekingIterator;

    invoke-interface {v0}, Lcom/google/common/collect/PeekingIterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 93
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;->next()Lorg/iq80/leveldb/impl/InternalEntry;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/iq80/leveldb/impl/InternalEntry;
    .locals 4

    .prologue
    .line 131
    iget-object v1, p0, Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;->iterator:Lcom/google/common/collect/PeekingIterator;

    invoke-interface {v1}, Lcom/google/common/collect/PeekingIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 132
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/util/Slice;>;"
    new-instance v3, Lorg/iq80/leveldb/impl/InternalEntry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/iq80/leveldb/util/Slice;

    invoke-direct {v3, v1, v2}, Lorg/iq80/leveldb/impl/InternalEntry;-><init>(Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/util/Slice;)V

    return-object v3
.end method

.method public bridge synthetic peek()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 93
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;->peek()Lorg/iq80/leveldb/impl/InternalEntry;

    move-result-object v0

    return-object v0
.end method

.method public peek()Lorg/iq80/leveldb/impl/InternalEntry;
    .locals 4

    .prologue
    .line 124
    iget-object v1, p0, Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;->iterator:Lcom/google/common/collect/PeekingIterator;

    invoke-interface {v1}, Lcom/google/common/collect/PeekingIterator;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 125
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/util/Slice;>;"
    new-instance v3, Lorg/iq80/leveldb/impl/InternalEntry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/iq80/leveldb/util/Slice;

    invoke-direct {v3, v1, v2}, Lorg/iq80/leveldb/impl/InternalEntry;-><init>(Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/util/Slice;)V

    return-object v3
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 138
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public bridge synthetic seek(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 93
    check-cast p1, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;->seek(Lorg/iq80/leveldb/impl/InternalKey;)V

    return-void
.end method

.method public seek(Lorg/iq80/leveldb/impl/InternalKey;)V
    .locals 1
    .param p1, "targetKey"    # Lorg/iq80/leveldb/impl/InternalKey;

    .prologue
    .line 118
    iget-object v0, p0, Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;->this$0:Lorg/iq80/leveldb/impl/MemTable;

    # getter for: Lorg/iq80/leveldb/impl/MemTable;->table:Ljava/util/concurrent/ConcurrentSkipListMap;
    invoke-static {v0}, Lorg/iq80/leveldb/impl/MemTable;->access$000(Lorg/iq80/leveldb/impl/MemTable;)Ljava/util/concurrent/ConcurrentSkipListMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentSkipListMap;->tailMap(Ljava/lang/Object;)Ljava/util/concurrent/ConcurrentNavigableMap;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentNavigableMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/collect/Iterators;->peekingIterator(Ljava/util/Iterator;)Lcom/google/common/collect/PeekingIterator;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;->iterator:Lcom/google/common/collect/PeekingIterator;

    .line 119
    return-void
.end method

.method public seekToFirst()V
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;->this$0:Lorg/iq80/leveldb/impl/MemTable;

    # getter for: Lorg/iq80/leveldb/impl/MemTable;->table:Ljava/util/concurrent/ConcurrentSkipListMap;
    invoke-static {v0}, Lorg/iq80/leveldb/impl/MemTable;->access$000(Lorg/iq80/leveldb/impl/MemTable;)Ljava/util/concurrent/ConcurrentSkipListMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentSkipListMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/collect/Iterators;->peekingIterator(Ljava/util/Iterator;)Lcom/google/common/collect/PeekingIterator;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;->iterator:Lcom/google/common/collect/PeekingIterator;

    .line 113
    return-void
.end method
