.class public Lorg/iq80/leveldb/impl/InternalKeyComparator;
.super Ljava/lang/Object;
.source "InternalKeyComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/iq80/leveldb/impl/InternalKey;",
        ">;"
    }
.end annotation


# instance fields
.field private final userComparator:Lorg/iq80/leveldb/table/UserComparator;


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/table/UserComparator;)V
    .locals 0
    .param p1, "userComparator"    # Lorg/iq80/leveldb/table/UserComparator;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lorg/iq80/leveldb/impl/InternalKeyComparator;->userComparator:Lorg/iq80/leveldb/table/UserComparator;

    .line 35
    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 27
    check-cast p1, Lorg/iq80/leveldb/impl/InternalKey;

    check-cast p2, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-virtual {p0, p1, p2}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->compare(Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)I
    .locals 6
    .param p1, "left"    # Lorg/iq80/leveldb/impl/InternalKey;
    .param p2, "right"    # Lorg/iq80/leveldb/impl/InternalKey;

    .prologue
    .line 50
    iget-object v1, p0, Lorg/iq80/leveldb/impl/InternalKeyComparator;->userComparator:Lorg/iq80/leveldb/table/UserComparator;

    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    invoke-virtual {p2}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/iq80/leveldb/table/UserComparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    .line 51
    .local v0, "result":I
    if-eqz v0, :cond_0

    .line 55
    .end local v0    # "result":I
    :goto_0
    return v0

    .restart local v0    # "result":I
    :cond_0
    invoke-virtual {p2}, Lorg/iq80/leveldb/impl/InternalKey;->getSequenceNumber()J

    move-result-wide v2

    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/InternalKey;->getSequenceNumber()J

    move-result-wide v4

    invoke-static {v2, v3, v4, v5}, Lcom/google/common/primitives/Longs;->compare(JJ)I

    move-result v0

    goto :goto_0
.end method

.method public getUserComparator()Lorg/iq80/leveldb/table/UserComparator;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lorg/iq80/leveldb/impl/InternalKeyComparator;->userComparator:Lorg/iq80/leveldb/table/UserComparator;

    return-object v0
.end method

.method public isOrdered(Ljava/lang/Iterable;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p1, "keys":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lorg/iq80/leveldb/impl/InternalKey;>;"
    const/4 v3, 0x1

    .line 77
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 78
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/iq80/leveldb/impl/InternalKey;>;"
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 90
    :cond_0
    :goto_0
    return v3

    .line 82
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/iq80/leveldb/impl/InternalKey;

    .line 83
    .local v2, "previous":Lorg/iq80/leveldb/impl/InternalKey;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 84
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/impl/InternalKey;

    .line 85
    .local v1, "next":Lorg/iq80/leveldb/impl/InternalKey;
    invoke-virtual {p0, v2, v1}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->compare(Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)I

    move-result v4

    if-lez v4, :cond_2

    .line 86
    const/4 v3, 0x0

    goto :goto_0

    .line 88
    :cond_2
    move-object v2, v1

    .line 89
    goto :goto_1
.end method

.method public varargs isOrdered([Lorg/iq80/leveldb/impl/InternalKey;)Z
    .locals 1
    .param p1, "keys"    # [Lorg/iq80/leveldb/impl/InternalKey;

    .prologue
    .line 66
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->isOrdered(Ljava/lang/Iterable;)Z

    move-result v0

    return v0
.end method

.method public name()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lorg/iq80/leveldb/impl/InternalKeyComparator;->userComparator:Lorg/iq80/leveldb/table/UserComparator;

    invoke-interface {v0}, Lorg/iq80/leveldb/table/UserComparator;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
