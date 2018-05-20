.class public Lorg/iq80/leveldb/impl/Compaction;
.super Ljava/lang/Object;
.source "Compaction.java"


# instance fields
.field private final edit:Lorg/iq80/leveldb/impl/VersionEdit;

.field private grandparentIndex:I

.field private final grandparents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;"
        }
    .end annotation
.end field

.field private final inputVersion:Lorg/iq80/leveldb/impl/Version;

.field private final inputs:[Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;"
        }
    .end annotation
.end field

.field private final level:I

.field private final levelInputs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;"
        }
    .end annotation
.end field

.field private final levelPointers:[I

.field private final levelUpInputs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;"
        }
    .end annotation
.end field

.field private final maxOutputFileSize:J

.field private overlappedBytes:J

.field private seenKey:Z


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/impl/Version;ILjava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .param p1, "inputVersion"    # Lorg/iq80/leveldb/impl/Version;
    .param p2, "level"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/iq80/leveldb/impl/Version;",
            "I",
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 65
    .local p3, "levelInputs":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    .local p4, "levelUpInputs":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    .local p5, "grandparents":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Lorg/iq80/leveldb/impl/VersionEdit;

    invoke-direct {v0}, Lorg/iq80/leveldb/impl/VersionEdit;-><init>()V

    iput-object v0, p0, Lorg/iq80/leveldb/impl/Compaction;->edit:Lorg/iq80/leveldb/impl/VersionEdit;

    .line 62
    const/4 v0, 0x7

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/iq80/leveldb/impl/Compaction;->levelPointers:[I

    .line 66
    iput-object p1, p0, Lorg/iq80/leveldb/impl/Compaction;->inputVersion:Lorg/iq80/leveldb/impl/Version;

    .line 67
    iput p2, p0, Lorg/iq80/leveldb/impl/Compaction;->level:I

    .line 68
    iput-object p3, p0, Lorg/iq80/leveldb/impl/Compaction;->levelInputs:Ljava/util/List;

    .line 69
    iput-object p4, p0, Lorg/iq80/leveldb/impl/Compaction;->levelUpInputs:Ljava/util/List;

    .line 70
    iput-object p5, p0, Lorg/iq80/leveldb/impl/Compaction;->grandparents:Ljava/util/List;

    .line 71
    invoke-static {p2}, Lorg/iq80/leveldb/impl/VersionSet;->maxFileSizeForLevel(I)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/iq80/leveldb/impl/Compaction;->maxOutputFileSize:J

    .line 72
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/util/List;

    const/4 v1, 0x0

    aput-object p3, v0, v1

    const/4 v1, 0x1

    aput-object p4, v0, v1

    iput-object v0, p0, Lorg/iq80/leveldb/impl/Compaction;->inputs:[Ljava/util/List;

    .line 73
    return-void
.end method

.method public static totalFileSize(Ljava/util/List;)J
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;)J"
        }
    .end annotation

    .prologue
    .line 128
    .local p0, "files":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    const-wide/16 v2, 0x0

    .line 129
    .local v2, "sum":J
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 130
    .local v0, "file":Lorg/iq80/leveldb/impl/FileMetaData;
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getFileSize()J

    move-result-wide v4

    add-long/2addr v2, v4

    .line 131
    goto :goto_0

    .line 132
    .end local v0    # "file":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_0
    return-wide v2
.end method


# virtual methods
.method public addInputDeletions(Lorg/iq80/leveldb/impl/VersionEdit;)V
    .locals 6
    .param p1, "edit"    # Lorg/iq80/leveldb/impl/VersionEdit;

    .prologue
    .line 138
    iget-object v1, p0, Lorg/iq80/leveldb/impl/Compaction;->levelInputs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 139
    .local v0, "input":Lorg/iq80/leveldb/impl/FileMetaData;
    iget v2, p0, Lorg/iq80/leveldb/impl/Compaction;->level:I

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getNumber()J

    move-result-wide v4

    invoke-virtual {p1, v2, v4, v5}, Lorg/iq80/leveldb/impl/VersionEdit;->deleteFile(IJ)V

    goto :goto_0

    .line 141
    .end local v0    # "input":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_0
    iget-object v1, p0, Lorg/iq80/leveldb/impl/Compaction;->levelUpInputs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 142
    .restart local v0    # "input":Lorg/iq80/leveldb/impl/FileMetaData;
    iget v2, p0, Lorg/iq80/leveldb/impl/Compaction;->level:I

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getNumber()J

    move-result-wide v4

    invoke-virtual {p1, v2, v4, v5}, Lorg/iq80/leveldb/impl/VersionEdit;->deleteFile(IJ)V

    goto :goto_1

    .line 144
    .end local v0    # "input":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_1
    return-void
