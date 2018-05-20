.class public interface abstract Lorg/iq80/leveldb/DB;
.super Ljava/lang/Object;
.source "DB.java"

# interfaces
.implements Ljava/lang/Iterable;
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Ljava/util/Map$Entry",
        "<[B[B>;>;",
        "Ljava/io/Closeable;"
    }
.end annotation


# virtual methods
.method public abstract compactRange([B[B)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/leveldb/DBException;
        }
    .end annotation
.end method

.method public abstract createWriteBatch()Lorg/iq80/leveldb/WriteBatch;
.end method

.method public abstract delete([BLorg/iq80/leveldb/WriteOptions;)Lorg/iq80/leveldb/Snapshot;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/leveldb/DBException;
        }
    .end annotation
.end method

.method public abstract delete([B)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/leveldb/DBException;
        }
    .end annotation
.end method

.method public abstract get([B)[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/leveldb/DBException;
        }
    .end annotation
.end method

.method public abstract get([BLorg/iq80/leveldb/ReadOptions;)[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/leveldb/DBException;
        }
    .end annotation
.end method

.method public varargs abstract getApproximateSizes([Lorg/iq80/leveldb/Range;)[J
.end method

.method public abstract getProperty(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getSnapshot()Lorg/iq80/leveldb/Snapshot;
.end method

.method public abstract iterator()Lorg/iq80/leveldb/DBIterator;
.end method

.method public abstract iterator(Lorg/iq80/leveldb/ReadOptions;)Lorg/iq80/leveldb/DBIterator;
.end method

.method public abstract put([B[BLorg/iq80/leveldb/WriteOptions;)Lorg/iq80/leveldb/Snapshot;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/leveldb/DBException;
        }
    .end annotation
.end method

.method public abstract put([B[B)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/leveldb/DBException;
        }
    .end annotation
.end method

.method public abstract resumeCompactions()V
.end method

.method public abstract suspendCompactions()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation
.end method

.method public abstract write(Lorg/iq80/leveldb/WriteBatch;Lorg/iq80/leveldb/WriteOptions;)Lorg/iq80/leveldb/Snapshot;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/leveldb/DBException;
        }
    .end annotation
.end method

.method public abstract write(Lorg/iq80/leveldb/WriteBatch;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/iq80/leveldb/DBException;
        }
    .end annotation
.end method
