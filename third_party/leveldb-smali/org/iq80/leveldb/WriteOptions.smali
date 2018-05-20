.class public Lorg/iq80/leveldb/WriteOptions;
.super Ljava/lang/Object;
.source "WriteOptions.java"


# instance fields
.field private snapshot:Z

.field private sync:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public snapshot(Z)Lorg/iq80/leveldb/WriteOptions;
    .locals 0
    .param p1, "snapshot"    # Z

    .prologue
    .line 43
    iput-boolean p1, p0, Lorg/iq80/leveldb/WriteOptions;->snapshot:Z

    .line 44
    return-object p0
.end method

.method public snapshot()Z
    .locals 1

    .prologue
    .line 38
    iget-boolean v0, p0, Lorg/iq80/leveldb/WriteOptions;->snapshot:Z

    return v0
.end method

.method public sync(Z)Lorg/iq80/leveldb/WriteOptions;
    .locals 0
    .param p1, "sync"    # Z

    .prologue
    .line 32
    iput-boolean p1, p0, Lorg/iq80/leveldb/WriteOptions;->sync:Z

    .line 33
    return-object p0
.end method

.method public sync()Z
    .locals 1

    .prologue
    .line 27
    iget-boolean v0, p0, Lorg/iq80/leveldb/WriteOptions;->sync:Z

    return v0
.end method
