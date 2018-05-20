.class final Lorg/iq80/leveldb/impl/LogMonitors$2;
.super Ljava/lang/Object;
.source "LogMonitors.java"

# interfaces
.implements Lorg/iq80/leveldb/impl/LogMonitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/iq80/leveldb/impl/LogMonitors;->logMonitor()Lorg/iq80/leveldb/impl/LogMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public corruption(JLjava/lang/String;)V
    .locals 5
    .param p1, "bytes"    # J
    .param p3, "reason"    # Ljava/lang/String;

    .prologue
    .line 48
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

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

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 49
    return-void
.end method

.method public corruption(JLjava/lang/Throwable;)V
    .locals 5
    .param p1, "bytes"    # J
    .param p3, "reason"    # Ljava/lang/Throwable;

    .prologue
    .line 54
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "corruption of %s bytes"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 55
    invoke-virtual {p3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 56
    return-void
.end method
