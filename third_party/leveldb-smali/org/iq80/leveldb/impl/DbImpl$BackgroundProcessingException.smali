.class public Lorg/iq80/leveldb/impl/DbImpl$BackgroundProcessingException;
.super Lorg/iq80/leveldb/DBException;
.source "DbImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/impl/DbImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BackgroundProcessingException"
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 1397
    invoke-direct {p0, p1}, Lorg/iq80/leveldb/DBException;-><init>(Ljava/lang/Throwable;)V

    .line 1398
    return-void
.end method
