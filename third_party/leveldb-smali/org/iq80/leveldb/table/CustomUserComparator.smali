.class public Lorg/iq80/leveldb/table/CustomUserComparator;
.super Ljava/lang/Object;
.source "CustomUserComparator.java"

# interfaces
.implements Lorg/iq80/leveldb/table/UserComparator;


# instance fields
.field private final comparator:Lorg/iq80/leveldb/DBComparator;


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/DBComparator;)V
    .locals 0
    .param p1, "comparator"    # Lorg/iq80/leveldb/DBComparator;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lorg/iq80/leveldb/table/CustomUserComparator;->comparator:Lorg/iq80/leveldb/DBComparator;

    .line 31
    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 23
    check-cast p1, Lorg/iq80/leveldb/util/Slice;

    check-cast p2, Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {p0, p1, p2}, Lorg/iq80/leveldb/table/CustomUserComparator;->compare(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)I
    .locals 3
    .param p1, "o1"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "o2"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 54
    iget-object v0, p0, Lorg/iq80/leveldb/table/CustomUserComparator;->comparator:Lorg/iq80/leveldb/DBComparator;

    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->getBytes()[B

    move-result-object v1

    invoke-virtual {p2}, Lorg/iq80/leveldb/util/Slice;->getBytes()[B

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/iq80/leveldb/DBComparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public findShortSuccessor(Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/util/Slice;
    .locals 3
    .param p1, "key"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 48
    new-instance v0, Lorg/iq80/leveldb/util/Slice;

    iget-object v1, p0, Lorg/iq80/leveldb/table/CustomUserComparator;->comparator:Lorg/iq80/leveldb/DBComparator;

    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->getBytes()[B

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/iq80/leveldb/DBComparator;->findShortSuccessor([B)[B

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/iq80/leveldb/util/Slice;-><init>([B)V

    return-object v0
.end method

.method public findShortestSeparator(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/util/Slice;
    .locals 4
    .param p1, "start"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "limit"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 42
    new-instance v0, Lorg/iq80/leveldb/util/Slice;

    iget-object v1, p0, Lorg/iq80/leveldb/table/CustomUserComparator;->comparator:Lorg/iq80/leveldb/DBComparator;

    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->getBytes()[B

    move-result-object v2

    invoke-virtual {p2}, Lorg/iq80/leveldb/util/Slice;->getBytes()[B

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/iq80/leveldb/DBComparator;->findShortestSeparator([B[B)[B

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/iq80/leveldb/util/Slice;-><init>([B)V

    return-object v0
.end method

.method public name()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lorg/iq80/leveldb/table/CustomUserComparator;->comparator:Lorg/iq80/leveldb/DBComparator;

    invoke-interface {v0}, Lorg/iq80/leveldb/DBComparator;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
