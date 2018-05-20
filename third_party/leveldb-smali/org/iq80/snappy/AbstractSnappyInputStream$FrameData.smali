.class public final Lorg/iq80/snappy/AbstractSnappyInputStream$FrameData;
.super Ljava/lang/Object;
.source "AbstractSnappyInputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/snappy/AbstractSnappyInputStream;
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
    .param p1, "checkSum"    # I
    .param p2, "offset"    # I

    .prologue
    .line 202
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 203
    iput p1, p0, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameData;->checkSum:I

    .line 204
    iput p2, p0, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameData;->offset:I

    .line 205
    return-void
.end method
