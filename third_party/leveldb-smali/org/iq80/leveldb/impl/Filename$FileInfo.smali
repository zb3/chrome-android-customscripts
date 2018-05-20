.class public Lorg/iq80/leveldb/impl/Filename$FileInfo;
.super Ljava/lang/Object;
.source "Filename.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/impl/Filename;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FileInfo"
.end annotation


# instance fields
.field private final fileNumber:J

.field private final fileType:Lorg/iq80/leveldb/impl/Filename$FileType;


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/impl/Filename$FileType;)V
    .locals 2
    .param p1, "fileType"    # Lorg/iq80/leveldb/impl/Filename$FileType;

    .prologue
    .line 224
    const-wide/16 v0, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/iq80/leveldb/impl/Filename$FileInfo;-><init>(Lorg/iq80/leveldb/impl/Filename$FileType;J)V

    .line 225
    return-void
.end method

.method public constructor <init>(Lorg/iq80/leveldb/impl/Filename$FileType;J)V
    .locals 2
    .param p1, "fileType"    # Lorg/iq80/leveldb/impl/Filename$FileType;
    .param p2, "fileNumber"    # J

    .prologue
    .line 228
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 229
    const-string v0, "fileType is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    iput-object p1, p0, Lorg/iq80/leveldb/impl/Filename$FileInfo;->fileType:Lorg/iq80/leveldb/impl/Filename$FileType;

    .line 231
    iput-wide p2, p0, Lorg/iq80/leveldb/impl/Filename$FileInfo;->fileNumber:J

    .line 232
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 8
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 247
    if-ne p0, p1, :cond_1

    .line 263
    :cond_0
    :goto_0
    return v1

    .line 250
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 251
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 254
    check-cast v0, Lorg/iq80/leveldb/impl/Filename$FileInfo;

    .line 256
    .local v0, "fileInfo":Lorg/iq80/leveldb/impl/Filename$FileInfo;
    iget-wide v4, p0, Lorg/iq80/leveldb/impl/Filename$FileInfo;->fileNumber:J

    iget-wide v6, v0, Lorg/iq80/leveldb/impl/Filename$FileInfo;->fileNumber:J

    cmp-long v3, v4, v6

    if-eqz v3, :cond_4

    move v1, v2

    .line 257
    goto :goto_0

    .line 259
    :cond_4
    iget-object v3, p0, Lorg/iq80/leveldb/impl/Filename$FileInfo;->fileType:Lorg/iq80/leveldb/impl/Filename$FileType;

    iget-object v4, v0, Lorg/iq80/leveldb/impl/Filename$FileInfo;->fileType:Lorg/iq80/leveldb/impl/Filename$FileType;

    if-eq v3, v4, :cond_0

    move v1, v2

    .line 260
    goto :goto_0
.end method

.method public getFileNumber()J
    .locals 2

    .prologue
    .line 241
    iget-wide v0, p0, Lorg/iq80/leveldb/impl/Filename$FileInfo;->fileNumber:J

    return-wide v0
.end method

.method public getFileType()Lorg/iq80/leveldb/impl/Filename$FileType;
    .locals 1

    .prologue
    .line 236
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Filename$FileInfo;->fileType:Lorg/iq80/leveldb/impl/Filename$FileType;

    return-object v0
.end method

.method public hashCode()I
    .locals 7

    .prologue
    .line 269
    iget-object v1, p0, Lorg/iq80/leveldb/impl/Filename$FileInfo;->fileType:Lorg/iq80/leveldb/impl/Filename$FileType;

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/Filename$FileType;->hashCode()I

    move-result v0

    .line 270
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Lorg/iq80/leveldb/impl/Filename$FileInfo;->fileNumber:J

    iget-wide v4, p0, Lorg/iq80/leveldb/impl/Filename$FileInfo;->fileNumber:J

    const/16 v6, 0x20

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int v0, v1, v2

    .line 271
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 277
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 278
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "FileInfo"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    const-string v1, "{fileType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/Filename$FileInfo;->fileType:Lorg/iq80/leveldb/impl/Filename$FileType;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 280
    const-string v1, ", fileNumber="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/iq80/leveldb/impl/Filename$FileInfo;->fileNumber:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 281
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 282
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
