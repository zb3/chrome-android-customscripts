.class public Lorg/iq80/leveldb/util/Finalizer;
.super Ljava/lang/Object;
.source "Finalizer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/iq80/leveldb/util/Finalizer$FinalizerQueueProcessor;,
        Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;,
        Lorg/iq80/leveldb/util/Finalizer$FinalizerMonitor;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final IGNORE_FINALIZER_MONITOR:Lorg/iq80/leveldb/util/Finalizer$FinalizerMonitor;


# instance fields
.field private final destroyed:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private executor:Ljava/util/concurrent/ExecutorService;

.field private final monitor:Lorg/iq80/leveldb/util/Finalizer$FinalizerMonitor;

.field private final referenceQueue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final references:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference",
            "<TT;>;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final threads:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    new-instance v0, Lorg/iq80/leveldb/util/Finalizer$1;

    invoke-direct {v0}, Lorg/iq80/leveldb/util/Finalizer$1;-><init>()V

    sput-object v0, Lorg/iq80/leveldb/util/Finalizer;->IGNORE_FINALIZER_MONITOR:Lorg/iq80/leveldb/util/Finalizer$FinalizerMonitor;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 53
    .local p0, "this":Lorg/iq80/leveldb/util/Finalizer;, "Lorg/iq80/leveldb/util/Finalizer<TT;>;"
    const/4 v0, 0x1

    sget-object v1, Lorg/iq80/leveldb/util/Finalizer;->IGNORE_FINALIZER_MONITOR:Lorg/iq80/leveldb/util/Finalizer$FinalizerMonitor;

    invoke-direct {p0, v0, v1}, Lorg/iq80/leveldb/util/Finalizer;-><init>(ILorg/iq80/leveldb/util/Finalizer$FinalizerMonitor;)V

    .line 54
    return-void
.end method

.method public constructor <init>(I)V
    .locals 2
    .param p1, "threads"    # I

    .prologue
    .line 58
    .local p0, "this":Lorg/iq80/leveldb/util/Finalizer;, "Lorg/iq80/leveldb/util/Finalizer<TT;>;"
    const/4 v0, 0x1

    sget-object v1, Lorg/iq80/leveldb/util/Finalizer;->IGNORE_FINALIZER_MONITOR:Lorg/iq80/leveldb/util/Finalizer$FinalizerMonitor;

    invoke-direct {p0, v0, v1}, Lorg/iq80/leveldb/util/Finalizer;-><init>(ILorg/iq80/leveldb/util/Finalizer$FinalizerMonitor;)V

    .line 59
    return-void
.end method

