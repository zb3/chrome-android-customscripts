.class public final Lorg/iq80/leveldb/util/DbIterator;
.super Lorg/iq80/leveldb/util/AbstractSeekingIterator;
.source "DbIterator.java"

# interfaces
.implements Lorg/iq80/leveldb/util/InternalIterator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;
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

.field private final heap:[Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

.field private heapSize:I

.field private final immutableMemTableIterator:Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

.field private final level0Files:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/util/InternalTableIterator;",
            ">;"
        }
    .end annotation
.end field

.field private final levels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/util/LevelIterator;",
            ">;"
        }
    .end annotation
.end field

.field private final memTableIterator:Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;Ljava/util/List;Ljava/util/List;Ljava/util/Comparator;)V
    .locals 2
    .param p1, "memTableIterator"    # Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;
    .param p2, "immutableMemTableIterator"    # Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;",
            "Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;",
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/util/InternalTableIterator;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/util/LevelIterator;",
            ">;",
            "Ljava/util/Comparator",
            "<",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 67
    .local p3, "level0Files":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/util/InternalTableIterator;>;"
    .local p4, "levels":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/util/LevelIterator;>;"
    .local p5, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lorg/iq80/leveldb/impl/InternalKey;>;"
    invoke-direct {p0}, Lorg/iq80/leveldb/util/AbstractSeekingIterator;-><init>()V

    .line 68
    iput-object p1, p0, Lorg/iq80/leveldb/util/DbIterator;->memTableIterator:Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    .line 69
    iput-object p2, p0, Lorg/iq80/leveldb/util/DbIterator;->immutableMemTableIterator:Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    .line 70
    iput-object p3, p0, Lorg/iq80/leveldb/util/DbIterator;->level0Files:Ljava/util/List;

    .line 71
    iput-object p4, p0, Lorg/iq80/leveldb/util/DbIterator;->levels:Ljava/util/List;

    .line 72
    iput-object p5, p0, Lorg/iq80/leveldb/util/DbIterator;->comparator:Ljava/util/Comparator;

    .line 74
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x3

    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr v0, v1

    new-array v0, v0, [Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    iput-object v0, p0, Lorg/iq80/leveldb/util/DbIterator;->heap:[Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    .line 75
    invoke-direct {p0}, Lorg/iq80/leveldb/util/DbIterator;->resetPriorityQueue()V

    .line 76
    return-void
.end method

.method private heapAdd(Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;)Z
    .locals 2
    .param p1, "newElement"    # Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    .prologue
    .line 168
    const-string v0, "newElement is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    iget-object v0, p0, Lorg/iq80/leveldb/util/DbIterator;->heap:[Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    iget v1, p0, Lorg/iq80/leveldb/util/DbIterator;->heapSize:I

    aput-object p1, v0, v1

    .line 171
    iget v0, p0, Lorg/iq80/leveldb/util/DbIterator;->heapSize:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/iq80/leveldb/util/DbIterator;->heapSize:I

    invoke-direct {p0, v0}, Lorg/iq80/leveldb/util/DbIterator;->heapSiftUp(I)V

    .line 172
    const/4 v0, 0x1

    return v0
.end method

.method private heapSiftDown(I)V
    .locals 4
    .param p1, "rootIndex"    # I

    .prologue
    .line 193
    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->heap:[Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    aget-object v1, v2, p1

    .line 195
    .local v1, "target":Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;
    :goto_0
    mul-int/lit8 v2, p1, 0x2

    add-int/lit8 v0, v2, 0x1

    .local v0, "childIndex":I
    iget v2, p0, Lorg/iq80/leveldb/util/DbIterator;->heapSize:I

    if-ge v0, v2, :cond_1

    .line 196
    add-int/lit8 v2, v0, 0x1

    iget v3, p0, Lorg/iq80/leveldb/util/DbIterator;->heapSize:I

    if-ge v2, v3, :cond_0

    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->heap:[Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    add-int/lit8 v3, v0, 0x1

    aget-object v2, v2, v3

    iget-object v3, p0, Lorg/iq80/leveldb/util/DbIterator;->heap:[Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    aget-object v3, v3, v0

    .line 197
    invoke-virtual {v2, v3}, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->compareTo(Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;)I

    move-result v2

    if-gez v2, :cond_0

    .line 198
    add-int/lit8 v0, v0, 0x1

    .line 200
    :cond_0
    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->heap:[Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    aget-object v2, v2, v0

    invoke-virtual {v1, v2}, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->compareTo(Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;)I

    move-result v2

    if-gtz v2, :cond_2

    .line 206
    :cond_1
    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->heap:[Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    aput-object v1, v2, p1

    .line 207
    return-void

    .line 203
    :cond_2
    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->heap:[Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    iget-object v3, p0, Lorg/iq80/leveldb/util/DbIterator;->heap:[Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    aget-object v3, v3, v0

    aput-object v3, v2, p1

    .line 204
    move p1, v0

    goto :goto_0
.end method

.method private heapSiftUp(I)V
    .locals 4
    .param p1, "childIndex"    # I

    .prologue
    .line 177
    iget-object v3, p0, Lorg/iq80/leveldb/util/DbIterator;->heap:[Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    aget-object v2, v3, p1

    .line 179
    .local v2, "target":Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;
    :goto_0
    if-lez p1, :cond_0

    .line 180
    add-int/lit8 v3, p1, -0x1

    div-int/lit8 v1, v3, 0x2

    .line 181
    .local v1, "parentIndex":I
    iget-object v3, p0, Lorg/iq80/leveldb/util/DbIterator;->heap:[Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    aget-object v0, v3, v1

    .line 182
    .local v0, "parent":Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;
    invoke-virtual {v0, v2}, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->compareTo(Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;)I

    move-result v3

    if-gtz v3, :cond_1

    .line 188
    .end local v0    # "parent":Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;
    .end local v1    # "parentIndex":I
    :cond_0
    iget-object v3, p0, Lorg/iq80/leveldb/util/DbIterator;->heap:[Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    aput-object v2, v3, p1

    .line 189
    return-void

    .line 185
    .restart local v0    # "parent":Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;
    .restart local v1    # "parentIndex":I
    :cond_1
    iget-object v3, p0, Lorg/iq80/leveldb/util/DbIterator;->heap:[Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    aput-object v0, v3, p1

    .line 186
    move p1, v1

    .line 187
    goto :goto_0
.end method

.method private resetPriorityQueue()V
    .locals 13

    .prologue
    const/4 v5, 0x0

    .line 146
    const/4 v3, 0x0

    .line 147
    .local v3, "i":I
    const/4 v0, 0x0

    iput v0, p0, Lorg/iq80/leveldb/util/DbIterator;->heapSize:I

    .line 148
    iget-object v0, p0, Lorg/iq80/leveldb/util/DbIterator;->memTableIterator:Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/iq80/leveldb/util/DbIterator;->memTableIterator:Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 149
    new-instance v0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    iget-object v1, p0, Lorg/iq80/leveldb/util/DbIterator;->memTableIterator:Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->comparator:Ljava/util/Comparator;

    add-int/lit8 v12, v3, 0x1

    .end local v3    # "i":I
    .local v12, "i":I
    iget-object v4, p0, Lorg/iq80/leveldb/util/DbIterator;->memTableIterator:Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;->next()Lorg/iq80/leveldb/impl/InternalEntry;

    move-result-object v4

    invoke-direct/range {v0 .. v5}, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;-><init>(Lorg/iq80/leveldb/impl/SeekingIterator;Ljava/util/Comparator;ILjava/util/Map$Entry;Lorg/iq80/leveldb/util/DbIterator$1;)V

    invoke-direct {p0, v0}, Lorg/iq80/leveldb/util/DbIterator;->heapAdd(Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;)Z

    move v3, v12

    .line 151
    .end local v12    # "i":I
    .restart local v3    # "i":I
    :cond_0
    iget-object v0, p0, Lorg/iq80/leveldb/util/DbIterator;->immutableMemTableIterator:Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/iq80/leveldb/util/DbIterator;->immutableMemTableIterator:Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 152
    new-instance v0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    iget-object v1, p0, Lorg/iq80/leveldb/util/DbIterator;->immutableMemTableIterator:Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->comparator:Ljava/util/Comparator;

    add-int/lit8 v12, v3, 0x1

    .end local v3    # "i":I
    .restart local v12    # "i":I
    iget-object v4, p0, Lorg/iq80/leveldb/util/DbIterator;->immutableMemTableIterator:Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;->next()Lorg/iq80/leveldb/impl/InternalEntry;

    move-result-object v4

    invoke-direct/range {v0 .. v5}, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;-><init>(Lorg/iq80/leveldb/impl/SeekingIterator;Ljava/util/Comparator;ILjava/util/Map$Entry;Lorg/iq80/leveldb/util/DbIterator$1;)V

    invoke-direct {p0, v0}, Lorg/iq80/leveldb/util/DbIterator;->heapAdd(Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;)Z

    move v3, v12

    .line 154
    .end local v12    # "i":I
    .restart local v3    # "i":I
    :cond_1
    iget-object v0, p0, Lorg/iq80/leveldb/util/DbIterator;->level0Files:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_2
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/util/InternalTableIterator;

    .line 155
    .local v1, "level0File":Lorg/iq80/leveldb/util/InternalTableIterator;
    invoke-virtual {v1}, Lorg/iq80/leveldb/util/InternalTableIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 156
    new-instance v0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->comparator:Ljava/util/Comparator;

    add-int/lit8 v12, v3, 0x1

    .end local v3    # "i":I
    .restart local v12    # "i":I
    invoke-virtual {v1}, Lorg/iq80/leveldb/util/InternalTableIterator;->next()Ljava/util/Map$Entry;

    move-result-object v4

    invoke-direct/range {v0 .. v5}, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;-><init>(Lorg/iq80/leveldb/impl/SeekingIterator;Ljava/util/Comparator;ILjava/util/Map$Entry;Lorg/iq80/leveldb/util/DbIterator$1;)V

    invoke-direct {p0, v0}, Lorg/iq80/leveldb/util/DbIterator;->heapAdd(Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;)Z

    move v3, v12

    .end local v12    # "i":I
    .restart local v3    # "i":I
    goto :goto_0

    .line 159
    .end local v1    # "level0File":Lorg/iq80/leveldb/util/InternalTableIterator;
    :cond_3
    iget-object v0, p0, Lorg/iq80/leveldb/util/DbIterator;->levels:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/iq80/leveldb/util/LevelIterator;

    .line 160
    .local v7, "level":Lorg/iq80/leveldb/util/LevelIterator;
    invoke-virtual {v7}, Lorg/iq80/leveldb/util/LevelIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 161
    new-instance v6, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    iget-object v8, p0, Lorg/iq80/leveldb/util/DbIterator;->comparator:Ljava/util/Comparator;

    add-int/lit8 v12, v3, 0x1

    .end local v3    # "i":I
    .restart local v12    # "i":I
    invoke-virtual {v7}, Lorg/iq80/leveldb/util/LevelIterator;->next()Ljava/util/Map$Entry;

    move-result-object v10

    move v9, v3

    move-object v11, v5

    invoke-direct/range {v6 .. v11}, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;-><init>(Lorg/iq80/leveldb/impl/SeekingIterator;Ljava/util/Comparator;ILjava/util/Map$Entry;Lorg/iq80/leveldb/util/DbIterator$1;)V

    invoke-direct {p0, v6}, Lorg/iq80/leveldb/util/DbIterator;->heapAdd(Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;)Z

    move v3, v12

    .end local v12    # "i":I
    .restart local v3    # "i":I
    goto :goto_1

    .line 164
    .end local v7    # "level":Lorg/iq80/leveldb/util/LevelIterator;
    :cond_5
    return-void
.end method


# virtual methods
.method protected getNextElement()Ljava/util/Map$Entry;
    .locals 7
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
    const/4 v3, 0x0

    const/4 v6, 0x0

    .line 117
    iget v4, p0, Lorg/iq80/leveldb/util/DbIterator;->heapSize:I

    if-nez v4, :cond_1

    move-object v1, v3

    .line 141
    :cond_0
    :goto_0
    return-object v1

    .line 121
    :cond_1
    iget-object v4, p0, Lorg/iq80/leveldb/util/DbIterator;->heap:[Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    aget-object v2, v4, v6

    .line 122
    .local v2, "smallest":Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;
    invoke-virtual {v2}, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->next()Ljava/util/Map$Entry;

    move-result-object v1

    .line 127
    .local v1, "result":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/util/Slice;>;"
    invoke-virtual {v2}, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 128
    move-object v0, v2

    .line 136
    .local v0, "replacementElement":Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;
    :goto_1
    if-eqz v0, :cond_0

    .line 137
    iget-object v3, p0, Lorg/iq80/leveldb/util/DbIterator;->heap:[Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    aput-object v0, v3, v6

    .line 138
    invoke-direct {p0, v6}, Lorg/iq80/leveldb/util/DbIterator;->heapSiftDown(I)V

    goto :goto_0

    .line 131
    .end local v0    # "replacementElement":Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;
    :cond_2
    iget v4, p0, Lorg/iq80/leveldb/util/DbIterator;->heapSize:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lorg/iq80/leveldb/util/DbIterator;->heapSize:I

    .line 132
    iget-object v4, p0, Lorg/iq80/leveldb/util/DbIterator;->heap:[Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    iget v5, p0, Lorg/iq80/leveldb/util/DbIterator;->heapSize:I

    aget-object v0, v4, v5

    .line 133
    .restart local v0    # "replacementElement":Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;
    iget-object v4, p0, Lorg/iq80/leveldb/util/DbIterator;->heap:[Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    iget v5, p0, Lorg/iq80/leveldb/util/DbIterator;->heapSize:I

    aput-object v3, v4, v5

    goto :goto_1
.end method

.method protected bridge synthetic seekInternal(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 32
    check-cast p1, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/util/DbIterator;->seekInternal(Lorg/iq80/leveldb/impl/InternalKey;)V

    return-void
.end method

.method protected seekInternal(Lorg/iq80/leveldb/impl/InternalKey;)V
    .locals 4
    .param p1, "targetKey"    # Lorg/iq80/leveldb/impl/InternalKey;

    .prologue
    .line 99
    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->memTableIterator:Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    if-eqz v2, :cond_0

    .line 100
    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->memTableIterator:Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    invoke-virtual {v2, p1}, Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;->seek(Lorg/iq80/leveldb/impl/InternalKey;)V

    .line 102
    :cond_0
    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->immutableMemTableIterator:Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    if-eqz v2, :cond_1

    .line 103
    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->immutableMemTableIterator:Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    invoke-virtual {v2, p1}, Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;->seek(Lorg/iq80/leveldb/impl/InternalKey;)V

    .line 105
    :cond_1
    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->level0Files:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/util/InternalTableIterator;

    .line 106
    .local v1, "level0File":Lorg/iq80/leveldb/util/InternalTableIterator;
    invoke-virtual {v1, p1}, Lorg/iq80/leveldb/util/InternalTableIterator;->seek(Ljava/lang/Object;)V

    goto :goto_0

    .line 108
    .end local v1    # "level0File":Lorg/iq80/leveldb/util/InternalTableIterator;
    :cond_2
    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->levels:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/util/LevelIterator;

    .line 109
    .local v0, "level":Lorg/iq80/leveldb/util/LevelIterator;
    invoke-virtual {v0, p1}, Lorg/iq80/leveldb/util/LevelIterator;->seek(Ljava/lang/Object;)V

    goto :goto_1

    .line 111
    .end local v0    # "level":Lorg/iq80/leveldb/util/LevelIterator;
    :cond_3
    invoke-direct {p0}, Lorg/iq80/leveldb/util/DbIterator;->resetPriorityQueue()V

    .line 112
    return-void
.end method

.method protected seekToFirstInternal()V
    .locals 4

    .prologue
    .line 81
    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->memTableIterator:Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    if-eqz v2, :cond_0

    .line 82
    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->memTableIterator:Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;->seekToFirst()V

    .line 84
    :cond_0
    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->immutableMemTableIterator:Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    if-eqz v2, :cond_1

    .line 85
    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->immutableMemTableIterator:Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;->seekToFirst()V

    .line 87
    :cond_1
    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->level0Files:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/util/InternalTableIterator;

    .line 88
    .local v1, "level0File":Lorg/iq80/leveldb/util/InternalTableIterator;
    invoke-virtual {v1}, Lorg/iq80/leveldb/util/InternalTableIterator;->seekToFirst()V

    goto :goto_0

    .line 90
    .end local v1    # "level0File":Lorg/iq80/leveldb/util/InternalTableIterator;
    :cond_2
    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->levels:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/util/LevelIterator;

    .line 91
    .local v0, "level":Lorg/iq80/leveldb/util/LevelIterator;
    invoke-virtual {v0}, Lorg/iq80/leveldb/util/LevelIterator;->seekToFirst()V

    goto :goto_1

    .line 93
    .end local v0    # "level":Lorg/iq80/leveldb/util/LevelIterator;
    :cond_3
    invoke-direct {p0}, Lorg/iq80/leveldb/util/DbIterator;->resetPriorityQueue()V

    .line 94
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 212
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 213
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "DbIterator"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    const-string v1, "{memTableIterator="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->memTableIterator:Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 215
    const-string v1, ", immutableMemTableIterator="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->immutableMemTableIterator:Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 216
    const-string v1, ", level0Files="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->level0Files:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 217
    const-string v1, ", levels="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->levels:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 218
    const-string v1, ", comparator="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator;->comparator:Ljava/util/Comparator;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 219
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 220
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
