.class public Lorg/iq80/leveldb/impl/VersionSet;
.super Ljava/lang/Object;
.source "VersionSet.java"

# interfaces
.implements Lorg/iq80/leveldb/impl/SeekingIterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/iq80/leveldb/impl/VersionSet$Builder;
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


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final L0_COMPACTION_TRIGGER:I = 0x4

.field public static final MAX_GRAND_PARENT_OVERLAP_BYTES:J = 0x1400000L

.field public static final TARGET_FILE_SIZE:I = 0x200000


# instance fields
.field private final activeVersions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/iq80/leveldb/impl/Version;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final compactPointers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            ">;"
        }
    .end annotation
.end field

.field private current:Lorg/iq80/leveldb/impl/Version;

.field private final databaseDir:Ljava/io/File;

.field private descriptorLog:Lorg/iq80/leveldb/impl/LogWriter;

.field private final internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

.field private lastSequence:J

.field private logNumber:J

.field private manifestFileNumber:J

.field private final nextFileNumber:Ljava/util/concurrent/atomic/AtomicLong;

.field private prevLogNumber:J

.field private final tableCache:Lorg/iq80/leveldb/impl/TableCache;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 57
    const-class v0, Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/iq80/leveldb/impl/VersionSet;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Ljava/io/File;Lorg/iq80/leveldb/impl/TableCache;Lorg/iq80/leveldb/impl/InternalKeyComparator;)V
    .locals 4
    .param p1, "databaseDir"    # Ljava/io/File;
    .param p2, "tableCache"    # Lorg/iq80/leveldb/impl/TableCache;
    .param p3, "internalKeyComparator"    # Lorg/iq80/leveldb/impl/InternalKeyComparator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v2, 0x2

    invoke-direct {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->nextFileNumber:Ljava/util/concurrent/atomic/AtomicLong;

    .line 69
    const-wide/16 v0, 0x1

    iput-wide v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->manifestFileNumber:J

    .line 75
    new-instance v0, Lcom/google/common/collect/MapMaker;

    invoke-direct {v0}, Lcom/google/common/collect/MapMaker;-><init>()V

    invoke-virtual {v0}, Lcom/google/common/collect/MapMaker;->weakKeys()Lcom/google/common/collect/MapMaker;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/MapMaker;->makeMap()Ljava/util/concurrent/ConcurrentMap;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->activeVersions:Ljava/util/Map;

    .line 81
    invoke-static {}, Lcom/google/common/collect/Maps;->newTreeMap()Ljava/util/TreeMap;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->compactPointers:Ljava/util/Map;

    .line 86
    iput-object p1, p0, Lorg/iq80/leveldb/impl/VersionSet;->databaseDir:Ljava/io/File;

    .line 87
    iput-object p2, p0, Lorg/iq80/leveldb/impl/VersionSet;->tableCache:Lorg/iq80/leveldb/impl/TableCache;

    .line 88
    iput-object p3, p0, Lorg/iq80/leveldb/impl/VersionSet;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    .line 89
    new-instance v0, Lorg/iq80/leveldb/impl/Version;

    invoke-direct {v0, p0}, Lorg/iq80/leveldb/impl/Version;-><init>(Lorg/iq80/leveldb/impl/VersionSet;)V

    invoke-direct {p0, v0}, Lorg/iq80/leveldb/impl/VersionSet;->appendVersion(Lorg/iq80/leveldb/impl/Version;)V

    .line 91
    invoke-direct {p0}, Lorg/iq80/leveldb/impl/VersionSet;->initializeIfNeeded()V

    .line 92
    return-void
.end method

.method static synthetic access$100(Lorg/iq80/leveldb/impl/VersionSet;)Lorg/iq80/leveldb/impl/InternalKeyComparator;
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/VersionSet;

    .prologue
    .line 57
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    return-object v0
.end method

.method static synthetic access$200(Lorg/iq80/leveldb/impl/VersionSet;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/VersionSet;

    .prologue
    .line 57
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->compactPointers:Ljava/util/Map;

    return-object v0
.end method

.method private appendVersion(Lorg/iq80/leveldb/impl/Version;)V
    .locals 3
    .param p1, "version"    # Lorg/iq80/leveldb/impl/Version;

    .prologue
    .line 140
    const-string v1, "version is null"

    invoke-static {p1, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    iget-object v1, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    if-eq p1, v1, :cond_1

    const/4 v1, 0x1

    :goto_0
    const-string v2, "version is the current version"

    invoke-static {v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 142
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    .line 143
    .local v0, "previous":Lorg/iq80/leveldb/impl/Version;
    iput-object p1, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    .line 144
    iget-object v1, p0, Lorg/iq80/leveldb/impl/VersionSet;->activeVersions:Ljava/util/Map;

    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    if-eqz v0, :cond_0

    .line 146
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/Version;->release()V

    .line 148
    :cond_0
    return-void

    .line 141
    .end local v0    # "previous":Lorg/iq80/leveldb/impl/Version;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static varargs coalesce([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">([TV;)TV;"
        }
    .end annotation

    .prologue
    .line 452
    .local p0, "values":[Ljava/lang/Object;, "[TV;"
    array-length v2, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v0, p0, v1

    .line 453
    .local v0, "value":Ljava/lang/Object;, "TV;"
    if-eqz v0, :cond_0

    .line 457
    .end local v0    # "value":Ljava/lang/Object;, "TV;"
    :goto_1
    return-object v0

    .line 452
    .restart local v0    # "value":Ljava/lang/Object;, "TV;"
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 457
    .end local v0    # "value":Ljava/lang/Object;, "TV;"
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private finalizeVersion(Lorg/iq80/leveldb/impl/Version;)V
    .locals 14
    .param p1, "version"    # Lorg/iq80/leveldb/impl/Version;

    .prologue
    .line 412
    const/4 v0, -0x1

    .line 413
    .local v0, "bestLevel":I
    const-wide/high16 v2, -0x4010000000000000L    # -1.0

    .line 415
    .local v2, "bestScore":D
    const/4 v4, 0x0

    .local v4, "level":I
    :goto_0
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/Version;->numberOfLevels()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ge v4, v5, :cond_3

    .line 417
    if-nez v4, :cond_1

    .line 429
    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    invoke-virtual {p1, v4}, Lorg/iq80/leveldb/impl/Version;->numberOfFilesInLevel(I)I

    move-result v5

    int-to-double v12, v5

    mul-double/2addr v10, v12

    const-wide/high16 v12, 0x4010000000000000L    # 4.0

    div-double v8, v10, v12

    .line 440
    .local v8, "score":D
    :goto_1
    cmpl-double v5, v8, v2

    if-lez v5, :cond_0

    .line 441
    move v0, v4

    .line 442
    move-wide v2, v8

    .line 415
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 433
    .end local v8    # "score":D
    :cond_1
    const-wide/16 v6, 0x0

    .line 434
    .local v6, "levelBytes":J
    invoke-virtual {p1, v4}, Lorg/iq80/leveldb/impl/Version;->getFiles(I)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 435
    .local v1, "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/FileMetaData;->getFileSize()J

    move-result-wide v10

    add-long/2addr v6, v10

    .line 436
    goto :goto_2

    .line 437
    .end local v1    # "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_2
    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    long-to-double v12, v6

    mul-double/2addr v10, v12

    invoke-static {v4}, Lorg/iq80/leveldb/impl/VersionSet;->maxBytesForLevel(I)D

    move-result-wide v12

    div-double v8, v10, v12

    .restart local v8    # "score":D
    goto :goto_1

    .line 446
    .end local v6    # "levelBytes":J
    .end local v8    # "score":D
    :cond_3
    invoke-virtual {p1, v0}, Lorg/iq80/leveldb/impl/Version;->setCompactionLevel(I)V

    .line 447
    invoke-virtual {p1, v2, v3}, Lorg/iq80/leveldb/impl/Version;->setCompactionScore(D)V

    .line 448
    return-void
.end method

.method private varargs getRange([Ljava/util/List;)Ljava/util/Map$Entry;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;)",
            "Ljava/util/Map$Entry",
            "<",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            ">;"
        }
    .end annotation

    .prologue
    .line 642
    .local p1, "inputLists":[Ljava/util/List;, "[Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    const/4 v3, 0x0

    .line 643
    .local v3, "smallest":Lorg/iq80/leveldb/impl/InternalKey;
    const/4 v2, 0x0

    .line 644
    .local v2, "largest":Lorg/iq80/leveldb/impl/InternalKey;
    array-length v5, p1

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v5, :cond_4

    aget-object v1, p1, v4

    .line 645
    .local v1, "inputList":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 646
    .local v0, "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    if-nez v3, :cond_1

    .line 647
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getSmallest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v3

    .line 648
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getLargest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v2

    goto :goto_1

    .line 651
    :cond_1
    iget-object v7, p0, Lorg/iq80/leveldb/impl/VersionSet;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getSmallest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v8

    invoke-virtual {v7, v8, v3}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->compare(Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)I

    move-result v7

    if-gez v7, :cond_2

    .line 652
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getSmallest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v3

    .line 654
    :cond_2
    iget-object v7, p0, Lorg/iq80/leveldb/impl/VersionSet;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getLargest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v8

    invoke-virtual {v7, v8, v2}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->compare(Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)I

    move-result v7

    if-lez v7, :cond_0

    .line 655
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getLargest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v2

    goto :goto_1

    .line 644
    .end local v0    # "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 660
    .end local v1    # "inputList":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    :cond_4
    invoke-static {v3, v2}, Lcom/google/common/collect/Maps;->immutableEntry(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v4

    return-object v4
.end method

.method private initializeIfNeeded()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    new-instance v0, Ljava/io/File;

    iget-object v3, p0, Lorg/iq80/leveldb/impl/VersionSet;->databaseDir:Ljava/io/File;

    invoke-static {}, Lorg/iq80/leveldb/impl/Filename;->currentFileName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 99
    .local v0, "currentFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 100
    new-instance v1, Lorg/iq80/leveldb/impl/VersionEdit;

    invoke-direct {v1}, Lorg/iq80/leveldb/impl/VersionEdit;-><init>()V

    .line 101
    .local v1, "edit":Lorg/iq80/leveldb/impl/VersionEdit;
    iget-object v3, p0, Lorg/iq80/leveldb/impl/VersionSet;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-virtual {v3}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/iq80/leveldb/impl/VersionEdit;->setComparatorName(Ljava/lang/String;)V

    .line 102
    iget-wide v4, p0, Lorg/iq80/leveldb/impl/VersionSet;->prevLogNumber:J

    invoke-virtual {v1, v4, v5}, Lorg/iq80/leveldb/impl/VersionEdit;->setLogNumber(J)V

    .line 103
    iget-object v3, p0, Lorg/iq80/leveldb/impl/VersionSet;->nextFileNumber:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Lorg/iq80/leveldb/impl/VersionEdit;->setNextFileNumber(J)V

    .line 104
    iget-wide v4, p0, Lorg/iq80/leveldb/impl/VersionSet;->lastSequence:J

    invoke-virtual {v1, v4, v5}, Lorg/iq80/leveldb/impl/VersionEdit;->setLastSequenceNumber(J)V

    .line 106
    new-instance v3, Ljava/io/File;

    iget-object v4, p0, Lorg/iq80/leveldb/impl/VersionSet;->databaseDir:Ljava/io/File;

    iget-wide v6, p0, Lorg/iq80/leveldb/impl/VersionSet;->manifestFileNumber:J

    invoke-static {v6, v7}, Lorg/iq80/leveldb/impl/Filename;->descriptorFileName(J)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iget-wide v4, p0, Lorg/iq80/leveldb/impl/VersionSet;->manifestFileNumber:J

    invoke-static {v3, v4, v5}, Lorg/iq80/leveldb/impl/Logs;->createLogWriter(Ljava/io/File;J)Lorg/iq80/leveldb/impl/LogWriter;

    move-result-object v2

    .line 108
    .local v2, "log":Lorg/iq80/leveldb/impl/LogWriter;
    :try_start_0
    invoke-direct {p0, v2}, Lorg/iq80/leveldb/impl/VersionSet;->writeSnapshot(Lorg/iq80/leveldb/impl/LogWriter;)V

    .line 109
    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/VersionEdit;->encode()Lorg/iq80/leveldb/util/Slice;

    move-result-object v3

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Lorg/iq80/leveldb/impl/LogWriter;->addRecord(Lorg/iq80/leveldb/util/Slice;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    invoke-interface {v2}, Lorg/iq80/leveldb/impl/LogWriter;->close()V

    .line 115
    iget-object v3, p0, Lorg/iq80/leveldb/impl/VersionSet;->databaseDir:Ljava/io/File;

    invoke-interface {v2}, Lorg/iq80/leveldb/impl/LogWriter;->getFileNumber()J

    move-result-wide v4

    invoke-static {v3, v4, v5}, Lorg/iq80/leveldb/impl/Filename;->setCurrentFile(Ljava/io/File;J)Z

    .line 117
    .end local v1    # "edit":Lorg/iq80/leveldb/impl/VersionEdit;
    .end local v2    # "log":Lorg/iq80/leveldb/impl/LogWriter;
    :cond_0
    return-void

    .line 112
    .restart local v1    # "edit":Lorg/iq80/leveldb/impl/VersionEdit;
    .restart local v2    # "log":Lorg/iq80/leveldb/impl/LogWriter;
    :catchall_0
    move-exception v3

    invoke-interface {v2}, Lorg/iq80/leveldb/impl/LogWriter;->close()V

    .line 113
    throw v3
.end method

.method private static maxBytesForLevel(I)D
    .locals 4
    .param p0, "level"    # I

    .prologue
    .line 473
    const-wide/high16 v0, 0x4164000000000000L    # 1.048576E7

    .line 474
    .local v0, "result":D
    :goto_0
    const/4 v2, 0x1

    if-le p0, v2, :cond_0

    .line 475
    const-wide/high16 v2, 0x4024000000000000L    # 10.0

    mul-double/2addr v0, v2

    .line 476
    add-int/lit8 p0, p0, -0x1

    goto :goto_0

    .line 478
    :cond_0
    return-wide v0
.end method

.method public static maxFileSizeForLevel(I)J
    .locals 2
    .param p0, "level"    # I

    .prologue
    .line 483
    const-wide/32 v0, 0x200000

    return-wide v0
.end method

.method private setupOtherInputs(ILjava/util/List;)Lorg/iq80/leveldb/impl/Compaction;
    .locals 17
    .param p1, "level"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;)",
            "Lorg/iq80/leveldb/impl/Compaction;"
        }
    .end annotation

    .prologue
    .line 554
    .local p2, "levelInputs":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/util/List;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/iq80/leveldb/impl/VersionSet;->getRange([Ljava/util/List;)Ljava/util/Map$Entry;

    move-result-object v15

    .line 555
    .local v15, "range":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;>;"
    invoke-interface {v15}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lorg/iq80/leveldb/impl/InternalKey;

    .line 556
    .local v16, "smallest":Lorg/iq80/leveldb/impl/InternalKey;
    invoke-interface {v15}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/iq80/leveldb/impl/InternalKey;

    .line 558
    .local v12, "largest":Lorg/iq80/leveldb/impl/InternalKey;
    add-int/lit8 v3, p1, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v3, v1, v12}, Lorg/iq80/leveldb/impl/VersionSet;->getOverlappingInputs(ILorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)Ljava/util/List;

    move-result-object v6

    .line 561
    .local v6, "levelUpInputs":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/util/List;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    const/4 v4, 0x1

    aput-object v6, v3, v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/iq80/leveldb/impl/VersionSet;->getRange([Ljava/util/List;)Ljava/util/Map$Entry;

    move-result-object v15

    .line 562
    invoke-interface {v15}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/iq80/leveldb/impl/InternalKey;

    .line 563
    .local v9, "allStart":Lorg/iq80/leveldb/impl/InternalKey;
    invoke-interface {v15}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/iq80/leveldb/impl/InternalKey;

    .line 567
    .local v8, "allLimit":Lorg/iq80/leveldb/impl/InternalKey;
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 568
    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-virtual {v0, v1, v9, v8}, Lorg/iq80/leveldb/impl/VersionSet;->getOverlappingInputs(ILorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)Ljava/util/List;

    move-result-object v10

    .line 570
    .local v10, "expanded0":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v4

    if-le v3, v4, :cond_0

    .line 571
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/util/List;

    const/4 v4, 0x0

    aput-object v10, v3, v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/iq80/leveldb/impl/VersionSet;->getRange([Ljava/util/List;)Ljava/util/Map$Entry;

    move-result-object v15

    .line 572
    invoke-interface {v15}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/iq80/leveldb/impl/InternalKey;

    .line 573
    .local v14, "newStart":Lorg/iq80/leveldb/impl/InternalKey;
    invoke-interface {v15}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/iq80/leveldb/impl/InternalKey;

    .line 575
    .local v13, "newLimit":Lorg/iq80/leveldb/impl/InternalKey;
    add-int/lit8 v3, p1, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v14, v13}, Lorg/iq80/leveldb/impl/VersionSet;->getOverlappingInputs(ILorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)Ljava/util/List;

    move-result-object v11

    .line 576
    .local v11, "expanded1":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v4

    if-ne v3, v4, :cond_0

    .line 584
    move-object/from16 v16, v14

    .line 585
    move-object v12, v13

    .line 586
    move-object/from16 p2, v10

    .line 587
    move-object v6, v11

    .line 589
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/util/List;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    const/4 v4, 0x1

    aput-object v6, v3, v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/iq80/leveldb/impl/VersionSet;->getRange([Ljava/util/List;)Ljava/util/Map$Entry;

    move-result-object v15

    .line 590
    invoke-interface {v15}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    .end local v9    # "allStart":Lorg/iq80/leveldb/impl/InternalKey;
    check-cast v9, Lorg/iq80/leveldb/impl/InternalKey;

    .line 591
    .restart local v9    # "allStart":Lorg/iq80/leveldb/impl/InternalKey;
    invoke-interface {v15}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "allLimit":Lorg/iq80/leveldb/impl/InternalKey;
    check-cast v8, Lorg/iq80/leveldb/impl/InternalKey;

    .line 598
    .end local v10    # "expanded0":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    .end local v11    # "expanded1":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    .end local v13    # "newLimit":Lorg/iq80/leveldb/impl/InternalKey;
    .end local v14    # "newStart":Lorg/iq80/leveldb/impl/InternalKey;
    .restart local v8    # "allLimit":Lorg/iq80/leveldb/impl/InternalKey;
    :cond_0
    const/4 v7, 0x0

    .line 599
    .local v7, "grandparents":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    add-int/lit8 v3, p1, 0x2

    const/4 v4, 0x7

    if-ge v3, v4, :cond_1

    .line 600
    add-int/lit8 v3, p1, 0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v9, v8}, Lorg/iq80/leveldb/impl/VersionSet;->getOverlappingInputs(ILorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)Ljava/util/List;

    move-result-object v7

    .line 610
    :cond_1
    new-instance v2, Lorg/iq80/leveldb/impl/Compaction;

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    move/from16 v4, p1

    move-object/from16 v5, p2

    invoke-direct/range {v2 .. v7}, Lorg/iq80/leveldb/impl/Compaction;-><init>(Lorg/iq80/leveldb/impl/Version;ILjava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 616
    .local v2, "compaction":Lorg/iq80/leveldb/impl/Compaction;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/iq80/leveldb/impl/VersionSet;->compactPointers:Ljava/util/Map;

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 617
    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/Compaction;->getEdit()Lorg/iq80/leveldb/impl/VersionEdit;

    move-result-object v3

    move/from16 v0, p1

    invoke-virtual {v3, v0, v12}, Lorg/iq80/leveldb/impl/VersionEdit;->setCompactPointer(ILorg/iq80/leveldb/impl/InternalKey;)V

    .line 619
    return-object v2
.end method

.method private writeSnapshot(Lorg/iq80/leveldb/impl/LogWriter;)V
    .locals 3
    .param p1, "log"    # Lorg/iq80/leveldb/impl/LogWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 318
    new-instance v0, Lorg/iq80/leveldb/impl/VersionEdit;

    invoke-direct {v0}, Lorg/iq80/leveldb/impl/VersionEdit;-><init>()V

    .line 319
    .local v0, "edit":Lorg/iq80/leveldb/impl/VersionEdit;
    iget-object v2, p0, Lorg/iq80/leveldb/impl/VersionSet;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/iq80/leveldb/impl/VersionEdit;->setComparatorName(Ljava/lang/String;)V

    .line 322
    iget-object v2, p0, Lorg/iq80/leveldb/impl/VersionSet;->compactPointers:Ljava/util/Map;

    invoke-virtual {v0, v2}, Lorg/iq80/leveldb/impl/VersionEdit;->setCompactPointers(Ljava/util/Map;)V

    .line 325
    iget-object v2, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/Version;->getFiles()Lcom/google/common/collect/Multimap;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/iq80/leveldb/impl/VersionEdit;->addFiles(Lcom/google/common/collect/Multimap;)V

    .line 327
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/VersionEdit;->encode()Lorg/iq80/leveldb/util/Slice;

    move-result-object v1

    .line 328
    .local v1, "record":Lorg/iq80/leveldb/util/Slice;
    const/4 v2, 0x0

    invoke-interface {p1, v1, v2}, Lorg/iq80/leveldb/impl/LogWriter;->addRecord(Lorg/iq80/leveldb/util/Slice;Z)V

    .line 329
    return-void
.end method


# virtual methods
.method public compactRange(ILorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)Lorg/iq80/leveldb/impl/Compaction;
    .locals 2
    .param p1, "level"    # I
    .param p2, "begin"    # Lorg/iq80/leveldb/impl/InternalKey;
    .param p3, "end"    # Lorg/iq80/leveldb/impl/InternalKey;

    .prologue
    .line 493
    invoke-virtual {p0, p1, p2, p3}, Lorg/iq80/leveldb/impl/VersionSet;->getOverlappingInputs(ILorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)Ljava/util/List;

    move-result-object v0

    .line 494
    .local v0, "levelInputs":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 495
    const/4 v1, 0x0

    .line 498
    :goto_0
    return-object v1

    :cond_0
    invoke-direct {p0, p1, v0}, Lorg/iq80/leveldb/impl/VersionSet;->setupOtherInputs(ILjava/util/List;)Lorg/iq80/leveldb/impl/Compaction;

    move-result-object v1

    goto :goto_0
.end method

.method public destroy()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 122
    iget-object v2, p0, Lorg/iq80/leveldb/impl/VersionSet;->descriptorLog:Lorg/iq80/leveldb/impl/LogWriter;

    if-eqz v2, :cond_0

    .line 123
    iget-object v2, p0, Lorg/iq80/leveldb/impl/VersionSet;->descriptorLog:Lorg/iq80/leveldb/impl/LogWriter;

    invoke-interface {v2}, Lorg/iq80/leveldb/impl/LogWriter;->close()V

    .line 124
    iput-object v3, p0, Lorg/iq80/leveldb/impl/VersionSet;->descriptorLog:Lorg/iq80/leveldb/impl/LogWriter;

    .line 127
    :cond_0
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    .line 128
    .local v0, "t":Lorg/iq80/leveldb/impl/Version;
    if-eqz v0, :cond_1

    .line 129
    iput-object v3, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    .line 130
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/Version;->release()V

    .line 133
    :cond_1
    iget-object v2, p0, Lorg/iq80/leveldb/impl/VersionSet;->activeVersions:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 136
    .local v1, "versions":Ljava/util/Set;, "Ljava/util/Set<Lorg/iq80/leveldb/impl/Version;>;"
    return-void
.end method

.method public get(Lorg/iq80/leveldb/impl/LookupKey;)Lorg/iq80/leveldb/impl/LookupResult;
    .locals 1
    .param p1, "key"    # Lorg/iq80/leveldb/impl/LookupKey;

    .prologue
    .line 222
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v0, p1}, Lorg/iq80/leveldb/impl/Version;->get(Lorg/iq80/leveldb/impl/LookupKey;)Lorg/iq80/leveldb/impl/LookupResult;

    move-result-object v0

    return-object v0
.end method

.method public getCurrent()Lorg/iq80/leveldb/impl/Version;
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    return-object v0
.end method

.method public getInternalKeyComparator()Lorg/iq80/leveldb/impl/InternalKeyComparator;
    .locals 1

    .prologue
    .line 160
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    return-object v0
.end method

.method public getLastSequence()J
    .locals 2

    .prologue
    .line 242
    iget-wide v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->lastSequence:J

    return-wide v0
.end method

.method public getLiveFiles()Ljava/util/List;
    .locals 4
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
    .line 462
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v1

    .line 463
    .local v1, "builder":Lcom/google/common/collect/ImmutableList$Builder;, "Lcom/google/common/collect/ImmutableList$Builder<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    iget-object v2, p0, Lorg/iq80/leveldb/impl/VersionSet;->activeVersions:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/Version;

    .line 464
    .local v0, "activeVersion":Lorg/iq80/leveldb/impl/Version;
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/Version;->getFiles()Lcom/google/common/collect/Multimap;

    move-result-object v3

    invoke-interface {v3}, Lcom/google/common/collect/Multimap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/google/common/collect/ImmutableList$Builder;->addAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableList$Builder;

    goto :goto_0

    .line 466
    .end local v0    # "activeVersion":Lorg/iq80/leveldb/impl/Version;
    :cond_0
    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    return-object v2
.end method

.method public getLogNumber()J
    .locals 2

    .prologue
    .line 185
    iget-wide v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->logNumber:J

    return-wide v0
.end method

.method public getManifestFileNumber()J
    .locals 2

    .prologue
    .line 175
    iget-wide v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->manifestFileNumber:J

    return-wide v0
.end method

.method public getMaxNextLevelOverlappingBytes()J
    .locals 12

    .prologue
    .line 665
    const-wide/16 v4, 0x0

    .line 666
    .local v4, "result":J
    const/4 v1, 0x1

    .local v1, "level":I
    :goto_0
    const/4 v8, 0x7

    if-ge v1, v8, :cond_2

    .line 667
    iget-object v8, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v8, v1}, Lorg/iq80/leveldb/impl/Version;->getFiles(I)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 668
    .local v0, "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    add-int/lit8 v9, v1, 0x1

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getSmallest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v10

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getLargest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v11

    invoke-virtual {p0, v9, v10, v11}, Lorg/iq80/leveldb/impl/VersionSet;->getOverlappingInputs(ILorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)Ljava/util/List;

    move-result-object v3

    .line 669
    .local v3, "overlaps":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    const-wide/16 v6, 0x0

    .line 670
    .local v6, "totalSize":J
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_0

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 671
    .local v2, "overlap":Lorg/iq80/leveldb/impl/FileMetaData;
    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/FileMetaData;->getFileSize()J

    move-result-wide v10

    add-long/2addr v6, v10

    .line 672
    goto :goto_2

    .line 673
    .end local v2    # "overlap":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_0
    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    .line 674
    goto :goto_1

    .line 666
    .end local v0    # "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    .end local v3    # "overlaps":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    .end local v6    # "totalSize":J
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 676
    :cond_2
    return-wide v4
.end method

.method public getNextFileNumber()J
    .locals 2

    .prologue
    .line 180
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->nextFileNumber:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    move-result-wide v0

    return-wide v0
.end method

.method getOverlappingInputs(ILorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)Ljava/util/List;
    .locals 7
    .param p1, "level"    # I
    .param p2, "begin"    # Lorg/iq80/leveldb/impl/InternalKey;
    .param p3, "end"    # Lorg/iq80/leveldb/impl/InternalKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 624
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v1

    .line 625
    .local v1, "files":Lcom/google/common/collect/ImmutableList$Builder;, "Lcom/google/common/collect/ImmutableList$Builder<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    invoke-virtual {p2}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    .line 626
    .local v2, "userBegin":Lorg/iq80/leveldb/util/Slice;
    invoke-virtual {p3}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v4

    .line 627
    .local v4, "userEnd":Lorg/iq80/leveldb/util/Slice;
    iget-object v5, p0, Lorg/iq80/leveldb/impl/VersionSet;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-virtual {v5}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->getUserComparator()Lorg/iq80/leveldb/table/UserComparator;

    move-result-object v3

    .line 628
    .local v3, "userComparator":Lorg/iq80/leveldb/table/UserComparator;
    iget-object v5, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v5, p1}, Lorg/iq80/leveldb/impl/Version;->getFiles(I)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 629
    .local v0, "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getLargest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v6

    invoke-virtual {v6}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v6

    invoke-interface {v3, v6, v2}, Lorg/iq80/leveldb/table/UserComparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v6

    if-ltz v6, :cond_0

    .line 630
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getSmallest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v6

    invoke-virtual {v6}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v6

    invoke-interface {v3, v6, v4}, Lorg/iq80/leveldb/table/UserComparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v6

    if-gtz v6, :cond_0

    .line 634
    invoke-virtual {v1, v0}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    goto :goto_0

    .line 637
    .end local v0    # "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_1
    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v5

    return-object v5
.end method

.method public getPrevLogNumber()J
    .locals 2

    .prologue
    .line 190
    iget-wide v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->prevLogNumber:J

    return-wide v0
.end method

.method public getTableCache()Lorg/iq80/leveldb/impl/TableCache;
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->tableCache:Lorg/iq80/leveldb/impl/TableCache;

    return-object v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 57
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/VersionSet;->iterator()Lorg/iq80/leveldb/util/MergingIterator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic iterator()Lorg/iq80/leveldb/impl/SeekingIterator;
    .locals 1

    .prologue
    .line 57
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/VersionSet;->iterator()Lorg/iq80/leveldb/util/MergingIterator;

    move-result-object v0

    return-object v0
.end method

.method public iterator()Lorg/iq80/leveldb/util/MergingIterator;
    .locals 1

    .prologue
    .line 196
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/Version;->iterator()Lorg/iq80/leveldb/util/MergingIterator;

    move-result-object v0

    return-object v0
.end method

.method public logAndApply(Lorg/iq80/leveldb/impl/VersionEdit;)V
    .locals 13
    .param p1, "edit"    # Lorg/iq80/leveldb/impl/VersionEdit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 254
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/VersionEdit;->getLogNumber()Ljava/lang/Long;

    move-result-object v5

    if-eqz v5, :cond_5

    .line 255
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/VersionEdit;->getLogNumber()Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    iget-wide v10, p0, Lorg/iq80/leveldb/impl/VersionSet;->logNumber:J

    cmp-long v5, v8, v10

    if-ltz v5, :cond_3

    move v5, v6

    :goto_0
    invoke-static {v5}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 256
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/VersionEdit;->getLogNumber()Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    iget-object v5, p0, Lorg/iq80/leveldb/impl/VersionSet;->nextFileNumber:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v10

    cmp-long v5, v8, v10

    if-gez v5, :cond_4

    :goto_1
    invoke-static {v6}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 262
    :goto_2
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/VersionEdit;->getPreviousLogNumber()Ljava/lang/Long;

    move-result-object v5

    if-nez v5, :cond_0

    .line 263
    iget-wide v6, p0, Lorg/iq80/leveldb/impl/VersionSet;->prevLogNumber:J

    invoke-virtual {p1, v6, v7}, Lorg/iq80/leveldb/impl/VersionEdit;->setPreviousLogNumber(J)V

    .line 266
    :cond_0
    iget-object v5, p0, Lorg/iq80/leveldb/impl/VersionSet;->nextFileNumber:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v6

    invoke-virtual {p1, v6, v7}, Lorg/iq80/leveldb/impl/VersionEdit;->setNextFileNumber(J)V

    .line 267
    iget-wide v6, p0, Lorg/iq80/leveldb/impl/VersionSet;->lastSequence:J

    invoke-virtual {p1, v6, v7}, Lorg/iq80/leveldb/impl/VersionEdit;->setLastSequenceNumber(J)V

    .line 269
    new-instance v4, Lorg/iq80/leveldb/impl/Version;

    invoke-direct {v4, p0}, Lorg/iq80/leveldb/impl/Version;-><init>(Lorg/iq80/leveldb/impl/VersionSet;)V

    .line 270
    .local v4, "version":Lorg/iq80/leveldb/impl/Version;
    new-instance v0, Lorg/iq80/leveldb/impl/VersionSet$Builder;

    iget-object v5, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    invoke-direct {v0, p0, v5, v12}, Lorg/iq80/leveldb/impl/VersionSet$Builder;-><init>(Lorg/iq80/leveldb/impl/VersionSet;Lorg/iq80/leveldb/impl/Version;Lorg/iq80/leveldb/impl/VersionSet$1;)V

    .line 271
    .local v0, "builder":Lorg/iq80/leveldb/impl/VersionSet$Builder;
    invoke-virtual {v0, p1}, Lorg/iq80/leveldb/impl/VersionSet$Builder;->apply(Lorg/iq80/leveldb/impl/VersionEdit;)V

    .line 272
    invoke-virtual {v0, v4}, Lorg/iq80/leveldb/impl/VersionSet$Builder;->saveTo(Lorg/iq80/leveldb/impl/Version;)V

    .line 274
    invoke-direct {p0, v4}, Lorg/iq80/leveldb/impl/VersionSet;->finalizeVersion(Lorg/iq80/leveldb/impl/Version;)V

    .line 276
    const/4 v1, 0x0

    .line 280
    .local v1, "createdNewManifest":Z
    :try_start_0
    iget-object v5, p0, Lorg/iq80/leveldb/impl/VersionSet;->descriptorLog:Lorg/iq80/leveldb/impl/LogWriter;

    if-nez v5, :cond_1

    .line 281
    iget-object v5, p0, Lorg/iq80/leveldb/impl/VersionSet;->nextFileNumber:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v6

    invoke-virtual {p1, v6, v7}, Lorg/iq80/leveldb/impl/VersionEdit;->setNextFileNumber(J)V

    .line 282
    new-instance v5, Ljava/io/File;

    iget-object v6, p0, Lorg/iq80/leveldb/impl/VersionSet;->databaseDir:Ljava/io/File;

    iget-wide v8, p0, Lorg/iq80/leveldb/impl/VersionSet;->manifestFileNumber:J

    invoke-static {v8, v9}, Lorg/iq80/leveldb/impl/Filename;->descriptorFileName(J)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iget-wide v6, p0, Lorg/iq80/leveldb/impl/VersionSet;->manifestFileNumber:J

    invoke-static {v5, v6, v7}, Lorg/iq80/leveldb/impl/Logs;->createLogWriter(Ljava/io/File;J)Lorg/iq80/leveldb/impl/LogWriter;

    move-result-object v5

    iput-object v5, p0, Lorg/iq80/leveldb/impl/VersionSet;->descriptorLog:Lorg/iq80/leveldb/impl/LogWriter;

    .line 283
    iget-object v5, p0, Lorg/iq80/leveldb/impl/VersionSet;->descriptorLog:Lorg/iq80/leveldb/impl/LogWriter;

    invoke-direct {p0, v5}, Lorg/iq80/leveldb/impl/VersionSet;->writeSnapshot(Lorg/iq80/leveldb/impl/LogWriter;)V

    .line 284
    const/4 v1, 0x1

    .line 288
    :cond_1
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/VersionEdit;->encode()Lorg/iq80/leveldb/util/Slice;

    move-result-object v3

    .line 289
    .local v3, "record":Lorg/iq80/leveldb/util/Slice;
    iget-object v5, p0, Lorg/iq80/leveldb/impl/VersionSet;->descriptorLog:Lorg/iq80/leveldb/impl/LogWriter;

    const/4 v6, 0x1

    invoke-interface {v5, v3, v6}, Lorg/iq80/leveldb/impl/LogWriter;->addRecord(Lorg/iq80/leveldb/util/Slice;Z)V

    .line 293
    if-eqz v1, :cond_2

    .line 294
    iget-object v5, p0, Lorg/iq80/leveldb/impl/VersionSet;->databaseDir:Ljava/io/File;

    iget-object v6, p0, Lorg/iq80/leveldb/impl/VersionSet;->descriptorLog:Lorg/iq80/leveldb/impl/LogWriter;

    invoke-interface {v6}, Lorg/iq80/leveldb/impl/LogWriter;->getFileNumber()J

    move-result-wide v6

    invoke-static {v5, v6, v7}, Lorg/iq80/leveldb/impl/Filename;->setCurrentFile(Ljava/io/File;J)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 309
    :cond_2
    invoke-direct {p0, v4}, Lorg/iq80/leveldb/impl/VersionSet;->appendVersion(Lorg/iq80/leveldb/impl/Version;)V

    .line 310
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/VersionEdit;->getLogNumber()Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    iput-wide v6, p0, Lorg/iq80/leveldb/impl/VersionSet;->logNumber:J

    .line 311
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/VersionEdit;->getPreviousLogNumber()Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    iput-wide v6, p0, Lorg/iq80/leveldb/impl/VersionSet;->prevLogNumber:J

    .line 312
    return-void

    .end local v0    # "builder":Lorg/iq80/leveldb/impl/VersionSet$Builder;
    .end local v1    # "createdNewManifest":Z
    .end local v3    # "record":Lorg/iq80/leveldb/util/Slice;
    .end local v4    # "version":Lorg/iq80/leveldb/impl/Version;
    :cond_3
    move v5, v7

    .line 255
    goto/16 :goto_0

    :cond_4
    move v6, v7

    .line 256
    goto/16 :goto_1

    .line 259
    :cond_5
    iget-wide v6, p0, Lorg/iq80/leveldb/impl/VersionSet;->logNumber:J

    invoke-virtual {p1, v6, v7}, Lorg/iq80/leveldb/impl/VersionEdit;->setLogNumber(J)V

    goto/16 :goto_2

    .line 297
    .restart local v0    # "builder":Lorg/iq80/leveldb/impl/VersionSet$Builder;
    .restart local v1    # "createdNewManifest":Z
    .restart local v4    # "version":Lorg/iq80/leveldb/impl/Version;
    :catch_0
    move-exception v2

    .line 299
    .local v2, "e":Ljava/io/IOException;
    if-eqz v1, :cond_6

    .line 300
    iget-object v5, p0, Lorg/iq80/leveldb/impl/VersionSet;->descriptorLog:Lorg/iq80/leveldb/impl/LogWriter;

    invoke-interface {v5}, Lorg/iq80/leveldb/impl/LogWriter;->close()V

    .line 302
    new-instance v5, Ljava/io/File;

    iget-object v6, p0, Lorg/iq80/leveldb/impl/VersionSet;->databaseDir:Ljava/io/File;

    iget-object v7, p0, Lorg/iq80/leveldb/impl/VersionSet;->descriptorLog:Lorg/iq80/leveldb/impl/LogWriter;

    invoke-interface {v7}, Lorg/iq80/leveldb/impl/LogWriter;->getFileNumber()J

    move-result-wide v8

    invoke-static {v8, v9}, Lorg/iq80/leveldb/impl/Filename;->logFileName(J)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 303
    iput-object v12, p0, Lorg/iq80/leveldb/impl/VersionSet;->descriptorLog:Lorg/iq80/leveldb/impl/LogWriter;

    .line 305
    :cond_6
    throw v2
.end method

.method public makeInputIterator(Lorg/iq80/leveldb/impl/Compaction;)Lorg/iq80/leveldb/util/MergingIterator;
    .locals 6
    .param p1, "c"    # Lorg/iq80/leveldb/impl/Compaction;

    .prologue
    .line 204
    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v1

    .line 205
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/util/InternalIterator;>;"
    const/4 v2, 0x0

    .local v2, "which":I
    :goto_0
    const/4 v3, 0x2

    if-ge v2, v3, :cond_2

    .line 206
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/Compaction;->getInputs()[Ljava/util/List;

    move-result-object v3

    aget-object v3, v3, v2

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 207
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/Compaction;->getLevel()I

    move-result v3

    add-int/2addr v3, v2

    if-nez v3, :cond_1

    .line 208
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/Compaction;->getInputs()[Ljava/util/List;

    move-result-object v3

    aget-object v0, v3, v2

    .line 209
    .local v0, "files":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    new-instance v3, Lorg/iq80/leveldb/util/Level0Iterator;

    iget-object v4, p0, Lorg/iq80/leveldb/impl/VersionSet;->tableCache:Lorg/iq80/leveldb/impl/TableCache;

    iget-object v5, p0, Lorg/iq80/leveldb/impl/VersionSet;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-direct {v3, v4, v0, v5}, Lorg/iq80/leveldb/util/Level0Iterator;-><init>(Lorg/iq80/leveldb/impl/TableCache;Ljava/util/List;Ljava/util/Comparator;)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 205
    .end local v0    # "files":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 213
    :cond_1
    iget-object v3, p0, Lorg/iq80/leveldb/impl/VersionSet;->tableCache:Lorg/iq80/leveldb/impl/TableCache;

    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/Compaction;->getInputs()[Ljava/util/List;

    move-result-object v4

    aget-object v4, v4, v2

    iget-object v5, p0, Lorg/iq80/leveldb/impl/VersionSet;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-static {v3, v4, v5}, Lorg/iq80/leveldb/impl/Level;->createLevelConcatIterator(Lorg/iq80/leveldb/impl/TableCache;Ljava/util/List;Lorg/iq80/leveldb/impl/InternalKeyComparator;)Lorg/iq80/leveldb/util/LevelIterator;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 217
    :cond_2
    new-instance v3, Lorg/iq80/leveldb/util/MergingIterator;

    iget-object v4, p0, Lorg/iq80/leveldb/impl/VersionSet;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-direct {v3, v1, v4}, Lorg/iq80/leveldb/util/MergingIterator;-><init>(Ljava/util/List;Ljava/util/Comparator;)V

    return-object v3
.end method

.method public needsCompaction()Z
    .locals 4

    .prologue
    .line 488
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/Version;->getCompactionScore()D

    move-result-wide v0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    cmpl-double v0, v0, v2

    if-gez v0, :cond_0

    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/Version;->getFileToCompact()Lorg/iq80/leveldb/impl/FileMetaData;

    move-result-object v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public numberOfBytesInLevel(I)J
    .locals 2
    .param p1, "level"    # I

    .prologue
    .line 237
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v0, p1}, Lorg/iq80/leveldb/impl/Version;->numberOfFilesInLevel(I)I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public numberOfFilesInLevel(I)I
    .locals 1
    .param p1, "level"    # I

    .prologue
    .line 232
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v0, p1}, Lorg/iq80/leveldb/impl/Version;->numberOfFilesInLevel(I)I

    move-result v0

    return v0
.end method

.method public overlapInLevel(ILorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)Z
    .locals 1
    .param p1, "level"    # I
    .param p2, "smallestUserKey"    # Lorg/iq80/leveldb/util/Slice;
    .param p3, "largestUserKey"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 227
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v0, p1, p2, p3}, Lorg/iq80/leveldb/impl/Version;->overlapInLevel(ILorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)Z

    move-result v0

    return v0
.end method

.method public pickCompaction()Lorg/iq80/leveldb/impl/Compaction;
    .locals 12

    .prologue
    .line 505
    iget-object v7, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v7}, Lorg/iq80/leveldb/impl/Version;->getCompactionScore()D

    move-result-wide v8

    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    cmpl-double v7, v8, v10

    if-ltz v7, :cond_5

    const/4 v6, 0x1

    .line 506
    .local v6, "sizeCompaction":Z
    :goto_0
    iget-object v7, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v7}, Lorg/iq80/leveldb/impl/Version;->getFileToCompact()Lorg/iq80/leveldb/impl/FileMetaData;

    move-result-object v7

    if-eqz v7, :cond_6

    const/4 v5, 0x1

    .line 510
    .local v5, "seekCompaction":Z
    :goto_1
    if-eqz v6, :cond_9

    .line 511
    iget-object v7, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v7}, Lorg/iq80/leveldb/impl/Version;->getCompactionLevel()I

    move-result v2

    .line 512
    .local v2, "level":I
    if-ltz v2, :cond_7

    const/4 v7, 0x1

    :goto_2
    invoke-static {v7}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 513
    add-int/lit8 v7, v2, 0x1

    const/4 v8, 0x7

    if-ge v7, v8, :cond_8

    const/4 v7, 0x1

    :goto_3
    invoke-static {v7}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 516
    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v3

    .line 517
    .local v3, "levelInputs":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    iget-object v7, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v7, v2}, Lorg/iq80/leveldb/impl/Version;->getFiles(I)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 518
    .local v1, "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    iget-object v7, p0, Lorg/iq80/leveldb/impl/VersionSet;->compactPointers:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v7, v9}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    iget-object v9, p0, Lorg/iq80/leveldb/impl/VersionSet;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    .line 519
    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/FileMetaData;->getLargest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v10

    iget-object v7, p0, Lorg/iq80/leveldb/impl/VersionSet;->compactPointers:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v7, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-virtual {v9, v10, v7}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->compare(Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)I

    move-result v7

    if-lez v7, :cond_0

    .line 520
    :cond_1
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 524
    .end local v1    # "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_2
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 526
    iget-object v7, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v7, v2}, Lorg/iq80/leveldb/impl/Version;->getFiles(I)Ljava/util/List;

    move-result-object v7

    const/4 v8, 0x0

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 538
    :cond_3
    :goto_4
    if-nez v2, :cond_4

    .line 539
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/util/List;

    const/4 v8, 0x0

    aput-object v3, v7, v8

    invoke-direct {p0, v7}, Lorg/iq80/leveldb/impl/VersionSet;->getRange([Ljava/util/List;)Ljava/util/Map$Entry;

    move-result-object v4

    .line 543
    .local v4, "range":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;>;"
    const/4 v9, 0x0

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-virtual {p0, v9, v7, v8}, Lorg/iq80/leveldb/impl/VersionSet;->getOverlappingInputs(ILorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)Ljava/util/List;

    move-result-object v3

    .line 545
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_b

    const/4 v7, 0x1

    :goto_5
    invoke-static {v7}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 548
    .end local v4    # "range":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;>;"
    :cond_4
    invoke-direct {p0, v2, v3}, Lorg/iq80/leveldb/impl/VersionSet;->setupOtherInputs(ILjava/util/List;)Lorg/iq80/leveldb/impl/Compaction;

    move-result-object v0

    .line 549
    .end local v2    # "level":I
    .end local v3    # "levelInputs":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    :goto_6
    return-object v0

    .line 505
    .end local v5    # "seekCompaction":Z
    .end local v6    # "sizeCompaction":Z
    :cond_5
    const/4 v6, 0x0

    goto/16 :goto_0

    .line 506
    .restart local v6    # "sizeCompaction":Z
    :cond_6
    const/4 v5, 0x0

    goto/16 :goto_1

    .line 512
    .restart local v2    # "level":I
    .restart local v5    # "seekCompaction":Z
    :cond_7
    const/4 v7, 0x0

    goto/16 :goto_2

    .line 513
    :cond_8
    const/4 v7, 0x0

    goto/16 :goto_3

    .line 529
    .end local v2    # "level":I
    :cond_9
    if-eqz v5, :cond_a

    .line 530
    iget-object v7, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v7}, Lorg/iq80/leveldb/impl/Version;->getFileToCompactLevel()I

    move-result v2

    .line 531
    .restart local v2    # "level":I
    iget-object v7, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v7}, Lorg/iq80/leveldb/impl/Version;->getFileToCompact()Lorg/iq80/leveldb/impl/FileMetaData;

    move-result-object v7

    invoke-static {v7}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v3

    .restart local v3    # "levelInputs":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    goto :goto_4

    .line 534
    .end local v2    # "level":I
    .end local v3    # "levelInputs":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    :cond_a
    const/4 v0, 0x0

    goto :goto_6

    .line 545
    .restart local v2    # "level":I
    .restart local v3    # "levelInputs":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    .restart local v4    # "range":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;>;"
    :cond_b
    const/4 v7, 0x0

    goto :goto_5
