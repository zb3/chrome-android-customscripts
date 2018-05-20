.class public final Lorg/xerial/snappy/SnappyFramedInputStream$FrameData;
.super Ljava/lang/Object;
.source "SnappyFramedInputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/xerial/snappy/SnappyFramedInputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "FrameData"
.end annotation


# instance fields
.field final checkSum:I

.field final offset:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .prologue
    .line 407
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 408
    iput p1, p0, Lorg/xerial/snappy/SnappyFramedInputStream$FrameData;->checkSum:I

    .line 409
    iput p2, p0, Lorg/xerial/snappy/SnappyFramedInputStream$FrameData;->offset:I

    .line 410
    return-void
.end method
