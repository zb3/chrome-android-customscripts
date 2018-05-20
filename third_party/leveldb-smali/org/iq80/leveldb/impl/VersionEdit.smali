.class public Lorg/iq80/leveldb/impl/VersionEdit;
.super Ljava/lang/Object;
.source "VersionEdit.java"


# instance fields
.field private final compactPointers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            ">;"
        }
    .end annotation
.end field

.field private comparatorName:Ljava/lang/String;

.field private final deletedFiles:Lcom/google/common/collect/Multimap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Multimap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private lastSequenceNumber:Ljava/lang/Long;

.field private logNumber:Ljava/lang/Long;

.field private final newFiles:Lcom/google/common/collect/Multimap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Multimap",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;"
        }
    .end annotation
.end field

.field private nextFileNumber:Ljava/lang/Long;

.field private previousLogNumber:Ljava/lang/Long;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    invoke-static {}, Lcom/google/common/collect/Maps;->newTreeMap()Ljava/util/TreeMap;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/VersionEdit;->compactPointers:Ljava/util/Map;

    .line 40
    invoke-static {}, Lcom/google/common/collect/ArrayListMultimap;->create()Lcom/google/common/collect/ArrayListMultimap;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/VersionEdit;->newFiles:Lcom/google/common/collect/Multimap;

    .line 41
    invoke-static {}, Lcom/google/common/collect/ArrayListMultimap;->create()Lcom/google/common/collect/ArrayListMultimap;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/VersionEdit;->deletedFiles:Lcom/google/common/collect/Multimap;

    .line 45
    return-void
.end method

.method public constructor <init>(Lorg/iq80/leveldb/util/Slice;)V
    .locals 4
    .param p1, "slice"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    invoke-static {}, Lcom/google/common/collect/Maps;->newTreeMap()Ljava/util/TreeMap;

    move-result-object v3

    iput-object v3, p0, Lorg/iq80/leveldb/impl/VersionEdit;->compactPointers:Ljava/util/Map;

    .line 40
    invoke-static {}, Lcom/google/common/collect/ArrayListMultimap;->create()Lcom/google/common/collect/ArrayListMultimap;

    move-result-object v3

    iput-object v3, p0, Lorg/iq80/leveldb/impl/VersionEdit;->newFiles:Lcom/google/common/collect/Multimap;

    .line 41
    invoke-static {}, Lcom/google/common/collect/ArrayListMultimap;->create()Lcom/google/common/collect/ArrayListMultimap;

    move-result-object v3

    iput-object v3, p0, Lorg/iq80/leveldb/impl/VersionEdit;->deletedFiles:Lcom/google/common/collect/Multimap;

    .line 49
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->input()Lorg/iq80/leveldb/util/SliceInput;

    move-result-object v1

    .line 50
    .local v1, "sliceInput":Lorg/iq80/leveldb/util/SliceInput;
    :goto_0
    invoke-virtual {v1}, Lorg/iq80/leveldb/util/SliceInput;->isReadable()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 51
    invoke-static {v1}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->readVariableLengthInt(Lorg/iq80/leveldb/util/SliceInput;)I

    move-result v0

    .line 52
    .local v0, "i":I
    invoke-static {v0}, Lorg/iq80/leveldb/impl/VersionEditTag;->getValueTypeByPersistentId(I)Lorg/iq80/leveldb/impl/VersionEditTag;

    move-result-object v2

    .line 53
    .local v2, "tag":Lorg/iq80/leveldb/impl/VersionEditTag;
    invoke-virtual {v2, v1, p0}, Lorg/iq80/leveldb/impl/VersionEditTag;->readValue(Lorg/iq80/leveldb/util/SliceInput;Lorg/iq80/leveldb/impl/VersionEdit;)V

    goto :goto_0

    .line 55
    .end local v0    # "i":I
    .end local v2    # "tag":Lorg/iq80/leveldb/impl/VersionEditTag;
    :cond_0
    return-void
.end method