.end method

.method public recover()V
    .locals 27
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 335
    new-instance v9, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/iq80/leveldb/impl/VersionSet;->databaseDir:Ljava/io/File;

    invoke-static {}, Lorg/iq80/leveldb/impl/Filename;->currentFileName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v9, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 336
    .local v9, "currentFile":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v4

    const-string v5, "CURRENT file does not exist"

    invoke-static {v4, v5}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 338
    sget-object v4, Lcom/google/common/base/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-static {v9, v4}, Lcom/google/common/io/Files;->toString(Ljava/io/File;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v10

    .line 339
    .local v10, "currentName":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v10, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0xa

    if-eq v4, v5, :cond_1

    .line 340
    :cond_0
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "CURRENT file does not end with newline"

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 342
    :cond_1
    const/4 v4, 0x0

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v10, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 345
    new-instance v13, Ljava/io/FileInputStream;

    new-instance v4, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/iq80/leveldb/impl/VersionSet;->databaseDir:Ljava/io/File;

    invoke-direct {v4, v5, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v13, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .local v13, "fis":Ljava/io/FileInputStream;
    const/16 v23, 0x0

    .line 346
    :try_start_0
    invoke-virtual {v13}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    move-result-object v3

    .line 345
    .local v3, "fileChannel":Ljava/nio/channels/FileChannel;
    const/16 v22, 0x0

    .line 348
    const/16 v17, 0x0

    .line 349
    .local v17, "nextFileNumber":Ljava/lang/Long;
    const/4 v14, 0x0

    .line 350
    .local v14, "lastSequence":Ljava/lang/Long;
    const/4 v15, 0x0

    .line 351
    .local v15, "logNumber":Ljava/lang/Long;
    const/16 v18, 0x0

    .line 352
    .local v18, "prevLogNumber":Ljava/lang/Long;
    :try_start_1
    new-instance v8, Lorg/iq80/leveldb/impl/VersionSet$Builder;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    invoke-direct {v8, v0, v4, v5}, Lorg/iq80/leveldb/impl/VersionSet$Builder;-><init>(Lorg/iq80/leveldb/impl/VersionSet;Lorg/iq80/leveldb/impl/Version;Lorg/iq80/leveldb/impl/VersionSet$1;)V

    .line 354
    .local v8, "builder":Lorg/iq80/leveldb/impl/VersionSet$Builder;
    new-instance v2, Lorg/iq80/leveldb/impl/LogReader;

    invoke-static {}, Lorg/iq80/leveldb/impl/LogMonitors;->throwExceptionMonitor()Lorg/iq80/leveldb/impl/LogMonitor;

    move-result-object v4

    const/4 v5, 0x1

    const-wide/16 v6, 0x0

    invoke-direct/range {v2 .. v7}, Lorg/iq80/leveldb/impl/LogReader;-><init>(Ljava/nio/channels/FileChannel;Lorg/iq80/leveldb/impl/LogMonitor;ZJ)V

    .line 355
    .local v2, "reader":Lorg/iq80/leveldb/impl/LogReader;
    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/LogReader;->readRecord()Lorg/iq80/leveldb/util/Slice;

    move-result-object v20

    .local v20, "record":Lorg/iq80/leveldb/util/Slice;
    :goto_0
    if-eqz v20, :cond_4

    .line 357
    new-instance v11, Lorg/iq80/leveldb/impl/VersionEdit;

    move-object/from16 v0, v20

    invoke-direct {v11, v0}, Lorg/iq80/leveldb/impl/VersionEdit;-><init>(Lorg/iq80/leveldb/util/Slice;)V

    .line 361
    .local v11, "edit":Lorg/iq80/leveldb/impl/VersionEdit;
    invoke-virtual {v11}, Lorg/iq80/leveldb/impl/VersionEdit;->getComparatorName()Ljava/lang/String;

    move-result-object v12

    .line 362
    .local v12, "editComparator":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/iq80/leveldb/impl/VersionSet;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->name()Ljava/lang/String;

    move-result-object v21

    .line 363
    .local v21, "userComparator":Ljava/lang/String;
    if-eqz v12, :cond_2

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    :cond_2
    const/4 v4, 0x1

    :goto_1
    const-string v5, "Expected user comparator %s to match existing database comparator "

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v21, v6, v7

    const/4 v7, 0x1

    aput-object v12, v6, v7

    invoke-static {v4, v5, v6}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 367
    invoke-virtual {v8, v11}, Lorg/iq80/leveldb/impl/VersionSet$Builder;->apply(Lorg/iq80/leveldb/impl/VersionEdit;)V

    .line 370
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Long;

    const/4 v5, 0x0

    invoke-virtual {v11}, Lorg/iq80/leveldb/impl/VersionEdit;->getLogNumber()Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    aput-object v15, v4, v5

    invoke-static {v4}, Lorg/iq80/leveldb/impl/VersionSet;->coalesce([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Ljava/lang/Long;

    move-object v15, v0

    .line 371
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Long;

    const/4 v5, 0x0

    invoke-virtual {v11}, Lorg/iq80/leveldb/impl/VersionEdit;->getPreviousLogNumber()Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    aput-object v18, v4, v5

    invoke-static {v4}, Lorg/iq80/leveldb/impl/VersionSet;->coalesce([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Ljava/lang/Long;

    move-object/from16 v18, v0

    .line 372
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Long;

    const/4 v5, 0x0

    invoke-virtual {v11}, Lorg/iq80/leveldb/impl/VersionEdit;->getNextFileNumber()Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    aput-object v17, v4, v5

    invoke-static {v4}, Lorg/iq80/leveldb/impl/VersionSet;->coalesce([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Ljava/lang/Long;

    move-object/from16 v17, v0

    .line 373
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Long;

    const/4 v5, 0x0

    invoke-virtual {v11}, Lorg/iq80/leveldb/impl/VersionEdit;->getLastSequenceNumber()Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    aput-object v14, v4, v5

    invoke-static {v4}, Lorg/iq80/leveldb/impl/VersionSet;->coalesce([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Ljava/lang/Long;

    move-object v14, v0

    .line 355
    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/LogReader;->readRecord()Lorg/iq80/leveldb/util/Slice;

    move-result-object v20

    goto/16 :goto_0

    .line 363
    :cond_3
    const/4 v4, 0x0

    goto :goto_1

    .line 376
    .end local v11    # "edit":Lorg/iq80/leveldb/impl/VersionEdit;
    .end local v12    # "editComparator":Ljava/lang/String;
    .end local v21    # "userComparator":Ljava/lang/String;
    :cond_4
    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v19

    .line 377
    .local v19, "problems":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez v17, :cond_5

    .line 378
    const-string v4, "Descriptor does not contain a meta-nextfile entry"

    move-object/from16 v0, v19

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 380
    :cond_5
    if-nez v15, :cond_6

    .line 381
    const-string v4, "Descriptor does not contain a meta-lognumber entry"

    move-object/from16 v0, v19

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 383
    :cond_6
    if-nez v14, :cond_7

    .line 384
    const-string v4, "Descriptor does not contain a last-sequence-number entry"

    move-object/from16 v0, v19

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 386
    :cond_7
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_a

    .line 387
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Corruption: \n\t"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n\t"

    invoke-static {v6}, Lcom/google/common/base/Joiner;->on(Ljava/lang/String;)Lcom/google/common/base/Joiner;

    move-result-object v6

    move-object/from16 v0, v19

    invoke-virtual {v6, v0}, Lcom/google/common/base/Joiner;->join(Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 345
    .end local v2    # "reader":Lorg/iq80/leveldb/impl/LogReader;
    .end local v8    # "builder":Lorg/iq80/leveldb/impl/VersionSet$Builder;
    .end local v19    # "problems":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v20    # "record":Lorg/iq80/leveldb/util/Slice;
    :catch_0
    move-exception v4

    :try_start_2
    throw v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 406
    :catchall_0
    move-exception v5

    move-object/from16 v26, v5

    move-object v5, v4

    move-object/from16 v4, v26

    :goto_2
    if-eqz v3, :cond_8

    if-eqz v5, :cond_f

    :try_start_3
    invoke-virtual {v3}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :cond_8
    :goto_3
    :try_start_4
    throw v4
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 345
    .end local v3    # "fileChannel":Ljava/nio/channels/FileChannel;
    .end local v14    # "lastSequence":Ljava/lang/Long;
    .end local v15    # "logNumber":Ljava/lang/Long;
    .end local v17    # "nextFileNumber":Ljava/lang/Long;
    .end local v18    # "prevLogNumber":Ljava/lang/Long;
    :catch_1
    move-exception v4

    :try_start_5
    throw v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 406
    :catchall_1
    move-exception v5

    move-object/from16 v26, v5

    move-object v5, v4

    move-object/from16 v4, v26

    :goto_4
    if-eqz v13, :cond_9

    if-eqz v5, :cond_11

    :try_start_6
    invoke-virtual {v13}, Ljava/io/FileInputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_5

    :cond_9
    :goto_5
    throw v4

    .line 390
    .restart local v2    # "reader":Lorg/iq80/leveldb/impl/LogReader;
    .restart local v3    # "fileChannel":Ljava/nio/channels/FileChannel;
    .restart local v8    # "builder":Lorg/iq80/leveldb/impl/VersionSet$Builder;
    .restart local v14    # "lastSequence":Ljava/lang/Long;
    .restart local v15    # "logNumber":Ljava/lang/Long;
    .restart local v17    # "nextFileNumber":Ljava/lang/Long;
    .restart local v18    # "prevLogNumber":Ljava/lang/Long;
    .restart local v19    # "problems":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v20    # "record":Lorg/iq80/leveldb/util/Slice;
    :cond_a
    if-nez v18, :cond_b

    .line 391
    const-wide/16 v4, 0x0

    :try_start_7
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    .line 394
    :cond_b
    new-instance v16, Lorg/iq80/leveldb/impl/Version;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/iq80/leveldb/impl/Version;-><init>(Lorg/iq80/leveldb/impl/VersionSet;)V

    .line 395
    .local v16, "newVersion":Lorg/iq80/leveldb/impl/Version;
    move-object/from16 v0, v16

    invoke-virtual {v8, v0}, Lorg/iq80/leveldb/impl/VersionSet$Builder;->saveTo(Lorg/iq80/leveldb/impl/Version;)V

    .line 398
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lorg/iq80/leveldb/impl/VersionSet;->finalizeVersion(Lorg/iq80/leveldb/impl/Version;)V

    .line 400
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lorg/iq80/leveldb/impl/VersionSet;->appendVersion(Lorg/iq80/leveldb/impl/Version;)V

    .line 401
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lorg/iq80/leveldb/impl/VersionSet;->manifestFileNumber:J

    .line 402
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/iq80/leveldb/impl/VersionSet;->nextFileNumber:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    const-wide/16 v24, 0x1

    add-long v6, v6, v24

    invoke-virtual {v4, v6, v7}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 403
    invoke-virtual {v14}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lorg/iq80/leveldb/impl/VersionSet;->lastSequence:J

    .line 404
    invoke-virtual {v15}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lorg/iq80/leveldb/impl/VersionSet;->logNumber:J

    .line 405
    invoke-virtual/range {v18 .. v18}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lorg/iq80/leveldb/impl/VersionSet;->prevLogNumber:J
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 406
    if-eqz v3, :cond_c

    if-eqz v22, :cond_e

    :try_start_8
    invoke-virtual {v3}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :cond_c
    :goto_6
    if-eqz v13, :cond_d

    if-eqz v23, :cond_10

    :try_start_9
    invoke-virtual {v13}, Ljava/io/FileInputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_4

    .line 407
    :cond_d
    :goto_7
    return-void

    .line 406
    :catch_2
    move-exception v4

    :try_start_a
    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_6

    .end local v2    # "reader":Lorg/iq80/leveldb/impl/LogReader;
    .end local v3    # "fileChannel":Ljava/nio/channels/FileChannel;
    .end local v8    # "builder":Lorg/iq80/leveldb/impl/VersionSet$Builder;
    .end local v14    # "lastSequence":Ljava/lang/Long;
    .end local v15    # "logNumber":Ljava/lang/Long;
    .end local v16    # "newVersion":Lorg/iq80/leveldb/impl/Version;
    .end local v17    # "nextFileNumber":Ljava/lang/Long;
    .end local v18    # "prevLogNumber":Ljava/lang/Long;
    .end local v19    # "problems":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v20    # "record":Lorg/iq80/leveldb/util/Slice;
    :catchall_2
    move-exception v4

    move-object/from16 v5, v23

    goto :goto_4

    .restart local v2    # "reader":Lorg/iq80/leveldb/impl/LogReader;
    .restart local v3    # "fileChannel":Ljava/nio/channels/FileChannel;
    .restart local v8    # "builder":Lorg/iq80/leveldb/impl/VersionSet$Builder;
    .restart local v14    # "lastSequence":Ljava/lang/Long;
    .restart local v15    # "logNumber":Ljava/lang/Long;
    .restart local v16    # "newVersion":Lorg/iq80/leveldb/impl/Version;
    .restart local v17    # "nextFileNumber":Ljava/lang/Long;
    .restart local v18    # "prevLogNumber":Ljava/lang/Long;
    .restart local v19    # "problems":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v20    # "record":Lorg/iq80/leveldb/util/Slice;
    :cond_e
    invoke-virtual {v3}, Ljava/nio/channels/FileChannel;->close()V

    goto :goto_6

    .end local v2    # "reader":Lorg/iq80/leveldb/impl/LogReader;
    .end local v8    # "builder":Lorg/iq80/leveldb/impl/VersionSet$Builder;
    .end local v16    # "newVersion":Lorg/iq80/leveldb/impl/Version;
    .end local v19    # "problems":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v20    # "record":Lorg/iq80/leveldb/util/Slice;
    :catch_3
    move-exception v6

    invoke-virtual {v5, v6}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto/16 :goto_3

    :cond_f
    invoke-virtual {v3}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    goto/16 :goto_3

    .restart local v2    # "reader":Lorg/iq80/leveldb/impl/LogReader;
    .restart local v8    # "builder":Lorg/iq80/leveldb/impl/VersionSet$Builder;
    .restart local v16    # "newVersion":Lorg/iq80/leveldb/impl/Version;
    .restart local v19    # "problems":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v20    # "record":Lorg/iq80/leveldb/util/Slice;
    :catch_4
    move-exception v4

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_7

    :cond_10
    invoke-virtual {v13}, Ljava/io/FileInputStream;->close()V

    goto :goto_7

    .end local v2    # "reader":Lorg/iq80/leveldb/impl/LogReader;
    .end local v3    # "fileChannel":Ljava/nio/channels/FileChannel;
    .end local v8    # "builder":Lorg/iq80/leveldb/impl/VersionSet$Builder;
    .end local v14    # "lastSequence":Ljava/lang/Long;
    .end local v15    # "logNumber":Ljava/lang/Long;
    .end local v16    # "newVersion":Lorg/iq80/leveldb/impl/Version;
    .end local v17    # "nextFileNumber":Ljava/lang/Long;
    .end local v18    # "prevLogNumber":Ljava/lang/Long;
    .end local v19    # "problems":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v20    # "record":Lorg/iq80/leveldb/util/Slice;
    :catch_5
    move-exception v6

    invoke-virtual {v5, v6}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto/16 :goto_5

    :cond_11
    invoke-virtual {v13}, Ljava/io/FileInputStream;->close()V

    goto/16 :goto_5

    .restart local v3    # "fileChannel":Ljava/nio/channels/FileChannel;
    .restart local v14    # "lastSequence":Ljava/lang/Long;
    .restart local v15    # "logNumber":Ljava/lang/Long;
    .restart local v17    # "nextFileNumber":Ljava/lang/Long;
    .restart local v18    # "prevLogNumber":Ljava/lang/Long;
    :catchall_3
    move-exception v4

    move-object/from16 v5, v22

    goto/16 :goto_2
.end method

.method public removeVersion(Lorg/iq80/leveldb/impl/Version;)V
    .locals 5
    .param p1, "version"    # Lorg/iq80/leveldb/impl/Version;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 152
    const-string v1, "version is null"

    invoke-static {p1, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    iget-object v1, p0, Lorg/iq80/leveldb/impl/VersionSet;->current:Lorg/iq80/leveldb/impl/Version;

    if-eq p1, v1, :cond_0

    move v1, v2

    :goto_0
    const-string v4, "version is the current version"

    invoke-static {v1, v4}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 154
    iget-object v1, p0, Lorg/iq80/leveldb/impl/VersionSet;->activeVersions:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    move v0, v2

    .line 155
    .local v0, "removed":Z
    :goto_1
    sget-boolean v1, Lorg/iq80/leveldb/impl/VersionSet;->$assertionsDisabled:Z

    if-nez v1, :cond_2

    if-nez v0, :cond_2

    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "Expected the version to still be in the active set"

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .end local v0    # "removed":Z
    :cond_0
    move v1, v3

    .line 153
    goto :goto_0

    :cond_1
    move v0, v3

    .line 154
    goto :goto_1

    .line 156
    .restart local v0    # "removed":Z
    :cond_2
    return-void
.end method

.method public setLastSequence(J)V
    .locals 3
    .param p1, "newLastSequence"    # J

    .prologue
    .line 247
    iget-wide v0, p0, Lorg/iq80/leveldb/impl/VersionSet;->lastSequence:J

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    const-string v1, "Expected newLastSequence to be greater than or equal to current lastSequence"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 248
    iput-wide p1, p0, Lorg/iq80/leveldb/impl/VersionSet;->lastSequence:J

    .line 249
    return-void

    .line 247
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
