.class Lorg/iq80/leveldb/table/Table$Closer;
.super Ljava/lang/Object;
.source "Table.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/table/Table;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Closer"
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
.field private final closeable:Ljava/io/Closeable;


# direct methods
.method public constructor <init>(Ljava/io/Closeable;)V
    .locals 0
    .param p1, "closeable"    # Ljava/io/Closeable;

    .prologue
    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 145
    iput-object p1, p0, Lorg/iq80/leveldb/table/Table$Closer;->closeable:Ljava/io/Closeable;

    .line 146
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
    .line 138
    invoke-virtual {p0}, Lorg/iq80/leveldb/table/Table$Closer;->call()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/lang/Void;
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lorg/iq80/leveldb/table/Table$Closer;->closeable:Ljava/io/Closeable;

    invoke-static {v0}, Lorg/iq80/leveldb/util/Closeables;->closeQuietly(Ljava/io/Closeable;)V

    .line 152
    const/4 v0, 0x0

    return-object v0
.end method
