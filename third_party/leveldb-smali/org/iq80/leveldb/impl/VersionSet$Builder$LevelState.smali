.class Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;
.super Ljava/lang/Object;
.source "VersionSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/impl/VersionSet$Builder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LevelState"
.end annotation


# instance fields
.field private final addedFiles:Ljava/util/SortedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/SortedSet",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;"
        }
    .end annotation
.end field

.field private final deletedFiles:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/impl/InternalKeyComparator;)V
    .locals 3
    .param p1, "internalKeyComparator"    # Lorg/iq80/leveldb/impl/InternalKeyComparator;

    .prologue
    .line 838
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 835
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;->deletedFiles:Ljava/util/Set;

    .line 839
    new-instance v0, Ljava/util/TreeSet;

    new-instance v1, Lorg/iq80/leveldb/impl/VersionSet$Builder$FileMetaDataBySmallestKey;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lorg/iq80/leveldb/impl/VersionSet$Builder$FileMetaDataBySmallestKey;-><init>(Lorg/iq80/leveldb/impl/InternalKeyComparator;Lorg/iq80/leveldb/impl/VersionSet$1;)V

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;->addedFiles:Ljava/util/SortedSet;

    .line 840
    return-void
.end method

.method static synthetic access$300(Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;

    .prologue
    .line 832
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;->deletedFiles:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$400(Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;)Ljava/util/SortedSet;
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;

    .prologue
    .line 832
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;->addedFiles:Ljava/util/SortedSet;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 845
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 846
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "LevelState"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 847
    const-string v1, "{addedFiles="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;->addedFiles:Ljava/util/SortedSet;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 848
    const-string v1, ", deletedFiles="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/VersionSet$Builder$LevelState;->deletedFiles:Ljava/util/Set;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 849
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 850
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
