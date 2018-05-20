.class Lorg/iq80/leveldb/impl/VersionSet$Builder$FileMetaDataBySmallestKey;
.super Ljava/lang/Object;
.source "VersionSet.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/impl/VersionSet$Builder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FileMetaDataBySmallestKey"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/iq80/leveldb/impl/FileMetaData;",
        ">;"
    }
.end annotation


# instance fields
.field private final internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;


# direct methods
.method private constructor <init>(Lorg/iq80/leveldb/impl/InternalKeyComparator;)V
    .locals 0
    .param p1, "internalKeyComparator"    # Lorg/iq80/leveldb/impl/InternalKeyComparator;

    .prologue
    .line 817
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 818
    iput-object p1, p0, Lorg/iq80/leveldb/impl/VersionSet$Builder$FileMetaDataBySmallestKey;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    .line 819
    return-void
.end method

.method synthetic constructor <init>(Lorg/iq80/leveldb/impl/InternalKeyComparator;Lorg/iq80/leveldb/impl/VersionSet$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/iq80/leveldb/impl/InternalKeyComparator;
    .param p2, "x1"    # Lorg/iq80/leveldb/impl/VersionSet$1;

    .prologue
    .line 811
    invoke-direct {p0, p1}, Lorg/iq80/leveldb/impl/VersionSet$Builder$FileMetaDataBySmallestKey;-><init>(Lorg/iq80/leveldb/impl/InternalKeyComparator;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 811
    check-cast p1, Lorg/iq80/leveldb/impl/FileMetaData;

    check-cast p2, Lorg/iq80/leveldb/impl/FileMetaData;

    invoke-virtual {p0, p1, p2}, Lorg/iq80/leveldb/impl/VersionSet$Builder$FileMetaDataBySmallestKey;->compare(Lorg/iq80/leveldb/impl/FileMetaData;Lorg/iq80/leveldb/impl/FileMetaData;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/iq80/leveldb/impl/FileMetaData;Lorg/iq80/leveldb/impl/FileMetaData;)I
    .locals 6
    .param p1, "f1"    # Lorg/iq80/leveldb/impl/FileMetaData;
    .param p2, "f2"    # Lorg/iq80/leveldb/impl/FileMetaData;

    .prologue
    .line 825
    invoke-static {}, Lcom/google/common/collect/ComparisonChain;->start()Lcom/google/common/collect/ComparisonChain;

    move-result-object v0

    .line 826
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/FileMetaData;->getSmallest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v1

    invoke-virtual {p2}, Lorg/iq80/leveldb/impl/FileMetaData;->getSmallest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v2

    iget-object v3, p0, Lorg/iq80/leveldb/impl/VersionSet$Builder$FileMetaDataBySmallestKey;->internalKeyComparator:Lorg/iq80/leveldb/impl/InternalKeyComparator;

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/common/collect/ComparisonChain;->compare(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lcom/google/common/collect/ComparisonChain;

    move-result-object v0

    .line 827
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/FileMetaData;->getNumber()J

    move-result-wide v2

    invoke-virtual {p2}, Lorg/iq80/leveldb/impl/FileMetaData;->getNumber()J

    move-result-wide v4

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/google/common/collect/ComparisonChain;->compare(JJ)Lcom/google/common/collect/ComparisonChain;

    move-result-object v0

    .line 828
    invoke-virtual {v0}, Lcom/google/common/collect/ComparisonChain;->result()I

    move-result v0

    .line 824
    return v0
.end method
