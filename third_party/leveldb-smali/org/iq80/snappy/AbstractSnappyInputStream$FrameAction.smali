.class final enum Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;
.super Ljava/lang/Enum;
.source "AbstractSnappyInputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/snappy/AbstractSnappyInputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "FrameAction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

.field public static final enum RAW:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

.field public static final enum SKIP:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

.field public static final enum UNCOMPRESS:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 177
    new-instance v0, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    const-string v1, "RAW"

    invoke-direct {v0, v1, v2}, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;->RAW:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    new-instance v0, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    const-string v1, "SKIP"

    invoke-direct {v0, v1, v3}, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;->SKIP:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    new-instance v0, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    const-string v1, "UNCOMPRESS"

    invoke-direct {v0, v1, v4}, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;->UNCOMPRESS:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    .line 175
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    sget-object v1, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;->RAW:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    aput-object v1, v0, v2

    sget-object v1, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;->SKIP:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    aput-object v1, v0, v3

    sget-object v1, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;->UNCOMPRESS:Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    aput-object v1, v0, v4

    sput-object v0, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;->$VALUES:[Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 175
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 175
    const-class v0, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    return-object v0
.end method

.method public static values()[Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;
    .locals 1

    .prologue
    .line 175
    sget-object v0, Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;->$VALUES:[Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    invoke-virtual {v0}, [Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/iq80/snappy/AbstractSnappyInputStream$FrameAction;

    return-object v0
.end method
