.class Lorg/iq80/leveldb/impl/VersionSet$Builder;
.super Ljava/lang/Object;
.source "VersionSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/impl/VersionSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;,
        Lorg/iq80/leveldb/impl/VersionSet$Builder$FileMetaDataBySmallestKey;
    }
.end annotation


# instance fields
.field private final baseVersion:Lorg/iq80/leveldb/impl/Version;

.field private final levels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;",
            ">;"
        }
    .end annotation
.end field

.field private final versionSet:Lorg/iq80/leveldb/impl/VersionSet;


# direct methods
.method private constructor <init>(Lorg/iq80/leveldb/impl/VersionSet;Lorg/iq80/leveldb/impl/Version;)V
    .locals 4
    .param p1, "versionSet"    # Lorg/iq80/leveldb/impl/VersionSet;
    .param p2, "baseVersion"    # Lorg/iq80/leveldb/impl/Version;

    .prologue
    .line 691
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 692
    iput-object p1, p0, Lorg/iq80/leveldb/impl/VersionSet$Builder;->versionSet:Lorg/iq80/leveldb/impl/VersionSet;

    .line 693
    iput-object p2, p0, Lorg/iq80/leveldb/impl/VersionSet$Builder;->baseVersion:Lorg/iq80/leveldb/impl/Version;

    .line 695
    invoke-virtual {p2}, Lorg/iq80/leveldb/impl/Version;->numberOfLevels()I

    move-result v1

    invoke-static {v1}, Lcom/google/common/collect/Lists;->newArrayListWithCapacity(I)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lorg/iq80/leveldb/impl/VersionSet$Builder;->levels:Ljava/util/List;

    .line 696
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p2}, Lorg/iq80/leveldb/impl/Version;->numberOfLevels()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 697
    iget-object v1, p0, Lorg/iq80/leveldb/impl/VersionSet$Builder;->levels:Ljava/util/List;

    new-instance v2, Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;

    # getter for: Lorg/iq80/leveldb/impl/VersionSet;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/VersionSet;->access$100(Lorg/iq80/leveldb/impl/VersionSet;)Lorg/iq80/leveldb/impl/InternalKeyComparator;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;-><init>(Lorg/iq80/leveldb/impl/InternalKeyComparator;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 696
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 699
    :cond_0
    return-void
.end method

