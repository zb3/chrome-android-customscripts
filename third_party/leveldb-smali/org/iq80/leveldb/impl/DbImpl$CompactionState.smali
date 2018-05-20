.class Lorg/iq80/leveldb/impl/DbImpl$CompactionState;
.super Ljava/lang/Object;
.source "DbImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/impl/DbImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CompactionState"
.end annotation


# instance fields
.field private builder:Lorg/iq80/leveldb/table/TableBuilder;

.field private final compaction:Lorg/iq80/leveldb/impl/Compaction;

.field private currentFileNumber:J

.field private currentFileSize:J

.field private currentLargest:Lorg/iq80/leveldb/impl/InternalKey;

.field private currentSmallest:Lorg/iq80/leveldb/impl/InternalKey;

.field private outfile:Ljava/nio/channels/FileChannel;

.field private final outputs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;"
        }
    .end annotation
.end field

.field private smallestSnapshot:J

.field private totalBytes:J


# direct methods
.method private constructor <init>(Lorg/iq80/leveldb/impl/Compaction;)V
    .locals 1
    .param p1, "compaction"    # Lorg/iq80/leveldb/impl/Compaction;

    .prologue
    .line 1275
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1258
    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->outputs:Ljava/util/List;

    .line 1276
    iput-object p1, p0, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->compaction:Lorg/iq80/leveldb/impl/Compaction;

    .line 1277
    return-void
.end method

.method synthetic constructor <init>(Lorg/iq80/leveldb/impl/Compaction;Lorg/iq80/leveldb/impl/DbImpl$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/iq80/leveldb/impl/Compaction;
    .param p2, "x1"    # Lorg/iq80/leveldb/impl/DbImpl$1;

    .prologue
    .line 1254
    invoke-direct {p0, p1}, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;-><init>(Lorg/iq80/leveldb/impl/Compaction;)V

    return-void
.end method

.method static synthetic access$1000(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)J
    .locals 2
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;

    .prologue
    .line 1254
    iget-wide v0, p0, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->smallestSnapshot:J

    return-wide v0
.end method

.method static synthetic access$1002(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;J)J
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;
    .param p1, "x1"    # J

    .prologue
    .line 1254
    iput-wide p1, p0, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->smallestSnapshot:J

    return-wide p1
.end method

.method static synthetic access$1100(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/impl/Compaction;
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;

    .prologue
    .line 1254
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->compaction:Lorg/iq80/leveldb/impl/Compaction;

    return-object v0
.end method

.method static synthetic access$1200(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/impl/InternalKey;
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;

    .prologue
    .line 1254
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->currentSmallest:Lorg/iq80/leveldb/impl/InternalKey;

    return-object v0
.end method

.method static synthetic access$1202(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;Lorg/iq80/leveldb/impl/InternalKey;)Lorg/iq80/leveldb/impl/InternalKey;
    .locals 0
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;
    .param p1, "x1"    # Lorg/iq80/leveldb/impl/InternalKey;

    .prologue
    .line 1254
    iput-object p1, p0, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->currentSmallest:Lorg/iq80/leveldb/impl/InternalKey;

    return-object p1
.end method

.method static synthetic access$1300(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/impl/InternalKey;
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;

    .prologue
    .line 1254
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->currentLargest:Lorg/iq80/leveldb/impl/InternalKey;

    return-object v0
.end method

.method static synthetic access$1302(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;Lorg/iq80/leveldb/impl/InternalKey;)Lorg/iq80/leveldb/impl/InternalKey;
    .locals 0
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;
    .param p1, "x1"    # Lorg/iq80/leveldb/impl/InternalKey;

    .prologue
    .line 1254
    iput-object p1, p0, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->currentLargest:Lorg/iq80/leveldb/impl/InternalKey;

    return-object p1
.end method

.method static synthetic access$1400(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)J
    .locals 2
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;

    .prologue
    .line 1254
    iget-wide v0, p0, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->currentFileNumber:J

    return-wide v0
.end method

.method static synthetic access$1402(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;J)J
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;
    .param p1, "x1"    # J

    .prologue
    .line 1254
    iput-wide p1, p0, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->currentFileNumber:J

    return-wide p1
.end method

.method static synthetic access$1500(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)J
    .locals 2
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;

    .prologue
    .line 1254
    iget-wide v0, p0, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->currentFileSize:J

    return-wide v0
.end method

.method static synthetic access$1502(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;J)J
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;
    .param p1, "x1"    # J

    .prologue
    .line 1254
    iput-wide p1, p0, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->currentFileSize:J

    return-wide p1
.end method

.method static synthetic access$1600(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)J
    .locals 2
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;

    .prologue
    .line 1254
    iget-wide v0, p0, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->totalBytes:J

    return-wide v0
.end method

.method static synthetic access$1602(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;J)J
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;
    .param p1, "x1"    # J

    .prologue
    .line 1254
    iput-wide p1, p0, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->totalBytes:J

    return-wide p1
.end method

.method static synthetic access$700(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Lorg/iq80/leveldb/table/TableBuilder;
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;

    .prologue
    .line 1254
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->builder:Lorg/iq80/leveldb/table/TableBuilder;

    return-object v0
.end method

.method static synthetic access$702(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;Lorg/iq80/leveldb/table/TableBuilder;)Lorg/iq80/leveldb/table/TableBuilder;
    .locals 0
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;
    .param p1, "x1"    # Lorg/iq80/leveldb/table/TableBuilder;

    .prologue
    .line 1254
    iput-object p1, p0, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->builder:Lorg/iq80/leveldb/table/TableBuilder;

    return-object p1
.end method

.method static synthetic access$800(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Ljava/nio/channels/FileChannel;
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;

    .prologue
    .line 1254
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->outfile:Ljava/nio/channels/FileChannel;

    return-object v0
.end method

.method static synthetic access$802(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;Ljava/nio/channels/FileChannel;)Ljava/nio/channels/FileChannel;
    .locals 0
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;
    .param p1, "x1"    # Ljava/nio/channels/FileChannel;

    .prologue
    .line 1254
    iput-object p1, p0, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->outfile:Ljava/nio/channels/FileChannel;

    return-object p1
.end method

.method static synthetic access$900(Lorg/iq80/leveldb/impl/DbImpl$CompactionState;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl$CompactionState;

    .prologue
    .line 1254
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->outputs:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public getCompaction()Lorg/iq80/leveldb/impl/Compaction;
    .locals 1

    .prologue
    .line 1281
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl$CompactionState;->compaction:Lorg/iq80/leveldb/impl/Compaction;

    return-object v0
.end method
