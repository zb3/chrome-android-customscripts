.class public final Lorg/iq80/leveldb/impl/LogMonitors;
.super Ljava/lang/Object;
.source "LogMonitors.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    return-void
.end method

.method public static logMonitor()Lorg/iq80/leveldb/impl/LogMonitor;
    .locals 1

    .prologue
    .line 43
    new-instance v0, Lorg/iq80/leveldb/impl/LogMonitors$2;

    invoke-direct {v0}, Lorg/iq80/leveldb/impl/LogMonitors$2;-><init>()V

    return-object v0
.end method

.method public static throwExceptionMonitor()Lorg/iq80/leveldb/impl/LogMonitor;
    .locals 1

    .prologue
    .line 24
    new-instance v0, Lorg/iq80/leveldb/impl/LogMonitors$1;

    invoke-direct {v0}, Lorg/iq80/leveldb/impl/LogMonitors$1;-><init>()V

    return-object v0
.end method
