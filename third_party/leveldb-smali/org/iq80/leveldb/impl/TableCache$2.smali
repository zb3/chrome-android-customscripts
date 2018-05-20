.class Lorg/iq80/leveldb/impl/TableCache$2;
.super Ljava/lang/Object;
.source "TableCache.java"

# interfaces
.implements Lcom/google/common/cache/RemovalListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/iq80/leveldb/impl/TableCache;-><init>(Ljava/io/File;ILorg/iq80/leveldb/table/UserComparator;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/cache/RemovalListener",
        "<",
        "Ljava/lang/Long;",
        "Lorg/iq80/leveldb/impl/TableCache$TableAndFile;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/iq80/leveldb/impl/TableCache;


# direct methods
.method constructor <init>(Lorg/iq80/leveldb/impl/TableCache;)V
    .locals 0
    .param p1, "this$0"    # Lorg/iq80/leveldb/impl/TableCache;

    .prologue
    .line 52
    iput-object p1, p0, Lorg/iq80/leveldb/impl/TableCache$2;->this$0:Lorg/iq80/leveldb/impl/TableCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRemoval(Lcom/google/common/cache/RemovalNotification;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/RemovalNotification",
            "<",
            "Ljava/lang/Long;",
            "Lorg/iq80/leveldb/impl/TableCache$TableAndFile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 56
    .local p1, "notification":Lcom/google/common/cache/RemovalNotification;, "Lcom/google/common/cache/RemovalNotification<Ljava/lang/Long;Lorg/iq80/leveldb/impl/TableCache$TableAndFile;>;"
    invoke-virtual {p1}, Lcom/google/common/cache/RemovalNotification;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/impl/TableCache$TableAndFile;

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/TableCache$TableAndFile;->getTable()Lorg/iq80/leveldb/table/Table;

    move-result-object v0

    .line 57
    .local v0, "table":Lorg/iq80/leveldb/table/Table;
    iget-object v1, p0, Lorg/iq80/leveldb/impl/TableCache$2;->this$0:Lorg/iq80/leveldb/impl/TableCache;

    # getter for: Lorg/iq80/leveldb/impl/TableCache;->finalizer:Lorg/iq80/leveldb/util/Finalizer;
    invoke-static {v1}, Lorg/iq80/leveldb/impl/TableCache;->access$100(Lorg/iq80/leveldb/impl/TableCache;)Lorg/iq80/leveldb/util/Finalizer;

    move-result-object v1

    invoke-virtual {v0}, Lorg/iq80/leveldb/table/Table;->closer()Ljava/util/concurrent/Callable;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/iq80/leveldb/util/Finalizer;->addCleanup(Ljava/lang/Object;Ljava/util/concurrent/Callable;)V

    .line 58
    return-void
.end method
