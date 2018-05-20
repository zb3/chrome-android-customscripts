.class public Lorg/iq80/leveldb/table/Footer;
.super Ljava/lang/Object;
.source "Footer.java"


# static fields
.field public static final ENCODED_LENGTH:I = 0x30


# instance fields
.field private final indexBlockHandle:Lorg/iq80/leveldb/table/BlockHandle;

.field private final metaindexBlockHandle:Lorg/iq80/leveldb/table/BlockHandle;


# direct methods
.method constructor <init>(Lorg/iq80/leveldb/table/BlockHandle;Lorg/iq80/leveldb/table/BlockHandle;)V
    .locals 0
    .param p1, "metaindexBlockHandle"    # Lorg/iq80/leveldb/table/BlockHandle;
    .param p2, "indexBlockHandle"    # Lorg/iq80/leveldb/table/BlockHandle;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lorg/iq80/leveldb/table/Footer;->metaindexBlockHandle:Lorg/iq80/leveldb/table/BlockHandle;

    .line 40
    iput-object p2, p0, Lorg/iq80/leveldb/table/Footer;->indexBlockHandle:Lorg/iq80/leveldb/table/BlockHandle;

    .line 41
    return-void
.end method

.method public static readFooter(Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/table/Footer;
    .locals 12
    .param p0, "slice"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    const/16 v10, 0x30

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 55
    const-string v5, "slice is null"

    invoke-static {p0, v5}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v5

    if-ne v5, v10, :cond_0

    move v5, v6

    :goto_0
    const-string v8, "Expected slice.size to be %s but was %s"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v7

    invoke-virtual {p0}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v6

    invoke-static {v5, v8, v9}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 58
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/Slice;->input()Lorg/iq80/leveldb/util/SliceInput;

    move-result-object v4

    .line 61
    .local v4, "sliceInput":Lorg/iq80/leveldb/util/SliceInput;
    invoke-static {v4}, Lorg/iq80/leveldb/table/BlockHandle;->readBlockHandle(Lorg/iq80/leveldb/util/SliceInput;)Lorg/iq80/leveldb/table/BlockHandle;

    move-result-object v1

    .line 62
    .local v1, "metaindexBlockHandle":Lorg/iq80/leveldb/table/BlockHandle;
    invoke-static {v4}, Lorg/iq80/leveldb/table/BlockHandle;->readBlockHandle(Lorg/iq80/leveldb/util/SliceInput;)Lorg/iq80/leveldb/table/BlockHandle;

    move-result-object v0

    .line 65
    .local v0, "indexBlockHandle":Lorg/iq80/leveldb/table/BlockHandle;
    const/16 v5, 0x28

    invoke-virtual {v4, v5}, Lorg/iq80/leveldb/util/SliceInput;->setPosition(I)V

    .line 68
    invoke-virtual {v4}, Lorg/iq80/leveldb/util/SliceInput;->readUnsignedInt()J

    move-result-wide v8

    invoke-virtual {v4}, Lorg/iq80/leveldb/util/SliceInput;->readUnsignedInt()J

    move-result-wide v10

    const/16 v5, 0x20

    shl-long/2addr v10, v5

    or-long v2, v8, v10

    .line 69
    .local v2, "magicNumber":J
    const-wide v8, -0x24b88adb747f04a9L    # -5.203211663106617E131

    cmp-long v5, v2, v8

    if-nez v5, :cond_1

    :goto_1
    const-string v5, "File is not a table (bad magic number)"

    invoke-static {v6, v5}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 71
    new-instance v5, Lorg/iq80/leveldb/table/Footer;

    invoke-direct {v5, v1, v0}, Lorg/iq80/leveldb/table/Footer;-><init>(Lorg/iq80/leveldb/table/BlockHandle;Lorg/iq80/leveldb/table/BlockHandle;)V

    return-object v5

    .end local v0    # "indexBlockHandle":Lorg/iq80/leveldb/table/BlockHandle;
    .end local v1    # "metaindexBlockHandle":Lorg/iq80/leveldb/table/BlockHandle;
    .end local v2    # "magicNumber":J
    .end local v4    # "sliceInput":Lorg/iq80/leveldb/util/SliceInput;
    :cond_0
    move v5, v7

    .line 56
    goto :goto_0

    .restart local v0    # "indexBlockHandle":Lorg/iq80/leveldb/table/BlockHandle;
    .restart local v1    # "metaindexBlockHandle":Lorg/iq80/leveldb/table/BlockHandle;
    .restart local v2    # "magicNumber":J
    .restart local v4    # "sliceInput":Lorg/iq80/leveldb/util/SliceInput;
    :cond_1
    move v6, v7

    .line 69
    goto :goto_1
.end method

.method public static writeFooter(Lorg/iq80/leveldb/table/Footer;)Lorg/iq80/leveldb/util/Slice;
    .locals 2
    .param p0, "footer"    # Lorg/iq80/leveldb/table/Footer;

    .prologue
    .line 76
    const/16 v1, 0x30

    invoke-static {v1}, Lorg/iq80/leveldb/util/Slices;->allocate(I)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    .line 77
    .local v0, "slice":Lorg/iq80/leveldb/util/Slice;
    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Slice;->output()Lorg/iq80/leveldb/util/SliceOutput;

    move-result-object v1

    invoke-static {p0, v1}, Lorg/iq80/leveldb/table/Footer;->writeFooter(Lorg/iq80/leveldb/table/Footer;Lorg/iq80/leveldb/util/SliceOutput;)V

    .line 78
    return-object v0
.end method

.method public static writeFooter(Lorg/iq80/leveldb/table/Footer;Lorg/iq80/leveldb/util/SliceOutput;)V
    .locals 2
    .param p0, "footer"    # Lorg/iq80/leveldb/table/Footer;
    .param p1, "sliceOutput"    # Lorg/iq80/leveldb/util/SliceOutput;

    .prologue
    .line 84
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/SliceOutput;->size()I

    move-result v0

    .line 87
    .local v0, "startingWriteIndex":I
    invoke-virtual {p0}, Lorg/iq80/leveldb/table/Footer;->getMetaindexBlockHandle()Lorg/iq80/leveldb/table/BlockHandle;

    move-result-object v1

    invoke-static {v1, p1}, Lorg/iq80/leveldb/table/BlockHandle;->writeBlockHandleTo(Lorg/iq80/leveldb/table/BlockHandle;Lorg/iq80/leveldb/util/SliceOutput;)V

    .line 88
    invoke-virtual {p0}, Lorg/iq80/leveldb/table/Footer;->getIndexBlockHandle()Lorg/iq80/leveldb/table/BlockHandle;

    move-result-object v1

    invoke-static {v1, p1}, Lorg/iq80/leveldb/table/BlockHandle;->writeBlockHandleTo(Lorg/iq80/leveldb/table/BlockHandle;Lorg/iq80/leveldb/util/SliceOutput;)V

    .line 91
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/SliceOutput;->size()I

    move-result v1

    sub-int/2addr v1, v0

    rsub-int/lit8 v1, v1, 0x28

    invoke-virtual {p1, v1}, Lorg/iq80/leveldb/util/SliceOutput;->writeZero(I)V

    .line 94
    const v1, -0x747f04a9

    invoke-virtual {p1, v1}, Lorg/iq80/leveldb/util/SliceOutput;->writeInt(I)V

    .line 95
    const v1, -0x24b88adc

    invoke-virtual {p1, v1}, Lorg/iq80/leveldb/util/SliceOutput;->writeInt(I)V

    .line 96
    return-void
.end method


# virtual methods
.method public getIndexBlockHandle()Lorg/iq80/leveldb/table/BlockHandle;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lorg/iq80/leveldb/table/Footer;->indexBlockHandle:Lorg/iq80/leveldb/table/BlockHandle;

    return-object v0
.end method

.method public getMetaindexBlockHandle()Lorg/iq80/leveldb/table/BlockHandle;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lorg/iq80/leveldb/table/Footer;->metaindexBlockHandle:Lorg/iq80/leveldb/table/BlockHandle;

    return-object v0
.end method
