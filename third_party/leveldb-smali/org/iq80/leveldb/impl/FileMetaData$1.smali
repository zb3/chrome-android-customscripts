.class final Lorg/iq80/leveldb/impl/FileMetaData$1;
.super Ljava/lang/Object;
.source "FileMetaData.java"

# interfaces
.implements Lcom/google/common/base/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/impl/FileMetaData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/base/Function",
        "<",
        "Lorg/iq80/leveldb/impl/FileMetaData;",
        "Lorg/iq80/leveldb/impl/InternalKey;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 27
    check-cast p1, Lorg/iq80/leveldb/impl/FileMetaData;

    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/impl/FileMetaData$1;->apply(Lorg/iq80/leveldb/impl/FileMetaData;)Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v0

    return-object v0
.end method

.method public apply(Lorg/iq80/leveldb/impl/FileMetaData;)Lorg/iq80/leveldb/impl/InternalKey;
    .locals 1
    .param p1, "fileMetaData"    # Lorg/iq80/leveldb/impl/FileMetaData;

    .prologue
    .line 31
    invoke-virtual {p1}, Lorg/iq80/leveldb/impl/FileMetaData;->getLargest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v0

    return-object v0
.end method
