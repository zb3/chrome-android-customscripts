.class public Lorg/iq80/leveldb/util/InternalTableIterator;
.super Lorg/iq80/leveldb/util/AbstractSeekingIterator;
.source "InternalTableIterator.java"

# interfaces
.implements Lorg/iq80/leveldb/util/InternalIterator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/iq80/leveldb/util/AbstractSeekingIterator",
        "<",
        "Lorg/iq80/leveldb/impl/InternalKey;",
        "Lorg/iq80/leveldb/util/Slice;",
        ">;",
        "Lorg/iq80/leveldb/util/InternalIterator;"
    }
.end annotation


# instance fields
.field private final tableIterator:Lorg/iq80/leveldb/util/TableIterator;


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/util/TableIterator;)V
    .locals 0
    .param p1, "tableIterator"    # Lorg/iq80/leveldb/util/TableIterator;

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/iq80/leveldb/util/AbstractSeekingIterator;-><init>()V

    .line 33
    iput-object p1, p0, Lorg/iq80/leveldb/util/InternalTableIterator;->tableIterator:Lorg/iq80/leveldb/util/TableIterator;

    .line 34
    return-void
.end method


# virtual methods
.method protected getNextElement()Ljava/util/Map$Entry;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            "Lorg/iq80/leveldb/util/Slice;",
            ">;"
        }
    .end annotation

    .prologue
    .line 51
    iget-object v1, p0, Lorg/iq80/leveldb/util/InternalTableIterator;->tableIterator:Lorg/iq80/leveldb/util/TableIterator;

    invoke-virtual {v1}, Lorg/iq80/leveldb/util/TableIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 52
    iget-object v1, p0, Lorg/iq80/leveldb/util/InternalTableIterator;->tableIterator:Lorg/iq80/leveldb/util/TableIterator;

    invoke-virtual {v1}, Lorg/iq80/leveldb/util/TableIterator;->next()Ljava/util/Map$Entry;

    move-result-object v0

    .line 53
    .local v0, "next":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;>;"
    new-instance v2, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/util/Slice;

    invoke-direct {v2, v1}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;)V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/google/common/collect/Maps;->immutableEntry(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v1

    .line 55
    .end local v0    # "next":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;>;"
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public bridge synthetic seekInternal(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 25
    check-cast p1, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/util/InternalTableIterator;->seekInternal(Lorg/iq80/leveldb/impl/InternalKey;)V

    return-void
.end method

.method public seekInternal(Lorg/iq80/leveldb/impl/InternalKey;)V
    .locals 2
    .param p1, "targetKey"    # Lorg/iq80/leveldb/impl/InternalKey;

    .prologue
    .line 45
    iget-object v0, p0, Lorg/iq80/leveldb/util/InternalTableIterator;->tableIterator:Lorg/iq80/leveldb/util/TableIterator;

    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/InternalKey;->encode()Lorg/iq80/leveldb/util/Slice;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/iq80/leveldb/util/TableIterator;->seek(Ljava/lang/Object;)V

    .line 46
    return-void
.end method

.method protected seekToFirstInternal()V
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lorg/iq80/leveldb/util/InternalTableIterator;->tableIterator:Lorg/iq80/leveldb/util/TableIterator;

    invoke-virtual {v0}, Lorg/iq80/leveldb/util/TableIterator;->seekToFirst()V

    .line 40
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "InternalTableIterator"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    const-string v1, "{fromIterator="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/util/InternalTableIterator;->tableIterator:Lorg/iq80/leveldb/util/TableIterator;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 64
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 65
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