# virtual methods
.method public addFile(IJJLorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)V
    .locals 8
    .param p1, "level"    # I
    .param p2, "fileNumber"    # J
    .param p4, "fileSize"    # J
    .param p6, "smallest"    # Lorg/iq80/leveldb/impl/InternalKey;
    .param p7, "largest"    # Lorg/iq80/leveldb/impl/InternalKey;

    .prologue
    .line 135
    new-instance v1, Lorg/iq80/leveldb/impl/FileMetaData;

    move-wide v2, p2

    move-wide v4, p4

    move-object v6, p6

    move-object v7, p7

    invoke-direct/range {v1 .. v7}, Lorg/iq80/leveldb/impl/FileMetaData;-><init>(JJLorg/iq80/leveldb/impl/InternalKey;Lorg/iq80/leveldb/impl/InternalKey;)V

    .line 136
    .local v1, "fileMetaData":Lorg/iq80/leveldb/impl/FileMetaData;
    invoke-virtual {p0, p1, v1}, Lorg/iq80/leveldb/impl/VersionEdit;->addFile(ILorg/iq80/leveldb/impl/FileMetaData;)V

    .line 137
    return-void
.end method

.method public addFile(ILorg/iq80/leveldb/impl/FileMetaData;)V
    .locals 2
    .param p1, "level"    # I
    .param p2, "fileMetaData"    # Lorg/iq80/leveldb/impl/FileMetaData;

    .prologue
    .line 141
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionEdit;->newFiles:Lcom/google/common/collect/Multimap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Lcom/google/common/collect/Multimap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 142
    return-void
.end method

