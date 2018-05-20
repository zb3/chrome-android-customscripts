.class Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;
.super Ljava/lang/Object;
.source "DbIterator.java"

# interfaces
.implements Ljava/util/Iterator;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/util/DbIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ComparableIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Ljava/util/Map$Entry",
        "<",
        "Lorg/iq80/leveldb/impl/InternalKey;",
        "Lorg/iq80/leveldb/util/Slice;",
        ">;>;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;",
        ">;"
    }
.end annotation


# instance fields
.field private final comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            ">;"
        }
    .end annotation
.end field

.field private final iterator:Lorg/iq80/leveldb/impl/SeekingIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/iq80/leveldb/impl/SeekingIterator",
            "<",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            "Lorg/iq80/leveldb/util/Slice;",
            ">;"
        }
    .end annotation
.end field

.field private nextElement:Ljava/util/Map$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map$Entry",
            "<",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            "Lorg/iq80/leveldb/util/Slice;",
            ">;"
        }
    .end annotation
.end field

.field private final ordinal:I


# direct methods
.method private constructor <init>(Lorg/iq80/leveldb/impl/SeekingIterator;Ljava/util/Comparator;ILjava/util/Map$Entry;)V
    .locals 0
    .param p3, "ordinal"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/iq80/leveldb/impl/SeekingIterator",
            "<",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            "Lorg/iq80/leveldb/util/Slice;",
            ">;",
            "Ljava/util/Comparator",
            "<",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            ">;I",
            "Ljava/util/Map$Entry",
            "<",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            "Lorg/iq80/leveldb/util/Slice;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 232
    .local p1, "iterator":Lorg/iq80/leveldb/impl/SeekingIterator;, "Lorg/iq80/leveldb/impl/SeekingIterator<Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/util/Slice;>;"
    .local p2, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lorg/iq80/leveldb/impl/InternalKey;>;"
    .local p4, "nextElement":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/util/Slice;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 233
    iput-object p1, p0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->iterator:Lorg/iq80/leveldb/impl/SeekingIterator;

    .line 234
    iput-object p2, p0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->comparator:Ljava/util/Comparator;

    .line 235
    iput p3, p0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->ordinal:I

    .line 236
    iput-object p4, p0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->nextElement:Ljava/util/Map$Entry;

    .line 237
    return-void
.end method

.method synthetic constructor <init>(Lorg/iq80/leveldb/impl/SeekingIterator;Ljava/util/Comparator;ILjava/util/Map$Entry;Lorg/iq80/leveldb/util/DbIterator$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/iq80/leveldb/impl/SeekingIterator;
    .param p2, "x1"    # Ljava/util/Comparator;
    .param p3, "x2"    # I
    .param p4, "x3"    # Ljava/util/Map$Entry;
    .param p5, "x4"    # Lorg/iq80/leveldb/util/DbIterator$1;

    .prologue
    .line 223
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;-><init>(Lorg/iq80/leveldb/impl/SeekingIterator;Ljava/util/Comparator;ILjava/util/Map$Entry;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 223
    check-cast p1, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->compareTo(Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;)I
    .locals 4
    .param p1, "that"    # Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    .prologue
    .line 301
    iget-object v1, p0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->comparator:Ljava/util/Comparator;

    iget-object v2, p0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->nextElement:Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    iget-object v3, p1, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->nextElement:Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    .line 302
    .local v0, "result":I
    if-nez v0, :cond_0

    .line 303
    iget v1, p0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->ordinal:I

    iget v2, p1, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->ordinal:I

    invoke-static {v1, v2}, Lcom/google/common/primitives/Ints;->compare(II)I

    move-result v0

    .line 305
    :cond_0
    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 271
    if-ne p0, p1, :cond_1

    .line 287
    :cond_0
    :goto_0
    return v1

    .line 274
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 275
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 278
    check-cast v0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;

    .line 280
    .local v0, "comparableIterator":Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;
    iget v3, p0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->ordinal:I

    iget v4, v0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->ordinal:I

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 281
    goto :goto_0

    .line 283
    :cond_4
    iget-object v3, p0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->nextElement:Ljava/util/Map$Entry;

    if-eqz v3, :cond_5

    iget-object v3, p0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->nextElement:Ljava/util/Map$Entry;

    iget-object v4, v0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->nextElement:Ljava/util/Map$Entry;

    invoke-interface {v3, v4}, Ljava/util/Map$Entry;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 284
    goto :goto_0

    .line 283
    :cond_5
    iget-object v3, v0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->nextElement:Ljava/util/Map$Entry;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public hasNext()Z
    .locals 1

    .prologue
    .line 242
    iget-object v0, p0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->nextElement:Ljava/util/Map$Entry;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 293
    iget v0, p0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->ordinal:I

    .line 294
    .local v0, "result":I
    mul-int/lit8 v2, v0, 0x1f

    iget-object v1, p0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->nextElement:Ljava/util/Map$Entry;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->nextElement:Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->hashCode()I

    move-result v1

    :goto_0
    add-int v0, v2, v1

    .line 295
    return v0

    .line 294
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 223
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->next()Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/util/Map$Entry;
    .locals 2
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
    .line 248
    iget-object v1, p0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->nextElement:Ljava/util/Map$Entry;

    if-nez v1, :cond_0

    .line 249
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1

    .line 252
    :cond_0
    iget-object v0, p0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->nextElement:Ljava/util/Map$Entry;

    .line 253
    .local v0, "result":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/util/Slice;>;"
    iget-object v1, p0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->iterator:Lorg/iq80/leveldb/impl/SeekingIterator;

    invoke-interface {v1}, Lorg/iq80/leveldb/impl/SeekingIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 254
    iget-object v1, p0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->iterator:Lorg/iq80/leveldb/impl/SeekingIterator;

    invoke-interface {v1}, Lorg/iq80/leveldb/impl/SeekingIterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    iput-object v1, p0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->nextElement:Ljava/util/Map$Entry;

    .line 259
    :goto_0
    return-object v0

    .line 257
    :cond_1
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/iq80/leveldb/util/DbIterator$ComparableIterator;->nextElement:Ljava/util/Map$Entry;

    goto :goto_0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 265
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
