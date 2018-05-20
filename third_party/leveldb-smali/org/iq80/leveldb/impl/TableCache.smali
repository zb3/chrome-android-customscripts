.class public Lorg/iq80/leveldb/impl/TableCache;
.super Ljava/lang/Object;
.source "TableCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/iq80/leveldb/impl/TableCache$TableAndFile;
    }
.end annotation


# instance fields
.field private final cache:Lcom/google/common/cache/LoadingCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/LoadingCache",
            "<",
            "Ljava/lang/Long;",
            "Lorg/iq80/leveldb/impl/TableCache$TableAndFile;",
            ">;"
        }
    .end annotation
.end field

.field private final finalizer:Lorg/iq80/leveldb/util/Finalizer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/iq80/leveldb/util/Finalizer",
            "<",
            "Lorg/iq80/leveldb/table/Table;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/io/File;ILorg/iq80/leveldb/table/UserComparator;Z)V
    .locals 4
    .param p1, "databaseDir"    # Ljava/io/File;
    .param p2, "tableCacheSize"    # I
    .param p3, "userComparator"    # Lorg/iq80/leveldb/table/UserComparator;
    .param p4, "verifyChecksums"    # Z

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Lorg/iq80/leveldb/util/Finalizer;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lorg/iq80/leveldb/util/Finalizer;-><init>(I)V

    iput-object v0, p0, Lorg/iq80/leveldb/impl/TableCache;->finalizer:Lorg/iq80/leveldb/util/Finalizer;

    .line 47
    const-string v0, "databaseName is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    invoke-static {}, Lcom/google/common/cache/CacheBuilder;->newBuilder()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    int-to-long v2, p2

    .line 50
    invoke-virtual {v0, v2, v3}, Lcom/google/common/cache/CacheBuilder;->maximumSize(J)Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    new-instance v1, Lorg/iq80/leveldb/impl/TableCache$2;

    invoke-direct {v1, p0}, Lorg/iq80/leveldb/impl/TableCache$2;-><init>(Lorg/iq80/leveldb/impl/TableCache;)V

    .line 51
    invoke-virtual {v0, v1}, Lcom/google/common/cache/CacheBuilder;->removalListener(Lcom/google/common/cache/RemovalListener;)Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    new-instance v1, Lorg/iq80/leveldb/impl/TableCache$1;

    invoke-direct {v1, p0, p1, p3, p4}, Lorg/iq80/leveldb/impl/TableCache$1;-><init>(Lorg/iq80/leveldb/impl/TableCache;Ljava/io/File;Lorg/iq80/leveldb/table/UserComparator;Z)V

    .line 60
    invoke-virtual {v0, v1}, Lcom/google/common/cache/CacheBuilder;->build(Lcom/google/common/cache/CacheLoader;)Lcom/google/common/cache/LoadingCache;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/TableCache;->cache:Lcom/google/common/cache/LoadingCache;

    .line 69
    return-void
.end method

.method static synthetic access$100(Lorg/iq80/leveldb/impl/TableCache;)Lorg/iq80/leveldb/util/Finalizer;
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/TableCache;

    .prologue
    .line 40
    iget-object v0, p0, Lorg/iq80/leveldb/impl/TableCache;->finalizer:Lorg/iq80/leveldb/util/Finalizer;

    return-object v0
.end method

.method private getTable(J)Lorg/iq80/leveldb/table/Table;
    .locals 7
    .param p1, "number"    # J

    .prologue
    .line 90
    :try_start_0
    iget-object v3, p0, Lorg/iq80/leveldb/impl/TableCache;->cache:Lcom/google/common/cache/LoadingCache;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/google/common/cache/LoadingCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/iq80/leveldb/impl/TableCache$TableAndFile;

    invoke-virtual {v3}, Lorg/iq80/leveldb/impl/TableCache$TableAndFile;->getTable()Lorg/iq80/leveldb/table/Table;
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 99
    .local v2, "table":Lorg/iq80/leveldb/table/Table;
    return-object v2

    .line 92
    .end local v2    # "table":Lorg/iq80/leveldb/table/Table;
    :catch_0
    move-exception v1

    .line 93
    .local v1, "e":Ljava/util/concurrent/ExecutionException;
    move-object v0, v1

    .line 94
    .local v0, "cause":Ljava/lang/Throwable;
    invoke-virtual {v1}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 95
    invoke-virtual {v1}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 97
    :cond_0
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not open table "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lorg/iq80/leveldb/impl/TableCache;->cache:Lcom/google/common/cache/LoadingCache;

    invoke-interface {v0}, Lcom/google/common/cache/LoadingCache;->invalidateAll()V

    .line 105
    iget-object v0, p0, Lorg/iq80/leveldb/impl/TableCache;->finalizer:Lorg/iq80/leveldb/util/Finalizer;

    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Finalizer;->destroy()V

    .line 106
    return-void
.end method

.method public evict(J)V
    .locals 3
    .param p1, "number"    # J

    .prologue
    .line 110
    iget-object v0, p0, Lorg/iq80/leveldb/impl/TableCache;->cache:Lcom/google/common/cache/LoadingCache;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/common/cache/LoadingCache;->invalidate(Ljava/lang/Object;)V

    .line 111
    return-void
.end method

.method public getApproximateOffsetOf(Lorg/iq80/leveldb/impl/FileMetaData;Lorg/iq80/leveldb/util/Slice;)J
    .locals 2
    .param p1, "file"    # Lorg/iq80/leveldb/impl/FileMetaData;
    .param p2, "key"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 83
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/FileMetaData;->getNumber()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lorg/iq80/leveldb/impl/TableCache;->getTable(J)Lorg/iq80/leveldb/table/Table;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/iq80/leveldb/table/Table;->getApproximateOffsetOf(Lorg/iq80/leveldb/util/Slice;)J

    move-result-wide v0

    return-wide v0
.end method

.method public newIterator(J)Lorg/iq80/leveldb/util/InternalTableIterator;
    .locals 3
    .param p1, "number"    # J

    .prologue
    .line 78
    new-instance v0, Lorg/iq80/leveldb/util/InternalTableIterator;

    invoke-direct {p0, p1, p2}, Lorg/iq80/leveldb/impl/TableCache;->getTable(J)Lorg/iq80/leveldb/table/Table;

    move-result-object v1

    invoke-virtual {v1}, Lorg/iq80/leveldb/table/Table;->iterator()Lorg/iq80/leveldb/util/TableIterator;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/iq80/leveldb/util/InternalTableIterator;-><init>(Lorg/iq80/leveldb/util/TableIterator;)V

    return-object v0
.end method

.method public newIterator(Lorg/iq80/leveldb/impl/FileMetaData;)Lorg/iq80/leveldb/util/InternalTableIterator;
    .locals 2
    .param p1, "file"    # Lorg/iq80/leveldb/impl/FileMetaData;

    .prologue
    .line 73
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/FileMetaData;->getNumber()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/iq80/leveldb/impl/TableCache;->newIterator(J)Lorg/iq80/leveldb/util/InternalTableIterator;

    move-result-object v0

    return-object v0
.end method
