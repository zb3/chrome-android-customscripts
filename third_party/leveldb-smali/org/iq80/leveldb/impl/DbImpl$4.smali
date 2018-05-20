.class Lorg/iq80/leveldb/impl/DbImpl$4;
.super Ljava/lang/Object;
.source "DbImpl.java"

# interfaces
.implements Lorg/iq80/leveldb/impl/WriteBatchImpl$Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/iq80/leveldb/impl/DbImpl;->writeWriteBatch(Lorg/iq80/leveldb/impl/WriteBatchImpl;J)Lorg/iq80/leveldb/util/Slice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/iq80/leveldb/impl/DbImpl;

.field final synthetic val$sliceOutput:Lorg/iq80/leveldb/util/SliceOutput;


# direct methods
.method constructor <init>(Lorg/iq80/leveldb/impl/DbImpl;Lorg/iq80/leveldb/util/SliceOutput;)V
    .locals 0
    .param p1, "this$0"    # Lorg/iq80/leveldb/impl/DbImpl;

    .prologue
    .line 1335
    iput-object p1, p0, Lorg/iq80/leveldb/impl/DbImpl$4;->this$0:Lorg/iq80/leveldb/impl/DbImpl;

    iput-object p2, p0, Lorg/iq80/leveldb/impl/DbImpl$4;->val$sliceOutput:Lorg/iq80/leveldb/util/SliceOutput;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public delete(Lorg/iq80/leveldb/util/Slice;)V
    .locals 2
    .param p1, "key"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 1347
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl$4;->val$sliceOutput:Lorg/iq80/leveldb/util/SliceOutput;

    sget-object v1, Lorg/iq80/leveldb/impl/ValueType;->DELETION:Lorg/iq80/leveldb/impl/ValueType;

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/ValueType;->getPersistentId()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 1348
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl$4;->val$sliceOutput:Lorg/iq80/leveldb/util/SliceOutput;

    invoke-static {v0, p1}, Lorg/iq80/leveldb/util/Slices;->writeLengthPrefixedBytes(Lorg/iq80/leveldb/util/SliceOutput;Lorg/iq80/leveldb/util/Slice;)V

    .line 1349
    return-void
.end method

.method public put(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)V
    .locals 2
    .param p1, "key"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "value"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 1339
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl$4;->val$sliceOutput:Lorg/iq80/leveldb/util/SliceOutput;

    sget-object v1, Lorg/iq80/leveldb/impl/ValueType;->VALUE:Lorg/iq80/leveldb/impl/ValueType;

    invoke-virtual {v1}, Lorg/iq80/leveldb/impl/ValueType;->getPersistentId()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 1340
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl$4;->val$sliceOutput:Lorg/iq80/leveldb/util/SliceOutput;

    invoke-static {v0, p1}, Lorg/iq80/leveldb/util/Slices;->writeLengthPrefixedBytes(Lorg/iq80/leveldb/util/SliceOutput;Lorg/iq80/leveldb/util/Slice;)V

    .line 1341
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl$4;->val$sliceOutput:Lorg/iq80/leveldb/util/SliceOutput;

    invoke-static {v0, p2}, Lorg/iq80/leveldb/util/Slices;->writeLengthPrefixedBytes(Lorg/iq80/leveldb/util/SliceOutput;Lorg/iq80/leveldb/util/Slice;)V

    .line 1342
    return-void
.end method
