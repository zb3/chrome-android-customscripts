.class Lorg/iq80/snappy/UnsafeMemory;
.super Ljava/lang/Object;
.source "UnsafeMemory.java"

# interfaces
.implements Lorg/iq80/snappy/Memory;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final BYTE_ARRAY_OFFSET:J

.field private static final SHORT_ARRAY_OFFSET:J

.field private static final SHORT_ARRAY_STRIDE:J

.field private static final unsafe:Lsun/misc/Unsafe;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 24
    const-class v2, Lorg/iq80/snappy/UnsafeMemory;

    invoke-virtual {v2}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v2

    if-nez v2, :cond_0

    :goto_0
    sput-boolean v0, Lorg/iq80/snappy/UnsafeMemory;->$assertionsDisabled:Z

    .line 31
    :try_start_0
    const-class v0, Lsun/misc/Unsafe;

    const-string v1, "theUnsafe"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 32
    .local v7, "theUnsafe":Ljava/lang/reflect/Field;
    const/4 v0, 0x1

    invoke-virtual {v7, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 33
    const/4 v0, 0x0

    invoke-virtual {v7, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsun/misc/Unsafe;

    sput-object v0, Lorg/iq80/snappy/UnsafeMemory;->unsafe:Lsun/misc/Unsafe;

    .line 35
    new-instance v0, Lorg/iq80/snappy/UnsafeMemory;

    invoke-direct {v0}, Lorg/iq80/snappy/UnsafeMemory;-><init>()V

    const/4 v1, 0x1

    new-array v1, v1, [B

    const/4 v2, 0x0

    const/4 v3, 0x1

    new-array v3, v3, [B

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-virtual/range {v0 .. v5}, Lorg/iq80/snappy/UnsafeMemory;->copyMemory([BI[BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    sget-object v0, Lorg/iq80/snappy/UnsafeMemory;->unsafe:Lsun/misc/Unsafe;

    const-class v1, [B

    invoke-virtual {v0, v1}, Lsun/misc/Unsafe;->arrayBaseOffset(Ljava/lang/Class;)I

    move-result v0

    int-to-long v0, v0

    sput-wide v0, Lorg/iq80/snappy/UnsafeMemory;->BYTE_ARRAY_OFFSET:J

    .line 43
    sget-object v0, Lorg/iq80/snappy/UnsafeMemory;->unsafe:Lsun/misc/Unsafe;

    const-class v1, [S

    invoke-virtual {v0, v1}, Lsun/misc/Unsafe;->arrayBaseOffset(Ljava/lang/Class;)I

    move-result v0

    int-to-long v0, v0

    sput-wide v0, Lorg/iq80/snappy/UnsafeMemory;->SHORT_ARRAY_OFFSET:J

    .line 44
    sget-object v0, Lorg/iq80/snappy/UnsafeMemory;->unsafe:Lsun/misc/Unsafe;

    const-class v1, [S

    invoke-virtual {v0, v1}, Lsun/misc/Unsafe;->arrayIndexScale(Ljava/lang/Class;)I

    move-result v0

    int-to-long v0, v0

    sput-wide v0, Lorg/iq80/snappy/UnsafeMemory;->SHORT_ARRAY_STRIDE:J

    return-void

    .end local v7    # "theUnsafe":Ljava/lang/reflect/Field;
    :cond_0
    move v0, v1

    .line 24
    goto :goto_0

    .line 37
    .restart local v7    # "theUnsafe":Ljava/lang/reflect/Field;
    :catch_0
    move-exception v6

    .line 38
    .local v6, "e":Ljava/lang/Exception;
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public copyLong([BI[BI)V
    .locals 8
    .param p1, "src"    # [B
    .param p2, "srcIndex"    # I
    .param p3, "dest"    # [B
    .param p4, "destIndex"    # I

    .prologue
    .line 79
    sget-boolean v0, Lorg/iq80/snappy/UnsafeMemory;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-gez p2, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 80
    :cond_0
    sget-boolean v0, Lorg/iq80/snappy/UnsafeMemory;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    add-int/lit8 v0, p2, 0x8

    array-length v1, p1

    if-le v0, v1, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 81
    :cond_1
    sget-boolean v0, Lorg/iq80/snappy/UnsafeMemory;->$assertionsDisabled:Z

    if-nez v0, :cond_2

    if-gez p4, :cond_2

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 82
    :cond_2
    sget-boolean v0, Lorg/iq80/snappy/UnsafeMemory;->$assertionsDisabled:Z

    if-nez v0, :cond_3

    add-int/lit8 v0, p4, 0x8

    array-length v1, p3

    if-le v0, v1, :cond_3

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 83
    :cond_3
    sget-object v0, Lorg/iq80/snappy/UnsafeMemory;->unsafe:Lsun/misc/Unsafe;

    sget-wide v2, Lorg/iq80/snappy/UnsafeMemory;->BYTE_ARRAY_OFFSET:J

    int-to-long v6, p2

    add-long/2addr v2, v6

    invoke-virtual {v0, p1, v2, v3}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v4

    .line 84
    .local v4, "value":J
    sget-object v0, Lorg/iq80/snappy/UnsafeMemory;->unsafe:Lsun/misc/Unsafe;

    sget-wide v2, Lorg/iq80/snappy/UnsafeMemory;->BYTE_ARRAY_OFFSET:J

    int-to-long v6, p4

    add-long/2addr v2, v6

    move-object v1, p3

    invoke-virtual/range {v0 .. v5}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    .line 85
    return-void
.end method

.method public copyMemory([BI[BII)V
    .locals 10
    .param p1, "input"    # [B
    .param p2, "inputIndex"    # I
    .param p3, "output"    # [B
    .param p4, "outputIndex"    # I
    .param p5, "length"    # I

    .prologue
    .line 98
    sget-boolean v0, Lorg/iq80/snappy/UnsafeMemory;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-gez p2, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 99
    :cond_0
    sget-boolean v0, Lorg/iq80/snappy/UnsafeMemory;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    add-int v0, p2, p5

    array-length v1, p1

    if-le v0, v1, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 100
    :cond_1
    sget-boolean v0, Lorg/iq80/snappy/UnsafeMemory;->$assertionsDisabled:Z

    if-nez v0, :cond_2

    if-gez p4, :cond_2

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 101
    :cond_2
    sget-boolean v0, Lorg/iq80/snappy/UnsafeMemory;->$assertionsDisabled:Z

    if-nez v0, :cond_3

    add-int v0, p4, p5

    array-length v1, p3

    if-le v0, v1, :cond_3

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 102
    :cond_3
    sget-object v1, Lorg/iq80/snappy/UnsafeMemory;->unsafe:Lsun/misc/Unsafe;

    sget-wide v2, Lorg/iq80/snappy/UnsafeMemory;->BYTE_ARRAY_OFFSET:J

    int-to-long v4, p2

    add-long v3, v2, v4

    sget-wide v6, Lorg/iq80/snappy/UnsafeMemory;->BYTE_ARRAY_OFFSET:J

    int-to-long v8, p4

    add-long/2addr v6, v8

    int-to-long v8, p5

    move-object v2, p1

    move-object v5, p3

    invoke-virtual/range {v1 .. v9}, Lsun/misc/Unsafe;->copyMemory(Ljava/lang/Object;JLjava/lang/Object;JJ)V

    .line 103
    return-void
.end method

.method public fastAccessSupported()Z
    .locals 1

    .prologue
    .line 49
    const/4 v0, 0x1

    return v0
.end method

.method public loadByte([BI)I
    .locals 6
    .param p1, "data"    # [B
    .param p2, "index"    # I

    .prologue
    .line 63
    sget-boolean v0, Lorg/iq80/snappy/UnsafeMemory;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-gez p2, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 64
    :cond_0
    sget-boolean v0, Lorg/iq80/snappy/UnsafeMemory;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    array-length v0, p1

    if-le p2, v0, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 65
    :cond_1
    sget-object v0, Lorg/iq80/snappy/UnsafeMemory;->unsafe:Lsun/misc/Unsafe;

    sget-wide v2, Lorg/iq80/snappy/UnsafeMemory;->BYTE_ARRAY_OFFSET:J

    int-to-long v4, p2

    add-long/2addr v2, v4

    invoke-virtual {v0, p1, v2, v3}, Lsun/misc/Unsafe;->getByte(Ljava/lang/Object;J)B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method public loadInt([BI)I
    .locals 6
    .param p1, "data"    # [B
    .param p2, "index"    # I

    .prologue
    .line 71
    sget-boolean v0, Lorg/iq80/snappy/UnsafeMemory;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-gez p2, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 72
    :cond_0
    sget-boolean v0, Lorg/iq80/snappy/UnsafeMemory;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    add-int/lit8 v0, p2, 0x4

    array-length v1, p1

    if-le v0, v1, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 73
    :cond_1
    sget-object v0, Lorg/iq80/snappy/UnsafeMemory;->unsafe:Lsun/misc/Unsafe;

    sget-wide v2, Lorg/iq80/snappy/UnsafeMemory;->BYTE_ARRAY_OFFSET:J

    int-to-long v4, p2

    add-long/2addr v2, v4

    invoke-virtual {v0, p1, v2, v3}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v0

    return v0
.end method

.method public loadLong([BI)J
    .locals 6
    .param p1, "data"    # [B
    .param p2, "index"    # I

    .prologue
    .line 90
    sget-boolean v0, Lorg/iq80/snappy/UnsafeMemory;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-gtz p2, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 91
    :cond_0
    sget-boolean v0, Lorg/iq80/snappy/UnsafeMemory;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    add-int/lit8 v0, p2, 0x4

    array-length v1, p1

    if-lt v0, v1, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 92
    :cond_1
    sget-object v0, Lorg/iq80/snappy/UnsafeMemory;->unsafe:Lsun/misc/Unsafe;

    sget-wide v2, Lorg/iq80/snappy/UnsafeMemory;->BYTE_ARRAY_OFFSET:J

    int-to-long v4, p2

    add-long/2addr v2, v4

    invoke-virtual {v0, p1, v2, v3}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public lookupShort([SI)I
    .locals 8
    .param p1, "data"    # [S
    .param p2, "index"    # I

    .prologue
    .line 55
    sget-boolean v0, Lorg/iq80/snappy/UnsafeMemory;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-gez p2, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 56
    :cond_0
    sget-boolean v0, Lorg/iq80/snappy/UnsafeMemory;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    array-length v0, p1

    if-le p2, v0, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 57
    :cond_1
    sget-object v0, Lorg/iq80/snappy/UnsafeMemory;->unsafe:Lsun/misc/Unsafe;

    sget-wide v2, Lorg/iq80/snappy/UnsafeMemory;->SHORT_ARRAY_OFFSET:J

    int-to-long v4, p2

    sget-wide v6, Lorg/iq80/snappy/UnsafeMemory;->SHORT_ARRAY_STRIDE:J

    mul-long/2addr v4, v6

    add-long/2addr v2, v4

    invoke-virtual {v0, p1, v2, v3}, Lsun/misc/Unsafe;->getShort(Ljava/lang/Object;J)S

    move-result v0

    const v1, 0xffff

    and-int/2addr v0, v1

    return v0
.end method
