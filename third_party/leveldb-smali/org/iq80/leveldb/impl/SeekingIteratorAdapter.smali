.class public Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;
.super Ljava/lang/Object;
.source "SeekingIteratorAdapter.java"

# interfaces
.implements Lorg/iq80/leveldb/DBIterator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;
    }
.end annotation


# instance fields
.field private final closed:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final seekingIterator:Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;)V
    .locals 2
    .param p1, "seekingIterator"    # Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 36
    iput-object p1, p0, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;->seekingIterator:Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;

    .line 37
    return-void
.end method

.method private adapt(Ljava/util/Map$Entry;)Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry",
            "<",
            "Lorg/iq80/leveldb/util/Slice;",
            "Lorg/iq80/leveldb/util/Slice;",
            ">;)",
            "Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;"
        }
    .end annotation

    .prologue
    .line 87
    .local p1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;>;"
    new-instance v2, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/util/Slice;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/util/Slice;

    invoke-direct {v2, v0, v1}, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;-><init>(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)V

    return-object v2
.end method


# virtual methods
.method public close()V
    .locals 3

    .prologue
    .line 74
    iget-object v0, p0, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 75
    iget-object v0, p0, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;->seekingIterator:Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->close()V

    .line 77
    :cond_0
    return-void
.end method

.method public hasNext()Z
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;->seekingIterator:Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public hasPrev()Z
    .locals 1

    .prologue
    .line 103
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 28
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;->next()Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;->seekingIterator:Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->next()Ljava/util/Map$Entry;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;->adapt(Ljava/util/Map$Entry;)Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic peekNext()Ljava/util/Map$Entry;
    .locals 1

    .prologue
    .line 28
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;->peekNext()Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;

    move-result-object v0

    return-object v0
.end method

.method public peekNext()Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;->seekingIterator:Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->peek()Ljava/util/Map$Entry;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;->adapt(Ljava/util/Map$Entry;)Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic peekPrev()Ljava/util/Map$Entry;
    .locals 1

    .prologue
    .line 28
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;->peekPrev()Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;

    move-result-object v0

    return-object v0
.end method

.method public peekPrev()Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;
    .locals 1

    .prologue
    .line 115
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public bridge synthetic prev()Ljava/util/Map$Entry;
    .locals 1

    .prologue
    .line 28
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;->prev()Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;

    move-result-object v0

    return-object v0
.end method

.method public prev()Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;
    .locals 1

    .prologue
    .line 109
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 82
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public seek([B)V
    .locals 2
    .param p1, "targetKey"    # [B

    .prologue
    .line 48
    iget-object v0, p0, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;->seekingIterator:Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;

    invoke-static {p1}, Lorg/iq80/leveldb/util/Slices;->wrappedBuffer([B)Lorg/iq80/leveldb/util/Slice;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->seek(Ljava/lang/Object;)V

    .line 49
    return-void
.end method

.method public seekToFirst()V
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;->seekingIterator:Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/SnapshotSeekingIterator;->seekToFirst()V

    .line 43
    return-void
.end method

.method public seekToLast()V
    .locals 1

    .prologue
    .line 97
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
