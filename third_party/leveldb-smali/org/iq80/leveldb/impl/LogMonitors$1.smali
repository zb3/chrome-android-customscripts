.class final Lorg/iq80/leveldb/impl/LogMonitors$1;
.super Ljava/lang/Object;
.source "LogMonitors.java"

# interfaces
.implements Lorg/iq80/leveldb/impl/LogMonitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/iq80/leveldb/impl/LogMonitors;->throwExceptionMonitor()Lorg/iq80/leveldb/impl/LogMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public corruption(JLjava/lang/String;)V
    .locals 5
    .param p1, "bytes"    # J
    .param p3, "reason"    # Ljava/lang/String;

    .prologue
    .line 29
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "corruption of %s bytes: %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p3, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public corruption(JLjava/lang/Throwable;)V
    .locals 5
    .param p1, "bytes"    # J
    .param p3, "reason"    # Ljava/lang/Throwable;

    .prologue
    .line 35
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "corruption of %s bytes"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method
