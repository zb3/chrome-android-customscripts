.class public final Lorg/iq80/leveldb/util/SliceComparator;
.super Ljava/lang/Object;
.source "SliceComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/iq80/leveldb/util/Slice;",
        ">;"
    }
.end annotation


# static fields
.field public static final SLICE_COMPARATOR:Lorg/iq80/leveldb/util/SliceComparator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    new-instance v0, Lorg/iq80/leveldb/util/SliceComparator;

    invoke-direct {v0}, Lorg/iq80/leveldb/util/SliceComparator;-><init>()V

    sput-object v0, Lorg/iq80/leveldb/util/SliceComparator;->SLICE_COMPARATOR:Lorg/iq80/leveldb/util/SliceComparator;

    return-void
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

    invoke-virtual {p0, p1, p2}, Lorg/iq80/leveldb/util/SliceComparator;->compare(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)I
    .locals 1
    .param p1, "sliceA"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "sliceB"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 30
    invoke-virtual {p1, p2}, Lorg/iq80/leveldb/util/Slice;->compareTo(Lorg/iq80/leveldb/util/Slice;)I

    move-result v0

    return v0
.end method
