.class public interface abstract Lorg/iq80/leveldb/impl/WriteBatchImpl$Handler;
.super Ljava/lang/Object;
.source "WriteBatchImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/impl/WriteBatchImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Handler"
.end annotation


# virtual methods
.method public abstract delete(Lorg/iq80/leveldb/util/Slice;)V
.end method

.method public abstract put(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)V
.end method
