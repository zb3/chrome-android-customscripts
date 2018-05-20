.class public Lorg/iq80/leveldb/impl/DbImpl;
.super Ljava/lang/Object;
.source "DbImpl.java"

# interfaces
.implements Lorg/iq80/leveldb/DB;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/iq80/leveldb/impl/DbImpl$BackgroundProcessingException;,
        Lorg/iq80/leveldb/impl/DbImpl$DatabaseShutdownException;,
        Lorg/iq80/leveldb/impl/DbImpl$InsertIntoHandler;,
        Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;,
        Lorg/iq80/leveldb/impl/DbImpl$CompactionState;
    }
.end annotation


# instance fields
.field private backgroundCompaction:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation
.end field

.field private final backgroundCondition:Ljava/util/concurrent/locks/Condition;

.field private volatile backgroundException:Ljava/lang/Throwable;

.field private final compactionExecutor:Ljava/util/concurrent/ExecutorService;

.field private final databaseDir:Ljava/io/File;

.field private final dbLock:Lorg/iq80/leveldb/impl/DbLock;

.field private immutableMemTable:Lorg/iq80/leveldb/impl/MemTable;

.field private final internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

.field private log:Lorg/iq80/leveldb/impl/LogWriter;

.field private manualCompaction:Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;

.field private memTable:Lorg/iq80/leveldb/impl/MemTable;

.field private final mutex:Ljava/util/concurrent/locks/ReentrantLock;

.field private final options:Lorg/iq80/leveldb/Options;

.field private final pendingOutputs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final shuttingDown:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private suspensionCounter:I

.field private final suspensionMutex:Ljava/lang/Object;

.field private final tableCache:Lorg/iq80/leveldb/impl/TableCache;

