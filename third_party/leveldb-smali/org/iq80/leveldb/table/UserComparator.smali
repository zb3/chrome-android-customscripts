.class public interface abstract Lorg/iq80/leveldb/table/UserComparator;
.super Ljava/lang/Object;
.source "UserComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/iq80/leveldb/util/Slice;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract findShortSuccessor(Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/util/Slice;
.end method

.method public abstract findShortestSeparator(Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/util/Slice;
.end method

.method public abstract name()Ljava/lang/String;
.end method
