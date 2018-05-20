.class public interface abstract Lorg/iq80/leveldb/DBIterator;
.super Ljava/lang/Object;
.source "DBIterator.java"

# interfaces
.implements Ljava/util/Iterator;
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Ljava/util/Map$Entry",
        "<[B[B>;>;",
        "Ljava/io/Closeable;"
    }
.end annotation


# virtual methods
.method public abstract hasPrev()Z
.end method

.method public abstract peekNext()Ljava/util/Map$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<[B[B>;"
        }
    .end annotation
.end method

.method public abstract peekPrev()Ljava/util/Map$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<[B[B>;"
        }
    .end annotation
.end method

.method public abstract prev()Ljava/util/Map$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<[B[B>;"
        }
    .end annotation
.end method

.method public abstract seek([B)V
.end method

.method public abstract seekToFirst()V
.end method

.method public abstract seekToLast()V
.end method
