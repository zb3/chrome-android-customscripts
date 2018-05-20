.class public final Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;
.super Lorg/iq80/leveldb/util/AbstractSeekingIterator;
.source "SnapshotSeekingIterator.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/iq80/leveldb/util/AbstractSeekingIterator",
        "<",
        "Lorg/iq80/leveldb/util/Slice;",
        "Lorg/iq80/leveldb/util/Slice;",
        ">;"
    }
.end annotation


# instance fields
.field private final iterator:Lorg/iq80/leveldb/util/DbIterator;

.field private final snapshot:Lorg/iq80/leveldb/impl/SnapshotImpl;

.field private final userComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/iq80/leveldb/util/Slice;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/util/DbIterator;Lorg/iq80/leveldb/impl/SnapshotImpl;Ljava/util/Comparator;)V
    .locals 1
    .param p1, "iterator"    # Lorg/iq80/leveldb/util/DbIterator;
    .param p2, "snapshot"    # Lorg/iq80/leveldb/impl/SnapshotImpl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/iq80/leveldb/util/DbIterator;",
            "Lorg/iq80/leveldb/impl/SnapshotImpl;",
            "Ljava/util/Comparator",
            "<",
            "Lorg/iq80/leveldb/util/Slice;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 36
    .local p3, "userComparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lorg/iq80/leveldb/util/Slice;>;"
    invoke-direct {p0}, Lorg/iq80/leveldb/util/AbstractSeekingIterator;-><init>()V

    .line 37
    iput-object p1, p0, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->iterator:Lorg/iq80/leveldb/util/DbIterator;

    .line 38
    iput-object p2, p0, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->snapshot:Lorg/iq80/leveldb/impl/SnapshotImpl;

    .line 39
    iput-object p3, p0, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->userComparator:Ljava/util/Comparator;

    .line 40
    iget-object v0, p0, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->snapshot:Lorg/iq80/leveldb/impl/SnapshotImpl;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/SnapshotImpl;->getVersion()Lorg/iq80/leveldb/impl/Version;

    move-result-object v0

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/Version;->retain()V

    .line 41
    return-void
.end method

.method private findNextUserEntry(Lorg/iq80/leveldb/util/Slice;)V
    .locals 6
    .param p1, "deletedKey"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 80
    iget-object v1, p0, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->iterator:Lorg/iq80/leveldb/util/DbIterator;

    invoke-virtual {v1}, Lorg/iq80/leveldb/util/DbIterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_1

    .line 106
    :cond_0
    :goto_0
    return-void

    .line 86
    :cond_1
    iget-object v1, p0, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->iterator:Lorg/iq80/leveldb/util/DbIterator;

    invoke-virtual {v1}, Lorg/iq80/leveldb/util/DbIterator;->peek()Ljava/util/Map$Entry;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/InternalKey;

    .line 89
    .local v0, "internalKey":Lorg/iq80/leveldb/impl/InternalKey;
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/InternalKey;->getSequenceNumber()J

    move-result-wide v2

    iget-object v1, p0, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->snapshot:Lorg/iq80/leveldb/impl/SnapshotImpl;

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/SnapshotImpl;->getLastSequence()J

    move-result-wide v4

    cmp-long v1, v2, v4

    if-lez v1, :cond_2

    .line 90
    iget-object v1, p0, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->iterator:Lorg/iq80/leveldb/util/DbIterator;

    invoke-virtual {v1}, Lorg/iq80/leveldb/util/DbIterator;->next()Ljava/util/Map$Entry;

    .line 105
    :goto_1
    iget-object v1, p0, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->iterator:Lorg/iq80/leveldb/util/DbIterator;

    invoke-virtual {v1}, Lorg/iq80/leveldb/util/DbIterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 95
    :cond_2
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/InternalKey;->getValueType()Lorg/iq80/leveldb/impl/ValueType;

    move-result-object v1

    sget-object v2, Lorg/iq80/leveldb/impl/ValueType;->DELETION:Lorg/iq80/leveldb/impl/ValueType;

    if-ne v1, v2, :cond_4

    .line 96
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object p1

    .line 104
    :cond_3
    iget-object v1, p0, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->iterator:Lorg/iq80/leveldb/util/DbIterator;

    invoke-virtual {v1}, Lorg/iq80/leveldb/util/DbIterator;->next()Ljava/util/Map$Entry;

    goto :goto_1

    .line 98
    :cond_4
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/InternalKey;->getValueType()Lorg/iq80/leveldb/impl/ValueType;

    move-result-object v1

    sget-object v2, Lorg/iq80/leveldb/impl/ValueType;->VALUE:Lorg/iq80/leveldb/impl/ValueType;

    if-ne v1, v2, :cond_3

    .line 100
    if-eqz p1, :cond_0

    iget-object v1, p0, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->userComparator:Ljava/util/Comparator;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v1

    if-lez v1, :cond_3

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->snapshot:Lorg/iq80/leveldb/impl/SnapshotImpl;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/SnapshotImpl;->getVersion()Lorg/iq80/leveldb/impl/Version;

    move-result-object v0

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/Version;->release()V

    .line 46
    return-void
