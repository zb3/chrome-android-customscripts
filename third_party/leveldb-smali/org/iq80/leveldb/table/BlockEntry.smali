.class public Lorg/iq80/leveldb/table/BlockEntry;
.super Ljava/lang/Object;
.source "BlockEntry.java"

# interfaces
.implements Ljava/util/Map$Entry;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Map$Entry",
        "<",
        "Lorg/iq80/leveldb/util/Slice;",
        "Lorg/iq80/leveldb/util/Slice;",
        ">;"
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
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    const-string v0, "key is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    const-string v0, "value is null"

    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    iput-object p1, p0, Lorg/iq80/leveldb/table/BlockEntry;->key:Lorg/iq80/leveldb/util/Slice;

    .line 84
    iput-object p2, p0, Lorg/iq80/leveldb/table/BlockEntry;->value:Lorg/iq80/leveldb/util/Slice;

    .line 85
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 111
    if-ne p0, p1, :cond_1

    .line 127
    :cond_0
    :goto_0
    return v1

    .line 114
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 115
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 118
    check-cast v0, Lorg/iq80/leveldb/table/BlockEntry;

    .line 120
    .local v0, "entry":Lorg/iq80/leveldb/table/BlockEntry;
    iget-object v3, p0, Lorg/iq80/leveldb/table/BlockEntry;->key:Lorg/iq80/leveldb/util/Slice;

    iget-object v4, v0, Lorg/iq80/leveldb/table/BlockEntry;->key:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v3, v4}, Lorg/iq80/leveldb/util/Slice;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 121
    goto :goto_0

    .line 123
    :cond_4
    iget-object v3, p0, Lorg/iq80/leveldb/table/BlockEntry;->value:Lorg/iq80/leveldb/util/Slice;

    iget-object v4, v0, Lorg/iq80/leveldb/table/BlockEntry;->value:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v3, v4}, Lorg/iq80/leveldb/util/Slice;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 124
    goto :goto_0
.end method

.method public bridge synthetic getKey()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 73
    invoke-virtual {p0}, Lorg/iq80/leveldb/table/BlockEntry;->getKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    return-object v0
.end method

.method public getKey()Lorg/iq80/leveldb/util/Slice;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lorg/iq80/leveldb/table/BlockEntry;->key:Lorg/iq80/leveldb/util/Slice;

    return-object v0
.end method

.method public bridge synthetic getValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 73
    invoke-virtual {p0}, Lorg/iq80/leveldb/table/BlockEntry;->getValue()Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Lorg/iq80/leveldb/util/Slice;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lorg/iq80/leveldb/table/BlockEntry;->value:Lorg/iq80/leveldb/util/Slice;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 133
    iget-object v1, p0, Lorg/iq80/leveldb/table/BlockEntry;->key:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v1}, Lorg/iq80/leveldb/util/Slice;->hashCode()I

    move-result v0

    .line 134
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lorg/iq80/leveldb/table/BlockEntry;->value:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v2}, Lorg/iq80/leveldb/util/Slice;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 135
    return v0
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 73
    check-cast p1, Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/table/BlockEntry;->setValue(Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    return-object v0
.end method

.method public final setValue(Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/util/Slice;
    .locals 1
    .param p1, "value"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 105
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 141
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 142
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "BlockEntry"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    const-string v1, "{key="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/table/BlockEntry;->key:Lorg/iq80/leveldb/util/Slice;

    sget-object v3, Lcom/google/common/base/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v3}, Lorg/iq80/leveldb/util/Slice;->toString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    const-string v1, ", value="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/table/BlockEntry;->value:Lorg/iq80/leveldb/util/Slice;

    sget-object v3, Lcom/google/common/base/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v3}, Lorg/iq80/leveldb/util/Slice;->toString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 146
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
