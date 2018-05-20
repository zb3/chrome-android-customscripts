.class public Lorg/iq80/leveldb/impl/WriteBatchImpl;
.super Ljava/lang/Object;
.source "WriteBatchImpl.java"

# interfaces
.implements Lorg/iq80/leveldb/WriteBatch;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/iq80/leveldb/impl/WriteBatchImpl$Handler;
    }
.end annotation


# instance fields
.field private approximateSize:I

.field private final batch:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Lorg/iq80/leveldb/util/Slice;",
            "Lorg/iq80/leveldb/util/Slice;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/WriteBatchImpl;->batch:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    .prologue
    .line 86
    return-void
.end method

.method public bridge synthetic delete([B)Lorg/iq80/leveldb/WriteBatch;
    .locals 1

    .prologue
    .line 31
    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/impl/WriteBatchImpl;->delete([B)Lorg/iq80/leveldb/impl/WriteBatchImpl;

    move-result-object v0

    return-object v0
.end method

.method public delete(Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/impl/WriteBatchImpl;
    .locals 2
    .param p1, "key"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 77
    const-string v0, "key is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    iget-object v1, p0, Lorg/iq80/leveldb/impl/WriteBatchImpl;->batch:Ljava/util/List;

    const/4 v0, 0x0

    check-cast v0, Lorg/iq80/leveldb/util/Slice;

    invoke-static {p1, v0}, Lcom/google/common/collect/Maps;->immutableEntry(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    iget v0, p0, Lorg/iq80/leveldb/impl/WriteBatchImpl;->approximateSize:I

    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x6

    add-int/2addr v0, v1

    iput v0, p0, Lorg/iq80/leveldb/impl/WriteBatchImpl;->approximateSize:I

    .line 80
    return-object p0
.end method

.method public delete([B)Lorg/iq80/leveldb/impl/WriteBatchImpl;
    .locals 3
    .param p1, "key"    # [B

    .prologue
    .line 69
    const-string v0, "key is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    iget-object v1, p0, Lorg/iq80/leveldb/impl/WriteBatchImpl;->batch:Ljava/util/List;

    invoke-static {p1}, Lorg/iq80/leveldb/util/Slices;->wrappedBuffer([B)Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    const/4 v0, 0x0

    check-cast v0, Lorg/iq80/leveldb/util/Slice;

    invoke-static {v2, v0}, Lcom/google/common/collect/Maps;->immutableEntry(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    iget v0, p0, Lorg/iq80/leveldb/impl/WriteBatchImpl;->approximateSize:I

    array-length v1, p1

    add-int/lit8 v1, v1, 0x6

    add-int/2addr v0, v1

    iput v0, p0, Lorg/iq80/leveldb/impl/WriteBatchImpl;->approximateSize:I

    .line 72
    return-object p0
.end method

.method public forEach(Lorg/iq80/leveldb/impl/WriteBatchImpl$Handler;)V
    .locals 5
    .param p1, "handler"    # Lorg/iq80/leveldb/impl/WriteBatchImpl$Handler;

    .prologue
    .line 90
    iget-object v3, p0, Lorg/iq80/leveldb/impl/WriteBatchImpl;->batch:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 91
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/util/Slice;

    .line 92
    .local v1, "key":Lorg/iq80/leveldb/util/Slice;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/iq80/leveldb/util/Slice;

    .line 93
    .local v2, "value":Lorg/iq80/leveldb/util/Slice;
    if-eqz v2, :cond_0

    .line 94
    invoke-interface {p1, v1, v2}, Lorg/iq80/leveldb/impl/WriteBatchImpl$Handler;->put(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)V

    goto :goto_0

    .line 97
    :cond_0
    invoke-interface {p1, v1}, Lorg/iq80/leveldb/impl/WriteBatchImpl$Handler;->delete(Lorg/iq80/leveldb/util/Slice;)V

    goto :goto_0

    .line 100
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;>;"
    .end local v1    # "key":Lorg/iq80/leveldb/util/Slice;
    .end local v2    # "value":Lorg/iq80/leveldb/util/Slice;
    :cond_1
    return-void
.end method

.method public getApproximateSize()I
    .locals 1

    .prologue
    .line 39
    iget v0, p0, Lorg/iq80/leveldb/impl/WriteBatchImpl;->approximateSize:I

    return v0
.end method

.method public bridge synthetic put([B[B)Lorg/iq80/leveldb/WriteBatch;
    .locals 1

    .prologue
    .line 31
    invoke-virtual {p0, p1, p2}, Lorg/iq80/leveldb/impl/WriteBatchImpl;->put([B[B)Lorg/iq80/leveldb/impl/WriteBatchImpl;

    move-result-object v0

    return-object v0
.end method

.method public put(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/impl/WriteBatchImpl;
    .locals 3
    .param p1, "key"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "value"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 59
    const-string v0, "key is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    const-string v0, "value is null"

    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    iget-object v0, p0, Lorg/iq80/leveldb/impl/WriteBatchImpl;->batch:Ljava/util/List;

    invoke-static {p1, p2}, Lcom/google/common/collect/Maps;->immutableEntry(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    iget v0, p0, Lorg/iq80/leveldb/impl/WriteBatchImpl;->approximateSize:I

    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0xc

    invoke-virtual {p2}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v2

    add-int/2addr v1, v2

    add-int/2addr v0, v1

    iput v0, p0, Lorg/iq80/leveldb/impl/WriteBatchImpl;->approximateSize:I

    .line 63
    return-object p0
.end method

.method public put([B[B)Lorg/iq80/leveldb/impl/WriteBatchImpl;
    .locals 3
    .param p1, "key"    # [B
    .param p2, "value"    # [B

    .prologue
    .line 50
    const-string v0, "key is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    const-string v0, "value is null"

    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    iget-object v0, p0, Lorg/iq80/leveldb/impl/WriteBatchImpl;->batch:Ljava/util/List;

    invoke-static {p1}, Lorg/iq80/leveldb/util/Slices;->wrappedBuffer([B)Lorg/iq80/leveldb/util/Slice;

    move-result-object v1

    invoke-static {p2}, Lorg/iq80/leveldb/util/Slices;->wrappedBuffer([B)Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/common/collect/Maps;->immutableEntry(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    iget v0, p0, Lorg/iq80/leveldb/impl/WriteBatchImpl;->approximateSize:I

    array-length v1, p1

    add-int/lit8 v1, v1, 0xc

    array-length v2, p2

    add-int/2addr v1, v2

    add-int/2addr v0, v1

    iput v0, p0, Lorg/iq80/leveldb/impl/WriteBatchImpl;->approximateSize:I

    .line 54
    return-object p0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lorg/iq80/leveldb/impl/WriteBatchImpl;->batch:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method
