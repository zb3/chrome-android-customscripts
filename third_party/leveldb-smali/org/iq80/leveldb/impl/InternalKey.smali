.class public Lorg/iq80/leveldb/impl/InternalKey;
.super Ljava/lang/Object;
.source "InternalKey.java"


# instance fields
.field private hash:I

.field private final sequenceNumber:J

.field private final userKey:Lorg/iq80/leveldb/util/Slice;

.field private final valueType:Lorg/iq80/leveldb/impl/ValueType;


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/util/Slice;)V
    .locals 7
    .param p1, "data"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    const/16 v6, 0x8

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    const-string v2, "data is null"

    invoke-static {p1, v2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v2

    if-lt v2, v6, :cond_0

    move v2, v3

    :goto_0
    const-string v5, "data must be at least %s bytes"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v6}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v6

    aput-object v6, v3, v4

    invoke-static {v2, v5, v3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 49
    invoke-static {p1}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey(Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    iput-object v2, p0, Lorg/iq80/leveldb/impl/InternalKey;->userKey:Lorg/iq80/leveldb/util/Slice;

    .line 50
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x8

    invoke-virtual {p1, v2}, Lorg/iq80/leveldb/util/Slice;->getLong(I)J

    move-result-wide v0

    .line 51
    .local v0, "packedSequenceAndType":J
    invoke-static {v0, v1}, Lorg/iq80/leveldb/impl/SequenceNumber;->unpackSequenceNumber(J)J

    move-result-wide v2

    iput-wide v2, p0, Lorg/iq80/leveldb/impl/InternalKey;->sequenceNumber:J

    .line 52
    invoke-static {v0, v1}, Lorg/iq80/leveldb/impl/SequenceNumber;->unpackValueType(J)Lorg/iq80/leveldb/impl/ValueType;

    move-result-object v2

    iput-object v2, p0, Lorg/iq80/leveldb/impl/InternalKey;->valueType:Lorg/iq80/leveldb/impl/ValueType;

    .line 53
    return-void

    .end local v0    # "packedSequenceAndType":J
    :cond_0
    move v2, v4

    .line 48
    goto :goto_0
.end method

.method public constructor <init>(Lorg/iq80/leveldb/util/Slice;JLorg/iq80/leveldb/impl/ValueType;)V
    .locals 2
    .param p1, "userKey"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "sequenceNumber"    # J
    .param p4, "valueType"    # Lorg/iq80/leveldb/impl/ValueType;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const-string v0, "userKey is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    const-string v1, "sequenceNumber is negative"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 38
    const-string v0, "valueType is null"

    invoke-static {p4, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    iput-object p1, p0, Lorg/iq80/leveldb/impl/InternalKey;->userKey:Lorg/iq80/leveldb/util/Slice;

    .line 41
    iput-wide p2, p0, Lorg/iq80/leveldb/impl/InternalKey;->sequenceNumber:J

    .line 42
    iput-object p4, p0, Lorg/iq80/leveldb/impl/InternalKey;->valueType:Lorg/iq80/leveldb/impl/ValueType;

    .line 43
    return-void

    .line 37
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>([B)V
    .locals 1
    .param p1, "data"    # [B

    .prologue
    .line 57
    invoke-static {p1}, Lorg/iq80/leveldb/util/Slices;->wrappedBuffer([B)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;)V

    .line 58
    return-void
.end method

.method private static getUserKey(Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/util/Slice;
    .locals 2
    .param p0, "data"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 140
    const/4 v0, 0x0

    invoke-virtual {p0}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x8

    invoke-virtual {p0, v0, v1}, Lorg/iq80/leveldb/util/Slice;->slice(II)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public encode()Lorg/iq80/leveldb/util/Slice;
    .locals 5

    .prologue
    .line 77
    iget-object v2, p0, Lorg/iq80/leveldb/impl/InternalKey;->userKey:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v2}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x8

    invoke-static {v2}, Lorg/iq80/leveldb/util/Slices;->allocate(I)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    .line 78
    .local v0, "slice":Lorg/iq80/leveldb/util/Slice;
    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Slice;->output()Lorg/iq80/leveldb/util/SliceOutput;

    move-result-object v1

    .line 79
    .local v1, "sliceOutput":Lorg/iq80/leveldb/util/SliceOutput;
    iget-object v2, p0, Lorg/iq80/leveldb/impl/InternalKey;->userKey:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v1, v2}, Lorg/iq80/leveldb/util/SliceOutput;->writeBytes(Lorg/iq80/leveldb/util/Slice;)V

    .line 80
    iget-wide v2, p0, Lorg/iq80/leveldb/impl/InternalKey;->sequenceNumber:J

    iget-object v4, p0, Lorg/iq80/leveldb/impl/InternalKey;->valueType:Lorg/iq80/leveldb/impl/ValueType;

    invoke-static {v2, v3, v4}, Lorg/iq80/leveldb/impl/SequenceNumber;->packSequenceAndValueType(JLorg/iq80/leveldb/impl/ValueType;)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lorg/iq80/leveldb/util/SliceOutput;->writeLong(J)V

    .line 81
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 8
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 87
    if-ne p0, p1, :cond_1

    .line 106
    :cond_0
    :goto_0
    return v1

    .line 90
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 91
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 94
    check-cast v0, Lorg/iq80/leveldb/impl/InternalKey;

    .line 96
    .local v0, "that":Lorg/iq80/leveldb/impl/InternalKey;
    iget-wide v4, p0, Lorg/iq80/leveldb/impl/InternalKey;->sequenceNumber:J

    iget-wide v6, v0, Lorg/iq80/leveldb/impl/InternalKey;->sequenceNumber:J

    cmp-long v3, v4, v6

    if-eqz v3, :cond_4

    move v1, v2

    .line 97
    goto :goto_0

    .line 99
    :cond_4
    iget-object v3, p0, Lorg/iq80/leveldb/impl/InternalKey;->userKey:Lorg/iq80/leveldb/util/Slice;

    if-eqz v3, :cond_6

    iget-object v3, p0, Lorg/iq80/leveldb/impl/InternalKey;->userKey:Lorg/iq80/leveldb/util/Slice;

    iget-object v4, v0, Lorg/iq80/leveldb/impl/InternalKey;->userKey:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v3, v4}, Lorg/iq80/leveldb/util/Slice;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    :cond_5
    move v1, v2

    .line 100
    goto :goto_0

    .line 99
    :cond_6
    iget-object v3, v0, Lorg/iq80/leveldb/impl/InternalKey;->userKey:Lorg/iq80/leveldb/util/Slice;

    if-nez v3, :cond_5

    .line 102
    :cond_7
    iget-object v3, p0, Lorg/iq80/leveldb/impl/InternalKey;->valueType:Lorg/iq80/leveldb/impl/ValueType;

    iget-object v4, v0, Lorg/iq80/leveldb/impl/InternalKey;->valueType:Lorg/iq80/leveldb/impl/ValueType;

    if-eq v3, v4, :cond_0

    move v1, v2

    .line 103
    goto :goto_0
.end method

.method public getSequenceNumber()J
    .locals 2

    .prologue
    .line 67
    iget-wide v0, p0, Lorg/iq80/leveldb/impl/InternalKey;->sequenceNumber:J

    return-wide v0
.end method

.method public getUserKey()Lorg/iq80/leveldb/util/Slice;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lorg/iq80/leveldb/impl/InternalKey;->userKey:Lorg/iq80/leveldb/util/Slice;

    return-object v0
.end method

.method public getValueType()Lorg/iq80/leveldb/impl/ValueType;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lorg/iq80/leveldb/impl/InternalKey;->valueType:Lorg/iq80/leveldb/impl/ValueType;

    return-object v0
.end method

.method public hashCode()I
    .locals 8

    .prologue
    const/4 v1, 0x0

    .line 114
    iget v2, p0, Lorg/iq80/leveldb/impl/InternalKey;->hash:I

    if-nez v2, :cond_2

    .line 115
    iget-object v2, p0, Lorg/iq80/leveldb/impl/InternalKey;->userKey:Lorg/iq80/leveldb/util/Slice;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lorg/iq80/leveldb/impl/InternalKey;->userKey:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v2}, Lorg/iq80/leveldb/util/Slice;->hashCode()I

    move-result v0

    .line 116
    .local v0, "result":I
    :goto_0
    mul-int/lit8 v2, v0, 0x1f

    iget-wide v4, p0, Lorg/iq80/leveldb/impl/InternalKey;->sequenceNumber:J

    iget-wide v6, p0, Lorg/iq80/leveldb/impl/InternalKey;->sequenceNumber:J

    const/16 v3, 0x20

    ushr-long/2addr v6, v3

    xor-long/2addr v4, v6

    long-to-int v3, v4

    add-int v0, v2, v3

    .line 117
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lorg/iq80/leveldb/impl/InternalKey;->valueType:Lorg/iq80/leveldb/impl/ValueType;

    if-eqz v3, :cond_0

    iget-object v1, p0, Lorg/iq80/leveldb/impl/InternalKey;->valueType:Lorg/iq80/leveldb/impl/ValueType;

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/ValueType;->hashCode()I

    move-result v1

    :cond_0
    add-int v0, v2, v1

    .line 118
    if-nez v0, :cond_1

    .line 119
    const/4 v0, 0x1

    .line 121
    :cond_1
    iput v0, p0, Lorg/iq80/leveldb/impl/InternalKey;->hash:I

    .line 123
    .end local v0    # "result":I
    :cond_2
    iget v1, p0, Lorg/iq80/leveldb/impl/InternalKey;->hash:I

    return v1

    :cond_3
    move v0, v1

    .line 115
    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 129
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 130
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "InternalKey"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    const-string v1, "{key="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    sget-object v3, Lcom/google/common/base/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v3}, Lorg/iq80/leveldb/util/Slice;->toString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    const-string v1, ", sequenceNumber="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/InternalKey;->getSequenceNumber()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 133
    const-string v1, ", valueType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/InternalKey;->getValueType()Lorg/iq80/leveldb/impl/ValueType;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 134
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 135
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
