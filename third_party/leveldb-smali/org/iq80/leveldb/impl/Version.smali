.class public Lorg/iq80/leveldb/impl/Version;
.super Ljava/lang/Object;
.source "Version.java"

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
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private compactionLevel:I

.field private compactionScore:D

.field private fileToCompact:Lorg/iq80/leveldb/impl/FileMetaData;

.field private fileToCompactLevel:I

.field private final level0:Lorg/iq80/leveldb/impl/Level0;

.field private final levels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/Level;",
            ">;"
        }
    .end annotation
.end field

.field private final retained:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final versionSet:Lorg/iq80/leveldb/impl/VersionSet;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    const-class v0, Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/iq80/leveldb/impl/Version;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lorg/iq80/leveldb/impl/VersionSet;)V
    .locals 7
    .param p1, "versionSet"    # Lorg/iq80/leveldb/impl/VersionSet;

    .prologue
    const/4 v4, 0x1

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v3, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v3, v4}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v3, p0, Lorg/iq80/leveldb/impl/Version;->retained:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 60
    iput-object p1, p0, Lorg/iq80/leveldb/impl/Version;->versionSet:Lorg/iq80/leveldb/impl/VersionSet;

    .line 61
    const-string v3, "levels must be at least 2"

    invoke-static {v4, v3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 63
    new-instance v3, Lorg/iq80/leveldb/impl/Level0;

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v4

    invoke-direct {p0}, Lorg/iq80/leveldb/impl/Version;->getTableCache()Lorg/iq80/leveldb/impl/TableCache;

    move-result-object v5

    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/Version;->getInternalKeyComparator()Lorg/iq80/leveldb/impl/InternalKeyComparator;

    move-result-object v6

    invoke-direct {v3, v4, v5, v6}, Lorg/iq80/leveldb/impl/Level0;-><init>(Ljava/util/List;Lorg/iq80/leveldb/impl/TableCache;Lorg/iq80/leveldb/impl/InternalKeyComparator;)V

    iput-object v3, p0, Lorg/iq80/leveldb/impl/Version;->level0:Lorg/iq80/leveldb/impl/Level0;

    .line 65
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v0

    .line 66
    .local v0, "builder":Lcom/google/common/collect/ImmutableList$Builder;, "Lcom/google/common/collect/ImmutableList$Builder<Lorg/iq80/leveldb/impl/Level;>;"
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_0
    const/4 v3, 0x7

    if-ge v2, v3, :cond_0

    .line 67
    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v1

    .line 68
    .local v1, "files":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    new-instance v3, Lorg/iq80/leveldb/impl/Level;

    invoke-direct {p0}, Lorg/iq80/leveldb/impl/Version;->getTableCache()Lorg/iq80/leveldb/impl/TableCache;

    move-result-object v4

    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/Version;->getInternalKeyComparator()Lorg/iq80/leveldb/impl/InternalKeyComparator;

    move-result-object v5

    invoke-direct {v3, v2, v1, v4, v5}, Lorg/iq80/leveldb/impl/Level;-><init>(ILjava/util/List;Lorg/iq80/leveldb/impl/TableCache;Lorg/iq80/leveldb/impl/InternalKeyComparator;)V

    invoke-virtual {v0, v3}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    .line 66
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 70
    .end local v1    # "files":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    :cond_0
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v3

    iput-object v3, p0, Lorg/iq80/leveldb/impl/Version;->levels:Ljava/util/List;

    .line 72
    return-void
.end method

.method private getTableCache()Lorg/iq80/leveldb/impl/TableCache;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Version;->versionSet:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/VersionSet;->getTableCache()Lorg/iq80/leveldb/impl/TableCache;

    move-result-object v0

    return-object v0
.end method

.method private updateStats(ILorg/iq80/leveldb/impl/FileMetaData;)Z
    .locals 2
    .param p1, "seekFileLevel"    # I
    .param p2, "seekFile"    # Lorg/iq80/leveldb/impl/FileMetaData;

    .prologue
    const/4 v0, 0x0

    .line 265
    if-nez p2, :cond_1

    .line 275
    :cond_0
    :goto_0
    return v0

    .line 269
    :cond_1
    invoke-virtual {p2}, Lorg/iq80/leveldb/impl/FileMetaData;->decrementAllowedSeeks()V

    .line 270
    invoke-virtual {p2}, Lorg/iq80/leveldb/impl/FileMetaData;->getAllowedSeeks()I

    move-result v1

    if-gtz v1, :cond_0

    iget-object v1, p0, Lorg/iq80/leveldb/impl/Version;->fileToCompact:Lorg/iq80/leveldb/impl/FileMetaData;

    if-nez v1, :cond_0

    .line 271
    iput-object p2, p0, Lorg/iq80/leveldb/impl/Version;->fileToCompact:Lorg/iq80/leveldb/impl/FileMetaData;

    .line 272
    iput p1, p0, Lorg/iq80/leveldb/impl/Version;->fileToCompactLevel:I

    .line 273
    const/4 v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public addFile(ILorg/iq80/leveldb/impl/FileMetaData;)V
    .locals 2
    .param p1, "level"    # I
    .param p2, "fileMetaData"    # Lorg/iq80/leveldb/impl/FileMetaData;

    .prologue
    .line 255
    if-nez p1, :cond_0

    .line 256
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Version;->level0:Lorg/iq80/leveldb/impl/Level0;

    invoke-virtual {v0, p2}, Lorg/iq80/leveldb/impl/Level0;->addFile(Lorg/iq80/leveldb/impl/FileMetaData;)V

    .line 261
    :goto_0
    return-void

    .line 259
    :cond_0
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Version;->levels:Ljava/util/List;

    add-int/lit8 v1, p1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/Level;

    invoke-virtual {v0, p2}, Lorg/iq80/leveldb/impl/Level;->addFile(Lorg/iq80/leveldb/impl/FileMetaData;)V

    goto :goto_0
.end method

.method public assertNoOverlappingFiles()V
    .locals 2

    .prologue
    .line 76
    const/4 v0, 0x1

    .local v0, "level":I
    :goto_0
    const/4 v1, 0x7

    if-ge v0, v1, :cond_0

    .line 77
    invoke-virtual {p0, v0}, Lorg/iq80/leveldb/impl/Version;->assertNoOverlappingFiles(I)V

    .line 76
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 79
    :cond_0
    return-void
.end method

.method public assertNoOverlappingFiles(I)V
    .locals 14
    .param p1, "level"    # I

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 83
    if-lez p1, :cond_2

    .line 84
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/Version;->getFiles()Lcom/google/common/collect/Multimap;

    move-result-object v3

    invoke-interface {v3}, Lcom/google/common/collect/Multimap;->asMap()Ljava/util/Map;

    move-result-object v3

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v3, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    .line 85
    .local v1, "files":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    if-eqz v1, :cond_2

    .line 86
    const-wide/16 v4, 0x0

    .line 87
    .local v4, "previousFileNumber":J
    const/4 v2, 0x0

    .line 88
    .local v2, "previousEnd":Lorg/iq80/leveldb/impl/InternalKey;
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 89
    .local v0, "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    if-eqz v2, :cond_0

    .line 90
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/Version;->getInternalKeyComparator()Lorg/iq80/leveldb/impl/InternalKeyComparator;

    move-result-object v3

    .line 92
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getSmallest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v9

    .line 90
    invoke-virtual {v3, v2, v9}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->compare(Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)I

    move-result v3

    if-gez v3, :cond_1

    move v3, v6

    :goto_1
    const-string v9, "Overlapping files %s and %s in level %s"

    const/4 v10, 0x3

    new-array v10, v10, [Ljava/lang/Object;

    .line 93
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v10, v7

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getNumber()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v10, v6

    const/4 v11, 0x2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    .line 90
    invoke-static {v3, v9, v10}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 96
    :cond_0
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getNumber()J

    move-result-wide v4

    .line 97
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getLargest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v2

    .line 98
    goto :goto_0

    :cond_1
    move v3, v7

    .line 90
    goto :goto_1

    .line 101
    .end local v0    # "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    .end local v1    # "files":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    .end local v2    # "previousEnd":Lorg/iq80/leveldb/impl/InternalKey;
    .end local v4    # "previousFileNumber":J
    :cond_2
    return-void
.end method

.method public get(Lorg/iq80/leveldb/impl/LookupKey;)Lorg/iq80/leveldb/impl/LookupResult;
    .locals 5
    .param p1, "key"    # Lorg/iq80/leveldb/impl/LookupKey;

    .prologue
    .line 167
    new-instance v2, Lorg/iq80/leveldb/impl/ReadStats;

    invoke-direct {v2}, Lorg/iq80/leveldb/impl/ReadStats;-><init>()V

    .line 168
    .local v2, "readStats":Lorg/iq80/leveldb/impl/ReadStats;
    iget-object v3, p0, Lorg/iq80/leveldb/impl/Version;->level0:Lorg/iq80/leveldb/impl/Level0;

    invoke-virtual {v3, p1, v2}, Lorg/iq80/leveldb/impl/Level0;->get(Lorg/iq80/leveldb/impl/LookupKey;Lorg/iq80/leveldb/impl/ReadStats;)Lorg/iq80/leveldb/impl/LookupResult;

    move-result-object v1

    .line 169
    .local v1, "lookupResult":Lorg/iq80/leveldb/impl/LookupResult;
    if-nez v1, :cond_1

    .line 170
    iget-object v3, p0, Lorg/iq80/leveldb/impl/Version;->levels:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/Level;

    .line 171
    .local v0, "level":Lorg/iq80/leveldb/impl/Level;
    invoke-virtual {v0, p1, v2}, Lorg/iq80/leveldb/impl/Level;->get(Lorg/iq80/leveldb/impl/LookupKey;Lorg/iq80/leveldb/impl/ReadStats;)Lorg/iq80/leveldb/impl/LookupResult;

    move-result-object v1

    .line 172
    if-eqz v1, :cond_0

    .line 177
    .end local v0    # "level":Lorg/iq80/leveldb/impl/Level;
    :cond_1
    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/ReadStats;->getSeekFileLevel()I

    move-result v3

    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/ReadStats;->getSeekFile()Lorg/iq80/leveldb/impl/FileMetaData;

    move-result-object v4

    invoke-direct {p0, v3, v4}, Lorg/iq80/leveldb/impl/Version;->updateStats(ILorg/iq80/leveldb/impl/FileMetaData;)Z

    .line 178
    return-object v1
.end method

.method public getApproximateOffsetOf(Lorg/iq80/leveldb/impl/InternalKey;)J
    .locals 8
    .param p1, "key"    # Lorg/iq80/leveldb/impl/InternalKey;

    .prologue
    .line 290
    const-wide/16 v2, 0x0

    .line 291
    .local v2, "result":J
    const/4 v1, 0x0

    .local v1, "level":I
    :goto_0
    const/4 v4, 0x7

    if-ge v1, v4, :cond_4

    .line 292
    invoke-virtual {p0, v1}, Lorg/iq80/leveldb/impl/Version;->getFiles(I)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 293
    .local v0, "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/Version;->getInternalKeyComparator()Lorg/iq80/leveldb/impl/InternalKeyComparator;

    move-result-object v5

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getLargest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v6

    invoke-virtual {v5, v6, p1}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->compare(Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)I

    move-result v5

    if-gtz v5, :cond_1

    .line 295
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getFileSize()J

    move-result-wide v6

    add-long/2addr v2, v6

    goto :goto_1

    .line 297
    :cond_1
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/Version;->getInternalKeyComparator()Lorg/iq80/leveldb/impl/InternalKeyComparator;

    move-result-object v5

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getSmallest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v6

    invoke-virtual {v5, v6, p1}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->compare(Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)I

    move-result v5

    if-lez v5, :cond_3

    .line 299
    if-lez v1, :cond_0

    .line 291
    .end local v0    # "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 309
    .restart local v0    # "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_3
    invoke-direct {p0}, Lorg/iq80/leveldb/impl/Version;->getTableCache()Lorg/iq80/leveldb/impl/TableCache;

    move-result-object v5

    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/InternalKey;->encode()Lorg/iq80/leveldb/util/Slice;

    move-result-object v6

    invoke-virtual {v5, v0, v6}, Lorg/iq80/leveldb/impl/TableCache;->getApproximateOffsetOf(Lorg/iq80/leveldb/impl/FileMetaData;Lorg/iq80/leveldb/util/Slice;)J

    move-result-wide v6

    add-long/2addr v2, v6

    goto :goto_1

    .line 313
    .end local v0    # "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_4
    return-wide v2
.end method

.method public declared-synchronized getCompactionLevel()I
    .locals 1

    .prologue
    .line 115
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lorg/iq80/leveldb/impl/Version;->compactionLevel:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getCompactionScore()D
    .locals 2

    .prologue
    .line 125
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/iq80/leveldb/impl/Version;->compactionScore:D
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getFileToCompact()Lorg/iq80/leveldb/impl/FileMetaData;
    .locals 1

    .prologue
    .line 280
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Version;->fileToCompact:Lorg/iq80/leveldb/impl/FileMetaData;

    return-object v0
.end method

.method public getFileToCompactLevel()I
    .locals 1

    .prologue
    .line 285
    iget v0, p0, Lorg/iq80/leveldb/impl/Version;->fileToCompactLevel:I

    return v0
.end method

.method public getFiles()Lcom/google/common/collect/Multimap;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multimap",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 232
    invoke-static {}, Lcom/google/common/collect/ImmutableMultimap;->builder()Lcom/google/common/collect/ImmutableMultimap$Builder;

    move-result-object v0

    .line 233
    .local v0, "builder":Lcom/google/common/collect/ImmutableMultimap$Builder;, "Lcom/google/common/collect/ImmutableMultimap$Builder<Ljava/lang/Integer;Lorg/iq80/leveldb/impl/FileMetaData;>;"
    invoke-static {}, Lcom/google/common/collect/Ordering;->natural()Lcom/google/common/collect/Ordering;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/common/collect/ImmutableMultimap$Builder;->orderKeysBy(Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableMultimap$Builder;

    move-result-object v0

    .line 235
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-object v3, p0, Lorg/iq80/leveldb/impl/Version;->level0:Lorg/iq80/leveldb/impl/Level0;

    invoke-virtual {v3}, Lorg/iq80/leveldb/impl/Level0;->getFiles()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/google/common/collect/ImmutableMultimap$Builder;->putAll(Ljava/lang/Object;Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableMultimap$Builder;

    .line 237
    iget-object v2, p0, Lorg/iq80/leveldb/impl/Version;->levels:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/impl/Level;

    .line 238
    .local v1, "level":Lorg/iq80/leveldb/impl/Level;
    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/Level;->getLevelNumber()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/Level;->getFiles()Ljava/util/List;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/google/common/collect/ImmutableMultimap$Builder;->putAll(Ljava/lang/Object;Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableMultimap$Builder;

    goto :goto_0

    .line 240
    .end local v1    # "level":Lorg/iq80/leveldb/impl/Level;
    :cond_0
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMultimap$Builder;->build()Lcom/google/common/collect/ImmutableMultimap;

    move-result-object v2

    return-object v2
.end method

.method public getFiles(I)Ljava/util/List;
    .locals 2
    .param p1, "level"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 245
    if-nez p1, :cond_0

    .line 246
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Version;->level0:Lorg/iq80/leveldb/impl/Level0;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/Level0;->getFiles()Ljava/util/List;

    move-result-object v0

    .line 249
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Version;->levels:Ljava/util/List;

    add-int/lit8 v1, p1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/Level;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/Level;->getFiles()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public final getInternalKeyComparator()Lorg/iq80/leveldb/impl/InternalKeyComparator;
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Version;->versionSet:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/VersionSet;->getInternalKeyComparator()Lorg/iq80/leveldb/impl/InternalKeyComparator;

    move-result-object v0

    return-object v0
.end method

.method getLevel0Files()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/util/InternalTableIterator;",
            ">;"
        }
    .end annotation

    .prologue
    .line 144
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v0

    .line 145
    .local v0, "builder":Lcom/google/common/collect/ImmutableList$Builder;, "Lcom/google/common/collect/ImmutableList$Builder<Lorg/iq80/leveldb/util/InternalTableIterator;>;"
    iget-object v2, p0, Lorg/iq80/leveldb/impl/Version;->level0:Lorg/iq80/leveldb/impl/Level0;

    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/Level0;->getFiles()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 146
    .local v1, "file":Lorg/iq80/leveldb/impl/FileMetaData;
    invoke-direct {p0}, Lorg/iq80/leveldb/impl/Version;->getTableCache()Lorg/iq80/leveldb/impl/TableCache;

    move-result-object v3

    invoke-virtual {v3, v1}, Lorg/iq80/leveldb/impl/TableCache;->newIterator(Lorg/iq80/leveldb/impl/FileMetaData;)Lorg/iq80/leveldb/util/InternalTableIterator;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    goto :goto_0

    .line 148
    .end local v1    # "file":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_0
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    return-object v2
.end method

.method getLevelIterators()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/util/LevelIterator;",
            ">;"
        }
    .end annotation

    .prologue
    .line 153
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v0

    .line 154
    .local v0, "builder":Lcom/google/common/collect/ImmutableList$Builder;, "Lcom/google/common/collect/ImmutableList$Builder<Lorg/iq80/leveldb/util/LevelIterator;>;"
    iget-object v2, p0, Lorg/iq80/leveldb/impl/Version;->levels:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/impl/Level;

    .line 155
    .local v1, "level":Lorg/iq80/leveldb/impl/Level;
    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/Level;->getFiles()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 156
    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/Level;->iterator()Lorg/iq80/leveldb/util/LevelIterator;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    goto :goto_0

    .line 159
    .end local v1    # "level":Lorg/iq80/leveldb/impl/Level;
    :cond_1
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    return-object v2
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 334
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Version;->retained:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 44
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/Version;->iterator()Lorg/iq80/leveldb/util/MergingIterator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic iterator()Lorg/iq80/leveldb/impl/SeekingIterator;
    .locals 1

    .prologue
    .line 44
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/Version;->iterator()Lorg/iq80/leveldb/util/MergingIterator;

    move-result-object v0

    return-object v0
.end method

.method public iterator()Lorg/iq80/leveldb/util/MergingIterator;
    .locals 4

    .prologue
    .line 136
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v0

    .line 137
    .local v0, "builder":Lcom/google/common/collect/ImmutableList$Builder;, "Lcom/google/common/collect/ImmutableList$Builder<Lorg/iq80/leveldb/util/InternalIterator;>;"
    iget-object v1, p0, Lorg/iq80/leveldb/impl/Version;->level0:Lorg/iq80/leveldb/impl/Level0;

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/Level0;->iterator()Lorg/iq80/leveldb/util/Level0Iterator;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    .line 138
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/Version;->getLevelIterators()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableList$Builder;->addAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableList$Builder;

    .line 139
    new-instance v1, Lorg/iq80/leveldb/util/MergingIterator;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/Version;->getInternalKeyComparator()Lorg/iq80/leveldb/impl/InternalKeyComparator;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/iq80/leveldb/util/MergingIterator;-><init>(Ljava/util/List;Ljava/util/Comparator;)V

    return-object v1
.end method

.method public numberOfFilesInLevel(I)I
    .locals 2
    .param p1, "level"    # I

    .prologue
    .line 222
    if-nez p1, :cond_0

    .line 223
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Version;->level0:Lorg/iq80/leveldb/impl/Level0;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/Level0;->getFiles()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 226
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Version;->levels:Ljava/util/List;

    add-int/lit8 v1, p1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/Level;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/Level;->getFiles()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0
.end method

.method public numberOfLevels()I
    .locals 1

    .prologue
    .line 217
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Version;->levels:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public overlapInLevel(ILorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)Z
    .locals 2
    .param p1, "level"    # I
    .param p2, "smallestUserKey"    # Lorg/iq80/leveldb/util/Slice;
    .param p3, "largestUserKey"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 205
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Version;->levels:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const-string v1, "Invalid level"

    invoke-static {p1, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndex(IILjava/lang/String;)I

    .line 206
    const-string v0, "smallestUserKey is null"

    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    const-string v0, "largestUserKey is null"

    invoke-static {p3, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    if-nez p1, :cond_0

    .line 210
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Version;->level0:Lorg/iq80/leveldb/impl/Level0;

    invoke-virtual {v0, p2, p3}, Lorg/iq80/leveldb/impl/Level0;->someFileOverlapsRange(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)Z

    move-result v0

    .line 212
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Version;->levels:Ljava/util/List;

    add-int/lit8 v1, p1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/Level;

    invoke-virtual {v0, p2, p3}, Lorg/iq80/leveldb/impl/Level;->someFileOverlapsRange(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)Z

    move-result v0

    goto :goto_0
.end method

.method pickLevelForMemTableOutput(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)I
    .locals 8
    .param p1, "smallestUserKey"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "largestUserKey"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 183
    const/4 v0, 0x0

    .line 184
    .local v0, "level":I
    const/4 v3, 0x0

    invoke-virtual {p0, v3, p1, p2}, Lorg/iq80/leveldb/impl/Version;->overlapInLevel(ILorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 187
    new-instance v2, Lorg/iq80/leveldb/impl/InternalKey;

    const-wide v6, 0xffffffffffffffL

    sget-object v3, Lorg/iq80/leveldb/impl/ValueType;->VALUE:Lorg/iq80/leveldb/impl/ValueType;

    invoke-direct {v2, p1, v6, v7, v3}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;JLorg/iq80/leveldb/impl/ValueType;)V

    .line 188
    .local v2, "start":Lorg/iq80/leveldb/impl/InternalKey;
    new-instance v1, Lorg/iq80/leveldb/impl/InternalKey;

    const-wide/16 v6, 0x0

    sget-object v3, Lorg/iq80/leveldb/impl/ValueType;->VALUE:Lorg/iq80/leveldb/impl/ValueType;

    invoke-direct {v1, p2, v6, v7, v3}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;JLorg/iq80/leveldb/impl/ValueType;)V

    .line 189
    .local v1, "limit":Lorg/iq80/leveldb/impl/InternalKey;
    :goto_0
    const/4 v3, 0x2

    if-ge v0, v3, :cond_0

    .line 190
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p0, v3, p1, p2}, Lorg/iq80/leveldb/impl/Version;->overlapInLevel(ILorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 200
    .end local v1    # "limit":Lorg/iq80/leveldb/impl/InternalKey;
    .end local v2    # "start":Lorg/iq80/leveldb/impl/InternalKey;
    :cond_0
    return v0

    .line 193
    .restart local v1    # "limit":Lorg/iq80/leveldb/impl/InternalKey;
    .restart local v2    # "start":Lorg/iq80/leveldb/impl/InternalKey;
    :cond_1
    iget-object v3, p0, Lorg/iq80/leveldb/impl/Version;->versionSet:Lorg/iq80/leveldb/impl/VersionSet;

    add-int/lit8 v6, v0, 0x2

    invoke-virtual {v3, v6, v2, v1}, Lorg/iq80/leveldb/impl/VersionSet;->getOverlappingInputs(ILorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Lorg/iq80/leveldb/impl/Compaction;->totalFileSize(Ljava/util/List;)J

    move-result-wide v4

    .line 194
    .local v4, "sum":J
    const-wide/32 v6, 0x1400000

    cmp-long v3, v4, v6

    if-gtz v3, :cond_0

    .line 197
    add-int/lit8 v0, v0, 0x1

    .line 198
    goto :goto_0
.end method

.method public release()V
    .locals 3

    .prologue
    .line 324
    iget-object v1, p0, Lorg/iq80/leveldb/impl/Version;->retained:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    .line 325
    .local v0, "now":I
    sget-boolean v1, Lorg/iq80/leveldb/impl/Version;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    if-gez v0, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "Version was released after it was disposed."

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 326
    :cond_0
    if-nez v0, :cond_1

    .line 328
    iget-object v1, p0, Lorg/iq80/leveldb/impl/Version;->versionSet:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v1, p0}, Lorg/iq80/leveldb/impl/VersionSet;->removeVersion(Lorg/iq80/leveldb/impl/Version;)V

    .line 330
    :cond_1
    return-void
.end method

.method public retain()V
    .locals 3

    .prologue
    .line 318
    iget-object v1, p0, Lorg/iq80/leveldb/impl/Version;->retained:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    .line 319
    .local v0, "was":I
    sget-boolean v1, Lorg/iq80/leveldb/impl/Version;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    if-gtz v0, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "Version was retain after it was disposed."

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 320
    :cond_0
    return-void
.end method

.method public declared-synchronized setCompactionLevel(I)V
    .locals 1
    .param p1, "compactionLevel"    # I

    .prologue
    .line 120
    monitor-enter p0

    :try_start_0
    iput p1, p0, Lorg/iq80/leveldb/impl/Version;->compactionLevel:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 121
    monitor-exit p0

    return-void

    .line 120
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setCompactionScore(D)V
    .locals 1
    .param p1, "compactionScore"    # D

    .prologue
    .line 130
    monitor-enter p0

    :try_start_0
    iput-wide p1, p0, Lorg/iq80/leveldb/impl/Version;->compactionScore:D
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 131
    monitor-exit p0

    return-void

    .line 130
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
