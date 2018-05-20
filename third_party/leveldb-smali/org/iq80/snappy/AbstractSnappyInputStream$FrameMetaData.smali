.class public final Lorg/iq80/snappy/AbstractSnappyInputStream$FrameMetaData;
.super Ljava/lang/Object;
.source "AbstractSnappyInputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/snappy/AbstractSnappyInputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "FrameMetaData"
.end annotation


# instance fields
.field final frameAction:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

.field final length:I


# direct methods
.method public constructor <init>(Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;I)V
    .locals 0
    .param p1, "frameAction"    # Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;
    .param p2, "length"    # I

    .prologue
    .line 190
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 191
    iput-object p1, p0, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameMetaData;->frameAction:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    .line 192
    iput p2, p0, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameMetaData;->length:I

    .line 193
    return-void
.end method
