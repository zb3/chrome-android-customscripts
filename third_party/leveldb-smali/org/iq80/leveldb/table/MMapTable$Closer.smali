.class Lorg/iq80/leveldb/table/MMapTable$Closer;
.super Ljava/lang/Object;
.source "MMapTable.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/table/MMapTable;
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

.field private final data:Ljava/nio/MappedByteBuffer;

.field private final name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/io/Closeable;Ljava/nio/MappedByteBuffer;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "closeable"    # Ljava/io/Closeable;
    .param p3, "data"    # Ljava/nio/MappedByteBuffer;

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput-object p1, p0, Lorg/iq80/leveldb/table/MMapTable$Closer;->name:Ljava/lang/String;

    .line 77
    iput-object p2, p0, Lorg/iq80/leveldb/table/MMapTable$Closer;->closeable:Ljava/io/Closeable;

    .line 78
    iput-object p3, p0, Lorg/iq80/leveldb/table/MMapTable$Closer;->data:Ljava/nio/MappedByteBuffer;

    .line 79
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
    .line 67
    invoke-virtual {p0}, Lorg/iq80/leveldb/table/MMapTable$Closer;->call()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/lang/Void;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lorg/iq80/leveldb/table/MMapTable$Closer;->data:Ljava/nio/MappedByteBuffer;

    invoke-static {v0}, Lorg/iq80/leveldb/util/ByteBufferSupport;->unmap(Ljava/nio/MappedByteBuffer;)V

    .line 84
    iget-object v0, p0, Lorg/iq80/leveldb/table/MMapTable$Closer;->closeable:Ljava/io/Closeable;

    invoke-static {v0}, Lorg/iq80/leveldb/util/Closeables;->closeQuietly(Ljava/io/Closeable;)V

    .line 85
    const/4 v0, 0x0

    return-object v0
.end method