.method synthetic constructor <init>(Lorg/iq80/leveldb/impl/VersionSet;Lorg/iq80/leveldb/impl/Version;Lorg/iq80/leveldb/impl/VersionSet$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/iq80/leveldb/impl/VersionSet;
    .param p2, "x1"    # Lorg/iq80/leveldb/impl/Version;
    .param p3, "x2"    # Lorg/iq80/leveldb/impl/VersionSet$1;

    .prologue
    .line 684
    invoke-direct {p0, p1, p2}, Lorg/iq80/leveldb/impl/VersionSet$Builder;-><init>(Lorg/iq80/leveldb/impl/VersionSet;Lorg/iq80/leveldb/impl/Version;)V

    return-void
.end method

.method private maybeAddFile(Lorg/iq80/leveldb/impl/Version;ILorg/iq80/leveldb/impl/FileMetaData;)V
    .locals 10
    .param p1, "version"    # Lorg/iq80/leveldb/impl/Version;
    .param p2, "level"    # I
    .param p3, "fileMetaData"    # Lorg/iq80/leveldb/impl/FileMetaData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 790
    iget-object v2, p0, Lorg/iq80/leveldb/impl/VersionSet$Builder;->levels:Ljava/util/List;

    invoke-interface {v2, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;

    # getter for: Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;->deletedFiles:Ljava/util/Set;
    invoke-static {v2}, Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;->access$300(Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;)Ljava/util/Set;

    move-result-object v2

    invoke-virtual {p3}, Lorg/iq80/leveldb/impl/FileMetaData;->getNumber()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 809
    :goto_0
    return-void

    .line 794
    :cond_0
    invoke-virtual {p1, p2}, Lorg/iq80/leveldb/impl/Version;->getFiles(I)Ljava/util/List;

    move-result-object v0

    .line 795
    .local v0, "files":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    if-lez p2, :cond_2

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 797
    iget-object v2, p0, Lorg/iq80/leveldb/impl/VersionSet$Builder;->versionSet:Lorg/iq80/leveldb/impl/VersionSet;

    # getter for: Lorg/iq80/leveldb/impl/VersionSet;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;
    invoke-static {v2}, Lorg/iq80/leveldb/impl/VersionSet;->access$100(Lorg/iq80/leveldb/impl/VersionSet;)Lorg/iq80/leveldb/impl/InternalKeyComparator;

    move-result-object v5

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/iq80/leveldb/impl/FileMetaData;

    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/FileMetaData;->getLargest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v2

    invoke-virtual {p3}, Lorg/iq80/leveldb/impl/FileMetaData;->getSmallest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v6

    invoke-virtual {v5, v2, v6}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->compare(Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)I

    move-result v2

    if-ltz v2, :cond_1

    move v1, v3

    .line 798
    .local v1, "filesOverlap":Z
    :goto_1
    if-eqz v1, :cond_2

    .line 802
    new-instance v5, Ljava/io/IOException;

    const-string v6, "Compaction is obsolete: Overlapping files %s and %s in level %s"

    const/4 v2, 0x3

    new-array v7, v2, [Ljava/lang/Object;

    .line 803
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/iq80/leveldb/impl/FileMetaData;

    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/FileMetaData;->getNumber()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v7, v4

    .line 804
    invoke-virtual {p3}, Lorg/iq80/leveldb/impl/FileMetaData;->getNumber()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v7, v3

    const/4 v2, 0x2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v7, v2

    .line 802
    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v5, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .end local v1    # "filesOverlap":Z
    :cond_1
    move v1, v4

    .line 797
    goto :goto_1

    .line 807
    :cond_2
    invoke-virtual {p1, p2, p3}, Lorg/iq80/leveldb/impl/Version;->addFile(ILorg/iq80/leveldb/impl/FileMetaData;)V

    goto :goto_0
.end method


# virtual methods
.method public apply(Lorg/iq80/leveldb/impl/VersionEdit;)V
    .locals 14
    .param p1, "edit"    # Lorg/iq80/leveldb/impl/VersionEdit;

    .prologue
    .line 707
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/VersionEdit;->getCompactPointers()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 708
    .local v3, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lorg/iq80/leveldb/impl/InternalKey;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    .line 709
    .local v7, "level":Ljava/lang/Integer;
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/iq80/leveldb/impl/InternalKey;

    .line 710
    .local v6, "internalKey":Lorg/iq80/leveldb/impl/InternalKey;
    iget-object v9, p0, Lorg/iq80/leveldb/impl/VersionSet$Builder;->versionSet:Lorg/iq80/leveldb/impl/VersionSet;

    # getter for: Lorg/iq80/leveldb/impl/VersionSet;->compactPointers:Ljava/util/Map;
    invoke-static {v9}, Lorg/iq80/leveldb/impl/VersionSet;->access$200(Lorg/iq80/leveldb/impl/VersionSet;)Ljava/util/Map;

    move-result-object v9

    invoke-interface {v9, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 714
    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lorg/iq80/leveldb/impl/InternalKey;>;"
    .end local v6    # "internalKey":Lorg/iq80/leveldb/impl/InternalKey;
    .end local v7    # "level":Ljava/lang/Integer;
    :cond_0
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/VersionEdit;->getDeletedFiles()Lcom/google/common/collect/Multimap;

    move-result-object v8

    invoke-interface {v8}, Lcom/google/common/collect/Multimap;->entries()Ljava/util/Collection;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 715
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Long;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    .line 716
    .restart local v7    # "level":Ljava/lang/Integer;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    .line 717
    .local v5, "fileNumber":Ljava/lang/Long;
    iget-object v8, p0, Lorg/iq80/leveldb/impl/VersionSet$Builder;->levels:Ljava/util/List;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v10

    invoke-interface {v8, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;

    # getter for: Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;->deletedFiles:Ljava/util/Set;
    invoke-static {v8}, Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;->access$300(Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;)Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 722
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Long;>;"
    .end local v5    # "fileNumber":Ljava/lang/Long;
    .end local v7    # "level":Ljava/lang/Integer;
    :cond_1
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/VersionEdit;->getNewFiles()Lcom/google/common/collect/Multimap;

    move-result-object v8

    invoke-interface {v8}, Lcom/google/common/collect/Multimap;->entries()Ljava/util/Collection;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 723
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lorg/iq80/leveldb/impl/FileMetaData;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    .line 724
    .restart local v7    # "level":Ljava/lang/Integer;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 739
    .local v4, "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/FileMetaData;->getFileSize()J

    move-result-wide v10

    const-wide/16 v12, 0x4000

    div-long/2addr v10, v12

    long-to-int v0, v10

    .line 740
    .local v0, "allowedSeeks":I
    const/16 v8, 0x64

    if-ge v0, v8, :cond_2

    .line 741
    const/16 v0, 0x64

    .line 743
    :cond_2
    invoke-virtual {v4, v0}, Lorg/iq80/leveldb/impl/FileMetaData;->setAllowedSeeks(I)V

    .line 745
    iget-object v8, p0, Lorg/iq80/leveldb/impl/VersionSet$Builder;->levels:Ljava/util/List;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v10

    invoke-interface {v8, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;

    # getter for: Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;->deletedFiles:Ljava/util/Set;
    invoke-static {v8}, Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;->access$300(Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;)Ljava/util/Set;

    move-result-object v8

    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/FileMetaData;->getNumber()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-interface {v8, v10}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 746
    iget-object v8, p0, Lorg/iq80/leveldb/impl/VersionSet$Builder;->levels:Ljava/util/List;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v10

    invoke-interface {v8, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;

    # getter for: Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;->addedFiles:Ljava/util/SortedSet;
    invoke-static {v8}, Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;->access$400(Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;)Ljava/util/SortedSet;

    move-result-object v8

    invoke-interface {v8, v4}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 748
    .end local v0    # "allowedSeeks":I
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lorg/iq80/leveldb/impl/FileMetaData;>;"
    .end local v4    # "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    .end local v7    # "level":Ljava/lang/Integer;
    :cond_3
    return-void
.end method

.method public saveTo(Lorg/iq80/leveldb/impl/Version;)V
    .locals 8
    .param p1, "version"    # Lorg/iq80/leveldb/impl/Version;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 756
    new-instance v2, Lorg/iq80/leveldb/impl/VersionSet$Builder$FileMetaDataBySmallestKey;

    iget-object v6, p0, Lorg/iq80/leveldb/impl/VersionSet$Builder;->versionSet:Lorg/iq80/leveldb/impl/VersionSet;

    # getter for: Lorg/iq80/leveldb/impl/VersionSet;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;
    invoke-static {v6}, Lorg/iq80/leveldb/impl/VersionSet;->access$100(Lorg/iq80/leveldb/impl/VersionSet;)Lorg/iq80/leveldb/impl/InternalKeyComparator;

    move-result-object v6

    const/4 v7, 0x0

    invoke-direct {v2, v6, v7}, Lorg/iq80/leveldb/impl/VersionSet$Builder$FileMetaDataBySmallestKey;-><init>(Lorg/iq80/leveldb/impl/InternalKeyComparator;Lorg/iq80/leveldb/impl/VersionSet$1;)V

    .line 757
    .local v2, "cmp":Lorg/iq80/leveldb/impl/VersionSet$Builder$FileMetaDataBySmallestKey;
    const/4 v4, 0x0

    .local v4, "level":I
    :goto_0
    iget-object v6, p0, Lorg/iq80/leveldb/impl/VersionSet$Builder;->baseVersion:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v6}, Lorg/iq80/leveldb/impl/Version;->numberOfLevels()I

    move-result v6

    if-ge v4, v6, :cond_3

    .line 761
    iget-object v6, p0, Lorg/iq80/leveldb/impl/VersionSet$Builder;->baseVersion:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v6}, Lorg/iq80/leveldb/impl/Version;->getFiles()Lcom/google/common/collect/Multimap;

    move-result-object v6

    invoke-interface {v6}, Lcom/google/common/collect/Multimap;->asMap()Ljava/util/Map;

    move-result-object v6

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    .line 762
    .local v1, "baseFiles":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    if-nez v1, :cond_0

    .line 763
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    .line 765
    :cond_0
    iget-object v6, p0, Lorg/iq80/leveldb/impl/VersionSet$Builder;->levels:Ljava/util/List;

    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;

    # getter for: Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;->addedFiles:Ljava/util/SortedSet;
    invoke-static {v6}, Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;->access$400(Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;)Ljava/util/SortedSet;

    move-result-object v0

    .line 766
    .local v0, "addedFiles":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    if-nez v0, :cond_1

    .line 767
    invoke-static {}, Lcom/google/common/collect/ImmutableSortedSet;->of()Lcom/google/common/collect/ImmutableSortedSet;

    move-result-object v0

    .line 771
    :cond_1
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v6

    invoke-interface {v0}, Ljava/util/SortedSet;->size()I

    move-result v7

    add-int/2addr v6, v7

    invoke-static {v6}, Lcom/google/common/collect/Lists;->newArrayListWithCapacity(I)Ljava/util/ArrayList;

    move-result-object v5

    .line 772
    .local v5, "sortedFiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 773
    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 774
    invoke-static {v5, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 776
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 777
    .local v3, "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    invoke-direct {p0, p1, v4, v3}, Lorg/iq80/leveldb/impl/VersionSet$Builder;->maybeAddFile(Lorg/iq80/leveldb/impl/Version;ILorg/iq80/leveldb/impl/FileMetaData;)V

    goto :goto_1

    .line 782
    .end local v3    # "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_2
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/Version;->assertNoOverlappingFiles()V

    .line 757
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 785
    .end local v0    # "addedFiles":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    .end local v1    # "baseFiles":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    .end local v5    # "sortedFiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    :cond_3
    return-void
.end method