.end method

.method protected getNextElement()Ljava/util/Map$Entry;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<",
            "Lorg/iq80/leveldb/util/Slice;",
            "Lorg/iq80/leveldb/util/Slice;",
            ">;"
        }
    .end annotation

    .prologue
    .line 65
    iget-object v1, p0, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->iterator:Lorg/iq80/leveldb/util/DbIterator;

    invoke-virtual {v1}, Lorg/iq80/leveldb/util/DbIterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 66
    const/4 v1, 0x0

    .line 74
    :goto_0
    return-object v1

    .line 69
    :cond_0
    iget-object v1, p0, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->iterator:Lorg/iq80/leveldb/util/DbIterator;

    invoke-virtual {v1}, Lorg/iq80/leveldb/util/DbIterator;->next()Ljava/util/Map$Entry;

    move-result-object v0

    .line 72
    .local v0, "next":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/util/Slice;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->findNextUserEntry(Lorg/iq80/leveldb/util/Slice;)V

    .line 74
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/common/collect/Maps;->immutableEntry(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v1

    goto :goto_0
.end method

.method protected bridge synthetic seekInternal(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 28
    check-cast p1, Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->seekInternal(Lorg/iq80/leveldb/util/Slice;)V

    return-void
.end method

.method protected seekInternal(Lorg/iq80/leveldb/util/Slice;)V
    .locals 5
    .param p1, "targetKey"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 58
    iget-object v0, p0, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->iterator:Lorg/iq80/leveldb/util/DbIterator;

    new-instance v1, Lorg/iq80/leveldb/impl/InternalKey;

    iget-object v2, p0, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->snapshot:Lorg/iq80/leveldb/impl/SnapshotImpl;

    invoke-virtual {v2}, Lorg/iq80/leveldb/impl/SnapshotImpl;->getLastSequence()J

    move-result-wide v2

    sget-object v4, Lorg/iq80/leveldb/impl/ValueType;->VALUE:Lorg/iq80/leveldb/impl/ValueType;

    invoke-direct {v1, p1, v2, v3, v4}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;JLorg/iq80/leveldb/impl/ValueType;)V

    invoke-virtual {v0, v1}, Lorg/iq80/leveldb/util/DbIterator;->seek(Ljava/lang/Object;)V

    .line 59
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->findNextUserEntry(Lorg/iq80/leveldb/util/Slice;)V

    .line 60
    return-void
.end method

.method protected seekToFirstInternal()V
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->iterator:Lorg/iq80/leveldb/util/DbIterator;

    invoke-virtual {v0}, Lorg/iq80/leveldb/util/DbIterator;->seekToFirst()V

    .line 52
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->findNextUserEntry(Lorg/iq80/leveldb/util/Slice;)V

    .line 53
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "SnapshotSeekingIterator"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    const-string v1, "{snapshot="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->snapshot:Lorg/iq80/leveldb/impl/SnapshotImpl;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 114
    const-string v1, ", iterator="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->iterator:Lorg/iq80/leveldb/util/DbIterator;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 115
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 116
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
