.class public Lorg/iq80/leveldb/impl/InternalUserComparator;
.super Ljava/lang/Object;
.source "InternalUserComparator.java"

# interfaces
.implements Lorg/iq80/leveldb/table/UserComparator;


# instance fields
.field private final internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/impl/InternalKeyComparator;)V
    .locals 0
    .param p1, "internalKeyComparator"    # Lorg/iq80/leveldb/impl/InternalKeyComparator;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lorg/iq80/leveldb/impl/InternalUserComparator;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    .line 34
    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 26
    check-cast p1, Lorg/iq80/leveldb/util/Slice;

    check-cast p2, Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {p0, p1, p2}, Lorg/iq80/leveldb/impl/InternalUserComparator;->compare(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)I
    .locals 3
    .param p1, "left"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "right"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 39
    iget-object v0, p0, Lorg/iq80/leveldb/impl/InternalUserComparator;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    new-instance v1, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-direct {v1, p1}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;)V

    new-instance v2, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-direct {v2, p2}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;)V

    invoke-virtual {v0, v1, v2}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->compare(Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)I

    move-result v0

    return v0
.end method

.method public findShortSuccessor(Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/util/Slice;
    .locals 6
    .param p1, "key"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 75
    new-instance v3, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-direct {v3, p1}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;)V

    invoke-virtual {v3}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    .line 76
    .local v2, "userKey":Lorg/iq80/leveldb/util/Slice;
    iget-object v3, p0, Lorg/iq80/leveldb/impl/InternalUserComparator;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-virtual {v3}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->getUserComparator()Lorg/iq80/leveldb/table/UserComparator;

    move-result-object v3

    invoke-interface {v3, v2}, Lorg/iq80/leveldb/table/UserComparator;->findShortSuccessor(Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v1

    .line 78
    .local v1, "shortSuccessor":Lorg/iq80/leveldb/util/Slice;
    iget-object v3, p0, Lorg/iq80/leveldb/impl/InternalUserComparator;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-virtual {v3}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->getUserComparator()Lorg/iq80/leveldb/table/UserComparator;

    move-result-object v3

    invoke-interface {v3, v2, v1}, Lorg/iq80/leveldb/table/UserComparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v3

    if-gez v3, :cond_0

    .line 81
    new-instance v0, Lorg/iq80/leveldb/impl/InternalKey;

    const-wide v4, 0xffffffffffffffL

    sget-object v3, Lorg/iq80/leveldb/impl/ValueType;->VALUE:Lorg/iq80/leveldb/impl/ValueType;

    invoke-direct {v0, v1, v4, v5, v3}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;JLorg/iq80/leveldb/impl/ValueType;)V

    .line 82
    .local v0, "newInternalKey":Lorg/iq80/leveldb/impl/InternalKey;
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/InternalKey;->encode()Lorg/iq80/leveldb/util/Slice;

    move-result-object v3

    invoke-virtual {p0, p1, v3}, Lorg/iq80/leveldb/impl/InternalUserComparator;->compare(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)I

    move-result v3

    if-gez v3, :cond_1

    const/4 v3, 0x1

    :goto_0
    invoke-static {v3}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 84
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/InternalKey;->encode()Lorg/iq80/leveldb/util/Slice;

    move-result-object p1

    .line 87
    .end local v0    # "newInternalKey":Lorg/iq80/leveldb/impl/InternalKey;
    .end local p1    # "key":Lorg/iq80/leveldb/util/Slice;
    :cond_0
    return-object p1

    .line 82
    .restart local v0    # "newInternalKey":Lorg/iq80/leveldb/impl/InternalKey;
    .restart local p1    # "key":Lorg/iq80/leveldb/util/Slice;
    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public findShortestSeparator(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/util/Slice;
    .locals 10
    .param p1, "start"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "limit"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 54
    new-instance v4, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-direct {v4, p1}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;)V

    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v3

    .line 55
    .local v3, "startUserKey":Lorg/iq80/leveldb/util/Slice;
    new-instance v4, Lorg/iq80/leveldb/impl/InternalKey;

    invoke-direct {v4, p2}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;)V

    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    .line 57
    .local v0, "limitUserKey":Lorg/iq80/leveldb/util/Slice;
    iget-object v4, p0, Lorg/iq80/leveldb/impl/InternalUserComparator;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->getUserComparator()Lorg/iq80/leveldb/table/UserComparator;

    move-result-object v4

    invoke-interface {v4, v3, v0}, Lorg/iq80/leveldb/table/UserComparator;->findShortestSeparator(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    .line 59
    .local v2, "shortestSeparator":Lorg/iq80/leveldb/util/Slice;
    iget-object v4, p0, Lorg/iq80/leveldb/impl/InternalUserComparator;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->getUserComparator()Lorg/iq80/leveldb/table/UserComparator;

    move-result-object v4

    invoke-interface {v4, v3, v2}, Lorg/iq80/leveldb/table/UserComparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v4

    if-gez v4, :cond_0

    .line 62
    new-instance v1, Lorg/iq80/leveldb/impl/InternalKey;

    const-wide v8, 0xffffffffffffffL

    sget-object v4, Lorg/iq80/leveldb/impl/ValueType;->VALUE:Lorg/iq80/leveldb/impl/ValueType;

    invoke-direct {v1, v2, v8, v9, v4}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;JLorg/iq80/leveldb/impl/ValueType;)V

    .line 63
    .local v1, "newInternalKey":Lorg/iq80/leveldb/impl/InternalKey;
    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/InternalKey;->encode()Lorg/iq80/leveldb/util/Slice;

    move-result-object v4

    invoke-virtual {p0, p1, v4}, Lorg/iq80/leveldb/impl/InternalUserComparator;->compare(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)I

    move-result v4

    if-gez v4, :cond_1

    move v4, v5

    :goto_0
    invoke-static {v4}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 64
    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/InternalKey;->encode()Lorg/iq80/leveldb/util/Slice;

    move-result-object v4

    invoke-virtual {p0, v4, p2}, Lorg/iq80/leveldb/impl/InternalUserComparator;->compare(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)I

    move-result v4

    if-gez v4, :cond_2

    :goto_1
    invoke-static {v5}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 66
    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/InternalKey;->encode()Lorg/iq80/leveldb/util/Slice;

    move-result-object p1

    .line 69
    .end local v1    # "newInternalKey":Lorg/iq80/leveldb/impl/InternalKey;
    .end local p1    # "start":Lorg/iq80/leveldb/util/Slice;
    :cond_0
    return-object p1

    .restart local v1    # "newInternalKey":Lorg/iq80/leveldb/impl/InternalKey;
    .restart local p1    # "start":Lorg/iq80/leveldb/util/Slice;
    :cond_1
    move v4, v6

    .line 63
    goto :goto_0

    :cond_2
    move v5, v6

    .line 64
    goto :goto_1
.end method

.method public name()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lorg/iq80/leveldb/impl/InternalUserComparator;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
