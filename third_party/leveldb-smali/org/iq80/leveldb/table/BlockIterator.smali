.class public Lorg/iq80/leveldb/table/BlockIterator;
.super Ljava/lang/Object;
.source "BlockIterator.java"

# interfaces
.implements Lorg/iq80/leveldb/impl/SeekingIterator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/iq80/leveldb/impl/SeekingIterator",
        "<",
        "Lorg/iq80/leveldb/util/Slice;",
        "Lorg/iq80/leveldb/util/Slice;",
        ">;"
    }
.end annotation


# instance fields
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

.field private final data:Lorg/iq80/leveldb/util/SliceInput;

.field private nextEntry:Lorg/iq80/leveldb/table/BlockEntry;

.field private final restartCount:I

.field private final restartPositions:Lorg/iq80/leveldb/util/Slice;


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;Ljava/util/Comparator;)V
    .locals 5
    .param p1, "data"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "restartPositions"    # Lorg/iq80/leveldb/util/Slice;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/iq80/leveldb/util/Slice;",
            "Lorg/iq80/leveldb/util/Slice;",
            "Ljava/util/Comparator",
            "<",
            "Lorg/iq80/leveldb/util/Slice;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lorg/iq80/leveldb/util/Slice;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const-string v0, "data is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    const-string v0, "restartPositions is null"

    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    invoke-virtual {p2}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v0

    rem-int/lit8 v0, v0, 0x4

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    const-string v3, "restartPositions.readableBytes() must be a multiple of %s"

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v4, 0x4

    invoke-static {v4}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    aput-object v4, v1, v2

    invoke-static {v0, v3, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 48
    const-string v0, "comparator is null"

    invoke-static {p3, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->input()Lorg/iq80/leveldb/util/SliceInput;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/table/BlockIterator;->data:Lorg/iq80/leveldb/util/SliceInput;

    .line 52
    invoke-virtual {p2}, Lorg/iq80/leveldb/util/Slice;->slice()Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/table/BlockIterator;->restartPositions:Lorg/iq80/leveldb/util/Slice;

    .line 53
    iget-object v0, p0, Lorg/iq80/leveldb/table/BlockIterator;->restartPositions:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v0

    div-int/lit8 v0, v0, 0x4

    iput v0, p0, Lorg/iq80/leveldb/table/BlockIterator;->restartCount:I

    .line 55
    iput-object p3, p0, Lorg/iq80/leveldb/table/BlockIterator;->comparator:Ljava/util/Comparator;

    .line 57
    invoke-virtual {p0}, Lorg/iq80/leveldb/table/BlockIterator;->seekToFirst()V

    .line 58
    return-void

    :cond_0
    move v0, v2

    .line 47
    goto :goto_0
.end method

.method private static readEntry(Lorg/iq80/leveldb/util/SliceInput;Lorg/iq80/leveldb/table/BlockEntry;)Lorg/iq80/leveldb/table/BlockEntry;
    .locals 9
    .param p0, "data"    # Lorg/iq80/leveldb/util/SliceInput;
    .param p1, "previousEntry"    # Lorg/iq80/leveldb/table/BlockEntry;

    .prologue
    const/4 v7, 0x0

    .line 181
    const-string v6, "data is null"

    invoke-static {p0, v6}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    invoke-static {p0}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->readVariableLengthInt(Lorg/iq80/leveldb/util/SliceInput;)I

    move-result v2

    .line 185
    .local v2, "sharedKeyLength":I
    invoke-static {p0}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->readVariableLengthInt(Lorg/iq80/leveldb/util/SliceInput;)I

    move-result v1

    .line 186
    .local v1, "nonSharedKeyLength":I
    invoke-static {p0}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->readVariableLengthInt(Lorg/iq80/leveldb/util/SliceInput;)I

    move-result v5

    .line 189
    .local v5, "valueLength":I
    add-int v6, v2, v1

    invoke-static {v6}, Lorg/iq80/leveldb/util/Slices;->allocate(I)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    .line 190
    .local v0, "key":Lorg/iq80/leveldb/util/Slice;
    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Slice;->output()Lorg/iq80/leveldb/util/SliceOutput;

    move-result-object v3

    .line 191
    .local v3, "sliceOutput":Lorg/iq80/leveldb/util/SliceOutput;
    if-lez v2, :cond_0

    .line 192
    if-eqz p1, :cond_1

    const/4 v6, 0x1

    :goto_0
    const-string v8, "Entry has a shared key but no previous entry was provided"

    invoke-static {v6, v8}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 193
    invoke-virtual {p1}, Lorg/iq80/leveldb/table/BlockEntry;->getKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v6

    invoke-virtual {v3, v6, v7, v2}, Lorg/iq80/leveldb/util/SliceOutput;->writeBytes(Lorg/iq80/leveldb/util/Slice;II)V

    .line 195
    :cond_0
    invoke-virtual {v3, p0, v1}, Lorg/iq80/leveldb/util/SliceOutput;->writeBytes(Lorg/iq80/leveldb/util/SliceInput;I)V

    .line 198
    invoke-virtual {p0, v5}, Lorg/iq80/leveldb/util/SliceInput;->readSlice(I)Lorg/iq80/leveldb/util/Slice;

    move-result-object v4

    .line 200
    .local v4, "value":Lorg/iq80/leveldb/util/Slice;
    new-instance v6, Lorg/iq80/leveldb/table/BlockEntry;

    invoke-direct {v6, v0, v4}, Lorg/iq80/leveldb/table/BlockEntry;-><init>(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)V

    return-object v6

    .end local v4    # "value":Lorg/iq80/leveldb/util/Slice;
    :cond_1
    move v6, v7

    .line 192
    goto :goto_0
.end method

.method private seekToRestartPosition(I)V
    .locals 4
    .param p1, "restartPosition"    # I

    .prologue
    const/4 v3, 0x0

    .line 159
    iget v1, p0, Lorg/iq80/leveldb/table/BlockIterator;->restartCount:I

    const-string v2, "restartPosition"

    invoke-static {p1, v1, v2}, Lcom/google/common/base/Preconditions;->checkPositionIndex(IILjava/lang/String;)I

    .line 162
    iget-object v1, p0, Lorg/iq80/leveldb/table/BlockIterator;->restartPositions:Lorg/iq80/leveldb/util/Slice;

    mul-int/lit8 v2, p1, 0x4

    invoke-virtual {v1, v2}, Lorg/iq80/leveldb/util/Slice;->getInt(I)I

    move-result v0

    .line 163
    .local v0, "offset":I
    iget-object v1, p0, Lorg/iq80/leveldb/table/BlockIterator;->data:Lorg/iq80/leveldb/util/SliceInput;

    invoke-virtual {v1, v0}, Lorg/iq80/leveldb/util/SliceInput;->setPosition(I)V

    .line 166
    iput-object v3, p0, Lorg/iq80/leveldb/table/BlockIterator;->nextEntry:Lorg/iq80/leveldb/table/BlockEntry;

    .line 169
    iget-object v1, p0, Lorg/iq80/leveldb/table/BlockIterator;->data:Lorg/iq80/leveldb/util/SliceInput;

    invoke-static {v1, v3}, Lorg/iq80/leveldb/table/BlockIterator;->readEntry(Lorg/iq80/leveldb/util/SliceInput;Lorg/iq80/leveldb/table/BlockEntry;)Lorg/iq80/leveldb/table/BlockEntry;

    move-result-object v1

    iput-object v1, p0, Lorg/iq80/leveldb/table/BlockIterator;->nextEntry:Lorg/iq80/leveldb/table/BlockEntry;

    .line 170
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lorg/iq80/leveldb/table/BlockIterator;->nextEntry:Lorg/iq80/leveldb/table/BlockEntry;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 33
    invoke-virtual {p0}, Lorg/iq80/leveldb/table/BlockIterator;->next()Lorg/iq80/leveldb/table/BlockEntry;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/iq80/leveldb/table/BlockEntry;
    .locals 3

    .prologue
    .line 78
    invoke-virtual {p0}, Lorg/iq80/leveldb/table/BlockIterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 79
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1

    .line 82
    :cond_0
    iget-object v0, p0, Lorg/iq80/leveldb/table/BlockIterator;->nextEntry:Lorg/iq80/leveldb/table/BlockEntry;

    .line 84
    .local v0, "entry":Lorg/iq80/leveldb/table/BlockEntry;
    iget-object v1, p0, Lorg/iq80/leveldb/table/BlockIterator;->data:Lorg/iq80/leveldb/util/SliceInput;

    invoke-virtual {v1}, Lorg/iq80/leveldb/util/SliceInput;->isReadable()Z

    move-result v1

    if-nez v1, :cond_1

    .line 85
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/iq80/leveldb/table/BlockIterator;->nextEntry:Lorg/iq80/leveldb/table/BlockEntry;

    .line 92
    :goto_0
    return-object v0

    .line 89
    :cond_1
    iget-object v1, p0, Lorg/iq80/leveldb/table/BlockIterator;->data:Lorg/iq80/leveldb/util/SliceInput;

    iget-object v2, p0, Lorg/iq80/leveldb/table/BlockIterator;->nextEntry:Lorg/iq80/leveldb/table/BlockEntry;

    invoke-static {v1, v2}, Lorg/iq80/leveldb/table/BlockIterator;->readEntry(Lorg/iq80/leveldb/util/SliceInput;Lorg/iq80/leveldb/table/BlockEntry;)Lorg/iq80/leveldb/table/BlockEntry;

    move-result-object v1

    iput-object v1, p0, Lorg/iq80/leveldb/table/BlockIterator;->nextEntry:Lorg/iq80/leveldb/table/BlockEntry;

    goto :goto_0
.end method

.method public bridge synthetic peek()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 33
    invoke-virtual {p0}, Lorg/iq80/leveldb/table/BlockIterator;->peek()Lorg/iq80/leveldb/table/BlockEntry;

    move-result-object v0

    return-object v0
.end method

.method public peek()Lorg/iq80/leveldb/table/BlockEntry;
    .locals 1

    .prologue
    .line 69
    invoke-virtual {p0}, Lorg/iq80/leveldb/table/BlockIterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 70
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 72
    :cond_0
    iget-object v0, p0, Lorg/iq80/leveldb/table/BlockIterator;->nextEntry:Lorg/iq80/leveldb/table/BlockEntry;

    return-object v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 98
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public bridge synthetic seek(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 33
    check-cast p1, Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/table/BlockIterator;->seek(Lorg/iq80/leveldb/util/Slice;)V

    return-void
.end method

.method public seek(Lorg/iq80/leveldb/util/Slice;)V
    .locals 5
    .param p1, "targetKey"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 118
    iget v3, p0, Lorg/iq80/leveldb/table/BlockIterator;->restartCount:I

    if-nez v3, :cond_1

    .line 150
    :cond_0
    return-void

    .line 122
    :cond_1
    const/4 v0, 0x0

    .line 123
    .local v0, "left":I
    iget v3, p0, Lorg/iq80/leveldb/table/BlockIterator;->restartCount:I

    add-int/lit8 v2, v3, -0x1

    .line 126
    .local v2, "right":I
    :goto_0
    if-ge v0, v2, :cond_3

    .line 127
    add-int v3, v0, v2

    add-int/lit8 v3, v3, 0x1

    div-int/lit8 v1, v3, 0x2

    .line 129
    .local v1, "mid":I
    invoke-direct {p0, v1}, Lorg/iq80/leveldb/table/BlockIterator;->seekToRestartPosition(I)V

    .line 131
    iget-object v3, p0, Lorg/iq80/leveldb/table/BlockIterator;->comparator:Ljava/util/Comparator;

    iget-object v4, p0, Lorg/iq80/leveldb/table/BlockIterator;->nextEntry:Lorg/iq80/leveldb/table/BlockEntry;

    invoke-virtual {v4}, Lorg/iq80/leveldb/table/BlockEntry;->getKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v4

    invoke-interface {v3, v4, p1}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v3

    if-gez v3, :cond_2

    .line 134
    move v0, v1

    goto :goto_0

    .line 139
    :cond_2
    add-int/lit8 v2, v1, -0x1

    goto :goto_0

    .line 144
    .end local v1    # "mid":I
    :cond_3
    invoke-direct {p0, v0}, Lorg/iq80/leveldb/table/BlockIterator;->seekToRestartPosition(I)V

    :goto_1
    iget-object v3, p0, Lorg/iq80/leveldb/table/BlockIterator;->nextEntry:Lorg/iq80/leveldb/table/BlockEntry;

    if-eqz v3, :cond_0

    .line 145
    iget-object v3, p0, Lorg/iq80/leveldb/table/BlockIterator;->comparator:Ljava/util/Comparator;

    invoke-virtual {p0}, Lorg/iq80/leveldb/table/BlockIterator;->peek()Lorg/iq80/leveldb/table/BlockEntry;

    move-result-object v4

    invoke-virtual {v4}, Lorg/iq80/leveldb/table/BlockEntry;->getKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v4

    invoke-interface {v3, v4, p1}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v3

    if-gez v3, :cond_0

    .line 144
    invoke-virtual {p0}, Lorg/iq80/leveldb/table/BlockIterator;->next()Lorg/iq80/leveldb/table/BlockEntry;

    goto :goto_1
.end method

.method public seekToFirst()V
    .locals 1

    .prologue
    .line 107
    iget v0, p0, Lorg/iq80/leveldb/table/BlockIterator;->restartCount:I

    if-lez v0, :cond_0

    .line 108
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/iq80/leveldb/table/BlockIterator;->seekToRestartPosition(I)V

    .line 110
    :cond_0
    return-void
.end method
