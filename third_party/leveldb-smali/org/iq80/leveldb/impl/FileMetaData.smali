.class public Lorg/iq80/leveldb/impl/FileMetaData;
.super Ljava/lang/Object;
.source "FileMetaData.java"


# static fields
.field public static final GET_LARGEST_USER_KEY:Lcom/google/common/base/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Function",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final allowedSeeks:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final fileSize:J

.field private final largest:Lorg/iq80/leveldb/impl/InternalKey;

.field private final number:J

.field private final smallest:Lorg/iq80/leveldb/impl/InternalKey;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    new-instance v0, Lorg/iq80/leveldb/impl/FileMetaData$1;

    invoke-direct {v0}, Lorg/iq80/leveldb/impl/FileMetaData$1;-><init>()V

    sput-object v0, Lorg/iq80/leveldb/impl/FileMetaData;->GET_LARGEST_USER_KEY:Lcom/google/common/base/Function;

    return-void
.end method

.method public constructor <init>(JJLorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)V
    .locals 3
    .param p1, "number"    # J
    .param p3, "fileSize"    # J
    .param p5, "smallest"    # Lorg/iq80/leveldb/impl/InternalKey;
    .param p6, "largest"    # Lorg/iq80/leveldb/impl/InternalKey;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/high16 v1, 0x40000000    # 2.0f

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lorg/iq80/leveldb/impl/FileMetaData;->allowedSeeks:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 60
    iput-wide p1, p0, Lorg/iq80/leveldb/impl/FileMetaData;->number:J

    .line 61
    iput-wide p3, p0, Lorg/iq80/leveldb/impl/FileMetaData;->fileSize:J

    .line 62
    iput-object p5, p0, Lorg/iq80/leveldb/impl/FileMetaData;->smallest:Lorg/iq80/leveldb/impl/InternalKey;

    .line 63
    iput-object p6, p0, Lorg/iq80/leveldb/impl/FileMetaData;->largest:Lorg/iq80/leveldb/impl/InternalKey;

    .line 64
    return-void
.end method


# virtual methods
.method public decrementAllowedSeeks()V
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lorg/iq80/leveldb/impl/FileMetaData;->allowedSeeks:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndDecrement()I

    .line 99
    return-void
.end method

.method public getAllowedSeeks()I
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lorg/iq80/leveldb/impl/FileMetaData;->allowedSeeks:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method public getFileSize()J
    .locals 2

    .prologue
    .line 68
    iget-wide v0, p0, Lorg/iq80/leveldb/impl/FileMetaData;->fileSize:J

    return-wide v0
.end method

.method public getLargest()Lorg/iq80/leveldb/impl/InternalKey;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lorg/iq80/leveldb/impl/FileMetaData;->largest:Lorg/iq80/leveldb/impl/InternalKey;

    return-object v0
.end method

.method public getNumber()J
    .locals 2

    .prologue
    .line 73
    iget-wide v0, p0, Lorg/iq80/leveldb/impl/FileMetaData;->number:J

    return-wide v0
.end method

.method public getSmallest()Lorg/iq80/leveldb/impl/InternalKey;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lorg/iq80/leveldb/impl/FileMetaData;->smallest:Lorg/iq80/leveldb/impl/InternalKey;

    return-object v0
.end method

.method public setAllowedSeeks(I)V
    .locals 1
    .param p1, "allowedSeeks"    # I

    .prologue
    .line 93
    iget-object v0, p0, Lorg/iq80/leveldb/impl/FileMetaData;->allowedSeeks:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 94
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 104
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "FileMetaData"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    const-string v1, "{number="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/iq80/leveldb/impl/FileMetaData;->number:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 107
    const-string v1, ", fileSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/iq80/leveldb/impl/FileMetaData;->fileSize:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 108
    const-string v1, ", smallest="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/FileMetaData;->smallest:Lorg/iq80/leveldb/impl/InternalKey;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 109
    const-string v1, ", largest="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/FileMetaData;->largest:Lorg/iq80/leveldb/impl/InternalKey;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 110
    const-string v1, ", allowedSeeks="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/FileMetaData;->allowedSeeks:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 111
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 112
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