.end method

.method public getEdit()Lorg/iq80/leveldb/impl/VersionEdit;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Compaction;->edit:Lorg/iq80/leveldb/impl/VersionEdit;

    return-object v0
.end method

.method public getInputs()[Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 201
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Compaction;->inputs:[Ljava/util/List;

    return-object v0
.end method

.method public getLevel()I
    .locals 1

    .prologue
    .line 77
    iget v0, p0, Lorg/iq80/leveldb/impl/Compaction;->level:I

    return v0
.end method

.method public getLevelInputs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 82
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Compaction;->levelInputs:Ljava/util/List;

    return-object v0
.end method

.method public getLevelUpInputs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Compaction;->levelUpInputs:Ljava/util/List;

    return-object v0
.end method

.method public getMaxOutputFileSize()J
    .locals 2

    .prologue
    .line 110
    iget-wide v0, p0, Lorg/iq80/leveldb/impl/Compaction;->maxOutputFileSize:J

    return-wide v0
.end method

.method public input(II)Lorg/iq80/leveldb/impl/FileMetaData;
    .locals 2
    .param p1, "which"    # I
    .param p2, "i"    # I

    .prologue
    const/4 v0, 0x1

    .line 98
    if-eqz p1, :cond_0

    if-ne p1, v0, :cond_1

    :cond_0
    :goto_0
    const-string v1, "which must be either 0 or 1"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 99
    if-nez p1, :cond_2

    .line 100
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Compaction;->levelInputs:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 103
    :goto_1
    return-object v0

    .line 98
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 103
    :cond_2
    iget-object v0, p0, Lorg/iq80/leveldb/impl/Compaction;->levelUpInputs:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/FileMetaData;

    goto :goto_1
.end method

.method public isBaseLevelForKey(Lorg/iq80/leveldb/util/Slice;)Z
    .locals 6
    .param p1, "userKey"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 152
    iget-object v4, p0, Lorg/iq80/leveldb/impl/Compaction;->inputVersion:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/Version;->getInternalKeyComparator()Lorg/iq80/leveldb/impl/InternalKeyComparator;

    move-result-object v4

    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->getUserComparator()Lorg/iq80/leveldb/table/UserComparator;

    move-result-object v3

    .line 153
    .local v3, "userComparator":Lorg/iq80/leveldb/table/UserComparator;
    iget v4, p0, Lorg/iq80/leveldb/impl/Compaction;->level:I

    add-int/lit8 v2, v4, 0x2

    .local v2, "level":I
    :goto_0
    const/4 v4, 0x7

    if-ge v2, v4, :cond_2

    .line 154
    iget-object v4, p0, Lorg/iq80/leveldb/impl/Compaction;->inputVersion:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v4, v2}, Lorg/iq80/leveldb/impl/Version;->getFiles(I)Ljava/util/List;

    move-result-object v1

    .line 155
    .local v1, "files":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    :goto_1
    iget-object v4, p0, Lorg/iq80/leveldb/impl/Compaction;->levelPointers:[I

    aget v4, v4, v2

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_1

    .line 156
    iget-object v4, p0, Lorg/iq80/leveldb/impl/Compaction;->levelPointers:[I

    aget v4, v4, v2

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/FileMetaData;

    .line 157
    .local v0, "f":Lorg/iq80/leveldb/impl/FileMetaData;
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getLargest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v4

    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v4

    invoke-interface {v3, p1, v4}, Lorg/iq80/leveldb/table/UserComparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v4

    if-gtz v4, :cond_0

    .line 159
    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/FileMetaData;->getSmallest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v4

    invoke-virtual {v4}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v4

    invoke-interface {v3, p1, v4}, Lorg/iq80/leveldb/table/UserComparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v4

    if-ltz v4, :cond_1

    .line 161
    const/4 v4, 0x0

    .line 168
    .end local v0    # "f":Lorg/iq80/leveldb/impl/FileMetaData;
    .end local v1    # "files":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    :goto_2
    return v4

    .line 165
    .restart local v0    # "f":Lorg/iq80/leveldb/impl/FileMetaData;
    .restart local v1    # "files":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    :cond_0
    iget-object v4, p0, Lorg/iq80/leveldb/impl/Compaction;->levelPointers:[I

    aget v5, v4, v2

    add-int/lit8 v5, v5, 0x1

    aput v5, v4, v2

    goto :goto_1

    .line 153
    .end local v0    # "f":Lorg/iq80/leveldb/impl/FileMetaData;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 168
    .end local v1    # "files":Ljava/util/List;, "Ljava/util/List<Lorg/iq80/leveldb/impl/FileMetaData;>;"
    :cond_2
    const/4 v4, 0x1

    goto :goto_2
.end method

.method public isTrivialMove()Z
    .locals 6

    .prologue
    const/4 v0, 0x1

    .line 120
    iget-object v1, p0, Lorg/iq80/leveldb/impl/Compaction;->levelInputs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v1, v0, :cond_0

    iget-object v1, p0, Lorg/iq80/leveldb/impl/Compaction;->levelUpInputs:Ljava/util/List;

    .line 121
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/iq80/leveldb/impl/Compaction;->grandparents:Ljava/util/List;

    .line 122
    invoke-static {v1}, Lorg/iq80/leveldb/impl/Compaction;->totalFileSize(Ljava/util/List;)J

    move-result-wide v2

    const-wide/32 v4, 0x1400000

    cmp-long v1, v2, v4

    if-gtz v1, :cond_0

    .line 120
    :goto_0
    return v0

    .line 122
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public shouldStopBefore(Lorg/iq80/leveldb/impl/InternalKey;)Z
    .locals 8
    .param p1, "internalKey"    # Lorg/iq80/leveldb/impl/InternalKey;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 175
    iget-object v1, p0, Lorg/iq80/leveldb/impl/Compaction;->grandparents:Ljava/util/List;

    if-nez v1, :cond_0

    move v1, v2

    .line 195
    :goto_0
    return v1

    .line 180
    :cond_0
    iget-object v1, p0, Lorg/iq80/leveldb/impl/Compaction;->inputVersion:Lorg/iq80/leveldb/impl/Version;

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/Version;->getInternalKeyComparator()Lorg/iq80/leveldb/impl/InternalKeyComparator;

    move-result-object v0

    .line 181
    .local v0, "internalKeyComparator":Lorg/iq80/leveldb/impl/InternalKeyComparator;
    :goto_1
    iget v1, p0, Lorg/iq80/leveldb/impl/Compaction;->grandparentIndex:I

    iget-object v4, p0, Lorg/iq80/leveldb/impl/Compaction;->grandparents:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v1, v4, :cond_2

    iget-object v1, p0, Lorg/iq80/leveldb/impl/Compaction;->grandparents:Ljava/util/List;

    iget v4, p0, Lorg/iq80/leveldb/impl/Compaction;->grandparentIndex:I

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/impl/FileMetaData;

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/FileMetaData;->getLargest()Lorg/iq80/leveldb/impl/InternalKey;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lorg/iq80/leveldb/impl/InternalKeyComparator;->compare(Lorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)I

    move-result v1

    if-lez v1, :cond_2

    .line 182
    iget-boolean v1, p0, Lorg/iq80/leveldb/impl/Compaction;->seenKey:Z

    if-eqz v1, :cond_1

    .line 183
    iget-wide v4, p0, Lorg/iq80/leveldb/impl/Compaction;->overlappedBytes:J

    iget-object v1, p0, Lorg/iq80/leveldb/impl/Compaction;->grandparents:Ljava/util/List;

    iget v6, p0, Lorg/iq80/leveldb/impl/Compaction;->grandparentIndex:I

    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/iq80/leveldb/impl/FileMetaData;

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/FileMetaData;->getFileSize()J

    move-result-wide v6

    add-long/2addr v4, v6

    iput-wide v4, p0, Lorg/iq80/leveldb/impl/Compaction;->overlappedBytes:J

    .line 185
    :cond_1
    iget v1, p0, Lorg/iq80/leveldb/impl/Compaction;->grandparentIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/iq80/leveldb/impl/Compaction;->grandparentIndex:I

    goto :goto_1

    .line 187
    :cond_2
    iput-boolean v3, p0, Lorg/iq80/leveldb/impl/Compaction;->seenKey:Z

    .line 189
    iget-wide v4, p0, Lorg/iq80/leveldb/impl/Compaction;->overlappedBytes:J

    const-wide/32 v6, 0x1400000

    cmp-long v1, v4, v6

    if-lez v1, :cond_3

    .line 191
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lorg/iq80/leveldb/impl/Compaction;->overlappedBytes:J

    move v1, v3

    .line 192
    goto :goto_0

    :cond_3
    move v1, v2

    .line 195
    goto :goto_0
.end method
