.class public Lorg/iq80/leveldb/table/BytewiseComparator;
.super Ljava/lang/Object;
.source "BytewiseComparator.java"

# interfaces
.implements Lorg/iq80/leveldb/table/UserComparator;


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const-class v0, Lorg/iq80/leveldb/table/BytewiseComparator;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/iq80/leveldb/table/BytewiseComparator;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 22
    check-cast p1, Lorg/iq80/leveldb/util/Slice;

    check-cast p2, Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {p0, p1, p2}, Lorg/iq80/leveldb/table/BytewiseComparator;->compare(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)I
    .locals 1
    .param p1, "sliceA"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "sliceB"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 34
    invoke-virtual {p1, p2}, Lorg/iq80/leveldb/util/Slice;->compareTo(Lorg/iq80/leveldb/util/Slice;)I

    move-result v0

    return v0
.end method

.method public findShortSuccessor(Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/util/Slice;
    .locals 5
    .param p1, "key"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 65
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 66
    invoke-virtual {p1, v1}, Lorg/iq80/leveldb/util/Slice;->getUnsignedByte(I)S

    move-result v0

    .line 67
    .local v0, "b":I
    const/16 v3, 0xff

    if-eq v0, v3, :cond_0

    .line 68
    const/4 v3, 0x0

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p1, v3, v4}, Lorg/iq80/leveldb/util/Slice;->copySlice(II)Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    .line 69
    .local v2, "result":Lorg/iq80/leveldb/util/Slice;
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {v2, v1, v3}, Lorg/iq80/leveldb/util/Slice;->setByte(II)V

    .line 74
    .end local v0    # "b":I
    .end local v2    # "result":Lorg/iq80/leveldb/util/Slice;
    :goto_1
    return-object v2

    .line 65
    .restart local v0    # "b":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v0    # "b":I
    :cond_1
    move-object v2, p1

    .line 74
    goto :goto_1
.end method

.method public findShortestSeparator(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/util/Slice;
    .locals 5
    .param p1, "start"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "limit"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 43
    invoke-static {p1, p2}, Lorg/iq80/leveldb/table/BlockBuilder;->calculateSharedBytes(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)I

    move-result v2

    .line 46
    .local v2, "sharedBytes":I
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v3

    invoke-virtual {p2}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 49
    invoke-virtual {p1, v2}, Lorg/iq80/leveldb/util/Slice;->getUnsignedByte(I)S

    move-result v0

    .line 50
    .local v0, "lastSharedByte":I
    const/16 v3, 0xff

    if-ge v0, v3, :cond_0

    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p2, v2}, Lorg/iq80/leveldb/util/Slice;->getUnsignedByte(I)S

    move-result v4

    if-ge v3, v4, :cond_0

    .line 51
    const/4 v3, 0x0

    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p1, v3, v4}, Lorg/iq80/leveldb/util/Slice;->copySlice(II)Lorg/iq80/leveldb/util/Slice;

    move-result-object v1

    .line 52
    .local v1, "result":Lorg/iq80/leveldb/util/Slice;
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {v1, v2, v3}, Lorg/iq80/leveldb/util/Slice;->setByte(II)V

    .line 54
    sget-boolean v3, Lorg/iq80/leveldb/table/BytewiseComparator;->$assertionsDisabled:Z

    if-nez v3, :cond_1

    invoke-virtual {p0, v1, p2}, Lorg/iq80/leveldb/table/BytewiseComparator;->compare(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)I

    move-result v3

    if-ltz v3, :cond_1

    new-instance v3, Ljava/lang/AssertionError;

    const-string v4, "start must be less than last limit"

    invoke-direct {v3, v4}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3

    .end local v0    # "lastSharedByte":I
    .end local v1    # "result":Lorg/iq80/leveldb/util/Slice;
    :cond_0
    move-object v1, p1

    .line 58
    :cond_1
    return-object v1
.end method

.method public name()Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    const-string v0, "leveldb.BytewiseComparator"

    return-object v0
.end method