.method public addFiles(Lcom/google/common/collect/Multimap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Multimap",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 146
    .local p1, "files":Lcom/google/common/collect/Multimap;, "Lcom/google/common/collect/Multimap<Ljava/lang/Integer;Lorg/iq80/leveldb/impl/FileMetaData;>;"
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionEdit;->newFiles:Lcom/google/common/collect/Multimap;

    invoke-interface {v0, p1}, Lcom/google/common/collect/Multimap;->putAll(Lcom/google/common/collect/Multimap;)Z

    .line 147
    return-void
.end method

.method public deleteFile(IJ)V
    .locals 4
    .param p1, "level"    # I
    .param p2, "fileNumber"    # J

    .prologue
    .line 157
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionEdit;->deletedFiles:Lcom/google/common/collect/Multimap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/google/common/collect/Multimap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 158
    return-void
.end method

.method public encode()Lorg/iq80/leveldb/util/Slice;
    .locals 5

    .prologue
    .line 162
    new-instance v0, Lorg/iq80/leveldb/util/DynamicSliceOutput;

    const/16 v2, 0x1000

    invoke-direct {v0, v2}, Lorg/iq80/leveldb/util/DynamicSliceOutput;-><init>(I)V

    .line 163
    .local v0, "dynamicSliceOutput":Lorg/iq80/leveldb/util/DynamicSliceOutput;
    invoke-static {}, Lorg/iq80/leveldb/impl/VersionEditTag;->values()[Lorg/iq80/leveldb/impl/VersionEditTag;

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v4, :cond_0

    aget-object v1, v3, v2

    .line 164
    .local v1, "versionEditTag":Lorg/iq80/leveldb/impl/VersionEditTag;
    invoke-virtual {v1, v0, p0}, Lorg/iq80/leveldb/impl/VersionEditTag;->writeValue(Lorg/iq80/leveldb/util/SliceOutput;Lorg/iq80/leveldb/impl/VersionEdit;)V

    .line 163
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 166
    .end local v1    # "versionEditTag":Lorg/iq80/leveldb/impl/VersionEditTag;
    :cond_0
    invoke-virtual {v0}, Lorg/iq80/leveldb/util/DynamicSliceOutput;->slice()Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    return-object v2
.end method

.method public getCompactPointers()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            ">;"
        }
    .end annotation

    .prologue
    .line 109
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionEdit;->compactPointers:Ljava/util/Map;

    invoke-static {v0}, Lcom/google/common/collect/ImmutableMap;->copyOf(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    return-object v0
.end method

.method public getComparatorName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionEdit;->comparatorName:Ljava/lang/String;

    return-object v0
.end method

.method public getDeletedFiles()Lcom/google/common/collect/Multimap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multimap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 151
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionEdit;->deletedFiles:Lcom/google/common/collect/Multimap;

    invoke-static {v0}, Lcom/google/common/collect/ImmutableMultimap;->copyOf(Lcom/google/common/collect/Multimap;)Lcom/google/common/collect/ImmutableMultimap;

    move-result-object v0

    return-object v0
.end method

.method public getLastSequenceNumber()Ljava/lang/Long;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionEdit;->lastSequenceNumber:Ljava/lang/Long;

    return-object v0
.end method

.method public getLogNumber()Ljava/lang/Long;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionEdit;->logNumber:Ljava/lang/Long;

    return-object v0
.end method

.method public getNewFiles()Lcom/google/common/collect/Multimap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multimap",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/iq80/leveldb/impl/FileMetaData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 124
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionEdit;->newFiles:Lcom/google/common/collect/Multimap;

    invoke-static {v0}, Lcom/google/common/collect/ImmutableMultimap;->copyOf(Lcom/google/common/collect/Multimap;)Lcom/google/common/collect/ImmutableMultimap;

    move-result-object v0

    return-object v0
.end method

.method public getNextFileNumber()Ljava/lang/Long;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionEdit;->nextFileNumber:Ljava/lang/Long;

    return-object v0
.end method

.method public getPreviousLogNumber()Ljava/lang/Long;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionEdit;->previousLogNumber:Ljava/lang/Long;

    return-object v0
.end method

.method public setCompactPointer(ILorg/iq80/leveldb/impl/InternalKey;)V
    .locals 2
    .param p1, "level"    # I
    .param p2, "key"    # Lorg/iq80/leveldb/impl/InternalKey;

    .prologue
    .line 114
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionEdit;->compactPointers:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    return-void
.end method

.method public setCompactPointers(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/iq80/leveldb/impl/InternalKey;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 119
    .local p1, "compactPointers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lorg/iq80/leveldb/impl/InternalKey;>;"
    iget-object v0, p0, Lorg/iq80/leveldb/impl/VersionEdit;->compactPointers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 120
    return-void
.end method

.method public setComparatorName(Ljava/lang/String;)V
    .locals 0
    .param p1, "comparatorName"    # Ljava/lang/String;

    .prologue
    .line 64
    iput-object p1, p0, Lorg/iq80/leveldb/impl/VersionEdit;->comparatorName:Ljava/lang/String;

    .line 65
    return-void
.end method

.method public setLastSequenceNumber(J)V
    .locals 1
    .param p1, "lastSequenceNumber"    # J

    .prologue
    .line 104
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/VersionEdit;->lastSequenceNumber:Ljava/lang/Long;

    .line 105
    return-void
.end method

.method public setLogNumber(J)V
    .locals 1
    .param p1, "logNumber"    # J

    .prologue
    .line 74
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/VersionEdit;->logNumber:Ljava/lang/Long;

    .line 75
    return-void
.end method

.method public setNextFileNumber(J)V
    .locals 1
    .param p1, "nextFileNumber"    # J

    .prologue
    .line 84
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/VersionEdit;->nextFileNumber:Ljava/lang/Long;

    .line 85
    return-void
.end method

.method public setPreviousLogNumber(J)V
    .locals 1
    .param p1, "previousLogNumber"    # J

    .prologue
    .line 94
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/VersionEdit;->previousLogNumber:Ljava/lang/Long;

    .line 95
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 172
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 173
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "VersionEdit"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    const-string v1, "{comparatorName=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/VersionEdit;->comparatorName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x27

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 175
    const-string v1, ", logNumber="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/VersionEdit;->logNumber:Ljava/lang/Long;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 176
    const-string v1, ", previousLogNumber="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/VersionEdit;->previousLogNumber:Ljava/lang/Long;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 177
    const-string v1, ", lastSequenceNumber="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/VersionEdit;->lastSequenceNumber:Ljava/lang/Long;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 178
    const-string v1, ", compactPointers="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/VersionEdit;->compactPointers:Ljava/util/Map;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 179
    const-string v1, ", newFiles="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/VersionEdit;->newFiles:Lcom/google/common/collect/Multimap;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 180
    const-string v1, ", deletedFiles="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/impl/VersionEdit;->deletedFiles:Lcom/google/common/collect/Multimap;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 181
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 182
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
