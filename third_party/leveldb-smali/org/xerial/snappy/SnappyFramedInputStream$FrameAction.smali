.class final enum Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;
.super Ljava/lang/Enum;
.source "SnappyFramedInputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/xerial/snappy/SnappyFramedInputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "FrameAction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

.field public static final enum RAW:Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

.field public static final enum SKIP:Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

.field public static final enum UNCOMPRESS:Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 376
    new-instance v0, Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    const-string v1, "RAW"

    invoke-direct {v0, v1, v2}, Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;->RAW:Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    new-instance v0, Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    const-string v1, "SKIP"

    invoke-direct {v0, v1, v3}, Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;->SKIP:Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    new-instance v0, Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    const-string v1, "UNCOMPRESS"

    invoke-direct {v0, v1, v4}, Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;->UNCOMPRESS:Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    .line 374
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    sget-object v1, Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;->RAW:Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    aput-object v1, v0, v2

    sget-object v1, Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;->SKIP:Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    aput-object v1, v0, v3

    sget-object v1, Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;->UNCOMPRESS:Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    aput-object v1, v0, v4

    sput-object v0, Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;->$VALUES:[Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

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
    .line 374
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;
    .locals 1

    .prologue
    .line 374
    const-class v0, Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    return-object v0
.end method

.method public static values()[Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;
    .locals 1

    .prologue
    .line 374
    sget-object v0, Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;->$VALUES:[Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    invoke-virtual {v0}, [Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/xerial/snappy/SnappyFramedInputStream$FrameAction;

    return-object v0
.end method
