.class public final Lorg/iq80/leveldb/util/Level0Iterator;
.super Lorg/iq80/leveldb/util/AbstractSeekingIterator;
.source "Level0Iterator.java"

# interfaces
.implements Lorg/iq80/leveldb/util/InternalIterator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/iq80/leveldb/util/Level0Iterator$ComparableIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/iq80/leveldb/util/AbstractSeekingIterator",
        "<",
        "Lorg/iq80/leveldb/impl/InternalKey;",
        "Lorg/iq80/leveldb/util/Slice;",
        ">;",
        "Lorg/iq80/leveldb/util/InternalIterator;"
    }
.end annotation


# instance fields
.field private final comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            ">;"
        }
    .end annotation
.end field

.field private final inputs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/util/InternalTableIterator;",
            ">;"
        }
    .end annotation
.end field

.field private final priorityQueue:Ljava/util/PriorityQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/PriorityQueue",
            "<",
            "Lorg/iq80/leveldb/util/Level0Iterator$ComparableIterator;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/Comparator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/util/InternalTableIterator;",
            ">;",
            "Ljava/util/Comparator",
            "<",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 58
    .local p1, "inputs":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/util/InternalTableIterator;>;"
    .local p2, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lorg/iq80/leveldb/impl/InternalKey;>;"
    invoke-direct {p0}, Lorg/iq80/leveldb/util/AbstractSeekingIterator;-><init>()V

    .line 59
    iput-object p1, p0, Lorg/iq80/leveldb/util/Level0Iterator;->inputs:Ljava/util/List;

    .line 60
    iput-object p2, p0, Lorg/iq80/leveldb/util/Level0Iterator;->comparator:Ljava/util/Comparator;

    .line 62
    new-instance v0, Ljava/util/PriorityQueue;

    invoke-static {p1}, Lcom/google/common/collect/Iterables;->size(Ljava/lang/Iterable;)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/PriorityQueue;-><init>(I)V

    iput-object v0, p0, Lorg/iq80/leveldb/util/Level0Iterator;->priorityQueue:Ljava/util/PriorityQueue;

    .line 63
    invoke-direct {p0, p2}, Lorg/iq80/leveldb/util/Level0Iterator;->resetPriorityQueue(Ljava/util/Comparator;)V

    .line 64
    return-void
.end method

.method public constructor <init>(Lorg/iq80/leveldb/impl/TableCache;Ljava/util/List;Ljava/util/Comparator;)V
    .locals 4
    .param p1, "tableCache"    # Lorg/iq80/leveldb/impl/TableCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/iq80/leveldb/impl/TableCache;",
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;",
            "Ljava/util/Comparator",
            "<",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p2, "files":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    .local p3, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lorg/iq80/leveldb/impl/InternalKey;>;"
    invoke-direct {p0}, Lorg/iq80/leveldb/util/AbstractSeekingIterator;-><init>()V

    .line 46
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v0

    .line 47
    .local v0, "builder":Lcom/google/common/collect/ImmutableList$Builder;, "Lcom/google/common/collect/ImmutableList$Builder<Lorg/iq80/leveldb/util/InternalTableIterator;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 48
    .local v1, "file":Lorg/iq80/leveldb/impl/FileMetaData;
    invoke-virtual {p1, v1}, Lorg/iq80/leveldb/impl/TableCache;->newIterator(Lorg/iq80/leveldb/impl/FileMetaData;)Lorg/iq80/leveldb/util/InternalTableIterator;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    goto :goto_0

    .line 50
    .end local v1    # "file":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_0
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    iput-object v2, p0, Lorg/iq80/leveldb/util/Level0Iterator;->inputs:Ljava/util/List;

    .line 51
    iput-object p3, p0, Lorg/iq80/leveldb/util/Level0Iterator;->comparator:Ljava/util/Comparator;

    .line 53
    new-instance v2, Ljava/util/PriorityQueue;

    iget-object v3, p0, Lorg/iq80/leveldb/util/Level0Iterator;->inputs:Ljava/util/List;

    invoke-static {v3}, Lcom/google/common/collect/Iterables;->size(Ljava/lang/Iterable;)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-direct {v2, v3}, Ljava/util/PriorityQueue;-><init>(I)V

    iput-object v2, p0, Lorg/iq80/leveldb/util/Level0Iterator;->priorityQueue:Ljava/util/PriorityQueue;

    .line 54
    invoke-direct {p0, p3}, Lorg/iq80/leveldb/util/Level0Iterator;->resetPriorityQueue(Ljava/util/Comparator;)V

    .line 55
    return-void
.end method

