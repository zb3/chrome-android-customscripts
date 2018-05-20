.class public final Lorg/iq80/leveldb/util/MergingIterator;
.super Lorg/iq80/leveldb/util/AbstractSeekingIterator;
.source "MergingIterator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/iq80/leveldb/util/MergingIterator$ComparableIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/iq80/leveldb/util/AbstractSeekingIterator",
        "<",
        "Lorg/iq80/leveldb/impl/InternalKey;",
        "Lorg/iq80/leveldb/util/Slice;",
        ">;"
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

.field private final levels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<+",
            "Lorg/iq80/leveldb/util/InternalIterator;",
            ">;"
        }
    .end annotation
.end field

.field private final priorityQueue:Ljava/util/PriorityQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/PriorityQueue",
            "<",
            "Lorg/iq80/leveldb/util/MergingIterator$ComparableIterator;",
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
            "<+",
            "Lorg/iq80/leveldb/util/InternalIterator;",
            ">;",
            "Ljava/util/Comparator",
            "<",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p1, "levels":Ljava/util/List;, "Ljava/util/List<+Lorg/iq80/leveldb/util/InternalIterator;>;"
    .local p2, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lorg/iq80/leveldb/impl/InternalKey;>;"
    invoke-direct {p0}, Lorg/iq80/leveldb/util/AbstractSeekingIterator;-><init>()V

    .line 39
    iput-object p1, p0, Lorg/iq80/leveldb/util/MergingIterator;->levels:Ljava/util/List;

    .line 40
    iput-object p2, p0, Lorg/iq80/leveldb/util/MergingIterator;->comparator:Ljava/util/Comparator;

    .line 42
    new-instance v0, Ljava/util/PriorityQueue;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/PriorityQueue;-><init>(I)V

    iput-object v0, p0, Lorg/iq80/leveldb/util/MergingIterator;->priorityQueue:Ljava/util/PriorityQueue;

    .line 43
    invoke-direct {p0, p2}, Lorg/iq80/leveldb/util/MergingIterator;->resetPriorityQueue(Ljava/util/Comparator;)V

    .line 44
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
    .line 66
    .local p1, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lorg/iq80/leveldb/impl/InternalKey;>;"
    const/4 v3, 0x1

    .line 67
    .local v3, "i":I
    iget-object v0, p0, Lorg/iq80/leveldb/util/MergingIterator;->levels:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_0
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/util/InternalIterator;

    .line 68
    .local v1, "level":Lorg/iq80/leveldb/util/InternalIterator;
    invoke-interface {v1}, Lorg/iq80/leveldb/util/InternalIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 69
    iget-object v8, p0, Lorg/iq80/leveldb/util/MergingIterator;->priorityQueue:Ljava/util/PriorityQueue;

    new-instance v0, Lorg/iq80/leveldb/util/MergingIterator$ComparableIterator;

    add-int/lit8 v6, v3, 0x1

    .end local v3    # "i":I
    .local v6, "i":I
    invoke-interface {v1}, Lorg/iq80/leveldb/util/InternalIterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    const/4 v5, 0x0

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lorg/iq80/leveldb/util/MergingIterator$ComparableIterator;-><init>(Lorg/iq80/leveldb/util/InternalIterator;Ljava/util/Comparator;ILjava/util/Map$Entry;Lorg/iq80/leveldb/util/MergingIterator$1;)V

    invoke-virtual {v8, v0}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    move v3, v6

    .end local v6    # "i":I
    .restart local v3    # "i":I
    goto :goto_0

    .line 72
    .end local v1    # "level":Lorg/iq80/leveldb/util/InternalIterator;
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
    .line 77
    const/4 v1, 0x0

    .line 78
    .local v1, "result":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/util/Slice;>;"
    iget-object v2, p0, Lorg/iq80/leveldb/util/MergingIterator;->priorityQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v2}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/util/MergingIterator$ComparableIterator;

    .line 79
    .local v0, "nextIterator":Lorg/iq80/leveldb/util/MergingIterator$ComparableIterator;
    if-eqz v0, :cond_0

    .line 80
    invoke-virtual {v0}, Lorg/iq80/leveldb/util/MergingIterator$ComparableIterator;->next()Ljava/util/Map$Entry;

    move-result-object v1

    .line 81
    invoke-virtual {v0}, Lorg/iq80/leveldb/util/MergingIterator$ComparableIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 82
    iget-object v2, p0, Lorg/iq80/leveldb/util/MergingIterator;->priorityQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v2, v0}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 85
    :cond_0
    return-object v1
.end method

.method protected bridge synthetic seekInternal(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 30
    check-cast p1, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/util/MergingIterator;->seekInternal(Lorg/iq80/leveldb/impl/InternalKey;)V

    return-void
.end method

.method protected seekInternal(Lorg/iq80/leveldb/impl/InternalKey;)V
    .locals 3
    .param p1, "targetKey"    # Lorg/iq80/leveldb/impl/InternalKey;

    .prologue
    .line 58
    iget-object v1, p0, Lorg/iq80/leveldb/util/MergingIterator;->levels:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/util/InternalIterator;

    .line 59
    .local v0, "level":Lorg/iq80/leveldb/util/InternalIterator;
    invoke-interface {v0, p1}, Lorg/iq80/leveldb/util/InternalIterator;->seek(Ljava/lang/Object;)V

    goto :goto_0

    .line 61
    .end local v0    # "level":Lorg/iq80/leveldb/util/InternalIterator;
    :cond_0
    iget-object v1, p0, Lorg/iq80/leveldb/util/MergingIterator;->comparator:Ljava/util/Comparator;

    invoke-direct {p0, v1}, Lorg/iq80/leveldb/util/MergingIterator;->resetPriorityQueue(Ljava/util/Comparator;)V

    .line 62
    return-void
.end method

.method protected seekToFirstInternal()V
    .locals 3

    .prologue
    .line 49
    iget-object v1, p0, Lorg/iq80/leveldb/util/MergingIterator;->levels:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/util/InternalIterator;

    .line 50
    .local v0, "level":Lorg/iq80/leveldb/util/InternalIterator;
    invoke-interface {v0}, Lorg/iq80/leveldb/util/InternalIterator;->seekToFirst()V

    goto :goto_0

    .line 52
    .end local v0    # "level":Lorg/iq80/leveldb/util/InternalIterator;
    :cond_0
    iget-object v1, p0, Lorg/iq80/leveldb/util/MergingIterator;->comparator:Ljava/util/Comparator;

    invoke-direct {p0, v1}, Lorg/iq80/leveldb/util/MergingIterator;->resetPriorityQueue(Ljava/util/Comparator;)V

    .line 53
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 92
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "MergingIterator"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    const-string v1, "{levels="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/util/MergingIterator;->levels:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 94
    const-string v1, ", comparator="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/util/MergingIterator;->comparator:Ljava/util/Comparator;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 95
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 96
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
