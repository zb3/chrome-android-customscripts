.class public final Lorg/iq80/leveldb/util/TableIterator;
.super Lorg/iq80/leveldb/util/AbstractSeekingIterator;
.source "TableIterator.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/iq80/leveldb/util/AbstractSeekingIterator",
        "<",
        "Lorg/iq80/leveldb/util/Slice;",
        "Lorg/iq80/leveldb/util/Slice;",
        ">;"
    }
.end annotation


# instance fields
.field private final blockIterator:Lorg/iq80/leveldb/table/BlockIterator;

.field private current:Lorg/iq80/leveldb/table/BlockIterator;

.field private final table:Lorg/iq80/leveldb/table/Table;


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/table/Table;Lorg/iq80/leveldb/table/BlockIterator;)V
    .locals 1
    .param p1, "table"    # Lorg/iq80/leveldb/table/Table;
    .param p2, "blockIterator"    # Lorg/iq80/leveldb/table/BlockIterator;

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/iq80/leveldb/util/AbstractSeekingIterator;-><init>()V

    .line 35
    iput-object p1, p0, Lorg/iq80/leveldb/util/TableIterator;->table:Lorg/iq80/leveldb/table/Table;

    .line 36
    iput-object p2, p0, Lorg/iq80/leveldb/util/TableIterator;->blockIterator:Lorg/iq80/leveldb/table/BlockIterator;

    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/iq80/leveldb/util/TableIterator;->current:Lorg/iq80/leveldb/table/BlockIterator;

    .line 38
    return-void
.end method

.method private getNextBlock()Lorg/iq80/leveldb/table/BlockIterator;
    .locals 3

    .prologue
    .line 101
    iget-object v2, p0, Lorg/iq80/leveldb/util/TableIterator;->blockIterator:Lorg/iq80/leveldb/table/BlockIterator;

    invoke-virtual {v2}, Lorg/iq80/leveldb/table/BlockIterator;->next()Lorg/iq80/leveldb/table/BlockEntry;

    move-result-object v2

    invoke-virtual {v2}, Lorg/iq80/leveldb/table/BlockEntry;->getValue()Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    .line 102
    .local v0, "blockHandle":Lorg/iq80/leveldb/util/Slice;
    iget-object v2, p0, Lorg/iq80/leveldb/util/TableIterator;->table:Lorg/iq80/leveldb/table/Table;

    invoke-virtual {v2, v0}, Lorg/iq80/leveldb/table/Table;->openBlock(Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/table/Block;

    move-result-object v1

    .line 103
    .local v1, "dataBlock":Lorg/iq80/leveldb/table/Block;
    invoke-virtual {v1}, Lorg/iq80/leveldb/table/Block;->iterator()Lorg/iq80/leveldb/table/BlockIterator;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method protected getNextElement()Ljava/util/Map$Entry;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<",
            "Lorg/iq80/leveldb/util/Slice;",
            "Lorg/iq80/leveldb/util/Slice;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 72
    const/4 v0, 0x0

    .line 74
    .local v0, "currentHasNext":Z
    :goto_0
    iget-object v2, p0, Lorg/iq80/leveldb/util/TableIterator;->current:Lorg/iq80/leveldb/table/BlockIterator;

    if-eqz v2, :cond_0

    .line 75
    iget-object v2, p0, Lorg/iq80/leveldb/util/TableIterator;->current:Lorg/iq80/leveldb/table/BlockIterator;

    invoke-virtual {v2}, Lorg/iq80/leveldb/table/BlockIterator;->hasNext()Z

    move-result v0

    .line 77
    :cond_0
    if-nez v0, :cond_1

    .line 78
    iget-object v2, p0, Lorg/iq80/leveldb/util/TableIterator;->blockIterator:Lorg/iq80/leveldb/table/BlockIterator;

    invoke-virtual {v2}, Lorg/iq80/leveldb/table/BlockIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 79
    invoke-direct {p0}, Lorg/iq80/leveldb/util/TableIterator;->getNextBlock()Lorg/iq80/leveldb/table/BlockIterator;

    move-result-object v2

    iput-object v2, p0, Lorg/iq80/leveldb/util/TableIterator;->current:Lorg/iq80/leveldb/table/BlockIterator;

    goto :goto_0

    .line 89
    :cond_1
    if-eqz v0, :cond_2

    .line 90
    iget-object v1, p0, Lorg/iq80/leveldb/util/TableIterator;->current:Lorg/iq80/leveldb/table/BlockIterator;

    invoke-virtual {v1}, Lorg/iq80/leveldb/table/BlockIterator;->next()Lorg/iq80/leveldb/table/BlockEntry;

    move-result-object v1

    .line 95
    :goto_1
    return-object v1

    .line 94
    :cond_2
    iput-object v1, p0, Lorg/iq80/leveldb/util/TableIterator;->current:Lorg/iq80/leveldb/table/BlockIterator;

    goto :goto_1
.end method

.method protected bridge synthetic seekInternal(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 26
    check-cast p1, Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/util/TableIterator;->seekInternal(Lorg/iq80/leveldb/util/Slice;)V

    return-void
.end method

.method protected seekInternal(Lorg/iq80/leveldb/util/Slice;)V
    .locals 1
    .param p1, "targetKey"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 52
    iget-object v0, p0, Lorg/iq80/leveldb/util/TableIterator;->blockIterator:Lorg/iq80/leveldb/table/BlockIterator;

    invoke-virtual {v0, p1}, Lorg/iq80/leveldb/table/BlockIterator;->seek(Lorg/iq80/leveldb/util/Slice;)V

    .line 55
    iget-object v0, p0, Lorg/iq80/leveldb/util/TableIterator;->blockIterator:Lorg/iq80/leveldb/table/BlockIterator;

    invoke-virtual {v0}, Lorg/iq80/leveldb/table/BlockIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 57
    invoke-direct {p0}, Lorg/iq80/leveldb/util/TableIterator;->getNextBlock()Lorg/iq80/leveldb/table/BlockIterator;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/util/TableIterator;->current:Lorg/iq80/leveldb/table/BlockIterator;

    .line 58
    iget-object v0, p0, Lorg/iq80/leveldb/util/TableIterator;->current:Lorg/iq80/leveldb/table/BlockIterator;

    invoke-virtual {v0, p1}, Lorg/iq80/leveldb/table/BlockIterator;->seek(Lorg/iq80/leveldb/util/Slice;)V

    .line 63
    :goto_0
    return-void

    .line 61
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/iq80/leveldb/util/TableIterator;->current:Lorg/iq80/leveldb/table/BlockIterator;

    goto :goto_0
.end method

.method protected seekToFirstInternal()V
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lorg/iq80/leveldb/util/TableIterator;->blockIterator:Lorg/iq80/leveldb/table/BlockIterator;

    invoke-virtual {v0}, Lorg/iq80/leveldb/table/BlockIterator;->seekToFirst()V

    .line 45
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/iq80/leveldb/util/TableIterator;->current:Lorg/iq80/leveldb/table/BlockIterator;

    .line 46
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 110
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "ConcatenatingIterator"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    const-string v1, "{blockIterator="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/util/TableIterator;->blockIterator:Lorg/iq80/leveldb/table/BlockIterator;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 112
    const-string v1, ", current="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/iq80/leveldb/util/TableIterator;->current:Lorg/iq80/leveldb/table/BlockIterator;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 113
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 114
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
