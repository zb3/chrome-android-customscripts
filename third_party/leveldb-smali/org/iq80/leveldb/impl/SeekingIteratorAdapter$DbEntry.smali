.class public Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;
.super Ljava/lang/Object;
.source "SeekingIteratorAdapter.java"

# interfaces
.implements Ljava/util/Map$Entry;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/impl/SeekingIteratorAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DbEntry"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Map$Entry",
        "<[B[B>;"
    }
.end annotation


# instance fields
.field private final key:Lorg/iq80/leveldb/util/Slice;

.field private final value:Lorg/iq80/leveldb/util/Slice;


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)V
    .locals 1
    .param p1, "key"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "value"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 126
    const-string v0, "key is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    const-string v0, "value is null"

    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    iput-object p1, p0, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;->key:Lorg/iq80/leveldb/util/Slice;

    .line 129
    iput-object p2, p0, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;->value:Lorg/iq80/leveldb/util/Slice;

    .line 130
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 163
    instance-of v2, p1, Ljava/util/Map$Entry;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 164
    check-cast v0, Ljava/util/Map$Entry;

    .line 165
    .local v0, "that":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    iget-object v2, p0, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;->key:Lorg/iq80/leveldb/util/Slice;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/iq80/leveldb/util/Slice;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;->value:Lorg/iq80/leveldb/util/Slice;

    .line 166
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/iq80/leveldb/util/Slice;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    .line 168
    .end local v0    # "that":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    :cond_0
    return v1
.end method

.method public bridge synthetic getKey()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 118
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;->getKey()[B

    move-result-object v0

    return-object v0
.end method

.method public getKey()[B
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;->key:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Slice;->getBytes()[B

    move-result-object v0

    return-object v0
.end method

.method public getKeySlice()Lorg/iq80/leveldb/util/Slice;
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;->key:Lorg/iq80/leveldb/util/Slice;

    return-object v0
.end method

.method public bridge synthetic getValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 118
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;->getValue()[B

    move-result-object v0

    return-object v0
.end method

.method public getValue()[B
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;->value:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Slice;->getBytes()[B

    move-result-object v0

    return-object v0
.end method

.method public getValueSlice()Lorg/iq80/leveldb/util/Slice;
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;->value:Lorg/iq80/leveldb/util/Slice;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 174
    iget-object v0, p0, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;->key:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Slice;->hashCode()I

    move-result v0

    iget-object v1, p0, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;->value:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v1}, Lorg/iq80/leveldb/util/Slice;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 118
    check-cast p1, [B

    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;->setValue([B)[B

    move-result-object v0

    return-object v0
.end method

.method public setValue([B)[B
    .locals 1
    .param p1, "value"    # [B

    .prologue
    .line 157
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 183
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;->key:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/iq80/leveldb/impl/SeekingIteratorAdapter$DbEntry;->value:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
