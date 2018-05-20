.class public interface abstract Lorg/iq80/leveldb/impl/SeekingIterable;
.super Ljava/lang/Object;
.source "SeekingIterable.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Ljava/util/Map$Entry",
        "<TK;TV;>;>;"
    }
.end annotation


# virtual methods
.method public abstract iterator()Lorg/iq80/leveldb/impl/SeekingIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/iq80/leveldb/impl/SeekingIterator",
            "<TK;TV;>;"
        }
    .end annotation
.end method
