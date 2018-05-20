.class final Lorg/iq80/leveldb/impl/Level0$1;
.super Ljava/lang/Object;
.source "Level0.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/impl/Level0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
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


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 46
    check-cast p1, Lorg/iq80/leveldb/impl/FileMetaData;

    check-cast p2, Lorg/iq80/leveldb/impl/FileMetaData;

    invoke-virtual {p0, p1, p2}, Lorg/iq80/leveldb/impl/Level0$1;->compare(Lorg/iq80/leveldb/impl/FileMetaData;Lorg/iq80/leveldb/impl/FileMetaData;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/iq80/leveldb/impl/FileMetaData;Lorg/iq80/leveldb/impl/FileMetaData;)I
    .locals 4
    .param p1, "fileMetaData"    # Lorg/iq80/leveldb/impl/FileMetaData;
    .param p2, "fileMetaData1"    # Lorg/iq80/leveldb/impl/FileMetaData;

    .prologue
    .line 50
    invoke-virtual {p2}, Lorg/iq80/leveldb/impl/FileMetaData;->getNumber()J

    move-result-wide v0

    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/FileMetaData;->getNumber()J

    move-result-wide v2

    sub-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method
