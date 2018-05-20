.class public Lorg/iq80/leveldb/Range;
.super Ljava/lang/Object;
.source "Range.java"


# instance fields
.field private final limit:[B

.field private final start:[B


# direct methods
.method public constructor <init>([B[B)V
    .locals 1
    .param p1, "start"    # [B
    .param p2, "limit"    # [B

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const-string v0, "start"

    invoke-static {p1, v0}, Lorg/iq80/leveldb/Options;->checkArgNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    const-string v0, "limit"

    invoke-static {p2, v0}, Lorg/iq80/leveldb/Options;->checkArgNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    iput-object p2, p0, Lorg/iq80/leveldb/Range;->limit:[B

    .line 43
    iput-object p1, p0, Lorg/iq80/leveldb/Range;->start:[B

    .line 44
    return-void
.end method


# virtual methods
.method public limit()[B
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lorg/iq80/leveldb/Range;->limit:[B

    return-object v0
.end method

.method public start()[B
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lorg/iq80/leveldb/Range;->start:[B

    return-object v0
.end method
