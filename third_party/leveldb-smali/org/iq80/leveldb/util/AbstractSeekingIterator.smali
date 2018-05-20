.class public abstract Lorg/iq80/leveldb/util/AbstractSeekingIterator;
.super Ljava/lang/Object;
.source "AbstractSeekingIterator.java"

# interfaces
.implements Lorg/iq80/leveldb/impl/SeekingIterator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/iq80/leveldb/impl/SeekingIterator",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field private nextElement:Ljava/util/Map$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map$Entry",
            "<TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    .local p0, "this":Lorg/iq80/leveldb/util/AbstractSeekingIterator;, "Lorg/iq80/leveldb/util/AbstractSeekingIterator<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract getNextElement()Ljava/util/Map$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;"
        }
    .end annotation
.end method

.method public final hasNext()Z
    .locals 1

    .prologue
    .line 47
    .local p0, "this":Lorg/iq80/leveldb/util/AbstractSeekingIterator;, "Lorg/iq80/leveldb/util/AbstractSeekingIterator<TK;TV;>;"
    iget-object v0, p0, Lorg/iq80/leveldb/util/AbstractSeekingIterator;->nextElement:Ljava/util/Map$Entry;

    if-nez v0, :cond_0

    .line 48
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/AbstractSeekingIterator;->getNextElement()Ljava/util/Map$Entry;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/util/AbstractSeekingIterator;->nextElement:Ljava/util/Map$Entry;

    .line 50
    :cond_0
    iget-object v0, p0, Lorg/iq80/leveldb/util/AbstractSeekingIterator;->nextElement:Ljava/util/Map$Entry;

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 25
    .local p0, "this":Lorg/iq80/leveldb/util/AbstractSeekingIterator;, "Lorg/iq80/leveldb/util/AbstractSeekingIterator<TK;TV;>;"
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/AbstractSeekingIterator;->next()Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public final next()Ljava/util/Map$Entry;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 56
    .local p0, "this":Lorg/iq80/leveldb/util/AbstractSeekingIterator;, "Lorg/iq80/leveldb/util/AbstractSeekingIterator<TK;TV;>;"
    iget-object v1, p0, Lorg/iq80/leveldb/util/AbstractSeekingIterator;->nextElement:Ljava/util/Map$Entry;

    if-nez v1, :cond_0

    .line 57
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/AbstractSeekingIterator;->getNextElement()Ljava/util/Map$Entry;

    move-result-object v1

    iput-object v1, p0, Lorg/iq80/leveldb/util/AbstractSeekingIterator;->nextElement:Ljava/util/Map$Entry;

    .line 58
    iget-object v1, p0, Lorg/iq80/leveldb/util/AbstractSeekingIterator;->nextElement:Ljava/util/Map$Entry;

    if-nez v1, :cond_0

    .line 59
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1

    .line 63
    :cond_0
    iget-object v0, p0, Lorg/iq80/leveldb/util/AbstractSeekingIterator;->nextElement:Ljava/util/Map$Entry;

    .line 64
    .local v0, "result":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/iq80/leveldb/util/AbstractSeekingIterator;->nextElement:Ljava/util/Map$Entry;

    .line 65
    return-object v0
.end method

.method public bridge synthetic peek()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 25
    .local p0, "this":Lorg/iq80/leveldb/util/AbstractSeekingIterator;, "Lorg/iq80/leveldb/util/AbstractSeekingIterator<TK;TV;>;"
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/AbstractSeekingIterator;->peek()Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public final peek()Ljava/util/Map$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 71
    .local p0, "this":Lorg/iq80/leveldb/util/AbstractSeekingIterator;, "Lorg/iq80/leveldb/util/AbstractSeekingIterator<TK;TV;>;"
    iget-object v0, p0, Lorg/iq80/leveldb/util/AbstractSeekingIterator;->nextElement:Ljava/util/Map$Entry;

    if-nez v0, :cond_0

    .line 72
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/AbstractSeekingIterator;->getNextElement()Ljava/util/Map$Entry;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/util/AbstractSeekingIterator;->nextElement:Ljava/util/Map$Entry;

    .line 73
    iget-object v0, p0, Lorg/iq80/leveldb/util/AbstractSeekingIterator;->nextElement:Ljava/util/Map$Entry;

    if-nez v0, :cond_0

    .line 74
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 78
    :cond_0
    iget-object v0, p0, Lorg/iq80/leveldb/util/AbstractSeekingIterator;->nextElement:Ljava/util/Map$Entry;

    return-object v0
.end method

.method public final remove()V
    .locals 1

    .prologue
    .line 84
    .local p0, "this":Lorg/iq80/leveldb/util/AbstractSeekingIterator;, "Lorg/iq80/leveldb/util/AbstractSeekingIterator<TK;TV;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public final seek(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "this":Lorg/iq80/leveldb/util/AbstractSeekingIterator;, "Lorg/iq80/leveldb/util/AbstractSeekingIterator<TK;TV;>;"
    .local p1, "targetKey":Ljava/lang/Object;, "TK;"
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/iq80/leveldb/util/AbstractSeekingIterator;->nextElement:Ljava/util/Map$Entry;

    .line 41
    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/util/AbstractSeekingIterator;->seekInternal(Ljava/lang/Object;)V

    .line 42
    return-void
.end method

.method protected abstract seekInternal(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation
.end method

.method public final seekToFirst()V
    .locals 1

    .prologue
    .line 33
    .local p0, "this":Lorg/iq80/leveldb/util/AbstractSeekingIterator;, "Lorg/iq80/leveldb/util/AbstractSeekingIterator<TK;TV;>;"
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/iq80/leveldb/util/AbstractSeekingIterator;->nextElement:Ljava/util/Map$Entry;

    .line 34
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/AbstractSeekingIterator;->seekToFirstInternal()V

    .line 35
    return-void
.end method

.method protected abstract seekToFirstInternal()V
.end method
