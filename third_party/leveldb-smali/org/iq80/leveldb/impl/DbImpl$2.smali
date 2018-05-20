.class Lorg/iq80/leveldb/impl/DbImpl$2;
.super Ljava/lang/Object;
.source "DbImpl.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/iq80/leveldb/impl/DbImpl;->maybeScheduleCompaction()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/iq80/leveldb/impl/DbImpl;


# direct methods
.method constructor <init>(Lorg/iq80/leveldb/impl/DbImpl;)V
    .locals 0
    .param p1, "this$0"    # Lorg/iq80/leveldb/impl/DbImpl;

    .prologue
    .line 396
    iput-object p1, p0, Lorg/iq80/leveldb/impl/DbImpl$2;->this$0:Lorg/iq80/leveldb/impl/DbImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 396
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/DbImpl$2;->call()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/lang/Void;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 402
    :try_start_0
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl$2;->this$0:Lorg/iq80/leveldb/impl/DbImpl;

    # invokes: Lorg/iq80/leveldb/impl/DbImpl;->backgroundCall()V
    invoke-static {v1}, Lorg/iq80/leveldb/impl/DbImpl;->access$100(Lorg/iq80/leveldb/impl/DbImpl;)V
    :try_end_0
    .catch Lorg/iq80/leveldb/impl/DbImpl$DatabaseShutdownException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 409
    :goto_0
    const/4 v1, 0x0

    return-object v1

    .line 406
    :catch_0
    move-exception v0

    .line 407
    .local v0, "e":Ljava/lang/Throwable;
    iget-object v1, p0, Lorg/iq80/leveldb/impl/DbImpl$2;->this$0:Lorg/iq80/leveldb/impl/DbImpl;

    # setter for: Lorg/iq80/leveldb/impl/DbImpl;->backgroundException:Ljava/lang/Throwable;
    invoke-static {v1, v0}, Lorg/iq80/leveldb/impl/DbImpl;->access$202(Lorg/iq80/leveldb/impl/DbImpl;Ljava/lang/Throwable;)Ljava/lang/Throwable;

    goto :goto_0

    .line 404
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_1
    move-exception v1

    goto :goto_0
.end method
