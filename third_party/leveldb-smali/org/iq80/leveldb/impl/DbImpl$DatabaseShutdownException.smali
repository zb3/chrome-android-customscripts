.class public Lorg/iq80/leveldb/impl/DbImpl$DatabaseShutdownException;
.super Lorg/iq80/leveldb/DBException;
.source "DbImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/impl/DbImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DatabaseShutdownException"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1383
    invoke-direct {p0}, Lorg/iq80/leveldb/DBException;-><init>()V

    .line 1384
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 1388
    invoke-direct {p0, p1}, Lorg/iq80/leveldb/DBException;-><init>(Ljava/lang/String;)V

    .line 1389
    return-void
.end method
