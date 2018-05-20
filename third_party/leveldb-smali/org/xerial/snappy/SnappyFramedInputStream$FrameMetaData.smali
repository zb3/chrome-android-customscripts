.class public final Lorg/xerial/snappy/SnappyFramedInputStream$FrameMetaData;
.super Ljava/lang/Object;
.source "SnappyFramedInputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/xerial/snappy/SnappyFramedInputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "FrameMetaData"
.end annotation


# instance fields
.field final frameAction:Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

.field final length:I


# direct methods
.method public constructor <init>(Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;I)V
    .locals 0

    .prologue
    .line 390
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 391
    iput-object p1, p0, Lorg/xerial/snappy/SnappyFramedInputStream$FrameMetaData;->frameAction:Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    .line 392
    iput p2, p0, Lorg/xerial/snappy/SnappyFramedInputStream$FrameMetaData;->length:I

    .line 393
    return-void
.end method
