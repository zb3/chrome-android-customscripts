.class Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;
.super Ljava/lang/Object;
.source "DbImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/impl/DbImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ManualCompaction"
.end annotation


# instance fields
.field private final begin:Lorg/iq80/leveldb/util/Slice;

.field private final end:Lorg/iq80/leveldb/util/Slice;

.field private final level:I


# direct methods
.method private constructor <init>(ILorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)V
    .locals 0
    .param p1, "level"    # I
    .param p2, "begin"    # Lorg/iq80/leveldb/util/Slice;
    .param p3, "end"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 1292
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1293
    iput p1, p0, Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;->level:I

    .line 1294
    iput-object p2, p0, Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;->begin:Lorg/iq80/leveldb/util/Slice;

    .line 1295
    iput-object p3, p0, Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;->end:Lorg/iq80/leveldb/util/Slice;

    .line 1296
    return-void
.end method

.method synthetic constructor <init>(ILorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/impl/DbImpl$1;)V
    .locals 0
    .param p1, "x0"    # I
    .param p2, "x1"    # Lorg/iq80/leveldb/util/Slice;
    .param p3, "x2"    # Lorg/iq80/leveldb/util/Slice;
    .param p4, "x3"    # Lorg/iq80/leveldb/impl/DbImpl$1;

    .prologue
    .line 1285
    invoke-direct {p0, p1, p2, p3}, Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;-><init>(ILorg/iq80/leveldb/util/Slice;Lorg/iq80/leveldb/util/Slice;)V

    return-void
.end method

.method static synthetic access$300(Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;)I
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;

    .prologue
    .line 1285
    iget v0, p0, Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;->level:I

    return v0
.end method

.method static synthetic access$400(Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;)Lorg/iq80/leveldb/util/Slice;
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;

    .prologue
    .line 1285
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;->begin:Lorg/iq80/leveldb/util/Slice;

    return-object v0
.end method

.method static synthetic access$500(Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;)Lorg/iq80/leveldb/util/Slice;
    .locals 1
    .param p0, "x0"    # Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;

    .prologue
    .line 1285
    iget-object v0, p0, Lorg/iq80/leveldb/impl/DbImpl$ManualCompaction;->end:Lorg/iq80/leveldb/util/Slice;

    return-object v0
.end method