.field private final versions:Lorg/iq80/leveldb/impl/VersionSet;


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/Options;Ljava/io/File;)V
    .locals 27
    .param p1, "options"    # Lorg/iq80/leveldb/Options;
    .param p2, "databaseDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 92
    new-instance v23, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct/range {v23 .. v23}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/iq80/leveldb/impl/DbImpl;->shuttingDown:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 93
    new-instance v23, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct/range {v23 .. v23}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    .line 94
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCondition:Ljava/util/concurrent/locks/Condition;

    .line 96
    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/iq80/leveldb/impl/DbImpl;->pendingOutputs:Ljava/util/List;

    .line 1401
    new-instance v23, Ljava/lang/Object;

    invoke-direct/range {v23 .. v23}, Ljava/lang/Object;-><init>()V

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/iq80/leveldb/impl/DbImpl;->suspensionMutex:Ljava/lang/Object;

    .line 114
    const-string v23, "options is null"

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    const-string v23, "databaseDir is null"

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/iq80/leveldb/impl/DbImpl;->options:Lorg/iq80/leveldb/Options;

    .line 118
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/iq80/leveldb/impl/DbImpl;->options:Lorg/iq80/leveldb/Options;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lorg/iq80/leveldb/Options;->compressionType()Lorg/iq80/leveldb/CompressionType;

    move-result-object v23

    sget-object v24, Lorg/iq80/leveldb/CompressionType;->SNAPPY:Lorg/iq80/leveldb/CompressionType;

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    if-ne v0, v1, :cond_0

    invoke-static {}, Lorg/iq80/leveldb/util/Snappy;->available()Z

    move-result v23

    if-nez v23, :cond_0

    .line 120
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/iq80/leveldb/impl/DbImpl;->options:Lorg/iq80/leveldb/Options;

    move-object/from16 v23, v0

    sget-object v24, Lorg/iq80/leveldb/CompressionType;->NONE:Lorg/iq80/leveldb/CompressionType;

    invoke-virtual/range {v23 .. v24}, Lorg/iq80/leveldb/Options;->compressionType(Lorg/iq80/leveldb/CompressionType;)Lorg/iq80/leveldb/Options;

    .line 123
    :cond_0
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/iq80/leveldb/impl/DbImpl;->databaseDir:Ljava/io/File;

    .line 126
    invoke-virtual/range {p1 .. p1}, Lorg/iq80/leveldb/Options;->comparator()Lorg/iq80/leveldb/DBComparator;

    move-result-object v5

    .line 128
    .local v5, "comparator":Lorg/iq80/leveldb/DBComparator;
    if-eqz v5, :cond_3

    .line 129
    new-instance v22, Lorg/iq80/leveldb/table/CustomUserComparator;

    move-object/from16 v0, v22

    invoke-direct {v0, v5}, Lorg/iq80/leveldb/table/CustomUserComparator;-><init>(Lorg/iq80/leveldb/DBComparator;)V

    .line 134
    .local v22, "userComparator":Lorg/iq80/leveldb/table/UserComparator;
    :goto_0
    new-instance v23, Lorg/iq80/leveldb/impl/InternalKeyComparator;

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/iq80/leveldb/impl/InternalKeyComparator;-><init>(Lorg/iq80/leveldb/table/UserComparator;)V

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/iq80/leveldb/impl/DbImpl;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    .line 135
    new-instance v23, Lorg/iq80/leveldb/impl/MemTable;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/iq80/leveldb/impl/DbImpl;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    move-object/from16 v24, v0

    invoke-direct/range {v23 .. v24}, Lorg/iq80/leveldb/impl/MemTable;-><init>(Lorg/iq80/leveldb/impl/InternalKeyComparator;)V

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/iq80/leveldb/impl/DbImpl;->memTable:Lorg/iq80/leveldb/impl/MemTable;

    .line 136
    const/16 v23, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/iq80/leveldb/impl/DbImpl;->immutableMemTable:Lorg/iq80/leveldb/impl/MemTable;

    .line 138
    new-instance v23, Lcom/google/common/util/concurrent/ThreadFactoryBuilder;

    invoke-direct/range {v23 .. v23}, Lcom/google/common/util/concurrent/ThreadFactoryBuilder;-><init>()V

    const-string v24, "leveldb-compaction-%s"

    .line 139
    invoke-virtual/range {v23 .. v24}, Lcom/google/common/util/concurrent/ThreadFactoryBuilder;->setNameFormat(Ljava/lang/String;)Lcom/google/common/util/concurrent/ThreadFactoryBuilder;

    move-result-object v23

    new-instance v24, Lorg/iq80/leveldb/impl/DbImpl$1;

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/iq80/leveldb/impl/DbImpl$1;-><init>(Lorg/iq80/leveldb/impl/DbImpl;)V

    .line 140
    invoke-virtual/range {v23 .. v24}, Lcom/google/common/util/concurrent/ThreadFactoryBuilder;->setUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)Lcom/google/common/util/concurrent/ThreadFactoryBuilder;

    move-result-object v23

    .line 150
    invoke-virtual/range {v23 .. v23}, Lcom/google/common/util/concurrent/ThreadFactoryBuilder;->build()Ljava/util/concurrent/ThreadFactory;

    move-result-object v4

    .line 151
    .local v4, "compactionThreadFactory":Ljava/util/concurrent/ThreadFactory;
    invoke-static {v4}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/iq80/leveldb/impl/DbImpl;->compactionExecutor:Ljava/util/concurrent/ExecutorService;

    .line 154
    invoke-virtual/range {p1 .. p1}, Lorg/iq80/leveldb/Options;->maxOpenFiles()I

    move-result v23

    add-int/lit8 v15, v23, -0xa

    .line 155
    .local v15, "tableCacheSize":I
    new-instance v23, Lorg/iq80/leveldb/impl/TableCache;

    new-instance v24, Lorg/iq80/leveldb/impl/InternalUserComparator;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/iq80/leveldb/impl/DbImpl;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    move-object/from16 v25, v0

    invoke-direct/range {v24 .. v25}, Lorg/iq80/leveldb/impl/InternalUserComparator;-><init>(Lorg/iq80/leveldb/impl/InternalKeyComparator;)V

    invoke-virtual/range {p1 .. p1}, Lorg/iq80/leveldb/Options;->verifyChecksums()Z

    move-result v25

    move-object/from16 v0, v23

    move-object/from16 v1, p2

    move-object/from16 v2, v24

    move/from16 v3, v25

    invoke-direct {v0, v1, v15, v2, v3}, Lorg/iq80/leveldb/impl/TableCache;-><init>(Ljava/io/File;ILorg/iq80/leveldb/table/UserComparator;Z)V

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/iq80/leveldb/impl/DbImpl;->tableCache:Lorg/iq80/leveldb/impl/TableCache;

    .line 160
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->mkdirs()Z

    .line 161
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->exists()Z

    move-result v23

    const-string v24, "Database directory \'%s\' does not exist and could not be created"

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    aput-object p2, v25, v26

    invoke-static/range {v23 .. v25}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 162
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->isDirectory()Z

    move-result v23

    const-string v24, "Database directory \'%s\' is not a directory"

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    aput-object p2, v25, v26

    invoke-static/range {v23 .. v25}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 164
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 167
    :try_start_0
    new-instance v23, Lorg/iq80/leveldb/impl/DbLock;

    new-instance v24, Ljava/io/File;

    invoke-static {}, Lorg/iq80/leveldb/impl/Filename;->lockFileName()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v24

    move-object/from16 v1, p2

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct/range {v23 .. v24}, Lorg/iq80/leveldb/impl/DbLock;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/iq80/leveldb/impl/DbImpl;->dbLock:Lorg/iq80/leveldb/impl/DbLock;

    .line 170
    new-instance v6, Ljava/io/File;

    invoke-static {}, Lorg/iq80/leveldb/impl/Filename;->currentFileName()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-direct {v6, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 171
    .local v6, "currentFile":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->canRead()Z

    move-result v23

    if-nez v23, :cond_4

    .line 172
    invoke-virtual/range {p1 .. p1}, Lorg/iq80/leveldb/Options;->createIfMissing()Z

    move-result v23

    const-string v24, "Database \'%s\' does not exist and the create if missing option is disabled"

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    aput-object p2, v25, v26

    invoke-static/range {v23 .. v25}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 178
    :goto_1
    new-instance v23, Lorg/iq80/leveldb/impl/VersionSet;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/iq80/leveldb/impl/DbImpl;->tableCache:Lorg/iq80/leveldb/impl/TableCache;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/iq80/leveldb/impl/DbImpl;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    move-object/from16 v25, v0

    move-object/from16 v0, v23

    move-object/from16 v1, p2

    move-object/from16 v2, v24

    move-object/from16 v3, v25

    invoke-direct {v0, v1, v2, v3}, Lorg/iq80/leveldb/impl/VersionSet;-><init>(Ljava/io/File;Lorg/iq80/leveldb/impl/TableCache;Lorg/iq80/leveldb/impl/InternalKeyComparator;)V

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    .line 181
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lorg/iq80/leveldb/impl/VersionSet;->recover()V

    .line 190
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lorg/iq80/leveldb/impl/VersionSet;->getLogNumber()J

    move-result-wide v18

    .line 191
    .local v18, "minLogNumber":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lorg/iq80/leveldb/impl/VersionSet;->getPrevLogNumber()J

    move-result-wide v20

    .line 192
    .local v20, "previousLogNumber":J
    invoke-static/range {p2 .. p2}, Lorg/iq80/leveldb/impl/Filename;->listFiles(Ljava/io/File;)Ljava/util/List;

    move-result-object v11

    .line 194
    .local v11, "filenames":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v14

    .line 195
    .local v14, "logs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :cond_1
    :goto_2
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_6

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/io/File;

    .line 196
    .local v10, "filename":Ljava/io/File;
    invoke-static {v10}, Lorg/iq80/leveldb/impl/Filename;->parseFileName(Ljava/io/File;)Lorg/iq80/leveldb/impl/Filename$FileInfo;

    move-result-object v8

    .line 198
    .local v8, "fileInfo":Lorg/iq80/leveldb/impl/Filename$FileInfo;
    if-eqz v8, :cond_1

    .line 199
    invoke-virtual {v8}, Lorg/iq80/leveldb/impl/Filename$FileInfo;->getFileType()Lorg/iq80/leveldb/impl/Filename$FileType;

    move-result-object v24

    sget-object v25, Lorg/iq80/leveldb/impl/Filename$FileType;->LOG:Lorg/iq80/leveldb/impl/Filename$FileType;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    if-ne v0, v1, :cond_1

    .line 200
    invoke-virtual {v8}, Lorg/iq80/leveldb/impl/Filename$FileInfo;->getFileNumber()J

    move-result-wide v24

    cmp-long v24, v24, v18

    if-gez v24, :cond_2

    invoke-virtual {v8}, Lorg/iq80/leveldb/impl/Filename$FileInfo;->getFileNumber()J

    move-result-wide v24

    cmp-long v24, v24, v20

    if-nez v24, :cond_1

    .line 201
    :cond_2
    invoke-virtual {v8}, Lorg/iq80/leveldb/impl/Filename$FileInfo;->getFileNumber()J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    .line 230
    .end local v6    # "currentFile":Ljava/io/File;
    .end local v8    # "fileInfo":Lorg/iq80/leveldb/impl/Filename$FileInfo;
    .end local v10    # "filename":Ljava/io/File;
    .end local v11    # "filenames":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v14    # "logs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    .end local v18    # "minLogNumber":J
    .end local v20    # "previousLogNumber":J
    :catchall_0
    move-exception v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 231
    throw v23

    .line 132
    .end local v4    # "compactionThreadFactory":Ljava/util/concurrent/ThreadFactory;
    .end local v15    # "tableCacheSize":I
    .end local v22    # "userComparator":Lorg/iq80/leveldb/table/UserComparator;
    :cond_3
    new-instance v22, Lorg/iq80/leveldb/table/BytewiseComparator;

    invoke-direct/range {v22 .. v22}, Lorg/iq80/leveldb/table/BytewiseComparator;-><init>()V

    .restart local v22    # "userComparator":Lorg/iq80/leveldb/table/UserComparator;
    goto/16 :goto_0

    .line 175
    .restart local v4    # "compactionThreadFactory":Ljava/util/concurrent/ThreadFactory;
    .restart local v6    # "currentFile":Ljava/io/File;
    .restart local v15    # "tableCacheSize":I
    :cond_4
    :try_start_1
    invoke-virtual/range {p1 .. p1}, Lorg/iq80/leveldb/Options;->errorIfExists()Z

    move-result v23

    if-nez v23, :cond_5

    const/16 v23, 0x1

    :goto_3
    const-string v24, "Database \'%s\' exists and the error if exists option is enabled"

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    aput-object p2, v25, v26

    invoke-static/range {v23 .. v25}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_1

    :cond_5
    const/16 v23, 0x0

    goto :goto_3

    .line 206
    .restart local v11    # "filenames":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .restart local v14    # "logs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    .restart local v18    # "minLogNumber":J
    .restart local v20    # "previousLogNumber":J
    :cond_6
    new-instance v7, Lorg/iq80/leveldb/impl/VersionEdit;

    invoke-direct {v7}, Lorg/iq80/leveldb/impl/VersionEdit;-><init>()V

    .line 207
    .local v7, "edit":Lorg/iq80/leveldb/impl/VersionEdit;
    invoke-static {v14}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 208
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :cond_7
    :goto_4
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_8

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Long;

    .line 209
    .local v9, "fileNumber":Ljava/lang/Long;
    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v24

    move-object/from16 v0, p0

    move-wide/from16 v1, v24

    invoke-direct {v0, v1, v2, v7}, Lorg/iq80/leveldb/impl/DbImpl;->recoverLogFile(JLorg/iq80/leveldb/impl/VersionEdit;)J

    move-result-wide v16

    .line 210
    .local v16, "maxSequence":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lorg/iq80/leveldb/impl/VersionSet;->getLastSequence()J

    move-result-wide v24

    cmp-long v24, v24, v16

    if-gez v24, :cond_7

    .line 211
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-wide/from16 v1, v16

    invoke-virtual {v0, v1, v2}, Lorg/iq80/leveldb/impl/VersionSet;->setLastSequence(J)V

    goto :goto_4

    .line 216
    .end local v9    # "fileNumber":Ljava/lang/Long;
    .end local v16    # "maxSequence":J
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lorg/iq80/leveldb/impl/VersionSet;->getNextFileNumber()J

    move-result-wide v12

    .line 217
    .local v12, "logFileNumber":J
    new-instance v23, Ljava/io/File;

    invoke-static {v12, v13}, Lorg/iq80/leveldb/impl/Filename;->logFileName(J)Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v23

    move-object/from16 v1, p2

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object/from16 v0, v23

    invoke-static {v0, v12, v13}, Lorg/iq80/leveldb/impl/Logs;->createLogWriter(Ljava/io/File;J)Lorg/iq80/leveldb/impl/LogWriter;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/iq80/leveldb/impl/DbImpl;->log:Lorg/iq80/leveldb/impl/LogWriter;

    .line 218
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/iq80/leveldb/impl/DbImpl;->log:Lorg/iq80/leveldb/impl/LogWriter;

    move-object/from16 v23, v0

    invoke-interface/range {v23 .. v23}, Lorg/iq80/leveldb/impl/LogWriter;->getFileNumber()J

    move-result-wide v24

    move-wide/from16 v0, v24

    invoke-virtual {v7, v0, v1}, Lorg/iq80/leveldb/impl/VersionEdit;->setLogNumber(J)V

    .line 221
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Lorg/iq80/leveldb/impl/VersionSet;->logAndApply(Lorg/iq80/leveldb/impl/VersionEdit;)V

    .line 224
    invoke-direct/range {p0 .. p0}, Lorg/iq80/leveldb/impl/DbImpl;->deleteObsoleteFiles()V

    .line 227
    invoke-direct/range {p0 .. p0}, Lorg/iq80/leveldb/impl/DbImpl;->maybeScheduleCompaction()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 230
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 232
    return-void
.end method

.method static synthetic access$100(Lorg/iq80/leveldb/impl/DbImpl;)V
    .locals 0
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 83
    invoke-direct {p0}, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCall()V

    return-void
.end method

.method static synthetic access$1700(Lorg/iq80/leveldb/impl/DbImpl;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl;

    .prologue
    .line 83
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->suspensionMutex:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$1800(Lorg/iq80/leveldb/impl/DbImpl;)I
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl;

    .prologue
    .line 83
    iget v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->suspensionCounter:I

    return v0
.end method

.method static synthetic access$1808(Lorg/iq80/leveldb/impl/DbImpl;)I
    .locals 2
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl;

    .prologue
    .line 83
    iget v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->suspensionCounter:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->suspensionCounter:I

    return v0
.end method

.method static synthetic access$1900(Lorg/iq80/leveldb/impl/DbImpl;)Ljava/util/concurrent/ExecutorService;
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl;

    .prologue
    .line 83
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->compactionExecutor:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method static synthetic access$202(Lorg/iq80/leveldb/impl/DbImpl;Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .locals 0
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl;
    .param p1, "x1"    # Ljava/lang/Throwable;

    .prologue
    .line 83
    iput-object p1, p0, Lorg/iq80/leveldb/impl/DbImpl;->backgroundException:Ljava/lang/Throwable;

    return-object p1
.end method

.method private backgroundCall()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 426
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 428
    :try_start_0
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCompaction:Ljava/util/concurrent/Future;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    if-nez v0, :cond_0

    .line 445
    :try_start_1
    invoke-direct {p0}, Lorg/iq80/leveldb/impl/DbImpl;->maybeScheduleCompaction()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 449
    :try_start_2
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 452
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 456
    :goto_0
    return-void

    .line 452
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 453
    throw v0

    .line 448
    :catchall_1
    move-exception v0

    .line 449
    :try_start_3
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 452
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 454
    throw v0

    .line 452
    :catchall_2
    move-exception v0

    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 453
    throw v0

    .line 433
    :cond_0
    :try_start_4
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->shuttingDown:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_1

    .line 434
    invoke-direct {p0}, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCompaction()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 438
    :cond_1
    const/4 v0, 0x0

    :try_start_5
    iput-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCompaction:Ljava/util/concurrent/Future;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 445
    :try_start_6
    invoke-direct {p0}, Lorg/iq80/leveldb/impl/DbImpl;->maybeScheduleCompaction()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_6

    .line 449
    :try_start_7
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    .line 452
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_0

    .line 438
    :catchall_3
    move-exception v0

    const/4 v1, 0x0

    :try_start_8
    iput-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCompaction:Ljava/util/concurrent/Future;

    .line 439
    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 442
    :catchall_4
    move-exception v0

    .line 445
    :try_start_9
    invoke-direct {p0}, Lorg/iq80/leveldb/impl/DbImpl;->maybeScheduleCompaction()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_9

    .line 449
    :try_start_a
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_8

    .line 452
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 455
    throw v0

    .line 452
    :catchall_5
    move-exception v0

    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 453
    throw v0

    .line 448
    :catchall_6
    move-exception v0

    .line 449
    :try_start_b
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_7

    .line 452
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 454
    throw v0

    .line 452
    :catchall_7
    move-exception v0

    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 453
    throw v0

    .line 452
    :catchall_8
    move-exception v0

    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 453
    throw v0

    .line 448
    :catchall_9
    move-exception v0

    .line 449
    :try_start_c
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_a

    .line 452
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 454
    throw v0

    .line 452
    :catchall_a
    move-exception v0

    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 453
    throw v0
.end method

.method private backgroundCompaction()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v13, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 461
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v5

    invoke-static {v5}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 463
    invoke-direct {p0}, Lorg/iq80/leveldb/impl/DbImpl;->compactMemTableInternal()V

    .line 466
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->manualCompaction:Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;

    if-eqz v5, :cond_1

    .line 467
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->manualCompaction:Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;

    # getter for: Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;->level:I
    invoke-static {v6}, Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;->access$300(Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;)I

    move-result v6

    new-instance v7, Lorg/iq80/leveldb/impl/InternalKey;

    iget-object v8, p0, Lorg/iq80/leveldb/impl/DbImpl;->manualCompaction:Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;

    .line 468
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;->begin:Lorg/iq80/leveldb/util/Slice;
    invoke-static {v8}, Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;->access$400(Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v8

    const-wide v10, 0xffffffffffffffL

    sget-object v9, Lorg/iq80/leveldb/impl/ValueType;->VALUE:Lorg/iq80/leveldb/impl/ValueType;

    invoke-direct {v7, v8, v10, v11, v9}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;JLorg/iq80/leveldb/impl/ValueType;)V

    new-instance v8, Lorg/iq80/leveldb/impl/InternalKey;

    iget-object v9, p0, Lorg/iq80/leveldb/impl/DbImpl;->manualCompaction:Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;

    .line 469
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;->end:Lorg/iq80/leveldb/util/Slice;
    invoke-static {v9}, Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;->access$500(Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v9

    const-wide/16 v10, 0x0

    sget-object v12, Lorg/iq80/leveldb/impl/ValueType;->DELETION:Lorg/iq80/leveldb/impl/ValueType;

    invoke-direct {v8, v9, v10, v11, v12}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;JLorg/iq80/leveldb/impl/ValueType;)V

    .line 467
    invoke-virtual {v5, v6, v7, v8}, Lorg/iq80/leveldb/impl/VersionSet;->compactRange(ILorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)Lorg/iq80/leveldb/impl/Compaction;

    move-result-object v0

    .line 475
    .local v0, "compaction":Lorg/iq80/leveldb/impl/Compaction;
    :goto_0
    if-nez v0, :cond_2

    .line 494
    :goto_1
    iget-object v3, p0, Lorg/iq80/leveldb/impl/DbImpl;->manualCompaction:Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;

    if-eqz v3, :cond_0

    .line 495
    iput-object v13, p0, Lorg/iq80/leveldb/impl/DbImpl;->manualCompaction:Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;

    .line 497
    :cond_0
    return-void

    .line 472
    .end local v0    # "compaction":Lorg/iq80/leveldb/impl/Compaction;
    :cond_1
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v5}, Lorg/iq80/leveldb/impl/VersionSet;->pickCompaction()Lorg/iq80/leveldb/impl/Compaction;

    move-result-object v0

    .restart local v0    # "compaction":Lorg/iq80/leveldb/impl/Compaction;
    goto :goto_0

    .line 478
    :cond_2
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->manualCompaction:Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;

    if-nez v5, :cond_4

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/Compaction;->isTrivialMove()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 480
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/Compaction;->getLevelInputs()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ne v5, v3, :cond_3

    :goto_2
    invoke-static {v3}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 481
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/Compaction;->getLevelInputs()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 482
    .local v2, "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/Compaction;->getEdit()Lorg/iq80/leveldb/impl/VersionEdit;

    move-result-object v3

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/Compaction;->getLevel()I

    move-result v4

    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/FileMetaData;->getNumber()J

    move-result-wide v6

    invoke-virtual {v3, v4, v6, v7}, Lorg/iq80/leveldb/impl/VersionEdit;->deleteFile(IJ)V

    .line 483
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/Compaction;->getEdit()Lorg/iq80/leveldb/impl/VersionEdit;

    move-result-object v3

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/Compaction;->getLevel()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v3, v4, v2}, Lorg/iq80/leveldb/impl/VersionEdit;->addFile(ILorg/iq80/leveldb/impl/FileMetaData;)V

    .line 484
    iget-object v3, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/Compaction;->getEdit()Lorg/iq80/leveldb/impl/VersionEdit;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/iq80/leveldb/impl/VersionSet;->logAndApply(Lorg/iq80/leveldb/impl/VersionEdit;)V

    goto :goto_1

    .end local v2    # "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_3
    move v3, v4

    .line 480
    goto :goto_2

    .line 488
    :cond_4
    new-instance v1, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;

    invoke-direct {v1, v0, v13}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;-><init>(Lorg/iq80/leveldb/impl/Compaction;Lorg/iq80/leveldb/impl/DbImpl$1;)V

    .line 489
    .local v1, "compactionState":Lorg/iq80/leveldb/impl/DbImpl$CompactionState;
    invoke-direct {p0, v1}, Lorg/iq80/leveldb/impl/DbImpl;->doCompactionWork(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)V

    .line 490
    invoke-direct {p0, v1}, Lorg/iq80/leveldb/impl/DbImpl;->cleanupCompaction(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)V

    goto :goto_1
.end method

.method private buildTable(Lorg/iq80/leveldb/impl/SeekingIterable;J)Lorg/iq80/leveldb/impl/FileMetaData;
    .locals 14
    .param p2, "fileNumber"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/iq80/leveldb/impl/SeekingIterable",
            "<",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            "Lorg/iq80/leveldb/util/Slice;",
            ">;J)",
            "Lorg/iq80/leveldb/impl/FileMetaData;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 975
    .local p1, "data":Lorg/iq80/leveldb/impl/SeekingIterable;, "Lorg/iq80/leveldb/impl/SeekingIterable<Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/util/Slice;>;"
    new-instance v10, Ljava/io/File;

    iget-object v2, p0, Lorg/iq80/leveldb/impl/DbImpl;->databaseDir:Ljava/io/File;

    invoke-static/range {p2 .. p3}, Lorg/iq80/leveldb/impl/Filename;->tableFileName(J)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v10, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 977
    .local v10, "file":Ljava/io/File;
    const/4 v6, 0x0

    .line 978
    .local v6, "smallest":Lorg/iq80/leveldb/impl/InternalKey;
    const/4 v7, 0x0

    .line 979
    .local v7, "largest":Lorg/iq80/leveldb/impl/InternalKey;
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 981
    .local v0, "channel":Ljava/nio/channels/FileChannel;
    :try_start_1
    new-instance v12, Lorg/iq80/leveldb/table/TableBuilder;

    iget-object v2, p0, Lorg/iq80/leveldb/impl/DbImpl;->options:Lorg/iq80/leveldb/Options;

    new-instance v3, Lorg/iq80/leveldb/impl/InternalUserComparator;

    iget-object v4, p0, Lorg/iq80/leveldb/impl/DbImpl;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-direct {v3, v4}, Lorg/iq80/leveldb/impl/InternalUserComparator;-><init>(Lorg/iq80/leveldb/impl/InternalKeyComparator;)V

    invoke-direct {v12, v2, v0, v3}, Lorg/iq80/leveldb/table/TableBuilder;-><init>(Lorg/iq80/leveldb/Options;Ljava/nio/channels/FileChannel;Lorg/iq80/leveldb/table/UserComparator;)V

    .line 983
    .local v12, "tableBuilder":Lorg/iq80/leveldb/table/TableBuilder;
    invoke-interface {p1}, Lorg/iq80/leveldb/impl/SeekingIterable;->iterator()Lorg/iq80/leveldb/impl/SeekingIterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map$Entry;

    .line 985
    .local v9, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/util/Slice;>;"
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/iq80/leveldb/impl/InternalKey;

    .line 986
    .local v11, "key":Lorg/iq80/leveldb/impl/InternalKey;
    if-nez v6, :cond_0

    .line 987
    move-object v6, v11

    .line 989
    :cond_0
    move-object v7, v11

    .line 991
    invoke-virtual {v11}, Lorg/iq80/leveldb/impl/InternalKey;->encode()Lorg/iq80/leveldb/util/Slice;

    move-result-object v4

    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v12, v4, v2}, Lorg/iq80/leveldb/table/TableBuilder;->add(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 997
    .end local v9    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/util/Slice;>;"
    .end local v11    # "key":Lorg/iq80/leveldb/impl/InternalKey;
    .end local v12    # "tableBuilder":Lorg/iq80/leveldb/table/TableBuilder;
    :catchall_0
    move-exception v2

    .line 998
    const/4 v3, 0x1

    :try_start_2
    invoke-virtual {v0, v3}, Ljava/nio/channels/FileChannel;->force(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 1001
    :try_start_3
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V

    .line 1003
    throw v2
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 1018
    .end local v0    # "channel":Ljava/nio/channels/FileChannel;
    :catch_0
    move-exception v8

    .line 1019
    .local v8, "e":Ljava/io/IOException;
    invoke-virtual {v10}, Ljava/io/File;->delete()Z

    .line 1020
    throw v8

    .line 994
    .end local v8    # "e":Ljava/io/IOException;
    .restart local v0    # "channel":Ljava/nio/channels/FileChannel;
    .restart local v12    # "tableBuilder":Lorg/iq80/leveldb/table/TableBuilder;
    :cond_1
    :try_start_4
    invoke-virtual {v12}, Lorg/iq80/leveldb/table/TableBuilder;->finish()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 998
    const/4 v2, 0x1

    :try_start_5
    invoke-virtual {v0, v2}, Ljava/nio/channels/FileChannel;->force(Z)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 1001
    :try_start_6
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V

    .line 1005
    if-nez v6, :cond_2

    .line 1006
    const/4 v1, 0x0

    .line 1015
    :goto_1
    return-object v1

    .line 1001
    :catchall_1
    move-exception v2

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V

    .line 1002
    throw v2

    .line 1001
    .end local v12    # "tableBuilder":Lorg/iq80/leveldb/table/TableBuilder;
    :catchall_2
    move-exception v2

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V

    .line 1002
    throw v2

    .line 1008
    .restart local v12    # "tableBuilder":Lorg/iq80/leveldb/table/TableBuilder;
    :cond_2
    new-instance v1, Lorg/iq80/leveldb/impl/FileMetaData;

    invoke-virtual {v10}, Ljava/io/File;->length()J

    move-result-wide v4

    move-wide/from16 v2, p2

    invoke-direct/range {v1 .. v7}, Lorg/iq80/leveldb/impl/FileMetaData;-><init>(JJLorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)V

    .line 1011
    .local v1, "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    iget-object v2, p0, Lorg/iq80/leveldb/impl/DbImpl;->tableCache:Lorg/iq80/leveldb/impl/TableCache;

    invoke-virtual {v2, v1}, Lorg/iq80/leveldb/impl/TableCache;->newIterator(Lorg/iq80/leveldb/impl/FileMetaData;)Lorg/iq80/leveldb/util/InternalTableIterator;

    .line 1013
    iget-object v2, p0, Lorg/iq80/leveldb/impl/DbImpl;->pendingOutputs:Ljava/util/List;

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    goto :goto_1
.end method

.method private cleanupCompaction(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)V
    .locals 6
    .param p1, "compactionState"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;

    .prologue
    .line 501
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v1

    invoke-static {v1}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 503
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->builder:Lorg/iq80/leveldb/table/TableBuilder;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$700(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/table/TableBuilder;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 504
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->builder:Lorg/iq80/leveldb/table/TableBuilder;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$700(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/table/TableBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lorg/iq80/leveldb/table/TableBuilder;->abandon()V

    .line 510
    :goto_0
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->outputs:Ljava/util/List;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$900(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 511
    .local v0, "output":Lorg/iq80/leveldb/impl/FileMetaData;
    iget-object v2, p0, Lorg/iq80/leveldb/impl/DbImpl;->pendingOutputs:Ljava/util/List;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getNumber()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_1

    .line 507
    .end local v0    # "output":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_0
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->outfile:Ljava/nio/channels/FileChannel;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$800(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Ljava/nio/channels/FileChannel;

    move-result-object v1

    if-nez v1, :cond_1

    const/4 v1, 0x1

    :goto_2
    invoke-static {v1}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_2

    .line 513
    :cond_2
    return-void
.end method

.method private compactMemTableInternal()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 907
    iget-object v2, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v2

    invoke-static {v2}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 908
    iget-object v2, p0, Lorg/iq80/leveldb/impl/DbImpl;->immutableMemTable:Lorg/iq80/leveldb/impl/MemTable;

    if-nez v2, :cond_0

    .line 934
    :goto_0
    return-void

    .line 914
    :cond_0
    :try_start_0
    new-instance v1, Lorg/iq80/leveldb/impl/VersionEdit;

    invoke-direct {v1}, Lorg/iq80/leveldb/impl/VersionEdit;-><init>()V

    .line 915
    .local v1, "edit":Lorg/iq80/leveldb/impl/VersionEdit;
    iget-object v2, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/VersionSet;->getCurrent()Lorg/iq80/leveldb/impl/Version;

    move-result-object v0

    .line 916
    .local v0, "base":Lorg/iq80/leveldb/impl/Version;
    iget-object v2, p0, Lorg/iq80/leveldb/impl/DbImpl;->immutableMemTable:Lorg/iq80/leveldb/impl/MemTable;

    invoke-direct {p0, v2, v1, v0}, Lorg/iq80/leveldb/impl/DbImpl;->writeLevel0Table(Lorg/iq80/leveldb/impl/MemTable;Lorg/iq80/leveldb/impl/VersionEdit;Lorg/iq80/leveldb/impl/Version;)V

    .line 918
    iget-object v2, p0, Lorg/iq80/leveldb/impl/DbImpl;->shuttingDown:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 919
    new-instance v2, Lorg/iq80/leveldb/impl/DbImpl$DatabaseShutdownException;

    const-string v3, "Database shutdown during memtable compaction"

    invoke-direct {v2, v3}, Lorg/iq80/leveldb/impl/DbImpl$DatabaseShutdownException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 932
    .end local v0    # "base":Lorg/iq80/leveldb/impl/Version;
    .end local v1    # "edit":Lorg/iq80/leveldb/impl/VersionEdit;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 933
    throw v2

    .line 923
    .restart local v0    # "base":Lorg/iq80/leveldb/impl/Version;
    .restart local v1    # "edit":Lorg/iq80/leveldb/impl/VersionEdit;
    :cond_1
    const-wide/16 v2, 0x0

    :try_start_1
    invoke-virtual {v1, v2, v3}, Lorg/iq80/leveldb/impl/VersionEdit;->setPreviousLogNumber(J)V

    .line 924
    iget-object v2, p0, Lorg/iq80/leveldb/impl/DbImpl;->log:Lorg/iq80/leveldb/impl/LogWriter;

    invoke-interface {v2}, Lorg/iq80/leveldb/impl/LogWriter;->getFileNumber()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lorg/iq80/leveldb/impl/VersionEdit;->setLogNumber(J)V

    .line 925
    iget-object v2, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v2, v1}, Lorg/iq80/leveldb/impl/VersionSet;->logAndApply(Lorg/iq80/leveldb/impl/VersionEdit;)V

    .line 927
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/iq80/leveldb/impl/DbImpl;->immutableMemTable:Lorg/iq80/leveldb/impl/MemTable;

    .line 929
    invoke-direct {p0}, Lorg/iq80/leveldb/impl/DbImpl;->deleteObsoleteFiles()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 932
    iget-object v2, p0, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    goto :goto_0
.end method

.method private deleteObsoleteFiles()V
    .locals 12

    .prologue
    const/4 v8, 0x1

    const/4 v5, 0x0

    .line 281
    iget-object v9, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v9}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v9

    invoke-static {v9}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 284
    iget-object v9, p0, Lorg/iq80/leveldb/impl/DbImpl;->pendingOutputs:Ljava/util/List;

    invoke-static {v9}, Lcom/google/common/collect/Lists;->newArrayList(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v4

    .line 285
    .local v4, "live":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    iget-object v9, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v9}, Lorg/iq80/leveldb/impl/VersionSet;->getLiveFiles()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_0

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 286
    .local v2, "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/FileMetaData;->getNumber()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-interface {v4, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 289
    .end local v2    # "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_0
    iget-object v9, p0, Lorg/iq80/leveldb/impl/DbImpl;->databaseDir:Ljava/io/File;

    invoke-static {v9}, Lorg/iq80/leveldb/impl/Filename;->listFiles(Ljava/io/File;)Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_1
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_6

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 290
    .local v0, "file":Ljava/io/File;
    invoke-static {v0}, Lorg/iq80/leveldb/impl/Filename;->parseFileName(Ljava/io/File;)Lorg/iq80/leveldb/impl/Filename$FileInfo;

    move-result-object v1

    .line 291
    .local v1, "fileInfo":Lorg/iq80/leveldb/impl/Filename$FileInfo;
    if-eqz v1, :cond_1

    .line 294
    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/Filename$FileInfo;->getFileNumber()J

    move-result-wide v6

    .line 295
    .local v6, "number":J
    const/4 v3, 0x1

    .line 296
    .local v3, "keep":Z
    sget-object v10, Lorg/iq80/leveldb/impl/DbImpl$6;->$SwitchMap$org$iq80$leveldb$impl$Filename$FileType:[I

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/Filename$FileInfo;->getFileType()Lorg/iq80/leveldb/impl/Filename$FileType;

    move-result-object v11

    invoke-virtual {v11}, Lorg/iq80/leveldb/impl/Filename$FileType;->ordinal()I

    move-result v11

    aget v10, v10, v11

    packed-switch v10, :pswitch_data_0

    .line 321
    :goto_2
    if-nez v3, :cond_1

    .line 322
    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/Filename$FileInfo;->getFileType()Lorg/iq80/leveldb/impl/Filename$FileType;

    move-result-object v10

    sget-object v11, Lorg/iq80/leveldb/impl/Filename$FileType;->TABLE:Lorg/iq80/leveldb/impl/Filename$FileType;

    if-ne v10, v11, :cond_2

    .line 323
    iget-object v10, p0, Lorg/iq80/leveldb/impl/DbImpl;->tableCache:Lorg/iq80/leveldb/impl/TableCache;

    invoke-virtual {v10, v6, v7}, Lorg/iq80/leveldb/impl/TableCache;->evict(J)V

    .line 329
    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    goto :goto_1

    .line 298
    :pswitch_0
    iget-object v10, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v10}, Lorg/iq80/leveldb/impl/VersionSet;->getLogNumber()J

    move-result-wide v10

    cmp-long v10, v6, v10

    if-gez v10, :cond_3

    iget-object v10, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    .line 299
    invoke-virtual {v10}, Lorg/iq80/leveldb/impl/VersionSet;->getPrevLogNumber()J

    move-result-wide v10

    cmp-long v10, v6, v10

    if-nez v10, :cond_4

    :cond_3
    move v3, v8

    .line 300
    :goto_3
    goto :goto_2

    :cond_4
    move v3, v5

    .line 299
    goto :goto_3

    .line 304
    :pswitch_1
    iget-object v10, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v10}, Lorg/iq80/leveldb/impl/VersionSet;->getManifestFileNumber()J

    move-result-wide v10

    cmp-long v10, v6, v10

    if-ltz v10, :cond_5

    move v3, v8

    .line 305
    :goto_4
    goto :goto_2

    :cond_5
    move v3, v5

    .line 304
    goto :goto_4

    .line 307
    :pswitch_2
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-interface {v4, v10}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    .line 308
    goto :goto_2

    .line 312
    :pswitch_3
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-interface {v4, v10}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    .line 313
    goto :goto_2

    .line 317
    :pswitch_4
    const/4 v3, 0x1

    goto :goto_2

    .line 332
    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "fileInfo":Lorg/iq80/leveldb/impl/Filename$FileInfo;
    .end local v3    # "keep":Z
    .end local v6    # "number":J
    :cond_6
    return-void

    .line 296
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_4
        :pswitch_4
    .end packed-switch
.end method

.method private doCompactionWork(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)V
    .locals 14
    .param p1, "compactionState"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v12, 0x0

    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 1027
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v5

    invoke-static {v5}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 1028
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->getCompaction()Lorg/iq80/leveldb/impl/Compaction;

    move-result-object v10

    invoke-virtual {v10}, Lorg/iq80/leveldb/impl/Compaction;->getLevel()I

    move-result v10

    invoke-virtual {v5, v10}, Lorg/iq80/leveldb/impl/VersionSet;->numberOfBytesInLevel(I)J

    move-result-wide v10

    cmp-long v5, v10, v12

    if-lez v5, :cond_7

    move v5, v8

    :goto_0
    invoke-static {v5}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 1029
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->builder:Lorg/iq80/leveldb/table/TableBuilder;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$700(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/table/TableBuilder;

    move-result-object v5

    if-nez v5, :cond_8

    move v5, v8

    :goto_1
    invoke-static {v5}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 1030
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->outfile:Ljava/nio/channels/FileChannel;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$800(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Ljava/nio/channels/FileChannel;

    move-result-object v5

    if-nez v5, :cond_9

    :goto_2
    invoke-static {v8}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 1033
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v5}, Lorg/iq80/leveldb/impl/VersionSet;->getLastSequence()J

    move-result-wide v8

    # setter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->smallestSnapshot:J
    invoke-static {p1, v8, v9}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1002(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;J)J

    .line 1036
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 1038
    :try_start_0
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->compaction:Lorg/iq80/leveldb/impl/Compaction;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1100(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/impl/Compaction;

    move-result-object v8

    invoke-virtual {v5, v8}, Lorg/iq80/leveldb/impl/VersionSet;->makeInputIterator(Lorg/iq80/leveldb/impl/Compaction;)Lorg/iq80/leveldb/util/MergingIterator;

    move-result-object v3

    .line 1040
    .local v3, "iterator":Lorg/iq80/leveldb/util/MergingIterator;
    const/4 v0, 0x0

    .line 1041
    .local v0, "currentUserKey":Lorg/iq80/leveldb/util/Slice;
    const/4 v2, 0x0

    .line 1043
    .local v2, "hasCurrentUserKey":Z
    const-wide v6, 0xffffffffffffffL

    .line 1044
    .local v6, "lastSequenceForKey":J
    :goto_3
    invoke-virtual {v3}, Lorg/iq80/leveldb/util/MergingIterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_b

    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->shuttingDown:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v5

    if-nez v5, :cond_b

    .line 1046
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1048
    :try_start_1
    invoke-direct {p0}, Lorg/iq80/leveldb/impl/DbImpl;->compactMemTableInternal()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1051
    :try_start_2
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 1054
    invoke-virtual {v3}, Lorg/iq80/leveldb/util/MergingIterator;->peek()Ljava/util/Map$Entry;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/iq80/leveldb/impl/InternalKey;

    .line 1055
    .local v4, "key":Lorg/iq80/leveldb/impl/InternalKey;
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->compaction:Lorg/iq80/leveldb/impl/Compaction;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1100(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/impl/Compaction;

    move-result-object v5

    invoke-virtual {v5, v4}, Lorg/iq80/leveldb/impl/Compaction;->shouldStopBefore(Lorg/iq80/leveldb/impl/InternalKey;)Z

    move-result v5

    if-eqz v5, :cond_0

    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->builder:Lorg/iq80/leveldb/table/TableBuilder;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$700(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/table/TableBuilder;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 1056
    invoke-direct {p0, p1}, Lorg/iq80/leveldb/impl/DbImpl;->finishCompactionOutputFile(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)V

    .line 1060
    :cond_0
    const/4 v1, 0x0

    .line 1069
    .local v1, "drop":Z
    if-eqz v2, :cond_1

    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-virtual {v5}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->getUserComparator()Lorg/iq80/leveldb/table/UserComparator;

    move-result-object v5

    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v8

    invoke-interface {v5, v8, v0}, Lorg/iq80/leveldb/table/UserComparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v5

    if-eqz v5, :cond_2

    .line 1071
    :cond_1
    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    .line 1072
    const/4 v2, 0x1

    .line 1073
    const-wide v6, 0xffffffffffffffL

    .line 1076
    :cond_2
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->smallestSnapshot:J
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1000(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)J

    move-result-wide v8

    cmp-long v5, v6, v8

    if-gtz v5, :cond_a

    .line 1078
    const/4 v1, 0x1

    .line 1093
    :cond_3
    :goto_4
    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/InternalKey;->getSequenceNumber()J

    move-result-wide v6

    .line 1096
    if-nez v1, :cond_6

    .line 1098
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->builder:Lorg/iq80/leveldb/table/TableBuilder;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$700(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/table/TableBuilder;

    move-result-object v5

    if-nez v5, :cond_4

    .line 1099
    invoke-direct {p0, p1}, Lorg/iq80/leveldb/impl/DbImpl;->openCompactionOutputFile(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)V

    .line 1101
    :cond_4
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->builder:Lorg/iq80/leveldb/table/TableBuilder;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$700(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/table/TableBuilder;

    move-result-object v5

    invoke-virtual {v5}, Lorg/iq80/leveldb/table/TableBuilder;->getEntryCount()J

    move-result-wide v8

    cmp-long v5, v8, v12

    if-nez v5, :cond_5

    .line 1102
    # setter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->currentSmallest:Lorg/iq80/leveldb/impl/InternalKey;
    invoke-static {p1, v4}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1202(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;Lorg/iq80/leveldb/impl/InternalKey;)Lorg/iq80/leveldb/impl/InternalKey;

    .line 1104
    :cond_5
    # setter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->currentLargest:Lorg/iq80/leveldb/impl/InternalKey;
    invoke-static {p1, v4}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1302(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;Lorg/iq80/leveldb/impl/InternalKey;)Lorg/iq80/leveldb/impl/InternalKey;

    .line 1105
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->builder:Lorg/iq80/leveldb/table/TableBuilder;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$700(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/table/TableBuilder;

    move-result-object v8

    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/InternalKey;->encode()Lorg/iq80/leveldb/util/Slice;

    move-result-object v9

    invoke-virtual {v3}, Lorg/iq80/leveldb/util/MergingIterator;->peek()Ljava/util/Map$Entry;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v8, v9, v5}, Lorg/iq80/leveldb/table/TableBuilder;->add(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)V

    .line 1108
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->builder:Lorg/iq80/leveldb/table/TableBuilder;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$700(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/table/TableBuilder;

    move-result-object v5

    invoke-virtual {v5}, Lorg/iq80/leveldb/table/TableBuilder;->getFileSize()J

    move-result-wide v8

    .line 1109
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->compaction:Lorg/iq80/leveldb/impl/Compaction;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1100(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/impl/Compaction;

    move-result-object v5

    invoke-virtual {v5}, Lorg/iq80/leveldb/impl/Compaction;->getMaxOutputFileSize()J

    move-result-wide v10

    cmp-long v5, v8, v10

    if-ltz v5, :cond_6

    .line 1110
    invoke-direct {p0, p1}, Lorg/iq80/leveldb/impl/DbImpl;->finishCompactionOutputFile(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)V

    .line 1113
    :cond_6
    invoke-virtual {v3}, Lorg/iq80/leveldb/util/MergingIterator;->next()Ljava/util/Map$Entry;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_3

    .line 1124
    .end local v0    # "currentUserKey":Lorg/iq80/leveldb/util/Slice;
    .end local v1    # "drop":Z
    .end local v2    # "hasCurrentUserKey":Z
    .end local v3    # "iterator":Lorg/iq80/leveldb/util/MergingIterator;
    .end local v4    # "key":Lorg/iq80/leveldb/impl/InternalKey;
    .end local v6    # "lastSequenceForKey":J
    :catchall_0
    move-exception v5

    iget-object v8, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 1125
    throw v5

    :cond_7
    move v5, v9

    .line 1028
    goto/16 :goto_0

    :cond_8
    move v5, v9

    .line 1029
    goto/16 :goto_1

    :cond_9
    move v8, v9

    .line 1030
    goto/16 :goto_2

    .line 1051
    .restart local v0    # "currentUserKey":Lorg/iq80/leveldb/util/Slice;
    .restart local v2    # "hasCurrentUserKey":Z
    .restart local v3    # "iterator":Lorg/iq80/leveldb/util/MergingIterator;
    .restart local v6    # "lastSequenceForKey":J
    :catchall_1
    move-exception v5

    :try_start_3
    iget-object v8, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 1052
    throw v5

    .line 1080
    .restart local v1    # "drop":Z
    .restart local v4    # "key":Lorg/iq80/leveldb/impl/InternalKey;
    :cond_a
    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/InternalKey;->getValueType()Lorg/iq80/leveldb/impl/ValueType;

    move-result-object v5

    sget-object v8, Lorg/iq80/leveldb/impl/ValueType;->DELETION:Lorg/iq80/leveldb/impl/ValueType;

    if-ne v5, v8, :cond_3

    .line 1081
    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/InternalKey;->getSequenceNumber()J

    move-result-wide v8

    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->smallestSnapshot:J
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1000(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)J

    move-result-wide v10

    cmp-long v5, v8, v10

    if-gtz v5, :cond_3

    .line 1082
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->compaction:Lorg/iq80/leveldb/impl/Compaction;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1100(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/impl/Compaction;

    move-result-object v5

    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v8

    invoke-virtual {v5, v8}, Lorg/iq80/leveldb/impl/Compaction;->isBaseLevelForKey(Lorg/iq80/leveldb/util/Slice;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 1090
    const/4 v1, 0x1

    goto/16 :goto_4

    .line 1116
    .end local v1    # "drop":Z
    .end local v4    # "key":Lorg/iq80/leveldb/impl/InternalKey;
    :cond_b
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->shuttingDown:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v5

    if-eqz v5, :cond_c

    .line 1117
    new-instance v5, Lorg/iq80/leveldb/impl/DbImpl$DatabaseShutdownException;

    const-string v8, "DB shutdown during compaction"

    invoke-direct {v5, v8}, Lorg/iq80/leveldb/impl/DbImpl$DatabaseShutdownException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1119
    :cond_c
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->builder:Lorg/iq80/leveldb/table/TableBuilder;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$700(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/table/TableBuilder;

    move-result-object v5

    if-eqz v5, :cond_d

    .line 1120
    invoke-direct {p0, p1}, Lorg/iq80/leveldb/impl/DbImpl;->finishCompactionOutputFile(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1124
    :cond_d
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 1129
    invoke-direct {p0, p1}, Lorg/iq80/leveldb/impl/DbImpl;->installCompactionResults(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)V

    .line 1130
    return-void
.end method

.method private finishCompactionOutputFile(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)V
    .locals 14
    .param p1, "compactionState"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1159
    const-string v0, "compactionState is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1160
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->outfile:Ljava/nio/channels/FileChannel;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$800(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Ljava/nio/channels/FileChannel;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 1161
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->builder:Lorg/iq80/leveldb/table/TableBuilder;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$700(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/table/TableBuilder;

    move-result-object v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    :goto_1
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 1163
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->currentFileNumber:J
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1400(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)J

    move-result-wide v12

    .line 1164
    .local v12, "outputNumber":J
    const-wide/16 v2, 0x0

    cmp-long v0, v12, v2

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    :goto_2
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 1166
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->builder:Lorg/iq80/leveldb/table/TableBuilder;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$700(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/table/TableBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/iq80/leveldb/table/TableBuilder;->getEntryCount()J

    move-result-wide v10

    .line 1167
    .local v10, "currentEntries":J
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->builder:Lorg/iq80/leveldb/table/TableBuilder;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$700(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/table/TableBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/iq80/leveldb/table/TableBuilder;->finish()V

    .line 1169
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->builder:Lorg/iq80/leveldb/table/TableBuilder;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$700(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/table/TableBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/iq80/leveldb/table/TableBuilder;->getFileSize()J

    move-result-wide v2

    const-wide/16 v4, 0x4

    sub-long v8, v2, v4

    .line 1170
    .local v8, "currentBytes":J
    # setter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->currentFileSize:J
    invoke-static {p1, v8, v9}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1502(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;J)J

    .line 1171
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->totalBytes:J
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1600(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)J

    move-result-wide v2

    add-long/2addr v2, v8

    # setter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->totalBytes:J
    invoke-static {p1, v2, v3}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1602(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;J)J

    .line 1173
    new-instance v1, Lorg/iq80/leveldb/impl/FileMetaData;

    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->currentFileNumber:J
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1400(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)J

    move-result-wide v2

    .line 1174
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->currentFileSize:J
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1500(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)J

    move-result-wide v4

    .line 1175
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->currentSmallest:Lorg/iq80/leveldb/impl/InternalKey;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1200(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v6

    .line 1176
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->currentLargest:Lorg/iq80/leveldb/impl/InternalKey;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1300(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v7

    invoke-direct/range {v1 .. v7}, Lorg/iq80/leveldb/impl/FileMetaData;-><init>(JJLorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)V

    .line 1177
    .local v1, "currentFileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->outputs:Ljava/util/List;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$900(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1179
    const/4 v0, 0x0

    # setter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->builder:Lorg/iq80/leveldb/table/TableBuilder;
    invoke-static {p1, v0}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$702(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;Lorg/iq80/leveldb/table/TableBuilder;)Lorg/iq80/leveldb/table/TableBuilder;

    .line 1181
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->outfile:Ljava/nio/channels/FileChannel;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$800(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Ljava/nio/channels/FileChannel;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 1182
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->outfile:Ljava/nio/channels/FileChannel;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$800(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Ljava/nio/channels/FileChannel;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V

    .line 1183
    const/4 v0, 0x0

    # setter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->outfile:Ljava/nio/channels/FileChannel;
    invoke-static {p1, v0}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$802(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;Ljava/nio/channels/FileChannel;)Ljava/nio/channels/FileChannel;

    .line 1185
    const-wide/16 v2, 0x0

    cmp-long v0, v10, v2

    if-lez v0, :cond_0

    .line 1187
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->tableCache:Lorg/iq80/leveldb/impl/TableCache;

    invoke-virtual {v0, v12, v13}, Lorg/iq80/leveldb/impl/TableCache;->newIterator(J)Lorg/iq80/leveldb/util/InternalTableIterator;

    .line 1189
    :cond_0
    return-void

    .line 1160
    .end local v1    # "currentFileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    .end local v8    # "currentBytes":J
    .end local v10    # "currentEntries":J
    .end local v12    # "outputNumber":J
    :cond_1
    const/4 v0, 0x0

    goto/16 :goto_0

    .line 1161
    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    .line 1164
    .restart local v12    # "outputNumber":J
    :cond_3
    const/4 v0, 0x0

    goto :goto_2
.end method

.method private getSnapshot(Lorg/iq80/leveldb/ReadOptions;)Lorg/iq80/leveldb/impl/SnapshotImpl;
    .locals 4
    .param p1, "options"    # Lorg/iq80/leveldb/ReadOptions;

    .prologue
    .line 799
    invoke-virtual {p1}, Lorg/iq80/leveldb/ReadOptions;->snapshot()Lorg/iq80/leveldb/Snapshot;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 800
    invoke-virtual {p1}, Lorg/iq80/leveldb/ReadOptions;->snapshot()Lorg/iq80/leveldb/Snapshot;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/SnapshotImpl;

    .line 806
    .local v0, "snapshot":Lorg/iq80/leveldb/impl/SnapshotImpl;
    :goto_0
    return-object v0

    .line 803
    .end local v0    # "snapshot":Lorg/iq80/leveldb/impl/SnapshotImpl;
    :cond_0
    new-instance v0, Lorg/iq80/leveldb/impl/SnapshotImpl;

    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/VersionSet;->getCurrent()Lorg/iq80/leveldb/impl/Version;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/VersionSet;->getLastSequence()J

    move-result-wide v2

    invoke-direct {v0, v1, v2, v3}, Lorg/iq80/leveldb/impl/SnapshotImpl;-><init>(Lorg/iq80/leveldb/impl/Version;J)V

    .line 804
    .restart local v0    # "snapshot":Lorg/iq80/leveldb/impl/SnapshotImpl;
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/SnapshotImpl;->close()V

    goto :goto_0
.end method

.method private installCompactionResults(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)V
    .locals 8
    .param p1, "compact"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1194
    iget-object v4, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v4

    invoke-static {v4}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 1197
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->compaction:Lorg/iq80/leveldb/impl/Compaction;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1100(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/impl/Compaction;

    move-result-object v4

    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->compaction:Lorg/iq80/leveldb/impl/Compaction;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1100(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/impl/Compaction;

    move-result-object v5

    invoke-virtual {v5}, Lorg/iq80/leveldb/impl/Compaction;->getEdit()Lorg/iq80/leveldb/impl/VersionEdit;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/iq80/leveldb/impl/Compaction;->addInputDeletions(Lorg/iq80/leveldb/impl/VersionEdit;)V

    .line 1198
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->compaction:Lorg/iq80/leveldb/impl/Compaction;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1100(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/impl/Compaction;

    move-result-object v4

    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/Compaction;->getLevel()I

    move-result v2

    .line 1199
    .local v2, "level":I
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->outputs:Ljava/util/List;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$900(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 1200
    .local v3, "output":Lorg/iq80/leveldb/impl/FileMetaData;
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->compaction:Lorg/iq80/leveldb/impl/Compaction;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1100(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/impl/Compaction;

    move-result-object v5

    invoke-virtual {v5}, Lorg/iq80/leveldb/impl/Compaction;->getEdit()Lorg/iq80/leveldb/impl/VersionEdit;

    move-result-object v5

    add-int/lit8 v6, v2, 0x1

    invoke-virtual {v5, v6, v3}, Lorg/iq80/leveldb/impl/VersionEdit;->addFile(ILorg/iq80/leveldb/impl/FileMetaData;)V

    .line 1201
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->pendingOutputs:Ljava/util/List;

    invoke-virtual {v3}, Lorg/iq80/leveldb/impl/FileMetaData;->getNumber()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1205
    .end local v3    # "output":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_0
    :try_start_0
    iget-object v4, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->compaction:Lorg/iq80/leveldb/impl/Compaction;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1100(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/impl/Compaction;

    move-result-object v5

    invoke-virtual {v5}, Lorg/iq80/leveldb/impl/Compaction;->getEdit()Lorg/iq80/leveldb/impl/VersionEdit;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/iq80/leveldb/impl/VersionSet;->logAndApply(Lorg/iq80/leveldb/impl/VersionEdit;)V

    .line 1206
    invoke-direct {p0}, Lorg/iq80/leveldb/impl/DbImpl;->deleteObsoleteFiles()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1218
    :goto_1
    return-void

    .line 1208
    :catch_0
    move-exception v0

    .line 1212
    .local v0, "e":Ljava/io/IOException;
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->outputs:Ljava/util/List;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$900(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 1213
    .restart local v3    # "output":Lorg/iq80/leveldb/impl/FileMetaData;
    new-instance v1, Ljava/io/File;

    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->databaseDir:Ljava/io/File;

    invoke-virtual {v3}, Lorg/iq80/leveldb/impl/FileMetaData;->getNumber()J

    move-result-wide v6

    invoke-static {v6, v7}, Lorg/iq80/leveldb/impl/Filename;->tableFileName(J)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v1, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1214
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    goto :goto_2

    .line 1216
    .end local v1    # "file":Ljava/io/File;
    .end local v3    # "output":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_1
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->outputs:Ljava/util/List;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$900(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->clear()V

    goto :goto_1
.end method

.method private makeRoomForWrite(Z)V
    .locals 10
    .param p1, "force"    # Z

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 811
    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v6

    invoke-static {v6}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 813
    if-nez p1, :cond_0

    move v0, v4

    .line 822
    .local v0, "allowDelay":Z
    :goto_0
    if-eqz v0, :cond_1

    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v6, v5}, Lorg/iq80/leveldb/impl/VersionSet;->numberOfFilesInLevel(I)I

    move-result v6

    const/16 v7, 0x8

    if-le v6, v7, :cond_1

    .line 830
    :try_start_0
    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 831
    const-wide/16 v6, 0x1

    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 838
    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 842
    const/4 v0, 0x0

    goto :goto_0

    .end local v0    # "allowDelay":Z
    :cond_0
    move v0, v5

    .line 813
    goto :goto_0

    .line 833
    .restart local v0    # "allowDelay":Z
    :catch_0
    move-exception v1

    .line 834
    .local v1, "e":Ljava/lang/InterruptedException;
    :try_start_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->interrupt()V

    .line 835
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 838
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v4

    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 839
    throw v4

    .line 844
    :cond_1
    if-nez p1, :cond_2

    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->memTable:Lorg/iq80/leveldb/impl/MemTable;

    invoke-virtual {v6}, Lorg/iq80/leveldb/impl/MemTable;->approximateMemoryUsage()J

    move-result-wide v6

    iget-object v8, p0, Lorg/iq80/leveldb/impl/DbImpl;->options:Lorg/iq80/leveldb/Options;

    invoke-virtual {v8}, Lorg/iq80/leveldb/Options;->writeBufferSize()I

    move-result v8

    int-to-long v8, v8

    cmp-long v6, v6, v8

    if-gtz v6, :cond_2

    .line 890
    return-void

    .line 848
    :cond_2
    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->immutableMemTable:Lorg/iq80/leveldb/impl/MemTable;

    if-eqz v6, :cond_3

    .line 851
    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v6}, Ljava/util/concurrent/locks/Condition;->awaitUninterruptibly()V

    goto :goto_0

    .line 853
    :cond_3
    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v6, v5}, Lorg/iq80/leveldb/impl/VersionSet;->numberOfFilesInLevel(I)I

    move-result v6

    const/16 v7, 0xc

    if-lt v6, v7, :cond_4

    .line 856
    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v6}, Ljava/util/concurrent/locks/Condition;->awaitUninterruptibly()V

    goto :goto_0

    .line 860
    :cond_4
    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v6}, Lorg/iq80/leveldb/impl/VersionSet;->getPrevLogNumber()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-nez v6, :cond_5

    move v6, v4

    :goto_1
    invoke-static {v6}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 864
    :try_start_2
    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->log:Lorg/iq80/leveldb/impl/LogWriter;

    invoke-interface {v6}, Lorg/iq80/leveldb/impl/LogWriter;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 871
    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v6}, Lorg/iq80/leveldb/impl/VersionSet;->getNextFileNumber()J

    move-result-wide v2

    .line 873
    .local v2, "logNumber":J
    :try_start_3
    new-instance v6, Ljava/io/File;

    iget-object v7, p0, Lorg/iq80/leveldb/impl/DbImpl;->databaseDir:Ljava/io/File;

    invoke-static {v2, v3}, Lorg/iq80/leveldb/impl/Filename;->logFileName(J)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v6, v2, v3}, Lorg/iq80/leveldb/impl/Logs;->createLogWriter(Ljava/io/File;J)Lorg/iq80/leveldb/impl/LogWriter;

    move-result-object v6

    iput-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->log:Lorg/iq80/leveldb/impl/LogWriter;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 881
    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->memTable:Lorg/iq80/leveldb/impl/MemTable;

    iput-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->immutableMemTable:Lorg/iq80/leveldb/impl/MemTable;

    .line 882
    new-instance v6, Lorg/iq80/leveldb/impl/MemTable;

    iget-object v7, p0, Lorg/iq80/leveldb/impl/DbImpl;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-direct {v6, v7}, Lorg/iq80/leveldb/impl/MemTable;-><init>(Lorg/iq80/leveldb/impl/InternalKeyComparator;)V

    iput-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->memTable:Lorg/iq80/leveldb/impl/MemTable;

    .line 885
    const/4 p1, 0x0

    .line 887
    invoke-direct {p0}, Lorg/iq80/leveldb/impl/DbImpl;->maybeScheduleCompaction()V

    goto/16 :goto_0

    .end local v2    # "logNumber":J
    :cond_5
    move v6, v5

    .line 860
    goto :goto_1

    .line 866
    :catch_1
    move-exception v1

    .line 867
    .local v1, "e":Ljava/io/IOException;
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unable to close log file "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->log:Lorg/iq80/leveldb/impl/LogWriter;

    invoke-interface {v6}, Lorg/iq80/leveldb/impl/LogWriter;->getFile()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 875
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v2    # "logNumber":J
    :catch_2
    move-exception v1

    .line 876
    .restart local v1    # "e":Ljava/io/IOException;
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unable to open new log file "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    new-instance v6, Ljava/io/File;

    iget-object v7, p0, Lorg/iq80/leveldb/impl/DbImpl;->databaseDir:Ljava/io/File;

    .line 877
    invoke-static {v2, v3}, Lorg/iq80/leveldb/impl/Filename;->logFileName(J)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method private maybeScheduleCompaction()V
    .locals 2

    .prologue
    .line 381
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v0

    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 383
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCompaction:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_1

    .line 413
    :cond_0
    :goto_0
    return-void

    .line 386
    :cond_1
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->shuttingDown:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    .line 389
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->immutableMemTable:Lorg/iq80/leveldb/impl/MemTable;

    if-nez v0, :cond_2

    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->manualCompaction:Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;

    if-nez v0, :cond_2

    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    .line 391
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/VersionSet;->needsCompaction()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 395
    :cond_2
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->compactionExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lorg/iq80/leveldb/impl/DbImpl$2;

    invoke-direct {v1, p0}, Lorg/iq80/leveldb/impl/DbImpl$2;-><init>(Lorg/iq80/leveldb/impl/DbImpl;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCompaction:Ljava/util/concurrent/Future;

    goto :goto_0
.end method

.method private openCompactionOutputFile(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)V
    .locals 8
    .param p1, "compactionState"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 1135
    const-string v1, "compactionState is null"

    invoke-static {p1, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1136
    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->builder:Lorg/iq80/leveldb/table/TableBuilder;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$700(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/table/TableBuilder;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    const-string v4, "compactionState builder is not null"

    invoke-static {v1, v4}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 1138
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 1140
    :try_start_0
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/VersionSet;->getNextFileNumber()J

    move-result-wide v2

    .line 1141
    .local v2, "fileNumber":J
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->pendingOutputs:Ljava/util/List;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1142
    # setter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->currentFileNumber:J
    invoke-static {p1, v2, v3}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1402(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;J)J

    .line 1143
    const-wide/16 v4, 0x0

    # setter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->currentFileSize:J
    invoke-static {p1, v4, v5}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1502(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;J)J

    .line 1144
    const/4 v1, 0x0

    # setter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->currentSmallest:Lorg/iq80/leveldb/impl/InternalKey;
    invoke-static {p1, v1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1202(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;Lorg/iq80/leveldb/impl/InternalKey;)Lorg/iq80/leveldb/impl/InternalKey;

    .line 1145
    const/4 v1, 0x0

    # setter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->currentLargest:Lorg/iq80/leveldb/impl/InternalKey;
    invoke-static {p1, v1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$1302(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;Lorg/iq80/leveldb/impl/InternalKey;)Lorg/iq80/leveldb/impl/InternalKey;

    .line 1147
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->databaseDir:Ljava/io/File;

    invoke-static {v2, v3}, Lorg/iq80/leveldb/impl/Filename;->tableFileName(J)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1148
    .local v0, "file":Ljava/io/File;
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    # setter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->outfile:Ljava/nio/channels/FileChannel;
    invoke-static {p1, v1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$802(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;Ljava/nio/channels/FileChannel;)Ljava/nio/channels/FileChannel;

    .line 1149
    new-instance v1, Lorg/iq80/leveldb/table/TableBuilder;

    iget-object v4, p0, Lorg/iq80/leveldb/impl/DbImpl;->options:Lorg/iq80/leveldb/Options;

    # getter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->outfile:Ljava/nio/channels/FileChannel;
    invoke-static {p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$800(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Ljava/nio/channels/FileChannel;

    move-result-object v5

    new-instance v6, Lorg/iq80/leveldb/impl/InternalUserComparator;

    iget-object v7, p0, Lorg/iq80/leveldb/impl/DbImpl;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-direct {v6, v7}, Lorg/iq80/leveldb/impl/InternalUserComparator;-><init>(Lorg/iq80/leveldb/impl/InternalKeyComparator;)V

    invoke-direct {v1, v4, v5, v6}, Lorg/iq80/leveldb/table/TableBuilder;-><init>(Lorg/iq80/leveldb/Options;Ljava/nio/channels/FileChannel;Lorg/iq80/leveldb/table/UserComparator;)V

    # setter for: Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->builder:Lorg/iq80/leveldb/table/TableBuilder;
    invoke-static {p1, v1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->access$702(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;Lorg/iq80/leveldb/table/TableBuilder;)Lorg/iq80/leveldb/table/TableBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1152
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 1154
    return-void

    .line 1136
    .end local v0    # "file":Ljava/io/File;
    .end local v2    # "fileNumber":J
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 1152
    :catchall_0
    move-exception v1

    iget-object v4, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 1153
    throw v1
.end method

.method private readWriteBatch(Lorg/iq80/leveldb/util/SliceInput;I)Lorg/iq80/leveldb/impl/WriteBatchImpl;
    .locals 10
    .param p1, "record"    # Lorg/iq80/leveldb/util/SliceInput;
    .param p2, "updateSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1302
    new-instance v4, Lorg/iq80/leveldb/impl/WriteBatchImpl;

    invoke-direct {v4}, Lorg/iq80/leveldb/impl/WriteBatchImpl;-><init>()V

    .line 1303
    .local v4, "writeBatch":Lorg/iq80/leveldb/impl/WriteBatchImpl;
    const/4 v0, 0x0

    .line 1304
    .local v0, "entries":I
    :goto_0
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/SliceInput;->isReadable()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1305
    add-int/lit8 v0, v0, 0x1

    .line 1306
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/SliceInput;->readByte()B

    move-result v5

    invoke-static {v5}, Lorg/iq80/leveldb/impl/ValueType;->getValueTypeByPersistentId(I)Lorg/iq80/leveldb/impl/ValueType;

    move-result-object v3

    .line 1307
    .local v3, "valueType":Lorg/iq80/leveldb/impl/ValueType;
    sget-object v5, Lorg/iq80/leveldb/impl/ValueType;->VALUE:Lorg/iq80/leveldb/impl/ValueType;

    if-ne v3, v5, :cond_0

    .line 1308
    invoke-static {p1}, Lorg/iq80/leveldb/util/Slices;->readLengthPrefixedBytes(Lorg/iq80/leveldb/util/SliceInput;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v1

    .line 1309
    .local v1, "key":Lorg/iq80/leveldb/util/Slice;
    invoke-static {p1}, Lorg/iq80/leveldb/util/Slices;->readLengthPrefixedBytes(Lorg/iq80/leveldb/util/SliceInput;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    .line 1310
    .local v2, "value":Lorg/iq80/leveldb/util/Slice;
    invoke-virtual {v4, v1, v2}, Lorg/iq80/leveldb/impl/WriteBatchImpl;->put(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/impl/WriteBatchImpl;

    goto :goto_0

    .line 1312
    .end local v1    # "key":Lorg/iq80/leveldb/util/Slice;
    .end local v2    # "value":Lorg/iq80/leveldb/util/Slice;
    :cond_0
    sget-object v5, Lorg/iq80/leveldb/impl/ValueType;->DELETION:Lorg/iq80/leveldb/impl/ValueType;

    if-ne v3, v5, :cond_1

    .line 1313
    invoke-static {p1}, Lorg/iq80/leveldb/util/Slices;->readLengthPrefixedBytes(Lorg/iq80/leveldb/util/SliceInput;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v1

    .line 1314
    .restart local v1    # "key":Lorg/iq80/leveldb/util/Slice;
    invoke-virtual {v4, v1}, Lorg/iq80/leveldb/impl/WriteBatchImpl;->delete(Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/impl/WriteBatchImpl;

    goto :goto_0

    .line 1317
    .end local v1    # "key":Lorg/iq80/leveldb/util/Slice;
    :cond_1
    new-instance v5, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unexpected value type "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1321
    .end local v3    # "valueType":Lorg/iq80/leveldb/impl/ValueType;
    :cond_2
    if-eq v0, p2, :cond_3

    .line 1322
    new-instance v5, Ljava/io/IOException;

    const-string v6, "Expected %d entries in log record but found %s entries"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1325
    :cond_3
    return-object v4
.end method

.method private recoverLogFile(JLorg/iq80/leveldb/impl/VersionEdit;)J
    .locals 29
    .param p1, "fileNumber"    # J
    .param p3, "edit"    # Lorg/iq80/leveldb/impl/VersionEdit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 518
    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v7

    invoke-static {v7}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 519
    new-instance v10, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/iq80/leveldb/impl/DbImpl;->databaseDir:Ljava/io/File;

    invoke-static/range {p1 .. p2}, Lorg/iq80/leveldb/impl/Filename;->logFileName(J)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v10, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 520
    .local v10, "file":Ljava/io/File;
    new-instance v11, Ljava/io/FileInputStream;

    invoke-direct {v11, v10}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .local v11, "fis":Ljava/io/FileInputStream;
    const/16 v24, 0x0

    .line 521
    :try_start_0
    invoke-virtual {v11}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v5

    .line 520
    .local v5, "channel":Ljava/nio/channels/FileChannel;
    const/16 v23, 0x0

    .line 522
    :try_start_1
    invoke-static {}, Lorg/iq80/leveldb/impl/LogMonitors;->logMonitor()Lorg/iq80/leveldb/impl/LogMonitor;

    move-result-object v6

    .line 523
    .local v6, "logMonitor":Lorg/iq80/leveldb/impl/LogMonitor;
    new-instance v4, Lorg/iq80/leveldb/impl/LogReader;

    const/4 v7, 0x1

    const-wide/16 v8, 0x0

    invoke-direct/range {v4 .. v9}, Lorg/iq80/leveldb/impl/LogReader;-><init>(Ljava/nio/channels/FileChannel;Lorg/iq80/leveldb/impl/LogMonitor;ZJ)V

    .line 528
    .local v4, "logReader":Lorg/iq80/leveldb/impl/LogReader;
    const-wide/16 v14, 0x0

    .line 529
    .local v14, "maxSequence":J
    const/16 v16, 0x0

    .line 530
    .local v16, "memTable":Lorg/iq80/leveldb/impl/MemTable;
    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/LogReader;->readRecord()Lorg/iq80/leveldb/util/Slice;

    move-result-object v17

    .local v17, "record":Lorg/iq80/leveldb/util/Slice;
    :goto_0
    if-eqz v17, :cond_4

    .line 531
    invoke-virtual/range {v17 .. v17}, Lorg/iq80/leveldb/util/Slice;->input()Lorg/iq80/leveldb/util/SliceInput;

    move-result-object v20

    .line 533
    .local v20, "sliceInput":Lorg/iq80/leveldb/util/SliceInput;
    invoke-virtual/range {v20 .. v20}, Lorg/iq80/leveldb/util/SliceInput;->available()I

    move-result v7

    const/16 v8, 0xc

    if-ge v7, v8, :cond_1

    .line 534
    invoke-virtual/range {v20 .. v20}, Lorg/iq80/leveldb/util/SliceInput;->available()I

    move-result v7

    int-to-long v8, v7

    const-string v7, "log record too small"

    invoke-interface {v6, v8, v9, v7}, Lorg/iq80/leveldb/impl/LogMonitor;->corruption(JLjava/lang/String;)V

    .line 530
    :cond_0
    :goto_1
    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/LogReader;->readRecord()Lorg/iq80/leveldb/util/Slice;

    move-result-object v17

    goto :goto_0

    .line 537
    :cond_1
    invoke-virtual/range {v20 .. v20}, Lorg/iq80/leveldb/util/SliceInput;->readLong()J

    move-result-wide v18

    .line 538
    .local v18, "sequenceBegin":J
    invoke-virtual/range {v20 .. v20}, Lorg/iq80/leveldb/util/SliceInput;->readInt()I

    move-result v21

    .line 541
    .local v21, "updateSize":I
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lorg/iq80/leveldb/impl/DbImpl;->readWriteBatch(Lorg/iq80/leveldb/util/SliceInput;I)Lorg/iq80/leveldb/impl/WriteBatchImpl;

    move-result-object v22

    .line 544
    .local v22, "writeBatch":Lorg/iq80/leveldb/impl/WriteBatchImpl;
    if-nez v16, :cond_2

    .line 545
    new-instance v16, Lorg/iq80/leveldb/impl/MemTable;

    .end local v16    # "memTable":Lorg/iq80/leveldb/impl/MemTable;
    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/iq80/leveldb/impl/DbImpl;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    move-object/from16 v0, v16

    invoke-direct {v0, v7}, Lorg/iq80/leveldb/impl/MemTable;-><init>(Lorg/iq80/leveldb/impl/InternalKeyComparator;)V

    .line 547
    .restart local v16    # "memTable":Lorg/iq80/leveldb/impl/MemTable;
    :cond_2
    new-instance v7, Lorg/iq80/leveldb/impl/DbImpl$InsertIntoHandler;

    move-object/from16 v0, v16

    move-wide/from16 v1, v18

    invoke-direct {v7, v0, v1, v2}, Lorg/iq80/leveldb/impl/DbImpl$InsertIntoHandler;-><init>(Lorg/iq80/leveldb/impl/MemTable;J)V

    move-object/from16 v0, v22

    invoke-virtual {v0, v7}, Lorg/iq80/leveldb/impl/WriteBatchImpl;->forEach(Lorg/iq80/leveldb/impl/WriteBatchImpl$Handler;)V

    .line 550
    move/from16 v0, v21

    int-to-long v8, v0

    add-long v8, v8, v18

    const-wide/16 v26, 0x1

    sub-long v12, v8, v26

    .line 551
    .local v12, "lastSequence":J
    cmp-long v7, v12, v14

    if-lez v7, :cond_3

    .line 552
    move-wide v14, v12

    .line 556
    :cond_3
    invoke-virtual/range {v16 .. v16}, Lorg/iq80/leveldb/impl/MemTable;->approximateMemoryUsage()J

    move-result-wide v8

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/iq80/leveldb/impl/DbImpl;->options:Lorg/iq80/leveldb/Options;

    invoke-virtual {v7}, Lorg/iq80/leveldb/Options;->writeBufferSize()I

    move-result v7

    int-to-long v0, v7

    move-wide/from16 v26, v0

    cmp-long v7, v8, v26

    if-lez v7, :cond_0

    .line 557
    const/4 v7, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2, v7}, Lorg/iq80/leveldb/impl/DbImpl;->writeLevel0Table(Lorg/iq80/leveldb/impl/MemTable;Lorg/iq80/leveldb/impl/VersionEdit;Lorg/iq80/leveldb/impl/Version;)V

    .line 558
    const/16 v16, 0x0

    goto :goto_1

    .line 563
    .end local v12    # "lastSequence":J
    .end local v18    # "sequenceBegin":J
    .end local v20    # "sliceInput":Lorg/iq80/leveldb/util/SliceInput;
    .end local v21    # "updateSize":I
    .end local v22    # "writeBatch":Lorg/iq80/leveldb/impl/WriteBatchImpl;
    :cond_4
    if-eqz v16, :cond_5

    invoke-virtual/range {v16 .. v16}, Lorg/iq80/leveldb/impl/MemTable;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_5

    .line 564
    const/4 v7, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2, v7}, Lorg/iq80/leveldb/impl/DbImpl;->writeLevel0Table(Lorg/iq80/leveldb/impl/MemTable;Lorg/iq80/leveldb/impl/VersionEdit;Lorg/iq80/leveldb/impl/Version;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 568
    :cond_5
    if-eqz v5, :cond_6

    if-eqz v23, :cond_9

    :try_start_2
    invoke-virtual {v5}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_6
    :goto_2
    if-eqz v11, :cond_7

    if-eqz v24, :cond_a

    :try_start_3
    invoke-virtual {v11}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_2

    .line 567
    :cond_7
    :goto_3
    return-wide v14

    .line 568
    :catch_0
    move-exception v7

    :try_start_4
    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_2

    .line 520
    .end local v4    # "logReader":Lorg/iq80/leveldb/impl/LogReader;
    .end local v5    # "channel":Ljava/nio/channels/FileChannel;
    .end local v6    # "logMonitor":Lorg/iq80/leveldb/impl/LogMonitor;
    .end local v14    # "maxSequence":J
    .end local v16    # "memTable":Lorg/iq80/leveldb/impl/MemTable;
    .end local v17    # "record":Lorg/iq80/leveldb/util/Slice;
    :catch_1
    move-exception v7

    :try_start_5
    throw v7
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 568
    :catchall_0
    move-exception v8

    move-object/from16 v28, v8

    move-object v8, v7

    move-object/from16 v7, v28

    :goto_4
    if-eqz v11, :cond_8

    if-eqz v8, :cond_d

    :try_start_6
    invoke-virtual {v11}, Ljava/io/FileInputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_5

    :cond_8
    :goto_5
    throw v7

    .restart local v4    # "logReader":Lorg/iq80/leveldb/impl/LogReader;
    .restart local v5    # "channel":Ljava/nio/channels/FileChannel;
    .restart local v6    # "logMonitor":Lorg/iq80/leveldb/impl/LogMonitor;
    .restart local v14    # "maxSequence":J
    .restart local v16    # "memTable":Lorg/iq80/leveldb/impl/MemTable;
    .restart local v17    # "record":Lorg/iq80/leveldb/util/Slice;
    :cond_9
    :try_start_7
    invoke-virtual {v5}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_2

    .end local v4    # "logReader":Lorg/iq80/leveldb/impl/LogReader;
    .end local v5    # "channel":Ljava/nio/channels/FileChannel;
    .end local v6    # "logMonitor":Lorg/iq80/leveldb/impl/LogMonitor;
    .end local v14    # "maxSequence":J
    .end local v16    # "memTable":Lorg/iq80/leveldb/impl/MemTable;
    .end local v17    # "record":Lorg/iq80/leveldb/util/Slice;
    :catchall_1
    move-exception v7

    move-object/from16 v8, v24

    goto :goto_4

    .restart local v4    # "logReader":Lorg/iq80/leveldb/impl/LogReader;
    .restart local v5    # "channel":Ljava/nio/channels/FileChannel;
    .restart local v6    # "logMonitor":Lorg/iq80/leveldb/impl/LogMonitor;
    .restart local v14    # "maxSequence":J
    .restart local v16    # "memTable":Lorg/iq80/leveldb/impl/MemTable;
    .restart local v17    # "record":Lorg/iq80/leveldb/util/Slice;
    :catch_2
    move-exception v7

    move-object/from16 v0, v24

    invoke-virtual {v0, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_3

    :cond_a
    invoke-virtual {v11}, Ljava/io/FileInputStream;->close()V

    goto :goto_3

    .line 520
    .end local v4    # "logReader":Lorg/iq80/leveldb/impl/LogReader;
    .end local v6    # "logMonitor":Lorg/iq80/leveldb/impl/LogMonitor;
    .end local v14    # "maxSequence":J
    .end local v16    # "memTable":Lorg/iq80/leveldb/impl/MemTable;
    .end local v17    # "record":Lorg/iq80/leveldb/util/Slice;
    :catch_3
    move-exception v7

    :try_start_8
    throw v7
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 568
    :catchall_2
    move-exception v8

    move-object/from16 v28, v8

    move-object v8, v7

    move-object/from16 v7, v28

    :goto_6
    if-eqz v5, :cond_b

    if-eqz v8, :cond_c

    :try_start_9
    invoke-virtual {v5}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_4
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    :cond_b
    :goto_7
    :try_start_a
    throw v7

    :catch_4
    move-exception v9

    invoke-virtual {v8, v9}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_7

    :cond_c
    invoke-virtual {v5}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    goto :goto_7

    .end local v5    # "channel":Ljava/nio/channels/FileChannel;
    :catch_5
    move-exception v9

    invoke-virtual {v8, v9}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_5

    :cond_d
    invoke-virtual {v11}, Ljava/io/FileInputStream;->close()V

    goto :goto_5

    .restart local v5    # "channel":Ljava/nio/channels/FileChannel;
    :catchall_3
    move-exception v7

    move-object/from16 v8, v23

    goto :goto_6
.end method

.method private writeLevel0Table(Lorg/iq80/leveldb/impl/MemTable;Lorg/iq80/leveldb/impl/VersionEdit;Lorg/iq80/leveldb/impl/Version;)V
    .locals 10
    .param p1, "mem"    # Lorg/iq80/leveldb/impl/MemTable;
    .param p2, "edit"    # Lorg/iq80/leveldb/impl/VersionEdit;
    .param p3, "base"    # Lorg/iq80/leveldb/impl/Version;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 939
    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantLock;->isHeldByCurrentThread()Z

    move-result v6

    invoke-static {v6}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 942
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/MemTable;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 970
    :cond_0
    :goto_0
    return-void

    .line 947
    :cond_1
    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v6}, Lorg/iq80/leveldb/impl/VersionSet;->getNextFileNumber()J

    move-result-wide v0

    .line 948
    .local v0, "fileNumber":J
    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->pendingOutputs:Ljava/util/List;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 949
    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 952
    :try_start_0
    invoke-direct {p0, p1, v0, v1}, Lorg/iq80/leveldb/impl/DbImpl;->buildTable(Lorg/iq80/leveldb/impl/SeekingIterable;J)Lorg/iq80/leveldb/impl/FileMetaData;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v4

    .line 955
    .local v4, "meta":Lorg/iq80/leveldb/impl/FileMetaData;
    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 957
    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->pendingOutputs:Ljava/util/List;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 961
    const/4 v2, 0x0

    .line 962
    .local v2, "level":I
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/FileMetaData;->getFileSize()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-lez v6, :cond_0

    .line 963
    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/FileMetaData;->getSmallest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v6

    invoke-virtual {v6}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v5

    .line 964
    .local v5, "minUserKey":Lorg/iq80/leveldb/util/Slice;
    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/FileMetaData;->getLargest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v6

    invoke-virtual {v6}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v3

    .line 965
    .local v3, "maxUserKey":Lorg/iq80/leveldb/util/Slice;
    if-eqz p3, :cond_2

    .line 966
    invoke-virtual {p3, v5, v3}, Lorg/iq80/leveldb/impl/Version;->pickLevelForMemTableOutput(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)I

    move-result v2

    .line 968
    :cond_2
    invoke-virtual {p2, v2, v4}, Lorg/iq80/leveldb/impl/VersionEdit;->addFile(ILorg/iq80/leveldb/impl/FileMetaData;)V

    goto :goto_0

    .line 955
    .end local v2    # "level":I
    .end local v3    # "maxUserKey":Lorg/iq80/leveldb/util/Slice;
    .end local v4    # "meta":Lorg/iq80/leveldb/impl/FileMetaData;
    .end local v5    # "minUserKey":Lorg/iq80/leveldb/util/Slice;
    :catchall_0
    move-exception v6

    iget-object v7, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 956
    throw v6
.end method

.method private writeWriteBatch(Lorg/iq80/leveldb/impl/WriteBatchImpl;J)Lorg/iq80/leveldb/util/Slice;
    .locals 4
    .param p1, "updates"    # Lorg/iq80/leveldb/impl/WriteBatchImpl;
    .param p2, "sequenceBegin"    # J

    .prologue
    .line 1330
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/WriteBatchImpl;->getApproximateSize()I

    move-result v2

    add-int/lit8 v2, v2, 0xc

    invoke-static {v2}, Lorg/iq80/leveldb/util/Slices;->allocate(I)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    .line 1331
    .local v0, "record":Lorg/iq80/leveldb/util/Slice;
    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Slice;->output()Lorg/iq80/leveldb/util/SliceOutput;

    move-result-object v1

    .line 1332
    .local v1, "sliceOutput":Lorg/iq80/leveldb/util/SliceOutput;
    invoke-virtual {v1, p2, p3}, Lorg/iq80/leveldb/util/SliceOutput;->writeLong(J)V

    .line 1333
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/WriteBatchImpl;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Lorg/iq80/leveldb/util/SliceOutput;->writeInt(I)V

    .line 1334
    new-instance v2, Lorg/iq80/leveldb/impl/DbImpl$4;

    invoke-direct {v2, p0, v1}, Lorg/iq80/leveldb/impl/DbImpl$4;-><init>(Lorg/iq80/leveldb/impl/DbImpl;Lorg/iq80/leveldb/util/SliceOutput;)V

    invoke-virtual {p1, v2}, Lorg/iq80/leveldb/impl/WriteBatchImpl;->forEach(Lorg/iq80/leveldb/impl/WriteBatchImpl$Handler;)V

    .line 1351
    const/4 v2, 0x0

    invoke-virtual {v1}, Lorg/iq80/leveldb/util/SliceOutput;->size()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Lorg/iq80/leveldb/util/Slice;->slice(II)Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public checkBackgroundException()V
    .locals 2

    .prologue
    .line 417
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->backgroundException:Ljava/lang/Throwable;

    .line 418
    .local v0, "e":Ljava/lang/Throwable;
    if-eqz v0, :cond_0

    .line 419
    new-instance v1, Lorg/iq80/leveldb/impl/DbImpl$BackgroundProcessingException;

    invoke-direct {v1, v0}, Lorg/iq80/leveldb/impl/DbImpl$BackgroundProcessingException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 421
    :cond_0
    return-void
.end method

.method public close()V
    .locals 5

    .prologue
    .line 237
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->shuttingDown:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 270
    :goto_0
    return-void

    .line 241
    :cond_0
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 243
    :goto_1
    :try_start_0
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCompaction:Ljava/util/concurrent/Future;

    if-eqz v1, :cond_1

    .line 244
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->awaitUninterruptibly()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 248
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 249
    throw v1

    .line 248
    :cond_1
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 251
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->compactionExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 253
    :try_start_1
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->compactionExecutor:Ljava/util/concurrent/ExecutorService;

    const-wide/16 v2, 0x1

    sget-object v4, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v2, v3, v4}, Ljava/util/concurrent/ExecutorService;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 259
    :goto_2
    :try_start_2
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/VersionSet;->destroy()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 264
    :goto_3
    :try_start_3
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->log:Lorg/iq80/leveldb/impl/LogWriter;

    invoke-interface {v1}, Lorg/iq80/leveldb/impl/LogWriter;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 268
    :goto_4
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->tableCache:Lorg/iq80/leveldb/impl/TableCache;

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/TableCache;->close()V

    .line 269
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->dbLock:Lorg/iq80/leveldb/impl/DbLock;

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/DbLock;->release()V

    goto :goto_0

    .line 255
    :catch_0
    move-exception v0

    .line 256
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_2

    .line 266
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v1

    goto :goto_4

    .line 261
    :catch_2
    move-exception v1

    goto :goto_3
.end method

.method public compactMemTable()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 895
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 897
    :try_start_0
    invoke-direct {p0}, Lorg/iq80/leveldb/impl/DbImpl;->compactMemTableInternal()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 900
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 902
    return-void

    .line 900
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 901
    throw v0
.end method

.method public compactRange(ILorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)V
    .locals 6
    .param p1, "level"    # I
    .param p2, "start"    # Lorg/iq80/leveldb/util/Slice;
    .param p3, "end"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    const/4 v5, 0x7

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 354
    if-ltz p1, :cond_0

    move v1, v2

    :goto_0
    const-string v4, "level is negative"

    invoke-static {v1, v4}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 355
    add-int/lit8 v1, p1, 0x1

    if-ge v1, v5, :cond_1

    move v1, v2

    :goto_1
    const-string v4, "level is greater than or equal to %s"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v3

    invoke-static {v1, v4, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 356
    const-string v1, "start is null"

    invoke-static {p2, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 357
    const-string v1, "end is null"

    invoke-static {p3, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 359
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 361
    :goto_2
    :try_start_0
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->manualCompaction:Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;

    if-eqz v1, :cond_2

    .line 362
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->awaitUninterruptibly()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    .line 374
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 375
    throw v1

    :cond_0
    move v1, v3

    .line 354
    goto :goto_0

    :cond_1
    move v1, v3

    .line 355
    goto :goto_1

    .line 364
    :cond_2
    :try_start_1
    new-instance v0, Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, p3, v1}, Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;-><init>(ILorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/impl/DbImpl$1;)V

    .line 365
    .local v0, "manualCompaction":Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;
    iput-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->manualCompaction:Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;

    .line 367
    invoke-direct {p0}, Lorg/iq80/leveldb/impl/DbImpl;->maybeScheduleCompaction()V

    .line 369
    :goto_3
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->manualCompaction:Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;

    if-ne v1, v0, :cond_3

    .line 370
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->awaitUninterruptibly()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    .line 374
    :cond_3
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 377
    return-void
.end method

.method public compactRange([B[B)V
    .locals 2
    .param p1, "begin"    # [B
    .param p2, "end"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/leveldb/DBException;
        }
    .end annotation

    .prologue
    .line 1446
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not yet implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createWriteBatch()Lorg/iq80/leveldb/WriteBatch;
    .locals 1

    .prologue
    .line 726
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/DbImpl;->checkBackgroundException()V

    .line 727
    new-instance v0, Lorg/iq80/leveldb/impl/WriteBatchImpl;

    invoke-direct {v0}, Lorg/iq80/leveldb/impl/WriteBatchImpl;-><init>()V

    return-object v0
.end method

.method public delete([BLorg/iq80/leveldb/WriteOptions;)Lorg/iq80/leveldb/Snapshot;
    .locals 1
    .param p1, "key"    # [B
    .param p2, "options"    # Lorg/iq80/leveldb/WriteOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/leveldb/DBException;
        }
    .end annotation

    .prologue
    .line 661
    new-instance v0, Lorg/iq80/leveldb/impl/WriteBatchImpl;

    invoke-direct {v0}, Lorg/iq80/leveldb/impl/WriteBatchImpl;-><init>()V

    invoke-virtual {v0, p1}, Lorg/iq80/leveldb/impl/WriteBatchImpl;->delete([B)Lorg/iq80/leveldb/impl/WriteBatchImpl;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lorg/iq80/leveldb/impl/DbImpl;->writeInternal(Lorg/iq80/leveldb/impl/WriteBatchImpl;Lorg/iq80/leveldb/WriteOptions;)Lorg/iq80/leveldb/Snapshot;

    move-result-object v0

    return-object v0
.end method

.method public delete([B)V
    .locals 2
    .param p1, "key"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/leveldb/DBException;
        }
    .end annotation

    .prologue
    .line 654
    new-instance v0, Lorg/iq80/leveldb/impl/WriteBatchImpl;

    invoke-direct {v0}, Lorg/iq80/leveldb/impl/WriteBatchImpl;-><init>()V

    invoke-virtual {v0, p1}, Lorg/iq80/leveldb/impl/WriteBatchImpl;->delete([B)Lorg/iq80/leveldb/impl/WriteBatchImpl;

    move-result-object v0

    new-instance v1, Lorg/iq80/leveldb/WriteOptions;

    invoke-direct {v1}, Lorg/iq80/leveldb/WriteOptions;-><init>()V

    invoke-virtual {p0, v0, v1}, Lorg/iq80/leveldb/impl/DbImpl;->writeInternal(Lorg/iq80/leveldb/impl/WriteBatchImpl;Lorg/iq80/leveldb/WriteOptions;)Lorg/iq80/leveldb/Snapshot;

    .line 655
    return-void
.end method

.method public flushMemTable()V
    .locals 2

    .prologue
    .line 336
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 339
    const/4 v0, 0x1

    :try_start_0
    invoke-direct {p0, v0}, Lorg/iq80/leveldb/impl/DbImpl;->makeRoomForWrite(Z)V

    .line 342
    :goto_0
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->immutableMemTable:Lorg/iq80/leveldb/impl/MemTable;

    if-eqz v0, :cond_0

    .line 343
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->backgroundCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->awaitUninterruptibly()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 348
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 349
    throw v0

    .line 348
    :cond_0
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 350
    return-void
.end method

.method public get([B)[B
    .locals 1
    .param p1, "key"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/leveldb/DBException;
        }
    .end annotation

    .prologue
    .line 575
    new-instance v0, Lorg/iq80/leveldb/ReadOptions;

    invoke-direct {v0}, Lorg/iq80/leveldb/ReadOptions;-><init>()V

    invoke-virtual {p0, p1, v0}, Lorg/iq80/leveldb/impl/DbImpl;->get([BLorg/iq80/leveldb/ReadOptions;)[B

    move-result-object v0

    return-object v0
.end method

.method public get([BLorg/iq80/leveldb/ReadOptions;)[B
    .locals 8
    .param p1, "key"    # [B
    .param p2, "options"    # Lorg/iq80/leveldb/ReadOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/leveldb/DBException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 582
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/DbImpl;->checkBackgroundException()V

    .line 584
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 586
    :try_start_0
    invoke-direct {p0, p2}, Lorg/iq80/leveldb/impl/DbImpl;->getSnapshot(Lorg/iq80/leveldb/ReadOptions;)Lorg/iq80/leveldb/impl/SnapshotImpl;

    move-result-object v2

    .line 587
    .local v2, "snapshot":Lorg/iq80/leveldb/impl/SnapshotImpl;
    new-instance v0, Lorg/iq80/leveldb/impl/LookupKey;

    invoke-static {p1}, Lorg/iq80/leveldb/util/Slices;->wrappedBuffer([B)Lorg/iq80/leveldb/util/Slice;

    move-result-object v5

    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/SnapshotImpl;->getLastSequence()J

    move-result-wide v6

    invoke-direct {v0, v5, v6, v7}, Lorg/iq80/leveldb/impl/LookupKey;-><init>(Lorg/iq80/leveldb/util/Slice;J)V

    .line 590
    .local v0, "lookupKey":Lorg/iq80/leveldb/impl/LookupKey;
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->memTable:Lorg/iq80/leveldb/impl/MemTable;

    invoke-virtual {v5, v0}, Lorg/iq80/leveldb/impl/MemTable;->get(Lorg/iq80/leveldb/impl/LookupKey;)Lorg/iq80/leveldb/impl/LookupResult;

    move-result-object v1

    .line 591
    .local v1, "lookupResult":Lorg/iq80/leveldb/impl/LookupResult;
    if-eqz v1, :cond_2

    .line 592
    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/LookupResult;->getValue()Lorg/iq80/leveldb/util/Slice;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 593
    .local v3, "value":Lorg/iq80/leveldb/util/Slice;
    if-nez v3, :cond_1

    .line 610
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 633
    .end local v3    # "value":Lorg/iq80/leveldb/util/Slice;
    :cond_0
    :goto_0
    return-object v4

    .line 596
    .restart local v3    # "value":Lorg/iq80/leveldb/util/Slice;
    :cond_1
    :try_start_1
    invoke-virtual {v3}, Lorg/iq80/leveldb/util/Slice;->getBytes()[B
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v4

    .line 610
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_0

    .line 598
    .end local v3    # "value":Lorg/iq80/leveldb/util/Slice;
    :cond_2
    :try_start_2
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->immutableMemTable:Lorg/iq80/leveldb/impl/MemTable;

    if-eqz v5, :cond_4

    .line 599
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->immutableMemTable:Lorg/iq80/leveldb/impl/MemTable;

    invoke-virtual {v5, v0}, Lorg/iq80/leveldb/impl/MemTable;->get(Lorg/iq80/leveldb/impl/LookupKey;)Lorg/iq80/leveldb/impl/LookupResult;

    move-result-object v1

    .line 600
    if-eqz v1, :cond_4

    .line 601
    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/LookupResult;->getValue()Lorg/iq80/leveldb/util/Slice;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v3

    .line 602
    .restart local v3    # "value":Lorg/iq80/leveldb/util/Slice;
    if-nez v3, :cond_3

    .line 610
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_0

    .line 605
    :cond_3
    :try_start_3
    invoke-virtual {v3}, Lorg/iq80/leveldb/util/Slice;->getBytes()[B
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v4

    .line 610
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_0

    .end local v3    # "value":Lorg/iq80/leveldb/util/Slice;
    :cond_4
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 614
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v5, v0}, Lorg/iq80/leveldb/impl/VersionSet;->get(Lorg/iq80/leveldb/impl/LookupKey;)Lorg/iq80/leveldb/impl/LookupResult;

    move-result-object v1

    .line 617
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 619
    :try_start_4
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v5}, Lorg/iq80/leveldb/impl/VersionSet;->needsCompaction()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 620
    invoke-direct {p0}, Lorg/iq80/leveldb/impl/DbImpl;->maybeScheduleCompaction()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 624
    :cond_5
    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 627
    if-eqz v1, :cond_0

    .line 628
    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/LookupResult;->getValue()Lorg/iq80/leveldb/util/Slice;

    move-result-object v3

    .line 629
    .restart local v3    # "value":Lorg/iq80/leveldb/util/Slice;
    if-eqz v3, :cond_0

    .line 630
    invoke-virtual {v3}, Lorg/iq80/leveldb/util/Slice;->getBytes()[B

    move-result-object v4

    goto :goto_0

    .line 610
    .end local v0    # "lookupKey":Lorg/iq80/leveldb/impl/LookupKey;
    .end local v1    # "lookupResult":Lorg/iq80/leveldb/impl/LookupResult;
    .end local v2    # "snapshot":Lorg/iq80/leveldb/impl/SnapshotImpl;
    .end local v3    # "value":Lorg/iq80/leveldb/util/Slice;
    :catchall_0
    move-exception v4

    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 611
    throw v4

    .line 624
    .restart local v0    # "lookupKey":Lorg/iq80/leveldb/impl/LookupKey;
    .restart local v1    # "lookupResult":Lorg/iq80/leveldb/impl/LookupResult;
    .restart local v2    # "snapshot":Lorg/iq80/leveldb/impl/SnapshotImpl;
    :catchall_1
    move-exception v4

    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 625
    throw v4
.end method

.method public getApproximateSizes(Lorg/iq80/leveldb/Range;)J
    .locals 12
    .param p1, "range"    # Lorg/iq80/leveldb/Range;

    .prologue
    const-wide v10, 0xffffffffffffffL

    .line 1239
    iget-object v7, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v7}, Lorg/iq80/leveldb/impl/VersionSet;->getCurrent()Lorg/iq80/leveldb/impl/Version;

    move-result-object v6

    .line 1241
    .local v6, "v":Lorg/iq80/leveldb/impl/Version;
    new-instance v1, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-virtual {p1}, Lorg/iq80/leveldb/Range;->start()[B

    move-result-object v7

    invoke-static {v7}, Lorg/iq80/leveldb/util/Slices;->wrappedBuffer([B)Lorg/iq80/leveldb/util/Slice;

    move-result-object v7

    sget-object v8, Lorg/iq80/leveldb/impl/ValueType;->VALUE:Lorg/iq80/leveldb/impl/ValueType;

    invoke-direct {v1, v7, v10, v11, v8}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;JLorg/iq80/leveldb/impl/ValueType;)V

    .line 1242
    .local v1, "startKey":Lorg/iq80/leveldb/impl/InternalKey;
    new-instance v0, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-virtual {p1}, Lorg/iq80/leveldb/Range;->limit()[B

    move-result-object v7

    invoke-static {v7}, Lorg/iq80/leveldb/util/Slices;->wrappedBuffer([B)Lorg/iq80/leveldb/util/Slice;

    move-result-object v7

    sget-object v8, Lorg/iq80/leveldb/impl/ValueType;->VALUE:Lorg/iq80/leveldb/impl/ValueType;

    invoke-direct {v0, v7, v10, v11, v8}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;JLorg/iq80/leveldb/impl/ValueType;)V

    .line 1243
    .local v0, "limitKey":Lorg/iq80/leveldb/impl/InternalKey;
    invoke-virtual {v6, v1}, Lorg/iq80/leveldb/impl/Version;->getApproximateOffsetOf(Lorg/iq80/leveldb/impl/InternalKey;)J

    move-result-wide v4

    .line 1244
    .local v4, "startOffset":J
    invoke-virtual {v6, v0}, Lorg/iq80/leveldb/impl/Version;->getApproximateOffsetOf(Lorg/iq80/leveldb/impl/InternalKey;)J

    move-result-wide v2

    .line 1246
    .local v2, "limitOffset":J
    cmp-long v7, v2, v4

    if-ltz v7, :cond_0

    sub-long v8, v2, v4

    :goto_0
    return-wide v8

    :cond_0
    const-wide/16 v8, 0x0

    goto :goto_0
.end method

.method public varargs getApproximateSizes([Lorg/iq80/leveldb/Range;)[J
    .locals 6
    .param p1, "ranges"    # [Lorg/iq80/leveldb/Range;

    .prologue
    .line 1228
    const-string v3, "ranges is null"

    invoke-static {p1, v3}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1229
    array-length v3, p1

    new-array v2, v3, [J

    .line 1230
    .local v2, "sizes":[J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, p1

    if-ge v0, v3, :cond_0

    .line 1231
    aget-object v1, p1, v0

    .line 1232
    .local v1, "range":Lorg/iq80/leveldb/Range;
    invoke-virtual {p0, v1}, Lorg/iq80/leveldb/impl/DbImpl;->getApproximateSizes(Lorg/iq80/leveldb/Range;)J

    move-result-wide v4

    aput-wide v4, v2, v0

    .line 1230
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1234
    .end local v1    # "range":Lorg/iq80/leveldb/Range;
    :cond_0
    return-object v2
.end method

.method public getMaxNextLevelOverlappingBytes()J
    .locals 2

    .prologue
    .line 1251
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/VersionSet;->getMaxNextLevelOverlappingBytes()J

    move-result-wide v0

    return-wide v0
.end method

.method public getProperty(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 275
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/DbImpl;->checkBackgroundException()V

    .line 276
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSnapshot()Lorg/iq80/leveldb/Snapshot;
    .locals 4

    .prologue
    .line 786
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/DbImpl;->checkBackgroundException()V

    .line 787
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 789
    :try_start_0
    new-instance v0, Lorg/iq80/leveldb/impl/SnapshotImpl;

    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/VersionSet;->getCurrent()Lorg/iq80/leveldb/impl/Version;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/VersionSet;->getLastSequence()J

    move-result-wide v2

    invoke-direct {v0, v1, v2, v3}, Lorg/iq80/leveldb/impl/SnapshotImpl;-><init>(Lorg/iq80/leveldb/impl/Version;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 792
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 789
    return-object v0

    .line 792
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 793
    throw v0
.end method

.method internalIterable()Lorg/iq80/leveldb/impl/SeekingIterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/iq80/leveldb/impl/SeekingIterable",
            "<",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            "Lorg/iq80/leveldb/util/Slice;",
            ">;"
        }
    .end annotation

    .prologue
    .line 756
    new-instance v0, Lorg/iq80/leveldb/impl/DbImpl$3;

    invoke-direct {v0, p0}, Lorg/iq80/leveldb/impl/DbImpl$3;-><init>(Lorg/iq80/leveldb/impl/DbImpl;)V

    return-object v0
.end method

.method internalIterator()Lorg/iq80/leveldb/util/DbIterator;
    .locals 7

    .prologue
    .line 768
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 771
    const/4 v2, 0x0

    .line 772
    .local v2, "iterator":Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;
    :try_start_0
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->immutableMemTable:Lorg/iq80/leveldb/impl/MemTable;

    if-eqz v0, :cond_0

    .line 773
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->immutableMemTable:Lorg/iq80/leveldb/impl/MemTable;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/MemTable;->iterator()Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    move-result-object v2

    .line 775
    :cond_0
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/VersionSet;->getCurrent()Lorg/iq80/leveldb/impl/Version;

    move-result-object v6

    .line 776
    .local v6, "current":Lorg/iq80/leveldb/impl/Version;
    new-instance v0, Lorg/iq80/leveldb/util/DbIterator;

    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->memTable:Lorg/iq80/leveldb/impl/MemTable;

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/MemTable;->iterator()Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;

    move-result-object v1

    invoke-virtual {v6}, Lorg/iq80/leveldb/impl/Version;->getLevel0Files()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v6}, Lorg/iq80/leveldb/impl/Version;->getLevelIterators()Ljava/util/List;

    move-result-object v4

    iget-object v5, p0, Lorg/iq80/leveldb/impl/DbImpl;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-direct/range {v0 .. v5}, Lorg/iq80/leveldb/util/DbIterator;-><init>(Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;Lorg/iq80/leveldb/impl/MemTable$MemTableIterator;Ljava/util/List;Ljava/util/List;Ljava/util/Comparator;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 779
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 776
    return-object v0

    .line 779
    .end local v6    # "current":Lorg/iq80/leveldb/impl/Version;
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 780
    throw v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 82
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/DbImpl;->iterator()Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic iterator()Lorg/iq80/leveldb/DBIterator;
    .locals 1

    .prologue
    .line 82
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/DbImpl;->iterator()Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic iterator(Lorg/iq80/leveldb/ReadOptions;)Lorg/iq80/leveldb/DBIterator;
    .locals 1

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/impl/DbImpl;->iterator(Lorg/iq80/leveldb/ReadOptions;)Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;

    move-result-object v0

    return-object v0
.end method

.method public iterator()Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;
    .locals 1

    .prologue
    .line 733
    new-instance v0, Lorg/iq80/leveldb/ReadOptions;

    invoke-direct {v0}, Lorg/iq80/leveldb/ReadOptions;-><init>()V

    invoke-virtual {p0, v0}, Lorg/iq80/leveldb/impl/DbImpl;->iterator(Lorg/iq80/leveldb/ReadOptions;)Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;

    move-result-object v0

    return-object v0
.end method

.method public iterator(Lorg/iq80/leveldb/ReadOptions;)Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;
    .locals 5
    .param p1, "options"    # Lorg/iq80/leveldb/ReadOptions;

    .prologue
    .line 739
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/DbImpl;->checkBackgroundException()V

    .line 740
    iget-object v3, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 742
    :try_start_0
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/DbImpl;->internalIterator()Lorg/iq80/leveldb/util/DbIterator;

    move-result-object v0

    .line 745
    .local v0, "rawIterator":Lorg/iq80/leveldb/util/DbIterator;
    invoke-direct {p0, p1}, Lorg/iq80/leveldb/impl/DbImpl;->getSnapshot(Lorg/iq80/leveldb/ReadOptions;)Lorg/iq80/leveldb/impl/SnapshotImpl;

    move-result-object v1

    .line 746
    .local v1, "snapshot":Lorg/iq80/leveldb/impl/SnapshotImpl;
    new-instance v2, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;

    iget-object v3, p0, Lorg/iq80/leveldb/impl/DbImpl;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-virtual {v3}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->getUserComparator()Lorg/iq80/leveldb/table/UserComparator;

    move-result-object v3

    invoke-direct {v2, v0, v1, v3}, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;-><init>(Lorg/iq80/leveldb/util/DbIterator;Lorg/iq80/leveldb/impl/SnapshotImpl;Ljava/util/Comparator;)V

    .line 747
    .local v2, "snapshotIterator":Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;
    new-instance v3, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;

    invoke-direct {v3, v2}, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;-><init>(Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 750
    iget-object v4, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 747
    return-object v3

    .line 750
    .end local v0    # "rawIterator":Lorg/iq80/leveldb/util/DbIterator;
    .end local v1    # "snapshot":Lorg/iq80/leveldb/impl/SnapshotImpl;
    .end local v2    # "snapshotIterator":Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;
    :catchall_0
    move-exception v3

    iget-object v4, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 751
    throw v3
.end method

.method numberOfFilesInLevel(I)I
    .locals 1
    .param p1, "level"    # I

    .prologue
    .line 1222
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/VersionSet;->getCurrent()Lorg/iq80/leveldb/impl/Version;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/iq80/leveldb/impl/Version;->numberOfFilesInLevel(I)I

    move-result v0

    return v0
.end method

.method public put([B[BLorg/iq80/leveldb/WriteOptions;)Lorg/iq80/leveldb/Snapshot;
    .locals 1
    .param p1, "key"    # [B
    .param p2, "value"    # [B
    .param p3, "options"    # Lorg/iq80/leveldb/WriteOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/leveldb/DBException;
        }
    .end annotation

    .prologue
    .line 647
    new-instance v0, Lorg/iq80/leveldb/impl/WriteBatchImpl;

    invoke-direct {v0}, Lorg/iq80/leveldb/impl/WriteBatchImpl;-><init>()V

    invoke-virtual {v0, p1, p2}, Lorg/iq80/leveldb/impl/WriteBatchImpl;->put([B[B)Lorg/iq80/leveldb/impl/WriteBatchImpl;

    move-result-object v0

    invoke-virtual {p0, v0, p3}, Lorg/iq80/leveldb/impl/DbImpl;->writeInternal(Lorg/iq80/leveldb/impl/WriteBatchImpl;Lorg/iq80/leveldb/WriteOptions;)Lorg/iq80/leveldb/Snapshot;

    move-result-object v0

    return-object v0
.end method

.method public put([B[B)V
    .locals 1
    .param p1, "key"    # [B
    .param p2, "value"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/leveldb/DBException;
        }
    .end annotation

    .prologue
    .line 640
    new-instance v0, Lorg/iq80/leveldb/WriteOptions;

    invoke-direct {v0}, Lorg/iq80/leveldb/WriteOptions;-><init>()V

    invoke-virtual {p0, p1, p2, v0}, Lorg/iq80/leveldb/impl/DbImpl;->put([B[BLorg/iq80/leveldb/WriteOptions;)Lorg/iq80/leveldb/Snapshot;

    .line 641
    return-void
.end method

.method public resumeCompactions()V
    .locals 2

    .prologue
    .line 1436
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->suspensionMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 1437
    :try_start_0
    iget v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->suspensionCounter:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->suspensionCounter:I

    .line 1438
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->suspensionMutex:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1439
    monitor-exit v1

    .line 1440
    return-void

    .line 1439
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public suspendCompactions()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 1408
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->compactionExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lorg/iq80/leveldb/impl/DbImpl$5;

    invoke-direct {v1, p0}, Lorg/iq80/leveldb/impl/DbImpl$5;-><init>(Lorg/iq80/leveldb/impl/DbImpl;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 1426
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl;->suspensionMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 1427
    :goto_0
    :try_start_0
    iget v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->suspensionCounter:I

    const/4 v2, 0x1

    if-ge v0, v2, :cond_0

    .line 1428
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl;->suspensionMutex:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V

    goto :goto_0

    .line 1430
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_0
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1431
    return-void
.end method

.method public write(Lorg/iq80/leveldb/WriteBatch;Lorg/iq80/leveldb/WriteOptions;)Lorg/iq80/leveldb/Snapshot;
    .locals 1
    .param p1, "updates"    # Lorg/iq80/leveldb/WriteBatch;
    .param p2, "options"    # Lorg/iq80/leveldb/WriteOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/leveldb/DBException;
        }
    .end annotation

    .prologue
    .line 675
    check-cast p1, Lorg/iq80/leveldb/impl/WriteBatchImpl;

    .end local p1    # "updates":Lorg/iq80/leveldb/WriteBatch;
    invoke-virtual {p0, p1, p2}, Lorg/iq80/leveldb/impl/DbImpl;->writeInternal(Lorg/iq80/leveldb/impl/WriteBatchImpl;Lorg/iq80/leveldb/WriteOptions;)Lorg/iq80/leveldb/Snapshot;

    move-result-object v0

    return-object v0
.end method

.method public write(Lorg/iq80/leveldb/WriteBatch;)V
    .locals 1
    .param p1, "updates"    # Lorg/iq80/leveldb/WriteBatch;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/leveldb/DBException;
        }
    .end annotation

    .prologue
    .line 668
    check-cast p1, Lorg/iq80/leveldb/impl/WriteBatchImpl;

    .end local p1    # "updates":Lorg/iq80/leveldb/WriteBatch;
    new-instance v0, Lorg/iq80/leveldb/WriteOptions;

    invoke-direct {v0}, Lorg/iq80/leveldb/WriteOptions;-><init>()V

    invoke-virtual {p0, p1, v0}, Lorg/iq80/leveldb/impl/DbImpl;->writeInternal(Lorg/iq80/leveldb/impl/WriteBatchImpl;Lorg/iq80/leveldb/WriteOptions;)Lorg/iq80/leveldb/Snapshot;

    .line 669
    return-void
.end method

.method public writeInternal(Lorg/iq80/leveldb/impl/WriteBatchImpl;Lorg/iq80/leveldb/WriteOptions;)Lorg/iq80/leveldb/Snapshot;
    .locals 10
    .param p1, "updates"    # Lorg/iq80/leveldb/impl/WriteBatchImpl;
    .param p2, "options"    # Lorg/iq80/leveldb/WriteOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/leveldb/DBException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x1

    .line 681
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/DbImpl;->checkBackgroundException()V

    .line 682
    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 685
    :try_start_0
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/WriteBatchImpl;->size()I

    move-result v6

    if-eqz v6, :cond_0

    .line 686
    const/4 v6, 0x0

    invoke-direct {p0, v6}, Lorg/iq80/leveldb/impl/DbImpl;->makeRoomForWrite(Z)V

    .line 689
    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v6}, Lorg/iq80/leveldb/impl/VersionSet;->getLastSequence()J

    move-result-wide v6

    add-long v2, v6, v8

    .line 690
    .local v2, "sequenceBegin":J
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/WriteBatchImpl;->size()I

    move-result v6

    int-to-long v6, v6

    add-long/2addr v6, v2

    sub-long v4, v6, v8

    .line 693
    .local v4, "sequenceEnd":J
    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v6, v4, v5}, Lorg/iq80/leveldb/impl/VersionSet;->setLastSequence(J)V

    .line 696
    invoke-direct {p0, p1, v2, v3}, Lorg/iq80/leveldb/impl/DbImpl;->writeWriteBatch(Lorg/iq80/leveldb/impl/WriteBatchImpl;J)Lorg/iq80/leveldb/util/Slice;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 698
    .local v1, "record":Lorg/iq80/leveldb/util/Slice;
    :try_start_1
    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->log:Lorg/iq80/leveldb/impl/LogWriter;

    invoke-virtual {p2}, Lorg/iq80/leveldb/WriteOptions;->sync()Z

    move-result v7

    invoke-interface {v6, v1, v7}, Lorg/iq80/leveldb/impl/LogWriter;->addRecord(Lorg/iq80/leveldb/util/Slice;Z)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 705
    :try_start_2
    new-instance v6, Lorg/iq80/leveldb/impl/DbImpl$InsertIntoHandler;

    iget-object v7, p0, Lorg/iq80/leveldb/impl/DbImpl;->memTable:Lorg/iq80/leveldb/impl/MemTable;

    invoke-direct {v6, v7, v2, v3}, Lorg/iq80/leveldb/impl/DbImpl$InsertIntoHandler;-><init>(Lorg/iq80/leveldb/impl/MemTable;J)V

    invoke-virtual {p1, v6}, Lorg/iq80/leveldb/impl/WriteBatchImpl;->forEach(Lorg/iq80/leveldb/impl/WriteBatchImpl$Handler;)V

    .line 711
    .end local v1    # "record":Lorg/iq80/leveldb/util/Slice;
    .end local v2    # "sequenceBegin":J
    :goto_0
    invoke-virtual {p2}, Lorg/iq80/leveldb/WriteOptions;->snapshot()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 712
    new-instance v6, Lorg/iq80/leveldb/impl/SnapshotImpl;

    iget-object v7, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v7}, Lorg/iq80/leveldb/impl/VersionSet;->getCurrent()Lorg/iq80/leveldb/impl/Version;

    move-result-object v7

    invoke-direct {v6, v7, v4, v5}, Lorg/iq80/leveldb/impl/SnapshotImpl;-><init>(Lorg/iq80/leveldb/impl/Version;J)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 719
    iget-object v7, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 715
    :goto_1
    return-object v6

    .line 700
    .restart local v1    # "record":Lorg/iq80/leveldb/util/Slice;
    .restart local v2    # "sequenceBegin":J
    :catch_0
    move-exception v0

    .line 701
    .local v0, "e":Ljava/io/IOException;
    :try_start_3
    invoke-static {v0}, Lcom/google/common/base/Throwables;->propagate(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v6

    throw v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 719
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "record":Lorg/iq80/leveldb/util/Slice;
    .end local v2    # "sequenceBegin":J
    .end local v4    # "sequenceEnd":J
    :catchall_0
    move-exception v6

    iget-object v7, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 720
    throw v6

    .line 708
    :cond_0
    :try_start_4
    iget-object v6, p0, Lorg/iq80/leveldb/impl/DbImpl;->versions:Lorg/iq80/leveldb/impl/VersionSet;

    invoke-virtual {v6}, Lorg/iq80/leveldb/impl/VersionSet;->getLastSequence()J
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-wide v4

    .restart local v4    # "sequenceEnd":J
    goto :goto_0

    .line 715
    :cond_1
    const/4 v6, 0x0

    .line 719
    iget-object v7, p0, Lorg/iq80/leveldb/impl/DbImpl;->mutex:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_1
.end method
