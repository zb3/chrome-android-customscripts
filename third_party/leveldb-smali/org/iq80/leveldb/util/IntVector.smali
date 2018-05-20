.class public Lorg/iq80/leveldb/util/IntVector;
.super Ljava/lang/Object;
.source "IntVector.java"


# instance fields
.field private size:I

.field private values:[I


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "initialCapacity"    # I

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-array v0, p1, [I

    iput-object v0, p0, Lorg/iq80/leveldb/util/IntVector;->values:[I

    .line 32
    return-void
.end method

.method private ensureCapacity(I)V
    .locals 2
    .param p1, "minCapacity"    # I

    .prologue
    .line 55
    iget-object v1, p0, Lorg/iq80/leveldb/util/IntVector;->values:[I

    array-length v1, v1

    if-lt v1, p1, :cond_0

    .line 68
    :goto_0
    return-void

    .line 59
    :cond_0
    iget-object v1, p0, Lorg/iq80/leveldb/util/IntVector;->values:[I

    array-length v0, v1

    .line 60
    .local v0, "newLength":I
    if-nez v0, :cond_1

    .line 61
    const/4 v0, 0x1

    .line 67
    :goto_1
    iget-object v1, p0, Lorg/iq80/leveldb/util/IntVector;->values:[I

    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v1

    iput-object v1, p0, Lorg/iq80/leveldb/util/IntVector;->values:[I

    goto :goto_0

    .line 64
    :cond_1
    shl-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method


# virtual methods
.method public add(I)V
    .locals 5
    .param p1, "value"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 46
    iget v0, p0, Lorg/iq80/leveldb/util/IntVector;->size:I

    add-int/lit8 v0, v0, 0x1

    if-ltz v0, :cond_0

    move v0, v1

    :goto_0
    const-string v3, "Invalid minLength: %s"

    new-array v1, v1, [Ljava/lang/Object;

    iget v4, p0, Lorg/iq80/leveldb/util/IntVector;->size:I

    add-int/lit8 v4, v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v1, v2

    invoke-static {v0, v3, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 48
    iget v0, p0, Lorg/iq80/leveldb/util/IntVector;->size:I

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lorg/iq80/leveldb/util/IntVector;->ensureCapacity(I)V

    .line 50
    iget-object v0, p0, Lorg/iq80/leveldb/util/IntVector;->values:[I

    iget v1, p0, Lorg/iq80/leveldb/util/IntVector;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/iq80/leveldb/util/IntVector;->size:I

    aput p1, v0, v1

    .line 51
    return-void

    :cond_0
    move v0, v2

    .line 46
    goto :goto_0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 41
    const/4 v0, 0x0

    iput v0, p0, Lorg/iq80/leveldb/util/IntVector;->size:I

    .line 42
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 36
    iget v0, p0, Lorg/iq80/leveldb/util/IntVector;->size:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 85
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "IntVector"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    const-string v1, "{size="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/iq80/leveldb/util/IntVector;->size:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 88
    const-string v1, ", values="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/util/IntVector;->values:[I

    invoke-static {v2}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 90
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public values()[I
    .locals 2

    .prologue
    .line 72
    iget-object v0, p0, Lorg/iq80/leveldb/util/IntVector;->values:[I

    iget v1, p0, Lorg/iq80/leveldb/util/IntVector;->size:I

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    return-object v0
.end method

.method public write(Lorg/iq80/leveldb/util/SliceOutput;)V
    .locals 2
    .param p1, "sliceOutput"    # Lorg/iq80/leveldb/util/SliceOutput;

    .prologue
    .line 77
    const/4 v0, 0x0

    .local v0, "index":I
    :goto_0
    iget v1, p0, Lorg/iq80/leveldb/util/IntVector;->size:I

    if-ge v0, v1, :cond_0

    .line 78
    iget-object v1, p0, Lorg/iq80/leveldb/util/IntVector;->values:[I

    aget v1, v1, v0

    invoke-virtual {p1, v1}, Lorg/iq80/leveldb/util/SliceOutput;->writeInt(I)V

    .line 77
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 80
    :cond_0
    return-void
.end method
