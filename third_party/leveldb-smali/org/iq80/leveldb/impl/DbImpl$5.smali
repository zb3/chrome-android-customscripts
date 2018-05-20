.class Lorg/iq80/leveldb/impl/DbImpl$5;
.super Ljava/lang/Object;
.source "DbImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/iq80/leveldb/impl/DbImpl;->suspendCompactions()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/iq80/leveldb/impl/DbImpl;


# direct methods
.method constructor <init>(Lorg/iq80/leveldb/impl/DbImpl;)V
    .locals 0
    .param p1, "this$0"    # Lorg/iq80/leveldb/impl/DbImpl;

    .prologue
    .line 1409
    iput-object p1, p0, Lorg/iq80/leveldb/impl/DbImpl$5;->this$0:Lorg/iq80/leveldb/impl/DbImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 1414
    :try_start_0
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl$5;->this$0:Lorg/iq80/leveldb/impl/DbImpl;

    # getter for: Lorg/iq80/leveldb/impl/DbImpl;->suspensionMutex:Ljava/lang/Object;
    invoke-static {v0}, Lorg/iq80/leveldb/impl/DbImpl;->access$1700(Lorg/iq80/leveldb/impl/DbImpl;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1415
    :try_start_1
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl$5;->this$0:Lorg/iq80/leveldb/impl/DbImpl;

    # operator++ for: Lorg/iq80/leveldb/impl/DbImpl;->suspensionCounter:I
    invoke-static {v0}, Lorg/iq80/leveldb/impl/DbImpl;->access$1808(Lorg/iq80/leveldb/impl/DbImpl;)I

    .line 1416
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl$5;->this$0:Lorg/iq80/leveldb/impl/DbImpl;

    # getter for: Lorg/iq80/leveldb/impl/DbImpl;->suspensionMutex:Ljava/lang/Object;
    invoke-static {v0}, Lorg/iq80/leveldb/impl/DbImpl;->access$1700(Lorg/iq80/leveldb/impl/DbImpl;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1417
    :goto_0
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl$5;->this$0:Lorg/iq80/leveldb/impl/DbImpl;

    # getter for: Lorg/iq80/leveldb/impl/DbImpl;->suspensionCounter:I
    invoke-static {v0}, Lorg/iq80/leveldb/impl/DbImpl;->access$1800(Lorg/iq80/leveldb/impl/DbImpl;)I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl$5;->this$0:Lorg/iq80/leveldb/impl/DbImpl;

    # getter for: Lorg/iq80/leveldb/impl/DbImpl;->compactionExecutor:Ljava/util/concurrent/ExecutorService;
    invoke-static {v0}, Lorg/iq80/leveldb/impl/DbImpl;->access$1900(Lorg/iq80/leveldb/impl/DbImpl;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->isShutdown()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1418
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl$5;->this$0:Lorg/iq80/leveldb/impl/DbImpl;

    # getter for: Lorg/iq80/leveldb/impl/DbImpl;->suspensionMutex:Ljava/lang/Object;
    invoke-static {v0}, Lorg/iq80/leveldb/impl/DbImpl;->access$1700(Lorg/iq80/leveldb/impl/DbImpl;)Ljava/lang/Object;

    move-result-object v0

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v2, v3}, Ljava/lang/Object;->wait(J)V

    goto :goto_0

    .line 1420
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v0
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 1422
    :catch_0
    move-exception v0

    .line 1424
    :goto_1
    return-void

    .line 1420
    :cond_0
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1
.end method
