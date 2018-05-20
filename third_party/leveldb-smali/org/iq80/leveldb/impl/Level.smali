.class public Lorg/iq80/leveldb/impl/Level;
.super Ljava/lang/Object;
.source "Level.java"

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

.field private final levelNumber:I

.field private final tableCache:Lorg/iq80/leveldb/impl/TableCache;


# direct methods
.method public constructor <init>(ILjava/util/List;Lorg/iq80/leveldb/impl/TableCache;Lorg/iq80/leveldb/impl/InternalKeyComparator;)V
    .locals 4
    .param p1, "levelNumber"    # I
    .param p3, "tableCache"    # Lorg/iq80/leveldb/impl/TableCache;
    .param p4, "internalKeyComparator"    # Lorg/iq80/leveldb/impl/InternalKeyComparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
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
    .local p2, "files":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    if-ltz p1, :cond_0

    move v0, v1

    :goto_0
    const-string v3, "levelNumber is negative"

    invoke-static {v0, v3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 50
    const-string v0, "files is null"

    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    const-string v0, "tableCache is null"

    invoke-static {p3, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    const-string v0, "internalKeyComparator is null"

    invoke-static {p4, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    invoke-static {p2}, Lcom/google/common/collect/Lists;->newArrayList(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/Level;->files:Ljava/util/List;

    .line 55
    iput-object p3, p0, Lorg/iq80/leveldb/impl/Level;->tableCache:Lorg/iq80/leveldb/impl/TableCache;

    .line 56
    iput-object p4, p0, Lorg/iq80/leveldb/impl/Level;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    .line 57
    if-ltz p1, :cond_1

    :goto_1
    const-string v0, "levelNumber is negative"

    invoke-static {v1, v0}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 58
    iput p1, p0, Lorg/iq80/leveldb/impl/Level;->levelNumber:I

    .line 59
    return-void

    :cond_0
    move v0, v2

    .line 49
    goto :goto_0

    :cond_1
    move v1, v2

    .line 57
    goto :goto_1
.end method

.method private static ceilingEntryIndex(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<TT;>;TT;",
            "Ljava/util/Comparator",
            "<TT;>;)I"
        }
    .end annotation

    .prologue
    .line 158
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    .local p1, "key":Ljava/lang/Object;, "TT;"
    .local p2, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<TT;>;"
    invoke-static {p0, p1, p2}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)I

    move-result v0

    .line 159
    .local v0, "insertionPoint":I
    if-gez v0, :cond_0

    .line 160
    add-int/lit8 v1, v0, 0x1

    neg-int v0, v1

    .line 162
    :cond_0
    return v0
.end method

.method public static createLevelConcatIterator(Lorg/iq80/leveldb/impl/TableCache;Ljava/util/List;Lorg/iq80/leveldb/impl/InternalKeyComparator;)Lorg/iq80/leveldb/util/LevelIterator;
    .locals 1
    .param p0, "tableCache"    # Lorg/iq80/leveldb/impl/TableCache;
    .param p2, "internalKeyComparator"    # Lorg/iq80/leveldb/impl/InternalKeyComparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/iq80/leveldb/impl/TableCache;",
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;",
            "Lorg/iq80/leveldb/impl/InternalKeyComparator;",
            ")",
            "Lorg/iq80/leveldb/util/LevelIterator;"
        }
    .end annotation

    .prologue
    .line 79
    .local p1, "files":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    new-instance v0, Lorg/iq80/leveldb/util/LevelIterator;

    invoke-direct {v0, p0, p1, p2}, Lorg/iq80/leveldb/util/LevelIterator;-><init>(Lorg/iq80/leveldb/impl/TableCache;Ljava/util/List;Lorg/iq80/leveldb/impl/InternalKeyComparator;)V

    return-object v0
.end method

.method private findFile(Lorg/iq80/leveldb/impl/InternalKey;)I
    .locals 5
    .param p1, "targetKey"    # Lorg/iq80/leveldb/impl/InternalKey;

    .prologue
    .line 177
    iget-object v3, p0, Lorg/iq80/leveldb/impl/Level;->files:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 178
    iget-object v3, p0, Lorg/iq80/leveldb/impl/Level;->files:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .line 200
    :cond_0
    return v2

    .line 182
    :cond_1
    const/4 v0, 0x0

    .line 183
    .local v0, "left":I
    iget-object v3, p0, Lorg/iq80/leveldb/impl/Level;->files:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v2, v3, -0x1

    .line 186
    .local v2, "right":I
    :goto_0
    if-ge v0, v2, :cond_0

    .line 187
    add-int v3, v0, v2

    div-int/lit8 v1, v3, 0x2

    .line 189
    .local v1, "mid":I
    iget-object v4, p0, Lorg/iq80/leveldb/impl/Level;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    iget-object v3, p0, Lorg/iq80/leveldb/impl/Level;->files:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/iq80/leveldb/impl/FileMetaData;

    invoke-virtual {v3}, Lorg/iq80/leveldb/impl/FileMetaData;->getLargest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v3

    invoke-virtual {v4, v3, p1}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->compare(Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)I

    move-result v3

    if-gez v3, :cond_2

    .line 192
    add-int/lit8 v0, v1, 0x1

    goto :goto_0

    .line 197
    :cond_2
    move v2, v1

    goto :goto_0
.end method


# virtual methods
.method public addFile(Lorg/iq80/leveldb/impl/FileMetaData;)V
    .locals 1
    .param p1, "fileMetaData"    # Lorg/iq80/leveldb/impl/FileMetaData;

    .prologue
    .line 206
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Level;->files:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 207
    return-void
.end method

.method public get(Lorg/iq80/leveldb/impl/LookupKey;Lorg/iq80/leveldb/impl/ReadStats;)Lorg/iq80/leveldb/impl/LookupResult;
    .locals 16
    .param p1, "key"    # Lorg/iq80/leveldb/impl/LookupKey;
    .param p2, "readStats"    # Lorg/iq80/leveldb/impl/ReadStats;

    .prologue
    .line 84
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/iq80/leveldb/impl/Level;->files:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 85
    const/4 v9, 0x0

    .line 153
    :goto_0
    return-object v9

    .line 88
    :cond_0
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/iq80/leveldb/impl/Level;->files:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    invoke-static {v9}, Lcom/google/common/collect/Lists;->newArrayListWithCapacity(I)Ljava/util/ArrayList;

    move-result-object v3

    .line 89
    .local v3, "fileMetaDataList":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    move-object/from16 v0, p0

    iget v9, v0, Lorg/iq80/leveldb/impl/Level;->levelNumber:I

    if-nez v9, :cond_2

    .line 90
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/iq80/leveldb/impl/Level;->files:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_1
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_5

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 91
    .local v2, "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/iq80/leveldb/impl/Level;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-virtual {v10}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->getUserComparator()Lorg/iq80/leveldb/table/UserComparator;

    move-result-object v10

    invoke-virtual/range {p1 .. p1}, Lorg/iq80/leveldb/impl/LookupKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v11

    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/FileMetaData;->getSmallest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v12

    invoke-virtual {v12}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v12

    invoke-interface {v10, v11, v12}, Lorg/iq80/leveldb/table/UserComparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v10

    if-ltz v10, :cond_1

    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/iq80/leveldb/impl/Level;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    .line 92
    invoke-virtual {v10}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->getUserComparator()Lorg/iq80/leveldb/table/UserComparator;

    move-result-object v10

    invoke-virtual/range {p1 .. p1}, Lorg/iq80/leveldb/impl/LookupKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v11

    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/FileMetaData;->getLargest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v12

    invoke-virtual {v12}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v12

    invoke-interface {v10, v11, v12}, Lorg/iq80/leveldb/table/UserComparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v10

    if-gtz v10, :cond_1

    .line 93
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 99
    .end local v2    # "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_2
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/iq80/leveldb/impl/Level;->files:Ljava/util/List;

    sget-object v10, Lorg/iq80/leveldb/impl/FileMetaData;->GET_LARGEST_USER_KEY:Lcom/google/common/base/Function;

    invoke-static {v9, v10}, Lcom/google/common/collect/Lists;->transform(Ljava/util/List;Lcom/google/common/base/Function;)Ljava/util/List;

    move-result-object v9

    invoke-virtual/range {p1 .. p1}, Lorg/iq80/leveldb/impl/LookupKey;->getInternalKey()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/iq80/leveldb/impl/Level;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-static {v9, v10, v11}, Lorg/iq80/leveldb/impl/Level;->ceilingEntryIndex(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)I

    move-result v4

    .line 102
    .local v4, "index":I
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/iq80/leveldb/impl/Level;->files:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    if-lt v4, v9, :cond_3

    .line 103
    const/4 v9, 0x0

    goto :goto_0

    .line 107
    :cond_3
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/iq80/leveldb/impl/Level;->files:Ljava/util/List;

    invoke-interface {v9, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 108
    .restart local v2    # "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/iq80/leveldb/impl/Level;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-virtual {v9}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->getUserComparator()Lorg/iq80/leveldb/table/UserComparator;

    move-result-object v9

    invoke-virtual/range {p1 .. p1}, Lorg/iq80/leveldb/impl/LookupKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v10

    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/FileMetaData;->getSmallest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v11

    invoke-virtual {v11}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v11

    invoke-interface {v9, v10, v11}, Lorg/iq80/leveldb/table/UserComparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v9

    if-gez v9, :cond_4

    .line 109
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 113
    :cond_4
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    .end local v2    # "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    .end local v4    # "index":I
    :cond_5
    const/4 v7, 0x0

    .line 117
    .local v7, "lastFileRead":Lorg/iq80/leveldb/impl/FileMetaData;
    const/4 v8, -0x1

    .line 118
    .local v8, "lastFileReadLevel":I
    invoke-virtual/range {p2 .. p2}, Lorg/iq80/leveldb/impl/ReadStats;->clear()V

    .line 119
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_6
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_a

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 120
    .restart local v2    # "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    if-eqz v7, :cond_7

    invoke-virtual/range {p2 .. p2}, Lorg/iq80/leveldb/impl/ReadStats;->getSeekFile()Lorg/iq80/leveldb/impl/FileMetaData;

    move-result-object v9

    if-nez v9, :cond_7

    .line 122
    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/iq80/leveldb/impl/ReadStats;->setSeekFile(Lorg/iq80/leveldb/impl/FileMetaData;)V

    .line 123
    move-object/from16 v0, p2

    invoke-virtual {v0, v8}, Lorg/iq80/leveldb/impl/ReadStats;->setSeekFileLevel(I)V

    .line 126
    :cond_7
    move-object v7, v2

    .line 127
    move-object/from16 v0, p0

    iget v8, v0, Lorg/iq80/leveldb/impl/Level;->levelNumber:I

    .line 130
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/iq80/leveldb/impl/Level;->tableCache:Lorg/iq80/leveldb/impl/TableCache;

    invoke-virtual {v9, v2}, Lorg/iq80/leveldb/impl/TableCache;->newIterator(Lorg/iq80/leveldb/impl/FileMetaData;)Lorg/iq80/leveldb/util/InternalTableIterator;

    move-result-object v6

    .line 133
    .local v6, "iterator":Lorg/iq80/leveldb/util/InternalTableIterator;
    invoke-virtual/range {p1 .. p1}, Lorg/iq80/leveldb/impl/LookupKey;->getInternalKey()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v9

    invoke-virtual {v6, v9}, Lorg/iq80/leveldb/util/InternalTableIterator;->seek(Ljava/lang/Object;)V

    .line 135
    invoke-virtual {v6}, Lorg/iq80/leveldb/util/InternalTableIterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_6

    .line 137
    invoke-virtual {v6}, Lorg/iq80/leveldb/util/InternalTableIterator;->next()Ljava/util/Map$Entry;

    move-result-object v1

    .line 138
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/util/Slice;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/iq80/leveldb/impl/InternalKey;

    .line 139
    .local v5, "internalKey":Lorg/iq80/leveldb/impl/InternalKey;
    if-eqz v5, :cond_8

    const/4 v9, 0x1

    :goto_2
    const-string v11, "Corrupt key for %s"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-virtual/range {p1 .. p1}, Lorg/iq80/leveldb/impl/LookupKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v14

    sget-object v15, Lcom/google/common/base/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v14, v15}, Lorg/iq80/leveldb/util/Slice;->toString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v9, v11, v12}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 142
    invoke-virtual/range {p1 .. p1}, Lorg/iq80/leveldb/impl/LookupKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v9

    invoke-virtual {v5}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v11

    invoke-virtual {v9, v11}, Lorg/iq80/leveldb/util/Slice;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 143
    invoke-virtual {v5}, Lorg/iq80/leveldb/impl/InternalKey;->getValueType()Lorg/iq80/leveldb/impl/ValueType;

    move-result-object v9

    sget-object v11, Lorg/iq80/leveldb/impl/ValueType;->DELETION:Lorg/iq80/leveldb/impl/ValueType;

    if-ne v9, v11, :cond_9

    .line 144
    invoke-static/range {p1 .. p1}, Lorg/iq80/leveldb/impl/LookupResult;->deleted(Lorg/iq80/leveldb/impl/LookupKey;)Lorg/iq80/leveldb/impl/LookupResult;

    move-result-object v9

    goto/16 :goto_0

    .line 139
    :cond_8
    const/4 v9, 0x0

    goto :goto_2

    .line 146
    :cond_9
    invoke-virtual {v5}, Lorg/iq80/leveldb/impl/InternalKey;->getValueType()Lorg/iq80/leveldb/impl/ValueType;

    move-result-object v9

    sget-object v11, Lorg/iq80/leveldb/impl/ValueType;->VALUE:Lorg/iq80/leveldb/impl/ValueType;

    if-ne v9, v11, :cond_6

    .line 147
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/iq80/leveldb/util/Slice;

    move-object/from16 v0, p1

    invoke-static {v0, v9}, Lorg/iq80/leveldb/impl/LookupResult;->ok(Lorg/iq80/leveldb/impl/LookupKey;Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/impl/LookupResult;

    move-result-object v9

    goto/16 :goto_0

    .line 153
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/util/Slice;>;"
    .end local v2    # "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    .end local v5    # "internalKey":Lorg/iq80/leveldb/impl/InternalKey;
    .end local v6    # "iterator":Lorg/iq80/leveldb/util/InternalTableIterator;
    :cond_a
    const/4 v9, 0x0

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
    .line 68
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Level;->files:Ljava/util/List;

    return-object v0
.end method

.method public getLevelNumber()I
    .locals 1

    .prologue
    .line 63
    iget v0, p0, Lorg/iq80/leveldb/impl/Level;->levelNumber:I

    return v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 39
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/Level;->iterator()Lorg/iq80/leveldb/util/LevelIterator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic iterator()Lorg/iq80/leveldb/impl/SeekingIterator;
    .locals 1

    .prologue
    .line 39
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/Level;->iterator()Lorg/iq80/leveldb/util/LevelIterator;

    move-result-object v0

    return-object v0
.end method

.method public iterator()Lorg/iq80/leveldb/util/LevelIterator;
    .locals 3

    .prologue
    .line 74
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Level;->tableCache:Lorg/iq80/leveldb/impl/TableCache;

    iget-object v1, p0, Lorg/iq80/leveldb/impl/Level;->files:Ljava/util/List;

    iget-object v2, p0, Lorg/iq80/leveldb/impl/Level;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-static {v0, v1, v2}, Lorg/iq80/leveldb/impl/Level;->createLevelConcatIterator(Lorg/iq80/leveldb/impl/TableCache;Ljava/util/List;Lorg/iq80/leveldb/impl/InternalKeyComparator;)Lorg/iq80/leveldb/util/LevelIterator;

    move-result-object v0

    return-object v0
.end method

.method public someFileOverlapsRange(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)Z
    .locals 6
    .param p1, "smallestUserKey"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "largestUserKey"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 167
    new-instance v1, Lorg/iq80/leveldb/impl/InternalKey;

    const-wide v4, 0xffffffffffffffL

    sget-object v3, Lorg/iq80/leveldb/impl/ValueType;->VALUE:Lorg/iq80/leveldb/impl/ValueType;

    invoke-direct {v1, p1, v4, v5, v3}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;JLorg/iq80/leveldb/impl/ValueType;)V

    .line 168
    .local v1, "smallestInternalKey":Lorg/iq80/leveldb/impl/InternalKey;
    invoke-direct {p0, v1}, Lorg/iq80/leveldb/impl/Level;->findFile(Lorg/iq80/leveldb/impl/InternalKey;)I

    move-result v0

    .line 170
    .local v0, "index":I
    iget-object v3, p0, Lorg/iq80/leveldb/impl/Level;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-virtual {v3}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->getUserComparator()Lorg/iq80/leveldb/table/UserComparator;

    move-result-object v2

    .line 171
    .local v2, "userComparator":Lorg/iq80/leveldb/table/UserComparator;
    iget-object v3, p0, Lorg/iq80/leveldb/impl/Level;->files:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_0

    iget-object v3, p0, Lorg/iq80/leveldb/impl/Level;->files:Ljava/util/List;

    .line 172
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

    .line 171
    :goto_0
    return v3

    .line 172
    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 212
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 213
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "Level"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    const-string v1, "{levelNumber="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/iq80/leveldb/impl/Level;->levelNumber:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 215
    const-string v1, ", files="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/Level;->files:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 216
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 217
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
