.class public Lorg/iq80/leveldb/impl/Level0;
.super Ljava/lang/Object;
.source "Level0.java"

# interfaces
.implements Lorg/iq80/leveldb/impl/SeekingIterable;


# annotations
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


# static fields
.field public static final NEWEST_FIRST:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
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

.field private final internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

.field private final tableCache:Lorg/iq80/leveldb/impl/TableCache;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 45
    new-instance v0, Lorg/iq80/leveldb/impl/Level0$1;

    invoke-direct {v0}, Lorg/iq80/leveldb/impl/Level0$1;-><init>()V

    sput-object v0, Lorg/iq80/leveldb/impl/Level0;->NEWEST_FIRST:Ljava/util/Comparator;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lorg/iq80/leveldb/impl/TableCache;Lorg/iq80/leveldb/impl/InternalKeyComparator;)V
    .locals 1
    .param p2, "tableCache"    # Lorg/iq80/leveldb/impl/TableCache;
    .param p3, "internalKeyComparator"    # Lorg/iq80/leveldb/impl/InternalKeyComparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;",
            "Lorg/iq80/leveldb/impl/TableCache;",
            "Lorg/iq80/leveldb/impl/InternalKeyComparator;",
            ")V"
        }
    .end annotation

    .prologue
    .line 55
    .local p1, "files":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    const-string v0, "files is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    const-string v0, "tableCache is null"

    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    const-string v0, "internalKeyComparator is null"

    invoke-static {p3, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    invoke-static {p1}, Lcom/google/common/collect/Lists;->newArrayList(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/Level0;->files:Ljava/util/List;

    .line 61
    iput-object p2, p0, Lorg/iq80/leveldb/impl/Level0;->tableCache:Lorg/iq80/leveldb/impl/TableCache;

    .line 62
    iput-object p3, p0, Lorg/iq80/leveldb/impl/Level0;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    .line 63
    return-void
.end method

.method private findFile(Lorg/iq80/leveldb/impl/InternalKey;)I
    .locals 5
    .param p1, "targetKey"    # Lorg/iq80/leveldb/impl/InternalKey;

    .prologue
    .line 144
    iget-object v3, p0, Lorg/iq80/leveldb/impl/Level0;->files:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 145
    iget-object v3, p0, Lorg/iq80/leveldb/impl/Level0;->files:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .line 167
    :cond_0
    return v2

    .line 149
    :cond_1
    const/4 v0, 0x0

    .line 150
    .local v0, "left":I
    iget-object v3, p0, Lorg/iq80/leveldb/impl/Level0;->files:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v2, v3, -0x1

    .line 153
    .local v2, "right":I
    :goto_0
    if-ge v0, v2, :cond_0

    .line 154
    add-int v3, v0, v2

    div-int/lit8 v1, v3, 0x2

    .line 156
    .local v1, "mid":I
    iget-object v4, p0, Lorg/iq80/leveldb/impl/Level0;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    iget-object v3, p0, Lorg/iq80/leveldb/impl/Level0;->files:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/iq80/leveldb/impl/FileMetaData;

    invoke-virtual {v3}, Lorg/iq80/leveldb/impl/FileMetaData;->getLargest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v3

    invoke-virtual {v4, v3, p1}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->compare(Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)I

    move-result v3

    if-gez v3, :cond_2

    .line 159
    add-int/lit8 v0, v1, 0x1

    goto :goto_0

    .line 164
    :cond_2
    move v2, v1

    goto :goto_0
.end method


# virtual methods
.method public addFile(Lorg/iq80/leveldb/impl/FileMetaData;)V
    .locals 1
    .param p1, "fileMetaData"    # Lorg/iq80/leveldb/impl/FileMetaData;

    .prologue
    .line 173
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Level0;->files:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 174
    return-void
.end method

.method public get(Lorg/iq80/leveldb/impl/LookupKey;Lorg/iq80/leveldb/impl/ReadStats;)Lorg/iq80/leveldb/impl/LookupResult;
    .locals 12
    .param p1, "key"    # Lorg/iq80/leveldb/impl/LookupKey;
    .param p2, "readStats"    # Lorg/iq80/leveldb/impl/ReadStats;

    .prologue
    .line 83
    iget-object v5, p0, Lorg/iq80/leveldb/impl/Level0;->files:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 84
    const/4 v5, 0x0

    .line 129
    :goto_0
    return-object v5

    .line 87
    :cond_0
    iget-object v5, p0, Lorg/iq80/leveldb/impl/Level0;->files:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-static {v5}, Lcom/google/common/collect/Lists;->newArrayListWithCapacity(I)Ljava/util/ArrayList;

    move-result-object v2

    .line 88
    .local v2, "fileMetaDataList":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    iget-object v5, p0, Lorg/iq80/leveldb/impl/Level0;->files:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 89
    .local v1, "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    iget-object v6, p0, Lorg/iq80/leveldb/impl/Level0;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-virtual {v6}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->getUserComparator()Lorg/iq80/leveldb/table/UserComparator;

    move-result-object v6

    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/LookupKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v7

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/FileMetaData;->getSmallest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v8

    invoke-virtual {v8}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Lorg/iq80/leveldb/table/UserComparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v6

    if-ltz v6, :cond_1

    iget-object v6, p0, Lorg/iq80/leveldb/impl/Level0;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    .line 90
    invoke-virtual {v6}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->getUserComparator()Lorg/iq80/leveldb/table/UserComparator;

    move-result-object v6

    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/LookupKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v7

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/FileMetaData;->getLargest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v8

    invoke-virtual {v8}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Lorg/iq80/leveldb/table/UserComparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v6

    if-gtz v6, :cond_1

    .line 91
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 95
    .end local v1    # "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_2
    sget-object v5, Lorg/iq80/leveldb/impl/Level0;->NEWEST_FIRST:Ljava/util/Comparator;

    invoke-static {v2, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 97
    invoke-virtual {p2}, Lorg/iq80/leveldb/impl/ReadStats;->clear()V

    .line 98
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_3
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 100
    .restart local v1    # "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    iget-object v5, p0, Lorg/iq80/leveldb/impl/Level0;->tableCache:Lorg/iq80/leveldb/impl/TableCache;

    invoke-virtual {v5, v1}, Lorg/iq80/leveldb/impl/TableCache;->newIterator(Lorg/iq80/leveldb/impl/FileMetaData;)Lorg/iq80/leveldb/util/InternalTableIterator;

    move-result-object v4

    .line 103
    .local v4, "iterator":Lorg/iq80/leveldb/util/InternalTableIterator;
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/LookupKey;->getInternalKey()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/iq80/leveldb/util/InternalTableIterator;->seek(Ljava/lang/Object;)V

    .line 105
    invoke-virtual {v4}, Lorg/iq80/leveldb/util/InternalTableIterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 107
    invoke-virtual {v4}, Lorg/iq80/leveldb/util/InternalTableIterator;->next()Ljava/util/Map$Entry;

    move-result-object v0

    .line 108
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/util/Slice;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/iq80/leveldb/impl/InternalKey;

    .line 109
    .local v3, "internalKey":Lorg/iq80/leveldb/impl/InternalKey;
    if-eqz v3, :cond_4

    const/4 v5, 0x1

    :goto_3
    const-string v7, "Corrupt key for %s"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/LookupKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v10

    sget-object v11, Lcom/google/common/base/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v10, v11}, Lorg/iq80/leveldb/util/Slice;->toString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v5, v7, v8}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 112
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/LookupKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v5

    invoke-virtual {v3}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v7

    invoke-virtual {v5, v7}, Lorg/iq80/leveldb/util/Slice;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 113
    invoke-virtual {v3}, Lorg/iq80/leveldb/impl/InternalKey;->getValueType()Lorg/iq80/leveldb/impl/ValueType;

    move-result-object v5

    sget-object v7, Lorg/iq80/leveldb/impl/ValueType;->DELETION:Lorg/iq80/leveldb/impl/ValueType;

    if-ne v5, v7, :cond_5

    .line 114
    invoke-static {p1}, Lorg/iq80/leveldb/impl/LookupResult;->deleted(Lorg/iq80/leveldb/impl/LookupKey;)Lorg/iq80/leveldb/impl/LookupResult;

    move-result-object v5

    goto/16 :goto_0

    .line 109
    :cond_4
    const/4 v5, 0x0

    goto :goto_3

    .line 116
    :cond_5
    invoke-virtual {v3}, Lorg/iq80/leveldb/impl/InternalKey;->getValueType()Lorg/iq80/leveldb/impl/ValueType;

    move-result-object v5

    sget-object v7, Lorg/iq80/leveldb/impl/ValueType;->VALUE:Lorg/iq80/leveldb/impl/ValueType;

    if-ne v5, v7, :cond_6

    .line 117
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/iq80/leveldb/util/Slice;

    invoke-static {p1, v5}, Lorg/iq80/leveldb/impl/LookupResult;->ok(Lorg/iq80/leveldb/impl/LookupKey;Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/impl/LookupResult;

    move-result-object v5

    goto/16 :goto_0

    .line 122
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/util/Slice;>;"
    .end local v3    # "internalKey":Lorg/iq80/leveldb/impl/InternalKey;
    :cond_6
    invoke-virtual {p2}, Lorg/iq80/leveldb/impl/ReadStats;->getSeekFile()Lorg/iq80/leveldb/impl/FileMetaData;

    move-result-object v5

    if-nez v5, :cond_3

    .line 124
    invoke-virtual {p2, v1}, Lorg/iq80/leveldb/impl/ReadStats;->setSeekFile(Lorg/iq80/leveldb/impl/FileMetaData;)V

    .line 125
    const/4 v5, 0x0

    invoke-virtual {p2, v5}, Lorg/iq80/leveldb/impl/ReadStats;->setSeekFileLevel(I)V

    goto :goto_2

    .line 129
    .end local v1    # "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    .end local v4    # "iterator":Lorg/iq80/leveldb/util/InternalTableIterator;
    :cond_7
    const/4 v5, 0x0

    goto/16 :goto_0
.end method

.method public getFiles()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 72
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Level0;->files:Ljava/util/List;

    return-object v0
.end method

.method public getLevelNumber()I
    .locals 1

    .prologue
    .line 67
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 38
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/Level0;->iterator()Lorg/iq80/leveldb/util/Level0Iterator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic iterator()Lorg/iq80/leveldb/impl/SeekingIterator;
    .locals 1

    .prologue
    .line 38
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/Level0;->iterator()Lorg/iq80/leveldb/util/Level0Iterator;

    move-result-object v0

    return-object v0
.end method

.method public iterator()Lorg/iq80/leveldb/util/Level0Iterator;
    .locals 4

    .prologue
    .line 78
    new-instance v0, Lorg/iq80/leveldb/util/Level0Iterator;

    iget-object v1, p0, Lorg/iq80/leveldb/impl/Level0;->tableCache:Lorg/iq80/leveldb/impl/TableCache;

    iget-object v2, p0, Lorg/iq80/leveldb/impl/Level0;->files:Ljava/util/List;

    iget-object v3, p0, Lorg/iq80/leveldb/impl/Level0;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-direct {v0, v1, v2, v3}, Lorg/iq80/leveldb/util/Level0Iterator;-><init>(Lorg/iq80/leveldb/impl/TableCache;Ljava/util/List;Ljava/util/Comparator;)V

    return-object v0
.end method

.method public someFileOverlapsRange(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)Z
    .locals 6
    .param p1, "smallestUserKey"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "largestUserKey"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 134
    new-instance v1, Lorg/iq80/leveldb/impl/InternalKey;

    const-wide v4, 0xffffffffffffffL

    sget-object v3, Lorg/iq80/leveldb/impl/ValueType;->VALUE:Lorg/iq80/leveldb/impl/ValueType;

    invoke-direct {v1, p1, v4, v5, v3}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;JLorg/iq80/leveldb/impl/ValueType;)V

    .line 135
    .local v1, "smallestInternalKey":Lorg/iq80/leveldb/impl/InternalKey;
    invoke-direct {p0, v1}, Lorg/iq80/leveldb/impl/Level0;->findFile(Lorg/iq80/leveldb/impl/InternalKey;)I

    move-result v0

    .line 137
    .local v0, "index":I
    iget-object v3, p0, Lorg/iq80/leveldb/impl/Level0;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-virtual {v3}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->getUserComparator()Lorg/iq80/leveldb/table/UserComparator;

    move-result-object v2

    .line 138
    .local v2, "userComparator":Lorg/iq80/leveldb/table/UserComparator;
    iget-object v3, p0, Lorg/iq80/leveldb/impl/Level0;->files:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_0

    iget-object v3, p0, Lorg/iq80/leveldb/impl/Level0;->files:Ljava/util/List;

    .line 139
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/iq80/leveldb/impl/FileMetaData;

    invoke-virtual {v3}, Lorg/iq80/leveldb/impl/FileMetaData;->getSmallest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v3

    invoke-virtual {v3}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v3

    invoke-interface {v2, p2, v3}, Lorg/iq80/leveldb/table/UserComparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v3

    if-ltz v3, :cond_0

    const/4 v3, 0x1

    .line 138
    :goto_0
    return v3

    .line 139
    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 179
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 180
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "Level0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    const-string v1, "{files="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/Level0;->files:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 182
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 183
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
