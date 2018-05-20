.class public final Lorg/iq80/leveldb/util/LevelIterator;
.super Lorg/iq80/leveldb/util/AbstractSeekingIterator;
.source "LevelIterator.java"

# interfaces
.implements Lorg/iq80/leveldb/util/InternalIterator;


# annotations
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
.field private final comparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

.field private current:Lorg/iq80/leveldb/util/InternalTableIterator;

.field private final files:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;"
        }
    .end annotation
.end field

.field private index:I

.field private final tableCache:Lorg/iq80/leveldb/impl/TableCache;


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/impl/TableCache;Ljava/util/List;Lorg/iq80/leveldb/impl/InternalKeyComparator;)V
    .locals 0
    .param p1, "tableCache"    # Lorg/iq80/leveldb/impl/TableCache;
    .param p3, "comparator"    # Lorg/iq80/leveldb/impl/InternalKeyComparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/iq80/leveldb/impl/TableCache;",
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;",
            "Lorg/iq80/leveldb/impl/InternalKeyComparator;",
            ")V"
        }
    .end annotation

    .prologue
    .line 39
    .local p2, "files":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    invoke-direct {p0}, Lorg/iq80/leveldb/util/AbstractSeekingIterator;-><init>()V

    .line 40
    iput-object p1, p0, Lorg/iq80/leveldb/util/LevelIterator;->tableCache:Lorg/iq80/leveldb/impl/TableCache;

    .line 41
    iput-object p2, p0, Lorg/iq80/leveldb/util/LevelIterator;->files:Ljava/util/List;

    .line 42
    iput-object p3, p0, Lorg/iq80/leveldb/util/LevelIterator;->comparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    .line 43
    return-void
.end method

.method private openNextFile()Lorg/iq80/leveldb/util/InternalTableIterator;
    .locals 3

    .prologue
    .line 135
    iget-object v1, p0, Lorg/iq80/leveldb/util/LevelIterator;->files:Ljava/util/List;

    iget v2, p0, Lorg/iq80/leveldb/util/LevelIterator;->index:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 136
    .local v0, "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    iget v1, p0, Lorg/iq80/leveldb/util/LevelIterator;->index:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/iq80/leveldb/util/LevelIterator;->index:I

    .line 137
    iget-object v1, p0, Lorg/iq80/leveldb/util/LevelIterator;->tableCache:Lorg/iq80/leveldb/impl/TableCache;

    invoke-virtual {v1, v0}, Lorg/iq80/leveldb/impl/TableCache;->newIterator(Lorg/iq80/leveldb/impl/FileMetaData;)Lorg/iq80/leveldb/util/InternalTableIterator;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method protected getNextElement()Ljava/util/Map$Entry;
    .locals 4
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
    const/4 v1, 0x0

    .line 106
    const/4 v0, 0x0

    .line 108
    .local v0, "currentHasNext":Z
    :goto_0
    iget-object v2, p0, Lorg/iq80/leveldb/util/LevelIterator;->current:Lorg/iq80/leveldb/util/InternalTableIterator;

    if-eqz v2, :cond_0

    .line 109
    iget-object v2, p0, Lorg/iq80/leveldb/util/LevelIterator;->current:Lorg/iq80/leveldb/util/InternalTableIterator;

    invoke-virtual {v2}, Lorg/iq80/leveldb/util/InternalTableIterator;->hasNext()Z

    move-result v0

    .line 111
    :cond_0
    if-nez v0, :cond_1

    .line 112
    iget v2, p0, Lorg/iq80/leveldb/util/LevelIterator;->index:I

    iget-object v3, p0, Lorg/iq80/leveldb/util/LevelIterator;->files:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 113
    invoke-direct {p0}, Lorg/iq80/leveldb/util/LevelIterator;->openNextFile()Lorg/iq80/leveldb/util/InternalTableIterator;

    move-result-object v2

    iput-object v2, p0, Lorg/iq80/leveldb/util/LevelIterator;->current:Lorg/iq80/leveldb/util/InternalTableIterator;

    goto :goto_0

    .line 123
    :cond_1
    if-eqz v0, :cond_2

    .line 124
    iget-object v1, p0, Lorg/iq80/leveldb/util/LevelIterator;->current:Lorg/iq80/leveldb/util/InternalTableIterator;

    invoke-virtual {v1}, Lorg/iq80/leveldb/util/InternalTableIterator;->next()Ljava/util/Map$Entry;

    move-result-object v1

    .line 129
    :goto_1
    return-object v1

    .line 128
    :cond_2
    iput-object v1, p0, Lorg/iq80/leveldb/util/LevelIterator;->current:Lorg/iq80/leveldb/util/InternalTableIterator;

    goto :goto_1
.end method

