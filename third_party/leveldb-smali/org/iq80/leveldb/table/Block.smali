.class public Lorg/iq80/leveldb/table/Block;
.super Ljava/lang/Object;
.source "Block.java"

# interfaces
.implements Lorg/iq80/leveldb/impl/SeekingIterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/iq80/leveldb/impl/SeekingIterable",
        "<",
        "Lorg/iq80/leveldb/util/Slice;",
        "Lorg/iq80/leveldb/util/Slice;",
        ">;"
    }
.end annotation


# instance fields
.field private final block:Lorg/iq80/leveldb/util/Slice;

.field private final comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/iq80/leveldb/util/Slice;",
            ">;"
        }
    .end annotation
.end field

.field private final data:Lorg/iq80/leveldb/util/Slice;

.field private final restartPositions:Lorg/iq80/leveldb/util/Slice;


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/util/Slice;Ljava/util/Comparator;)V
    .locals 8
    .param p1, "block"    # Lorg/iq80/leveldb/util/Slice;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/iq80/leveldb/util/Slice;",
            "Ljava/util/Comparator",
            "<",
            "Lorg/iq80/leveldb/util/Slice;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lorg/iq80/leveldb/util/Slice;>;"
    const/4 v7, 0x4

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    const-string v2, "block is null"

    invoke-static {p1, v2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v2

    if-lt v2, v7, :cond_0

    move v2, v3

    :goto_0
    const-string v5, "Block is corrupt: size must be at least %s block"

    new-array v6, v3, [Ljava/lang/Object;

    invoke-static {v7}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v7

    aput-object v7, v6, v4

    invoke-static {v2, v5, v6}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 76
    const-string v2, "comparator is null"

    invoke-static {p2, v2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->slice()Lorg/iq80/leveldb/util/Slice;

    move-result-object p1

    .line 79
    iput-object p1, p0, Lorg/iq80/leveldb/table/Block;->block:Lorg/iq80/leveldb/util/Slice;

    .line 80
    iput-object p2, p0, Lorg/iq80/leveldb/table/Block;->comparator:Ljava/util/Comparator;

    .line 87
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x4

    invoke-virtual {p1, v2}, Lorg/iq80/leveldb/util/Slice;->getInt(I)I

    move-result v0

    .line 89
    .local v0, "restartCount":I
    if-lez v0, :cond_2

    .line 91
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v2

    add-int/lit8 v5, v0, 0x1

    mul-int/lit8 v5, v5, 0x4

    sub-int v1, v2, v5

    .line 92
    .local v1, "restartOffset":I
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x4

    if-ge v1, v2, :cond_1

    :goto_1
    const-string v2, "Block is corrupt: restart offset count is greater than block size"

    invoke-static {v3, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 93
    mul-int/lit8 v2, v0, 0x4

    invoke-virtual {p1, v1, v2}, Lorg/iq80/leveldb/util/Slice;->slice(II)Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    iput-object v2, p0, Lorg/iq80/leveldb/table/Block;->restartPositions:Lorg/iq80/leveldb/util/Slice;

    .line 96
    invoke-virtual {p1, v4, v1}, Lorg/iq80/leveldb/util/Slice;->slice(II)Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    iput-object v2, p0, Lorg/iq80/leveldb/table/Block;->data:Lorg/iq80/leveldb/util/Slice;

    .line 102
    .end local v1    # "restartOffset":I
    :goto_2
    return-void

    .end local v0    # "restartCount":I
    :cond_0
    move v2, v4

    .line 75
    goto :goto_0

    .restart local v0    # "restartCount":I
    .restart local v1    # "restartOffset":I
    :cond_1
    move v3, v4

    .line 92
    goto :goto_1

    .line 99
    .end local v1    # "restartOffset":I
    :cond_2
    sget-object v2, Lorg/iq80/leveldb/util/Slices;->EMPTY_SLICE:Lorg/iq80/leveldb/util/Slice;

    iput-object v2, p0, Lorg/iq80/leveldb/table/Block;->data:Lorg/iq80/leveldb/util/Slice;

    .line 100
    sget-object v2, Lorg/iq80/leveldb/util/Slices;->EMPTY_SLICE:Lorg/iq80/leveldb/util/Slice;

    iput-object v2, p0, Lorg/iq80/leveldb/table/Block;->restartPositions:Lorg/iq80/leveldb/util/Slice;

    goto :goto_2
.end method


# virtual methods
.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 63
    invoke-virtual {p0}, Lorg/iq80/leveldb/table/Block;->iterator()Lorg/iq80/leveldb/table/BlockIterator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic iterator()Lorg/iq80/leveldb/impl/SeekingIterator;
    .locals 1

    .prologue
    .line 63
    invoke-virtual {p0}, Lorg/iq80/leveldb/table/Block;->iterator()Lorg/iq80/leveldb/table/BlockIterator;

    move-result-object v0

    return-object v0
.end method

.method public iterator()Lorg/iq80/leveldb/table/BlockIterator;
    .locals 4

    .prologue
    .line 112
    new-instance v0, Lorg/iq80/leveldb/table/BlockIterator;

    iget-object v1, p0, Lorg/iq80/leveldb/table/Block;->data:Lorg/iq80/leveldb/util/Slice;

    iget-object v2, p0, Lorg/iq80/leveldb/table/Block;->restartPositions:Lorg/iq80/leveldb/util/Slice;

    iget-object v3, p0, Lorg/iq80/leveldb/table/Block;->comparator:Ljava/util/Comparator;

    invoke-direct {v0, v1, v2, v3}, Lorg/iq80/leveldb/table/BlockIterator;-><init>(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;Ljava/util/Comparator;)V

    return-object v0
.end method

.method public size()J
    .locals 2

    .prologue
    .line 106
    iget-object v0, p0, Lorg/iq80/leveldb/table/Block;->block:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method
