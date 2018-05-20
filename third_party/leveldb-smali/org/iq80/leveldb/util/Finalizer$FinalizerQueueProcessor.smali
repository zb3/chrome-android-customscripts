.class Lorg/iq80/leveldb/util/Finalizer$FinalizerQueueProcessor;
.super Ljava/lang/Object;
.source "Finalizer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/util/Finalizer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FinalizerQueueProcessor"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/iq80/leveldb/util/Finalizer;


# direct methods
.method private constructor <init>(Lorg/iq80/leveldb/util/Finalizer;)V
    .locals 0

    .prologue
    .line 141
    .local p0, "this":Lorg/iq80/leveldb/util/Finalizer$FinalizerQueueProcessor;, "Lorg/iq80/leveldb/util/Finalizer<TT;>.FinalizerQueueProcessor;"
    iput-object p1, p0, Lorg/iq80/leveldb/util/Finalizer$FinalizerQueueProcessor;->this$0:Lorg/iq80/leveldb/util/Finalizer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/iq80/leveldb/util/Finalizer;Lorg/iq80/leveldb/util/Finalizer$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/iq80/leveldb/util/Finalizer;
    .param p2, "x1"    # Lorg/iq80/leveldb/util/Finalizer$1;

    .prologue
    .line 141
    .local p0, "this":Lorg/iq80/leveldb/util/Finalizer$FinalizerQueueProcessor;, "Lorg/iq80/leveldb/util/Finalizer<TT;>.FinalizerQueueProcessor;"
    invoke-direct {p0, p1}, Lorg/iq80/leveldb/util/Finalizer$FinalizerQueueProcessor;-><init>(Lorg/iq80/leveldb/util/Finalizer;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 147
    .local p0, "this":Lorg/iq80/leveldb/util/Finalizer$FinalizerQueueProcessor;, "Lorg/iq80/leveldb/util/Finalizer<TT;>.FinalizerQueueProcessor;"
    :cond_0
    iget-object v4, p0, Lorg/iq80/leveldb/util/Finalizer$FinalizerQueueProcessor;->this$0:Lorg/iq80/leveldb/util/Finalizer;

    # getter for: Lorg/iq80/leveldb/util/Finalizer;->destroyed:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-static {v4}, Lorg/iq80/leveldb/util/Finalizer;->access$300(Lorg/iq80/leveldb/util/Finalizer;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v4

    if-nez v4, :cond_3

    .line 151
    :try_start_0
    iget-object v4, p0, Lorg/iq80/leveldb/util/Finalizer$FinalizerQueueProcessor;->this$0:Lorg/iq80/leveldb/util/Finalizer;

    # getter for: Lorg/iq80/leveldb/util/Finalizer;->referenceQueue:Ljava/lang/ref/ReferenceQueue;
    invoke-static {v4}, Lorg/iq80/leveldb/util/Finalizer;->access$400(Lorg/iq80/leveldb/util/Finalizer;)Ljava/lang/ref/ReferenceQueue;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/ref/ReferenceQueue;->remove()Ljava/lang/ref/Reference;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    .local v1, "reference":Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;, "Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference<TT;>;"
    iget-object v4, p0, Lorg/iq80/leveldb/util/Finalizer$FinalizerQueueProcessor;->this$0:Lorg/iq80/leveldb/util/Finalizer;

    # getter for: Lorg/iq80/leveldb/util/Finalizer;->references:Ljava/util/concurrent/ConcurrentHashMap;
    invoke-static {v4}, Lorg/iq80/leveldb/util/Finalizer;->access$500(Lorg/iq80/leveldb/util/Finalizer;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    const/4 v2, 0x0

    .line 163
    .local v2, "rescheduleAndReturn":Z
    :try_start_1
    # invokes: Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;->cleanup()V
    invoke-static {v1}, Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;->access$200(Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;)V

    .line 164
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->isInterrupted()Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result v2

    .line 183
    :cond_1
    :goto_0
    if-eqz v2, :cond_0

    .line 184
    iget-object v5, p0, Lorg/iq80/leveldb/util/Finalizer$FinalizerQueueProcessor;->this$0:Lorg/iq80/leveldb/util/Finalizer;

    monitor-enter v5

    .line 185
    :try_start_2
    iget-object v4, p0, Lorg/iq80/leveldb/util/Finalizer$FinalizerQueueProcessor;->this$0:Lorg/iq80/leveldb/util/Finalizer;

    # getter for: Lorg/iq80/leveldb/util/Finalizer;->destroyed:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-static {v4}, Lorg/iq80/leveldb/util/Finalizer;->access$300(Lorg/iq80/leveldb/util/Finalizer;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v4

    if-nez v4, :cond_2

    .line 186
    iget-object v4, p0, Lorg/iq80/leveldb/util/Finalizer$FinalizerQueueProcessor;->this$0:Lorg/iq80/leveldb/util/Finalizer;

    # getter for: Lorg/iq80/leveldb/util/Finalizer;->executor:Ljava/util/concurrent/ExecutorService;
    invoke-static {v4}, Lorg/iq80/leveldb/util/Finalizer;->access$700(Lorg/iq80/leveldb/util/Finalizer;)Ljava/util/concurrent/ExecutorService;

    move-result-object v4

    new-instance v6, Lorg/iq80/leveldb/util/Finalizer$FinalizerQueueProcessor;

    iget-object v7, p0, Lorg/iq80/leveldb/util/Finalizer$FinalizerQueueProcessor;->this$0:Lorg/iq80/leveldb/util/Finalizer;

    invoke-direct {v6, v7}, Lorg/iq80/leveldb/util/Finalizer$FinalizerQueueProcessor;-><init>(Lorg/iq80/leveldb/util/Finalizer;)V

    invoke-interface {v4, v6}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 188
    :cond_2
    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 192
    .end local v1    # "reference":Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;, "Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference<TT;>;"
    .end local v2    # "rescheduleAndReturn":Z
    :cond_3
    :goto_1
    return-void

    .line 153
    :catch_0
    move-exception v0

    .line 154
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->interrupt()V

    goto :goto_1

    .line 166
    .end local v0    # "e":Ljava/lang/InterruptedException;
    .restart local v1    # "reference":Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;, "Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference<TT;>;"
    .restart local v2    # "rescheduleAndReturn":Z
    :catch_1
    move-exception v3

    .line 168
    .local v3, "userException":Ljava/lang/Throwable;
    :try_start_3
    iget-object v4, p0, Lorg/iq80/leveldb/util/Finalizer$FinalizerQueueProcessor;->this$0:Lorg/iq80/leveldb/util/Finalizer;

    # getter for: Lorg/iq80/leveldb/util/Finalizer;->monitor:Lorg/iq80/leveldb/util/Finalizer$FinalizerMonitor;
    invoke-static {v4}, Lorg/iq80/leveldb/util/Finalizer;->access$600(Lorg/iq80/leveldb/util/Finalizer;)Lorg/iq80/leveldb/util/Finalizer$FinalizerMonitor;

    move-result-object v4

    invoke-interface {v4, v3}, Lorg/iq80/leveldb/util/Finalizer$FinalizerMonitor;->unexpectedException(Ljava/lang/Throwable;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 174
    :goto_2
    instance-of v4, v3, Ljava/lang/InterruptedException;

    if-eqz v4, :cond_4

    .line 175
    const/4 v2, 0x1

    .line 176
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 178
    :cond_4
    instance-of v4, v3, Ljava/lang/Error;

    if-eqz v4, :cond_1

    .line 179
    const/4 v2, 0x1

    goto :goto_0

    .line 188
    .end local v3    # "userException":Ljava/lang/Throwable;
    :catchall_0
    move-exception v4

    :try_start_4
    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v4

    .line 170
    .restart local v3    # "userException":Ljava/lang/Throwable;
    :catch_2
    move-exception v4

    goto :goto_2
.end method
