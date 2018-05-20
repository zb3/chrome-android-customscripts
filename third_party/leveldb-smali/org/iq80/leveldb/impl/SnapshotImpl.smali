.class public Lorg/iq80/leveldb/impl/SnapshotImpl;
.super Ljava/lang/Object;
.source "SnapshotImpl.java"

# interfaces
.implements Lorg/iq80/leveldb/Snapshot;


# instance fields
.field private final closed:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final lastSequence:J

.field private final version:Lorg/iq80/leveldb/impl/Version;


# direct methods
.method constructor <init>(Lorg/iq80/leveldb/impl/Version;J)V
    .locals 2
    .param p1, "version"    # Lorg/iq80/leveldb/impl/Version;
    .param p2, "lastSequence"    # J

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lorg/iq80/leveldb/impl/SnapshotImpl;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 33
    iput-object p1, p0, Lorg/iq80/leveldb/impl/SnapshotImpl;->version:Lorg/iq80/leveldb/impl/Version;

    .line 34
    iput-wide p2, p0, Lorg/iq80/leveldb/impl/SnapshotImpl;->lastSequence:J

    .line 35
    iget-object v0, p0, Lorg/iq80/leveldb/impl/SnapshotImpl;->version:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/Version;->retain()V

    .line 36
    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    .prologue
    .line 43
    iget-object v0, p0, Lorg/iq80/leveldb/impl/SnapshotImpl;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 44
    iget-object v0, p0, Lorg/iq80/leveldb/impl/SnapshotImpl;->version:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/Version;->release()V

    .line 46
    :cond_0
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 8
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 67
    if-ne p0, p1, :cond_1

    .line 83
    :cond_0
    :goto_0
    return v1

    .line 70
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 71
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 74
    check-cast v0, Lorg/iq80/leveldb/impl/SnapshotImpl;

    .line 76
    .local v0, "snapshot":Lorg/iq80/leveldb/impl/SnapshotImpl;
    iget-wide v4, p0, Lorg/iq80/leveldb/impl/SnapshotImpl;->lastSequence:J

    iget-wide v6, v0, Lorg/iq80/leveldb/impl/SnapshotImpl;->lastSequence:J

    cmp-long v3, v4, v6

    if-eqz v3, :cond_4

    move v1, v2

    .line 77
    goto :goto_0

    .line 79
    :cond_4
    iget-object v3, p0, Lorg/iq80/leveldb/impl/SnapshotImpl;->version:Lorg/iq80/leveldb/impl/Version;

    iget-object v4, v0, Lorg/iq80/leveldb/impl/SnapshotImpl;->version:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 80
    goto :goto_0
.end method

.method public getLastSequence()J
    .locals 2

    .prologue
    .line 50
    iget-wide v0, p0, Lorg/iq80/leveldb/impl/SnapshotImpl;->lastSequence:J

    return-wide v0
.end method

.method public getVersion()Lorg/iq80/leveldb/impl/Version;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lorg/iq80/leveldb/impl/SnapshotImpl;->version:Lorg/iq80/leveldb/impl/Version;

    return-object v0
.end method

.method public hashCode()I
    .locals 7

    .prologue
    .line 89
    iget-object v1, p0, Lorg/iq80/leveldb/impl/SnapshotImpl;->version:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 90
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Lorg/iq80/leveldb/impl/SnapshotImpl;->lastSequence:J

    iget-wide v4, p0, Lorg/iq80/leveldb/impl/SnapshotImpl;->lastSequence:J

    const/16 v6, 0x20

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int v0, v1, v2

    .line 91
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 61
    iget-wide v0, p0, Lorg/iq80/leveldb/impl/SnapshotImpl;->lastSequence:J

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
