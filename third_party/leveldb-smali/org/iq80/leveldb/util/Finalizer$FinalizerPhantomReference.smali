.class Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;
.super Ljava/lang/ref/PhantomReference;
.source "Finalizer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/util/Finalizer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FinalizerPhantomReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/ref/PhantomReference",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final cleaned:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final cleanup:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;Ljava/util/concurrent/Callable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/ref/ReferenceQueue",
            "<-TT;>;",
            "Ljava/util/concurrent/Callable",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 128
    .local p0, "this":Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;, "Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference<TT;>;"
    .local p1, "referent":Ljava/lang/Object;, "TT;"
    .local p2, "queue":Ljava/lang/ref/ReferenceQueue;, "Ljava/lang/ref/ReferenceQueue<-TT;>;"
    .local p3, "cleanup":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<*>;"
    invoke-direct {p0, p1, p2}, Ljava/lang/ref/PhantomReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    .line 123
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;->cleaned:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 129
    iput-object p3, p0, Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;->cleanup:Ljava/util/concurrent/Callable;

    .line 130
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;Ljava/util/concurrent/Callable;Lorg/iq80/leveldb/util/Finalizer$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/ref/ReferenceQueue;
    .param p3, "x2"    # Ljava/util/concurrent/Callable;
    .param p4, "x3"    # Lorg/iq80/leveldb/util/Finalizer$1;

    .prologue
    .line 120
    .local p0, "this":Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;, "Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference<TT;>;"
    invoke-direct {p0, p1, p2, p3}, Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;Ljava/util/concurrent/Callable;)V

    return-void
.end method

.method static synthetic access$200(Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;)V
    .locals 0
    .param p0, "x0"    # Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 120
    invoke-direct {p0}, Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;->cleanup()V

    return-void
.end method

.method private cleanup()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 135
    .local p0, "this":Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;, "Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference<TT;>;"
    iget-object v0, p0, Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;->cleaned:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 136
    iget-object v0, p0, Lorg/iq80/leveldb/util/Finalizer$FinalizerPhantomReference;->cleanup:Ljava/util/concurrent/Callable;

    invoke-interface {v0}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    .line 138
    :cond_0
    return-void
.end method