.method private resetPriorityQueue(Ljava/util/Comparator;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 86
    .local p1, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lorg/iq80/leveldb/impl/InternalKey;>;"
    const/4 v3, 0x0

    .line 87
    .local v3, "i":I
    iget-object v0, p0, Lorg/iq80/leveldb/util/Level0Iterator;->inputs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_0
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/util/InternalTableIterator;

    .line 88
    .local v1, "input":Lorg/iq80/leveldb/util/InternalTableIterator;
    invoke-virtual {v1}, Lorg/iq80/leveldb/util/InternalTableIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 89
    iget-object v8, p0, Lorg/iq80/leveldb/util/Level0Iterator;->priorityQueue:Ljava/util/PriorityQueue;

    new-instance v0, Lorg/iq80/leveldb/util/Level0Iterator$ComparableIterator;

    add-int/lit8 v6, v3, 0x1

    .end local v3    # "i":I
    .local v6, "i":I
    invoke-virtual {v1}, Lorg/iq80/leveldb/util/InternalTableIterator;->next()Ljava/util/Map$Entry;

    move-result-object v4

    const/4 v5, 0x0

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lorg/iq80/leveldb/util/Level0Iterator$ComparableIterator;-><init>(Lorg/iq80/leveldb/impl/SeekingIterator;Ljava/util/Comparator;ILjava/util/Map$Entry;Lorg/iq80/leveldb/util/Level0Iterator$1;)V

    invoke-virtual {v8, v0}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    move v3, v6

    .end local v6    # "i":I
    .restart local v3    # "i":I
    goto :goto_0

    .line 92
    .end local v1    # "input":Lorg/iq80/leveldb/util/InternalTableIterator;
    :cond_1
    return-void
.end method


# virtual methods
.method protected getNextElement()Ljava/util/Map$Entry;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            "Lorg/iq80/leveldb/util/Slice;",
            ">;"
        }
    .end annotation

    .prologue
    .line 97
    const/4 v1, 0x0

    .line 98
    .local v1, "result":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/util/Slice;>;"
    iget-object v2, p0, Lorg/iq80/leveldb/util/Level0Iterator;->priorityQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v2}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/util/Level0Iterator$ComparableIterator;

    .line 99
    .local v0, "nextIterator":Lorg/iq80/leveldb/util/Level0Iterator$ComparableIterator;
    if-eqz v0, :cond_0

    .line 100
    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Level0Iterator$ComparableIterator;->next()Ljava/util/Map$Entry;

    move-result-object v1

    .line 101
    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Level0Iterator$ComparableIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 102
    iget-object v2, p0, Lorg/iq80/leveldb/util/Level0Iterator;->priorityQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v2, v0}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 105
    :cond_0
    return-object v1
.end method

.method protected bridge synthetic seekInternal(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 36
    check-cast p1, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/util/Level0Iterator;->seekInternal(Lorg/iq80/leveldb/impl/InternalKey;)V

    return-void
.end method

.method protected seekInternal(Lorg/iq80/leveldb/impl/InternalKey;)V
    .locals 3
    .param p1, "targetKey"    # Lorg/iq80/leveldb/impl/InternalKey;

    .prologue
    .line 78
    iget-object v1, p0, Lorg/iq80/leveldb/util/Level0Iterator;->inputs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/util/InternalTableIterator;

    .line 79
    .local v0, "input":Lorg/iq80/leveldb/util/InternalTableIterator;
    invoke-virtual {v0, p1}, Lorg/iq80/leveldb/util/InternalTableIterator;->seek(Ljava/lang/Object;)V

    goto :goto_0

    .line 81
    .end local v0    # "input":Lorg/iq80/leveldb/util/InternalTableIterator;
    :cond_0
    iget-object v1, p0, Lorg/iq80/leveldb/util/Level0Iterator;->comparator:Ljava/util/Comparator;

    invoke-direct {p0, v1}, Lorg/iq80/leveldb/util/Level0Iterator;->resetPriorityQueue(Ljava/util/Comparator;)V

    .line 82
    return-void
.end method

.method protected seekToFirstInternal()V
    .locals 3

    .prologue
    .line 69
    iget-object v1, p0, Lorg/iq80/leveldb/util/Level0Iterator;->inputs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/util/InternalTableIterator;

    .line 70
    .local v0, "input":Lorg/iq80/leveldb/util/InternalTableIterator;
    invoke-virtual {v0}, Lorg/iq80/leveldb/util/InternalTableIterator;->seekToFirst()V

    goto :goto_0

    .line 72
    .end local v0    # "input":Lorg/iq80/leveldb/util/InternalTableIterator;
    :cond_0
    iget-object v1, p0, Lorg/iq80/leveldb/util/Level0Iterator;->comparator:Ljava/util/Comparator;

    invoke-direct {p0, v1}, Lorg/iq80/leveldb/util/Level0Iterator;->resetPriorityQueue(Ljava/util/Comparator;)V

    .line 73
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "MergingIterator"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    const-string v1, "{inputs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/util/Level0Iterator;->inputs:Ljava/util/List;

    invoke-static {v2}, Lcom/google/common/collect/Iterables;->toString(Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    const-string v1, ", comparator="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/util/Level0Iterator;->comparator:Ljava/util/Comparator;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 115
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 116
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
