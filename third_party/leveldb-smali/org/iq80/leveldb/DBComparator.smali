.class public interface abstract Lorg/iq80/leveldb/DBComparator;
.super Ljava/lang/Object;
.source "DBComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<[B>;"
    }
.end annotation


# virtual methods
.method public abstract findShortSuccessor([B)[B
.end method

.method public abstract findShortestSeparator([B[B)[B
.end method

.method public abstract name()Ljava/lang/String;
.end method
