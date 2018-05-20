.class Lorg/iq80/leveldb/impl/TableCache$1;
.super Lcom/google/common/cache/CacheLoader;
.source "TableCache.java"


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
        "Lcom/google/common/cache/CacheLoader",
        "<",
        "Ljava/lang/Long;",
        "Lorg/iq80/leveldb/impl/TableCache$TableAndFile;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/iq80/leveldb/impl/TableCache;

.field final synthetic val$databaseDir:Ljava/io/File;

.field final synthetic val$userComparator:Lorg/iq80/leveldb/table/UserComparator;

.field final synthetic val$verifyChecksums:Z


# direct methods
.method constructor <init>(Lorg/iq80/leveldb/impl/TableCache;Ljava/io/File;Lorg/iq80/leveldb/table/UserComparator;Z)V
    .locals 0
    .param p1, "this$0"    # Lorg/iq80/leveldb/impl/TableCache;

    .prologue
    .line 61
    iput-object p1, p0, Lorg/iq80/leveldb/impl/TableCache$1;->this$0:Lorg/iq80/leveldb/impl/TableCache;

    iput-object p2, p0, Lorg/iq80/leveldb/impl/TableCache$1;->val$databaseDir:Ljava/io/File;

    iput-object p3, p0, Lorg/iq80/leveldb/impl/TableCache$1;->val$userComparator:Lorg/iq80/leveldb/table/UserComparator;

    iput-boolean p4, p0, Lorg/iq80/leveldb/impl/TableCache$1;->val$verifyChecksums:Z

    invoke-direct {p0}, Lcom/google/common/cache/CacheLoader;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic load(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 61
    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/impl/TableCache$1;->load(Ljava/lang/Long;)Lorg/iq80/leveldb/impl/TableCache$TableAndFile;

    move-result-object v0

    return-object v0
.end method

.method public load(Ljava/lang/Long;)Lorg/iq80/leveldb/impl/TableCache$TableAndFile;
    .locals 7
    .param p1, "fileNumber"    # Ljava/lang/Long;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    new-instance v0, Lorg/iq80/leveldb/impl/TableCache$TableAndFile;

    iget-object v1, p0, Lorg/iq80/leveldb/impl/TableCache$1;->val$databaseDir:Ljava/io/File;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iget-object v4, p0, Lorg/iq80/leveldb/impl/TableCache$1;->val$userComparator:Lorg/iq80/leveldb/table/UserComparator;

    iget-boolean v5, p0, Lorg/iq80/leveldb/impl/TableCache$1;->val$verifyChecksums:Z

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lorg/iq80/leveldb/impl/TableCache$TableAndFile;-><init>(Ljava/io/File;JLorg/iq80/leveldb/table/UserComparator;ZLorg/iq80/leveldb/impl/TableCache$1;)V

    return-object v0
.end method
