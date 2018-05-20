.class public Lorg/iq80/leveldb/ReadOptions;
.super Ljava/lang/Object;
.source "ReadOptions.java"


# instance fields
.field private fillCache:Z

.field private snapshot:Lorg/iq80/leveldb/Snapshot;

.field private verifyChecksums:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/iq80/leveldb/ReadOptions;->fillCache:Z

    return-void
.end method


# virtual methods
.method public fillCache(Z)Lorg/iq80/leveldb/ReadOptions;
    .locals 0
    .param p1, "fillCache"    # Z

    .prologue
    .line 44
    iput-boolean p1, p0, Lorg/iq80/leveldb/ReadOptions;->fillCache:Z

    .line 45
    return-object p0
.end method

.method public fillCache()Z
    .locals 1

    .prologue
    .line 39
    iget-boolean v0, p0, Lorg/iq80/leveldb/ReadOptions;->fillCache:Z

    return v0
.end method

.method public snapshot(Lorg/iq80/leveldb/Snapshot;)Lorg/iq80/leveldb/ReadOptions;
    .locals 0
    .param p1, "snapshot"    # Lorg/iq80/leveldb/Snapshot;

    .prologue
    .line 33
    iput-object p1, p0, Lorg/iq80/leveldb/ReadOptions;->snapshot:Lorg/iq80/leveldb/Snapshot;

    .line 34
    return-object p0
.end method

.method public snapshot()Lorg/iq80/leveldb/Snapshot;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lorg/iq80/leveldb/ReadOptions;->snapshot:Lorg/iq80/leveldb/Snapshot;

    return-object v0
.end method

.method public verifyChecksums(Z)Lorg/iq80/leveldb/ReadOptions;
    .locals 0
    .param p1, "verifyChecksums"    # Z

    .prologue
    .line 55
    iput-boolean p1, p0, Lorg/iq80/leveldb/ReadOptions;->verifyChecksums:Z

    .line 56
    return-object p0
.end method

.method public verifyChecksums()Z
    .locals 1

    .prologue
    .line 50
    iget-boolean v0, p0, Lorg/iq80/leveldb/ReadOptions;->verifyChecksums:Z

    return v0
.end method