.method protected bridge synthetic seekInternal(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 28
    check-cast p1, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/util/LevelIterator;->seekInternal(Lorg/iq80/leveldb/impl/InternalKey;)V

    return-void
.end method

.method protected seekInternal(Lorg/iq80/leveldb/impl/InternalKey;)V
    .locals 6
    .param p1, "targetKey"    # Lorg/iq80/leveldb/impl/InternalKey;

    .prologue
    .line 57
    iget-object v3, p0, Lorg/iq80/leveldb/util/LevelIterator;->files:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 97
    :goto_0
    return-void

    .line 62
    :cond_0
    const/4 v0, 0x0

    .line 63
    .local v0, "left":I
    iget-object v3, p0, Lorg/iq80/leveldb/util/LevelIterator;->files:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v2, v3, -0x1

    .line 66
    .local v2, "right":I
    :goto_1
    if-ge v0, v2, :cond_2

    .line 67
    add-int v3, v0, v2

    div-int/lit8 v1, v3, 0x2

    .line 69
    .local v1, "mid":I
    iget-object v4, p0, Lorg/iq80/leveldb/util/LevelIterator;->comparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    iget-object v3, p0, Lorg/iq80/leveldb/util/LevelIterator;->files:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/iq80/leveldb/impl/FileMetaData;

    invoke-virtual {v3}, Lorg/iq80/leveldb/impl/FileMetaData;->getLargest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v3

    invoke-virtual {v4, v3, p1}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->compare(Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)I

    move-result v3

    if-gez v3, :cond_1

    .line 72
    add-int/lit8 v0, v1, 0x1

    goto :goto_1

    .line 77
    :cond_1
    move v2, v1

    goto :goto_1

    .line 80
    .end local v1    # "mid":I
    :cond_2
    iput v2, p0, Lorg/iq80/leveldb/util/LevelIterator;->index:I

    .line 84
    iget v3, p0, Lorg/iq80/leveldb/util/LevelIterator;->index:I

    iget-object v4, p0, Lorg/iq80/leveldb/util/LevelIterator;->files:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ne v3, v4, :cond_3

    iget-object v4, p0, Lorg/iq80/leveldb/util/LevelIterator;->comparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    iget-object v3, p0, Lorg/iq80/leveldb/util/LevelIterator;->files:Ljava/util/List;

    iget v5, p0, Lorg/iq80/leveldb/util/LevelIterator;->index:I

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/iq80/leveldb/impl/FileMetaData;

    invoke-virtual {v3}, Lorg/iq80/leveldb/impl/FileMetaData;->getLargest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v3

    invoke-virtual {v4, v3, p1}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->compare(Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)I

    move-result v3

    if-gez v3, :cond_3

    .line 85
    iget v3, p0, Lorg/iq80/leveldb/util/LevelIterator;->index:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/iq80/leveldb/util/LevelIterator;->index:I

    .line 89
    :cond_3
    iget v3, p0, Lorg/iq80/leveldb/util/LevelIterator;->index:I

    iget-object v4, p0, Lorg/iq80/leveldb/util/LevelIterator;->files:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_4

    .line 91
    invoke-direct {p0}, Lorg/iq80/leveldb/util/LevelIterator;->openNextFile()Lorg/iq80/leveldb/util/InternalTableIterator;

    move-result-object v3

    iput-object v3, p0, Lorg/iq80/leveldb/util/LevelIterator;->current:Lorg/iq80/leveldb/util/InternalTableIterator;

    .line 92
    iget-object v3, p0, Lorg/iq80/leveldb/util/LevelIterator;->current:Lorg/iq80/leveldb/util/InternalTableIterator;

    invoke-virtual {v3, p1}, Lorg/iq80/leveldb/util/InternalTableIterator;->seek(Ljava/lang/Object;)V

    goto :goto_0

    .line 95
    :cond_4
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/iq80/leveldb/util/LevelIterator;->current:Lorg/iq80/leveldb/util/InternalTableIterator;

    goto :goto_0
.end method

.method protected seekToFirstInternal()V
    .locals 1

    .prologue
    .line 49
    const/4 v0, 0x0

    iput v0, p0, Lorg/iq80/leveldb/util/LevelIterator;->index:I

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/iq80/leveldb/util/LevelIterator;->current:Lorg/iq80/leveldb/util/InternalTableIterator;

    .line 51
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 143
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 144
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "ConcatenatingIterator"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    const-string v1, "{index="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/iq80/leveldb/util/LevelIterator;->index:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 146
    const-string v1, ", files="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/util/LevelIterator;->files:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 147
    const-string v1, ", current="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/util/LevelIterator;->current:Lorg/iq80/leveldb/util/InternalTableIterator;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 148
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 149
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
