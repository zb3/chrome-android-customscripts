.class public Lorg/iq80/leveldb/table/BlockBuilder;
.super Ljava/lang/Object;
.source "BlockBuilder.java"


# instance fields
.field private final block:Lorg/iq80/leveldb/util/DynamicSliceOutput;

.field private final blockRestartInterval:I

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

.field private entryCount:I

.field private finished:Z

.field private lastKey:Lorg/iq80/leveldb/util/Slice;

.field private restartBlockEntryCount:I

.field private final restartPositions:Lorg/iq80/leveldb/util/IntVector;


# direct methods
.method public constructor <init>(IILjava/util/Comparator;)V
    .locals 4
    .param p1, "estimatedSize"    # I
    .param p2, "blockRestartInterval"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
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

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    if-ltz p1, :cond_0

    move v0, v1

    :goto_0
    const-string v3, "estimatedSize is negative"

    invoke-static {v0, v3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 47
    if-ltz p2, :cond_1

    :goto_1
    const-string v0, "blockRestartInterval is negative"

    invoke-static {v1, v0}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 48
    const-string v0, "comparator is null"

    invoke-static {p3, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    new-instance v0, Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-direct {v0, p1}, Lorg/iq80/leveldb/util/DynamicSliceOutput;-><init>(I)V

    iput-object v0, p0, Lorg/iq80/leveldb/table/BlockBuilder;->block:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    .line 51
    iput p2, p0, Lorg/iq80/leveldb/table/BlockBuilder;->blockRestartInterval:I

    .line 52
    iput-object p3, p0, Lorg/iq80/leveldb/table/BlockBuilder;->comparator:Ljava/util/Comparator;

    .line 54
    new-instance v0, Lorg/iq80/leveldb/util/IntVector;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Lorg/iq80/leveldb/util/IntVector;-><init>(I)V

    iput-object v0, p0, Lorg/iq80/leveldb/table/BlockBuilder;->restartPositions:Lorg/iq80/leveldb/util/IntVector;

    .line 55
    iget-object v0, p0, Lorg/iq80/leveldb/table/BlockBuilder;->restartPositions:Lorg/iq80/leveldb/util/IntVector;

    invoke-virtual {v0, v2}, Lorg/iq80/leveldb/util/IntVector;->add(I)V

    .line 56
    return-void

    :cond_0
    move v0, v2

    .line 46
    goto :goto_0

    :cond_1
    move v1, v2

    .line 47
    goto :goto_1
.end method

.method public static calculateSharedBytes(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)I
    .locals 5
    .param p0, "leftKey"    # Lorg/iq80/leveldb/util/Slice;
    .param p1, "rightKey"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 144
    const/4 v1, 0x0

    .line 146
    .local v1, "sharedKeyBytes":I
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    .line 147
    const/4 v2, 0x2

    new-array v2, v2, [I

    const/4 v3, 0x0

    invoke-virtual {p0}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v4

    aput v4, v2, v3

    const/4 v3, 0x1

    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v4

    aput v4, v2, v3

    invoke-static {v2}, Lcom/google/common/primitives/Ints;->min([I)I

    move-result v0

    .line 148
    .local v0, "minSharedKeyBytes":I
    :goto_0
    if-ge v1, v0, :cond_0

    invoke-virtual {p0, v1}, Lorg/iq80/leveldb/util/Slice;->getByte(I)B

    move-result v2

    invoke-virtual {p1, v1}, Lorg/iq80/leveldb/util/Slice;->getByte(I)B

    move-result v3

    if-ne v2, v3, :cond_0

    .line 149
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 153
    .end local v0    # "minSharedKeyBytes":I
    :cond_0
    return v1
.end method


# virtual methods
.method public add(Lorg/iq80/leveldb/table/BlockEntry;)V
    .locals 2
    .param p1, "blockEntry"    # Lorg/iq80/leveldb/table/BlockEntry;

    .prologue
    .line 98
    const-string v0, "blockEntry is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    invoke-virtual {p1}, Lorg/iq80/leveldb/table/BlockEntry;->getKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    invoke-virtual {p1}, Lorg/iq80/leveldb/table/BlockEntry;->getValue()Lorg/iq80/leveldb/util/Slice;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/iq80/leveldb/table/BlockBuilder;->add(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)V

    .line 100
    return-void
.end method

.method public add(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)V
    .locals 6
    .param p1, "key"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "value"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 104
    const-string v2, "key is null"

    invoke-static {p1, v2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    const-string v2, "value is null"

    invoke-static {p2, v2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    iget-boolean v2, p0, Lorg/iq80/leveldb/table/BlockBuilder;->finished:Z

    if-nez v2, :cond_1

    move v2, v3

    :goto_0
    const-string v5, "block is finished"

    invoke-static {v2, v5}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 107
    iget v2, p0, Lorg/iq80/leveldb/table/BlockBuilder;->restartBlockEntryCount:I

    iget v5, p0, Lorg/iq80/leveldb/table/BlockBuilder;->blockRestartInterval:I

    invoke-static {v2, v5}, Lcom/google/common/base/Preconditions;->checkPositionIndex(II)I

    .line 109
    iget-object v2, p0, Lorg/iq80/leveldb/table/BlockBuilder;->lastKey:Lorg/iq80/leveldb/util/Slice;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/iq80/leveldb/table/BlockBuilder;->comparator:Ljava/util/Comparator;

    iget-object v5, p0, Lorg/iq80/leveldb/table/BlockBuilder;->lastKey:Lorg/iq80/leveldb/util/Slice;

    invoke-interface {v2, p1, v5}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-lez v2, :cond_2

    :cond_0
    :goto_1
    const-string v2, "key must be greater than last key"

    invoke-static {v3, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 111
    const/4 v1, 0x0

    .line 112
    .local v1, "sharedKeyBytes":I
    iget v2, p0, Lorg/iq80/leveldb/table/BlockBuilder;->restartBlockEntryCount:I

    iget v3, p0, Lorg/iq80/leveldb/table/BlockBuilder;->blockRestartInterval:I

    if-ge v2, v3, :cond_3

    .line 113
    iget-object v2, p0, Lorg/iq80/leveldb/table/BlockBuilder;->lastKey:Lorg/iq80/leveldb/util/Slice;

    invoke-static {p1, v2}, Lorg/iq80/leveldb/table/BlockBuilder;->calculateSharedBytes(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)I

    move-result v1

    .line 121
    :goto_2
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v2

    sub-int v0, v2, v1

    .line 124
    .local v0, "nonSharedKeyBytes":I
    iget-object v2, p0, Lorg/iq80/leveldb/table/BlockBuilder;->block:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-static {v1, v2}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->writeVariableLengthInt(ILorg/iq80/leveldb/util/SliceOutput;)V

    .line 125
    iget-object v2, p0, Lorg/iq80/leveldb/table/BlockBuilder;->block:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-static {v0, v2}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->writeVariableLengthInt(ILorg/iq80/leveldb/util/SliceOutput;)V

    .line 126
    invoke-virtual {p2}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v2

    iget-object v3, p0, Lorg/iq80/leveldb/table/BlockBuilder;->block:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-static {v2, v3}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->writeVariableLengthInt(ILorg/iq80/leveldb/util/SliceOutput;)V

    .line 129
    iget-object v2, p0, Lorg/iq80/leveldb/table/BlockBuilder;->block:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v2, p1, v1, v0}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->writeBytes(Lorg/iq80/leveldb/util/Slice;II)V

    .line 132
    iget-object v2, p0, Lorg/iq80/leveldb/table/BlockBuilder;->block:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {p2}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v3

    invoke-virtual {v2, p2, v4, v3}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->writeBytes(Lorg/iq80/leveldb/util/Slice;II)V

    .line 135
    iput-object p1, p0, Lorg/iq80/leveldb/table/BlockBuilder;->lastKey:Lorg/iq80/leveldb/util/Slice;

    .line 138
    iget v2, p0, Lorg/iq80/leveldb/table/BlockBuilder;->entryCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/iq80/leveldb/table/BlockBuilder;->entryCount:I

    .line 139
    iget v2, p0, Lorg/iq80/leveldb/table/BlockBuilder;->restartBlockEntryCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/iq80/leveldb/table/BlockBuilder;->restartBlockEntryCount:I

    .line 140
    return-void

    .end local v0    # "nonSharedKeyBytes":I
    .end local v1    # "sharedKeyBytes":I
    :cond_1
    move v2, v4

    .line 106
    goto :goto_0

    :cond_2
    move v3, v4

    .line 109
    goto :goto_1

    .line 117
    .restart local v1    # "sharedKeyBytes":I
    :cond_3
    iget-object v2, p0, Lorg/iq80/leveldb/table/BlockBuilder;->restartPositions:Lorg/iq80/leveldb/util/IntVector;

    iget-object v3, p0, Lorg/iq80/leveldb/table/BlockBuilder;->block:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v3}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Lorg/iq80/leveldb/util/IntVector;->add(I)V

    .line 118
    iput v4, p0, Lorg/iq80/leveldb/table/BlockBuilder;->restartBlockEntryCount:I

    goto :goto_2
.end method

.method public currentSizeEstimate()I
    .locals 2

    .prologue
    .line 82
    iget-boolean v0, p0, Lorg/iq80/leveldb/table/BlockBuilder;->finished:Z

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lorg/iq80/leveldb/table/BlockBuilder;->block:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v0}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->size()I

    move-result v0

    .line 91
    :goto_0
    return v0

    .line 87
    :cond_0
    iget-object v0, p0, Lorg/iq80/leveldb/table/BlockBuilder;->block:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v0}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->size()I

    move-result v0

    if-nez v0, :cond_1

    .line 88
    const/4 v0, 0x4

    goto :goto_0

    .line 91
    :cond_1
    iget-object v0, p0, Lorg/iq80/leveldb/table/BlockBuilder;->block:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v0}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->size()I

    move-result v0

    iget-object v1, p0, Lorg/iq80/leveldb/table/BlockBuilder;->restartPositions:Lorg/iq80/leveldb/util/IntVector;

    .line 92
    invoke-virtual {v1}, Lorg/iq80/leveldb/util/IntVector;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x4

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    .line 91
    goto :goto_0
.end method

.method public finish()Lorg/iq80/leveldb/util/Slice;
    .locals 2

    .prologue
    .line 158
    iget-boolean v0, p0, Lorg/iq80/leveldb/table/BlockBuilder;->finished:Z

    if-nez v0, :cond_0

    .line 159
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/iq80/leveldb/table/BlockBuilder;->finished:Z

    .line 161
    iget v0, p0, Lorg/iq80/leveldb/table/BlockBuilder;->entryCount:I

    if-lez v0, :cond_1

    .line 162
    iget-object v0, p0, Lorg/iq80/leveldb/table/BlockBuilder;->restartPositions:Lorg/iq80/leveldb/util/IntVector;

    iget-object v1, p0, Lorg/iq80/leveldb/table/BlockBuilder;->block:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v0, v1}, Lorg/iq80/leveldb/util/IntVector;->write(Lorg/iq80/leveldb/util/SliceOutput;)V

    .line 163
    iget-object v0, p0, Lorg/iq80/leveldb/table/BlockBuilder;->block:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    iget-object v1, p0, Lorg/iq80/leveldb/table/BlockBuilder;->restartPositions:Lorg/iq80/leveldb/util/IntVector;

    invoke-virtual {v1}, Lorg/iq80/leveldb/util/IntVector;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->writeInt(I)V

    .line 169
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/iq80/leveldb/table/BlockBuilder;->block:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v0}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->slice()Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    return-object v0

    .line 166
    :cond_1
    iget-object v0, p0, Lorg/iq80/leveldb/table/BlockBuilder;->block:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->writeInt(I)V

    goto :goto_0
