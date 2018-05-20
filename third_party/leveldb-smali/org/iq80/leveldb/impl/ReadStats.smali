.class public Lorg/iq80/leveldb/impl/ReadStats;
.super Ljava/lang/Object;
.source "ReadStats.java"


# instance fields
.field private seekFile:Lorg/iq80/leveldb/impl/FileMetaData;

.field private seekFileLevel:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const/4 v0, -0x1

    iput v0, p0, Lorg/iq80/leveldb/impl/ReadStats;->seekFileLevel:I

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 27
    const/4 v0, -0x1

    iput v0, p0, Lorg/iq80/leveldb/impl/ReadStats;->seekFileLevel:I

    .line 28
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/ReadStats;->seekFile:Lorg/iq80/leveldb/impl/FileMetaData;

    .line 29
    return-void
.end method

.method public getSeekFile()Lorg/iq80/leveldb/impl/FileMetaData;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lorg/iq80/leveldb/impl/ReadStats;->seekFile:Lorg/iq80/leveldb/impl/FileMetaData;

    return-object v0
.end method

.method public getSeekFileLevel()I
    .locals 1

    .prologue
    .line 33
    iget v0, p0, Lorg/iq80/leveldb/impl/ReadStats;->seekFileLevel:I

    return v0
.end method

.method public setSeekFile(Lorg/iq80/leveldb/impl/FileMetaData;)V
    .locals 0
    .param p1, "seekFile"    # Lorg/iq80/leveldb/impl/FileMetaData;

    .prologue
    .line 48
    iput-object p1, p0, Lorg/iq80/leveldb/impl/ReadStats;->seekFile:Lorg/iq80/leveldb/impl/FileMetaData;

    .line 49
    return-void
.end method

.method public setSeekFileLevel(I)V
    .locals 0
    .param p1, "seekFileLevel"    # I

    .prologue
    .line 38
    iput p1, p0, Lorg/iq80/leveldb/impl/ReadStats;->seekFileLevel:I

    .line 39
    return-void
.end method
