.class public final Lorg/iq80/leveldb/impl/SequenceNumber;
.super Ljava/lang/Object;
.source "SequenceNumber.java"


# static fields
.field public static final MAX_SEQUENCE_NUMBER:J = 0xffffffffffffffL


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method

.method public static packSequenceAndValueType(JLorg/iq80/leveldb/impl/ValueType;)J
    .locals 4
    .param p0, "sequence"    # J
    .param p2, "valueType"    # Lorg/iq80/leveldb/impl/ValueType;

    .prologue
    .line 34
    const-wide v0, 0xffffffffffffffL

    cmp-long v0, p0, v0

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    const-string v1, "Sequence number is greater than MAX_SEQUENCE_NUMBER"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 35
    const-string v0, "valueType is null"

    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    const/16 v0, 0x8

    shl-long v0, p0, v0

    invoke-virtual {p2}, Lorg/iq80/leveldb/impl/ValueType;->getPersistentId()I

    move-result v2

    int-to-long v2, v2

    or-long/2addr v0, v2

    return-wide v0

    .line 34
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static unpackSequenceNumber(J)J
    .locals 2
    .param p0, "num"    # J

    .prologue
    .line 47
    const/16 v0, 0x8

    ushr-long v0, p0, v0

    return-wide v0
.end method

.method public static unpackValueType(J)Lorg/iq80/leveldb/impl/ValueType;
    .locals 2
    .param p0, "num"    # J

    .prologue
    .line 42
    long-to-int v0, p0

    int-to-byte v0, v0

    invoke-static {v0}, Lorg/iq80/leveldb/impl/ValueType;->getValueTypeByPersistentId(I)Lorg/iq80/leveldb/impl/ValueType;

    move-result-object v0

    return-object v0
.end method