.method public constructor <init>(ILorg/iq80/leveldb/util/Finalizer$FinalizerMonitor;)V
    .locals 2
    .param p1, "threads"    # I
    .param p2, "monitor"    # Lorg/iq80/leveldb/util/Finalizer$FinalizerMonitor;

    .prologue
    .local p0, "this":Lorg/iq80/leveldb/util/Finalizer;, "Lorg/iq80/leveldb/util/Finalizer<TT;>;"
    const/4 v0, 0x1

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v1, p0, Lorg/iq80/leveldb/util/Finalizer;->references:Ljava/util/concurrent/ConcurrentHashMap;

    .line 47
    new-instance v1, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v1}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v1, p0, Lorg/iq80/leveldb/util/Finalizer;->referenceQueue:Ljava/lang/ref/ReferenceQueue;

    .line 48
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v1, p0, Lorg/iq80/leveldb/util/Finalizer;->destroyed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 63
    iput-object p2, p0, Lorg/iq80/leveldb/util/Finalizer;->monitor:Lorg/iq80/leveldb/util/Finalizer$FinalizerMonitor;

    .line 64
    if-lt p1, v0, :cond_0

    :goto_0
    const-string v1, "threads must be at least 1"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 65
    iput p1, p0, Lorg/iq80/leveldb/util/Finalizer;->threads:I

    .line 66
    return-void

    .line 64
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic access$300(Lorg/iq80/leveldb/util/Finalizer;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/util/Finalizer;

    .prologue
    .line 33
    iget-object v0, p0, Lorg/iq80/leveldb/util/Finalizer;->destroyed:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic access$400(Lorg/iq80/leveldb/util/Finalizer;)Ljava/lang/ref/ReferenceQueue;
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/util/Finalizer;

    .prologue
    .line 33
    iget-object v0, p0, Lorg/iq80/leveldb/util/Finalizer;->referenceQueue:Ljava/lang/ref/ReferenceQueue;

    return-object v0
.end method

.method static synthetic access$500(Lorg/iq80/leveldb/util/Finalizer;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/util/Finalizer;

    .prologue
    .line 33
    iget-object v0, p0, Lorg/iq80/leveldb/util/Finalizer;->references:Ljava/util/concurrent/ConcurrentHashMap;

    return-object v0
.end method

.method static synthetic access$600(Lorg/iq80/leveldb/util/Finalizer;)Lorg/iq80/leveldb/util/Finalizer$FinalizerMonitor;
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/util/Finalizer;

    .prologue
    .line 33
    iget-object v0, p0, Lorg/iq80/leveldb/util/Finalizer;->monitor:Lorg/iq80/leveldb/util/Finalizer$FinalizerMonitor;

    return-object v0
.end method

.method static synthetic access$700(Lorg/iq80/leveldb/util/Finalizer;)Ljava/util/concurrent/ExecutorService;
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/util/Finalizer;

    .prologue
    .line 33
    iget-object v0, p0, Lorg/iq80/leveldb/util/Finalizer;->executor:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method


# virtual methods
.method public declared-synchronized addCleanup(Ljava/lang/Object;Ljava/util/concurrent/Callable;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/util/concurrent/Callable",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/iq80/leveldb/util/Finalizer;, "Lorg/iq80/leveldb/util/Finalizer<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    .local p2, "cleanup":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<*>;"
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 70
    monitor-enter p0

    :try_start_0
    const-string v5, "item is null"

    invoke-static {p1, v5}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    const-string v5, "cleanup is null"

    invoke-static {p2, v5}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    iget-object v5, p0, Lorg/iq80/leveldb/util/Finalizer;->destroyed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v5

    if-nez v5, :cond_0

    :goto_0
    const-string v4, "%s is destroyed"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 74
    iget-object v3, p0, Lorg/iq80/leveldb/util/Finalizer;->executor:Ljava/util/concurrent/ExecutorService;

    if-nez v3, :cond_1

    .line 76
    new-instance v3, Lcom/google/common/util/concurrent/ThreadFactoryBuilder;

    invoke-direct {v3}, Lcom/google/common/util/concurrent/ThreadFactoryBuilder;-><init>()V

    const-string v4, "FinalizerQueueProcessor-%d"

    .line 77
    invoke-virtual {v3, v4}, Lcom/google/common/util/concurrent/ThreadFactoryBuilder;->setNameFormat(Ljava/lang/String;)Lcom/google/common/util/concurrent/ThreadFactoryBuilder;

    move-result-object v3

    const/4 v4, 0x1

    .line 78
    invoke-virtual {v3, v4}, Lcom/google/common/util/concurrent/ThreadFactoryBuilder;->setDaemon(Z)Lcom/google/common/util/concurrent/ThreadFactoryBuilder;

    move-result-object v3

    .line 79
    invoke-virtual {v3}, Lcom/google/common/util/concurrent/ThreadFactoryBuilder;->build()Ljava/util/concurrent/ThreadFactory;

    move-result-object v2

    .line 80
    .local v2, "threadFactory":Ljava/util/concurrent/ThreadFactory;
    iget v3, p0, Lorg/iq80/leveldb/util/Finalizer;->threads:I

    invoke-static {v3, v2}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v3

    iput-object v3, p0, Lorg/iq80/leveldb/util/Finalizer;->executor:Ljava/util/concurrent/ExecutorService;

    .line 83
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v3, p0, Lorg/iq80/leveldb/util/Finalizer;->threads:I

    if-ge v0, v3, :cond_1

    .line 84
    iget-object v3, p0, Lorg/iq80/leveldb/util/Finalizer;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v4, Lorg/iq80/leveldb/util/Finalizer$FinalizerQueueProcessor;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Lorg/iq80/leveldb/util/Finalizer$FinalizerQueueProcessor;-><init>(Lorg/iq80/leveldb/util/Finalizer;Lorg/iq80/leveldb/util/Finalizer$1;)V

    invoke-interface {v3, v4}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 83
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .end local v0    # "i":I
    .end local v2    # "threadFactory":Ljava/util/concurrent/ThreadFactory;
    :cond_0
    move v3, v4

    .line 72
    goto :goto_0

    .line 89
    :cond_1
    new-instance v1, Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;

    iget-object v3, p0, Lorg/iq80/leveldb/util/Finalizer;->referenceQueue:Ljava/lang/ref/ReferenceQueue;

    const/4 v4, 0x0

    invoke-direct {v1, p1, v3, p2, v4}, Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;Ljava/util/concurrent/Callable;Lorg/iq80/leveldb/util/Finalizer$1;)V

    .line 93
    .local v1, "reference":Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;, "Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference<TT;>;"
    iget-object v3, p0, Lorg/iq80/leveldb/util/Finalizer;->references:Ljava/util/concurrent/ConcurrentHashMap;

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3, v1, v4}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    monitor-exit p0

    return-void

    .line 70
    .end local v1    # "reference":Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;, "Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference<TT;>;"
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized destroy()V
    .locals 4

    .prologue
    .line 98
    .local p0, "this":Lorg/iq80/leveldb/util/Finalizer;, "Lorg/iq80/leveldb/util/Finalizer<TT;>;"
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lorg/iq80/leveldb/util/Finalizer;->destroyed:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 99
    iget-object v2, p0, Lorg/iq80/leveldb/util/Finalizer;->executor:Ljava/util/concurrent/ExecutorService;

    if-eqz v2, :cond_0

    .line 100
    iget-object v2, p0, Lorg/iq80/leveldb/util/Finalizer;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v2}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 104
    :cond_0
    iget-object v2, p0, Lorg/iq80/leveldb/util/Finalizer;->references:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentHashMap;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .line 105
    .local v0, "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference<TT;>;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 106
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 108
    .local v1, "r":Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;, "Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference<TT;>;"
    :try_start_1
    # invokes: Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;->cleanup()V
    invoke-static {v1}, Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;->access$200(Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 110
    :catch_0
    move-exception v2

    goto :goto_0

    .line 113
    .end local v1    # "r":Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;, "Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference<TT;>;"
    :cond_1
    monitor-exit p0

    return-void

    .line 98
    .end local v0    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference<TT;>;>;"
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method
