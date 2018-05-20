.class Lorg/iq80/leveldb/impl/DbImpl$3;
.super Ljava/lang/Object;
.source "DbImpl.java"

# interfaces
.implements Lorg/iq80/leveldb/impl/SeekingIterable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/iq80/leveldb/impl/DbImpl;->internalIterable()Lorg/iq80/leveldb/impl/SeekingIterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/iq80/leveldb/impl/SeekingIterable",
        "<",
        "Lorg/iq80/leveldb/impl/InternalKey;",
        "Lorg/iq80/leveldb/util/Slice;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/iq80/leveldb/impl/DbImpl;


# direct methods
.method constructor <init>(Lorg/iq80/leveldb/impl/DbImpl;)V
    .locals 0
    .param p1, "this$0"    # Lorg/iq80/leveldb/impl/DbImpl;

    .prologue
    .line 757
    iput-object p1, p0, Lorg/iq80/leveldb/impl/DbImpl$3;->this$0:Lorg/iq80/leveldb/impl/DbImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 757
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/DbImpl$3;->iterator()Lorg/iq80/leveldb/util/DbIterator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic iterator()Lorg/iq80/leveldb/impl/SeekingIterator;
    .locals 1

    .prologue
    .line 757
    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/DbImpl$3;->iterator()Lorg/iq80/leveldb/util/DbIterator;

    move-result-object v0

    return-object v0
.end method

.method public iterator()Lorg/iq80/leveldb/util/DbIterator;
    .locals 1

    .prologue
    .line 761
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl$3;->this$0:Lorg/iq80/leveldb/impl/DbImpl;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/DbImpl;->internalIterator()Lorg/iq80/leveldb/util/DbIterator;

    move-result-object v0

    return-object v0
.end method
