.class public Lorg/xerial/snappy/SnappyError;
.super Ljava/lang/Error;
.source "SnappyError.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field public final errorCode:Lorg/xerial/snappy/SnappyErrorCode;


# direct methods
.method public constructor <init>(Lorg/xerial/snappy/SnappyErrorCode;)V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Error;-><init>()V

    .line 45
    iput-object p1, p0, Lorg/xerial/snappy/SnappyError;->errorCode:Lorg/xerial/snappy/SnappyErrorCode;

    .line 46
    return-void
.end method

.method public constructor <init>(Lorg/xerial/snappy/SnappyErrorCode;Ljava/lang/Error;)V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0, p2}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    .line 51
    iput-object p1, p0, Lorg/xerial/snappy/SnappyError;->errorCode:Lorg/xerial/snappy/SnappyErrorCode;

    .line 52
    return-void
.end method

.method public constructor <init>(Lorg/xerial/snappy/SnappyErrorCode;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0, p2}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    .line 57
    iput-object p1, p0, Lorg/xerial/snappy/SnappyError;->errorCode:Lorg/xerial/snappy/SnappyErrorCode;

    .line 58
    return-void
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .locals 4

    .prologue
    .line 63
    const-string v0, "[%s] %s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/xerial/snappy/SnappyError;->errorCode:Lorg/xerial/snappy/SnappyErrorCode;

    invoke-virtual {v3}, Lorg/xerial/snappy/SnappyErrorCode;->name()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-super {p0}, Ljava/lang/Error;->getMessage()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