.end method

.method public getEntryCount()I
    .locals 1

    .prologue
    .line 71
    iget v0, p0, Lorg/iq80/leveldb/table/BlockBuilder;->entryCount:I

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 76
    iget v0, p0, Lorg/iq80/leveldb/table/BlockBuilder;->entryCount:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public reset()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 60
    iget-object v0, p0, Lorg/iq80/leveldb/table/BlockBuilder;->block:Lorg/iq80/leveldb/util/DynamicSliceOutput;

    invoke-virtual {v0}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->reset()V

    .line 61
    iput v1, p0, Lorg/iq80/leveldb/table/BlockBuilder;->entryCount:I

    .line 62
    iget-object v0, p0, Lorg/iq80/leveldb/table/BlockBuilder;->restartPositions:Lorg/iq80/leveldb/util/IntVector;

    invoke-virtual {v0}, Lorg/iq80/leveldb/util/IntVector;->clear()V

    .line 63
    iget-object v0, p0, Lorg/iq80/leveldb/table/BlockBuilder;->restartPositions:Lorg/iq80/leveldb/util/IntVector;

    invoke-virtual {v0, v1}, Lorg/iq80/leveldb/util/IntVector;->add(I)V

    .line 64
    iput v1, p0, Lorg/iq80/leveldb/table/BlockBuilder;->restartBlockEntryCount:I

    .line 65
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/iq80/leveldb/table/BlockBuilder;->lastKey:Lorg/iq80/leveldb/util/Slice;

    .line 66
    iput-boolean v1, p0, Lorg/iq80/leveldb/table/BlockBuilder;->finished:Z

    .line 67
    return-void
.end method
