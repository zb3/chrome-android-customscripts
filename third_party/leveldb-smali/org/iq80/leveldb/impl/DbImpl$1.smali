.class Lorg/iq80/leveldb/impl/DbImpl$1;
.super Ljava/lang/Object;
.source "DbImpl.java"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/iq80/leveldb/impl/DbImpl;-><init>(Lorg/iq80/leveldb/Options;Ljava/io/File;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/iq80/leveldb/impl/DbImpl;


# direct methods
.method constructor <init>(Lorg/iq80/leveldb/impl/DbImpl;)V
    .locals 0
    .param p1, "this$0"    # Lorg/iq80/leveldb/impl/DbImpl;

    .prologue
    .line 141
    iput-object p1, p0, Lorg/iq80/leveldb/impl/DbImpl$1;->this$0:Lorg/iq80/leveldb/impl/DbImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "t"    # Ljava/lang/Thread;
    .param p2, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 146
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "%s%n"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 147
    invoke-virtual {p2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 148
    return-void
.end method
