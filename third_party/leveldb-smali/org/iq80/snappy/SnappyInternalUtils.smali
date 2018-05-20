.class final Lorg/iq80/snappy/SnappyInternalUtils;
.super Ljava/lang/Object;
.source "SnappyInternalUtils.java"


# static fields
.field static final HAS_UNSAFE:Z

.field private static final memory:Lorg/iq80/snappy/Memory;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    .line 34
    const/4 v1, 0x0

    .line 43
    .local v1, "memoryInstance":Lorg/iq80/snappy/Memory;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v6

    sget-object v7, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v6, v7, :cond_0

    .line 45
    :try_start_0
    const-class v6, Lorg/iq80/snappy/SnappyInternalUtils;

    invoke-virtual {v6}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    const-string v7, "org.iq80.snappy.UnsafeMemory"

    invoke-virtual {v6, v7}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const-class v7, Lorg/iq80/snappy/Memory;

    invoke-virtual {v6, v7}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v5

    .line 46
    .local v5, "unsafeMemoryClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/iq80/snappy/Memory;>;"
    invoke-virtual {v5}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/iq80/snappy/Memory;

    .line 47
    .local v4, "unsafeMemory":Lorg/iq80/snappy/Memory;
    const/4 v6, 0x4

    new-array v6, v6, [B

    const/4 v7, 0x0

    invoke-interface {v4, v6, v7}, Lorg/iq80/snappy/Memory;->loadInt([BI)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    move-result v6

    if-nez v6, :cond_0

    .line 48
    move-object v1, v4

    .line 54
    .end local v4    # "unsafeMemory":Lorg/iq80/snappy/Memory;
    .end local v5    # "unsafeMemoryClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/iq80/snappy/Memory;>;"
    :cond_0
    :goto_0
    if-nez v1, :cond_1

    .line 56
    :try_start_1
    const-class v6, Lorg/iq80/snappy/SnappyInternalUtils;

    invoke-virtual {v6}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    const-string v7, "org.iq80.snappy.SlowMemory"

    invoke-virtual {v6, v7}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const-class v7, Lorg/iq80/snappy/Memory;

    invoke-virtual {v6, v7}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v3

    .line 57
    .local v3, "slowMemoryClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/iq80/snappy/Memory;>;"
    invoke-virtual {v3}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/iq80/snappy/Memory;

    .line 58
    .local v2, "slowMemory":Lorg/iq80/snappy/Memory;
    const/4 v6, 0x4

    new-array v6, v6, [B

    const/4 v7, 0x0

    invoke-interface {v2, v6, v7}, Lorg/iq80/snappy/Memory;->loadInt([BI)I
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    move-result v6

    if-nez v6, :cond_2

    .line 59
    move-object v1, v2

    .line 69
    .end local v2    # "slowMemory":Lorg/iq80/snappy/Memory;
    .end local v3    # "slowMemoryClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/iq80/snappy/Memory;>;"
    :cond_1
    sput-object v1, Lorg/iq80/snappy/SnappyInternalUtils;->memory:Lorg/iq80/snappy/Memory;

    .line 72
    sget-object v6, Lorg/iq80/snappy/SnappyInternalUtils;->memory:Lorg/iq80/snappy/Memory;

    invoke-interface {v6}, Lorg/iq80/snappy/Memory;->fastAccessSupported()Z

    move-result v6

    sput-boolean v6, Lorg/iq80/snappy/SnappyInternalUtils;->HAS_UNSAFE:Z

    return-void

    .line 62
    .restart local v2    # "slowMemory":Lorg/iq80/snappy/Memory;
    .restart local v3    # "slowMemoryClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/iq80/snappy/Memory;>;"
    :cond_2
    :try_start_2
    new-instance v6, Ljava/lang/AssertionError;

    const-string v7, "SlowMemory class is broken!"

    invoke-direct {v6, v7}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v6
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 65
    .end local v2    # "slowMemory":Lorg/iq80/snappy/Memory;
    .end local v3    # "slowMemoryClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/iq80/snappy/Memory;>;"
    :catch_0
    move-exception v0

    .line 66
    .local v0, "ignored":Ljava/lang/Throwable;
    new-instance v6, Ljava/lang/AssertionError;

    const-string v7, "Could not find SlowMemory class"

    invoke-direct {v6, v7}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v6

    .line 51
    .end local v0    # "ignored":Ljava/lang/Throwable;
    :catch_1
    move-exception v6

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method

.method static badPositionIndex(IILjava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "index"    # I
    .param p1, "size"    # I
    .param p2, "desc"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 157
    if-gez p0, :cond_0

    .line 158
    const-string v0, "%s (%s) must not be negative"

    new-array v1, v4, [Ljava/lang/Object;

    aput-object p2, v1, v2

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 164
    :goto_0
    return-object v0

    .line 160
    :cond_0
    if-gez p1, :cond_1

    .line 161
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "negative size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 164
    :cond_1
    const-string v0, "%s (%s) must not be greater than size (%s)"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p2, v1, v2

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method static badPositionIndexes(III)Ljava/lang/String;
    .locals 4
    .param p0, "start"    # I
    .param p1, "end"    # I
    .param p2, "size"    # I

    .prologue
    .line 145
    if-ltz p0, :cond_0

    if-le p0, p2, :cond_1

    .line 146
    :cond_0
    const-string v0, "start index"

    invoke-static {p0, p2, v0}, Lorg/iq80/snappy/SnappyInternalUtils;->badPositionIndex(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 152
    :goto_0
    return-object v0

    .line 148
    :cond_1
    if-ltz p1, :cond_2

    if-le p1, p2, :cond_3

    .line 149
    :cond_2
    const-string v0, "end index"

    invoke-static {p1, p2, v0}, Lorg/iq80/snappy/SnappyInternalUtils;->badPositionIndex(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 152
    :cond_3
    const-string v0, "end index (%s) must not be less than start index (%s)"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method static varargs checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p0, "expression"    # Z
    .param p1, "errorMessageTemplate"    # Ljava/lang/String;
    .param p2, "errorMessageArgs"    # [Ljava/lang/Object;

    .prologue
    .line 130
    if-nez p0, :cond_0

    .line 131
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 133
    :cond_0
    return-void
.end method

.method static varargs checkNotNull(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "errorMessageTemplate"    # Ljava/lang/String;
    .param p2, "errorMessageArgs"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 121
    .local p0, "reference":Ljava/lang/Object;, "TT;"
    if-nez p0, :cond_0

    .line 123
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 125
    :cond_0
    return-object p0
.end method

.method static checkPositionIndexes(III)V
    .locals 2
    .param p0, "start"    # I
    .param p1, "end"    # I
    .param p2, "size"    # I

    .prologue
    .line 138
    if-ltz p0, :cond_0

    if-lt p1, p0, :cond_0

    if-le p1, p2, :cond_1

    .line 139
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-static {p0, p1, p2}, Lorg/iq80/snappy/SnappyInternalUtils;->badPositionIndexes(III)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 141
    :cond_1
    return-void
.end method

.method static copyLong([BI[BI)V
    .locals 1
    .param p0, "src"    # [B
    .param p1, "srcIndex"    # I
    .param p2, "dest"    # [B
    .param p3, "destIndex"    # I

    .prologue
    .line 104
    sget-object v0, Lorg/iq80/snappy/SnappyInternalUtils;->memory:Lorg/iq80/snappy/Memory;

    invoke-interface {v0, p0, p1, p2, p3}, Lorg/iq80/snappy/Memory;->copyLong([BI[BI)V

    .line 105
    return-void
.end method

.method static copyMemory([BI[BII)V
    .locals 6
    .param p0, "input"    # [B
    .param p1, "inputIndex"    # I
    .param p2, "output"    # [B
    .param p3, "outputIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 114
    sget-object v0, Lorg/iq80/snappy/SnappyInternalUtils;->memory:Lorg/iq80/snappy/Memory;

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    invoke-interface/range {v0 .. v5}, Lorg/iq80/snappy/Memory;->copyMemory([BI[BII)V

    .line 115
    return-void
.end method

.method static equals([BI[BII)Z
    .locals 3
    .param p0, "left"    # [B
    .param p1, "leftIndex"    # I
    .param p2, "right"    # [B
    .param p3, "rightIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 76
    add-int v1, p1, p4

    array-length v2, p0

    invoke-static {p1, v1, v2}, Lorg/iq80/snappy/SnappyInternalUtils;->checkPositionIndexes(III)V

    .line 77
    add-int v1, p3, p4

    array-length v2, p2

    invoke-static {p3, v1, v2}, Lorg/iq80/snappy/SnappyInternalUtils;->checkPositionIndexes(III)V

    .line 79
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p4, :cond_1

    .line 80
    add-int v1, p1, v0

    aget-byte v1, p0, v1

    add-int v2, p3, v0

    aget-byte v2, p2, v2

    if-eq v1, v2, :cond_0

    .line 81
    const/4 v1, 0x0

    .line 84
    :goto_1
    return v1

    .line 79
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 84
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method

.method public static loadByte([BI)I
    .locals 1
    .param p0, "data"    # [B
    .param p1, "index"    # I

    .prologue
    .line 94
    sget-object v0, Lorg/iq80/snappy/SnappyInternalUtils;->memory:Lorg/iq80/snappy/Memory;

    invoke-interface {v0, p0, p1}, Lorg/iq80/snappy/Memory;->loadByte([BI)I

    move-result v0

    return v0
.end method

.method static loadInt([BI)I
    .locals 1
    .param p0, "data"    # [B
    .param p1, "index"    # I

    .prologue
    .line 99
    sget-object v0, Lorg/iq80/snappy/SnappyInternalUtils;->memory:Lorg/iq80/snappy/Memory;

    invoke-interface {v0, p0, p1}, Lorg/iq80/snappy/Memory;->loadInt([BI)I

    move-result v0

    return v0
.end method

.method static loadLong([BI)J
    .locals 2
    .param p0, "data"    # [B
    .param p1, "index"    # I

    .prologue
    .line 109
    sget-object v0, Lorg/iq80/snappy/SnappyInternalUtils;->memory:Lorg/iq80/snappy/Memory;

    invoke-interface {v0, p0, p1}, Lorg/iq80/snappy/Memory;->loadLong([BI)J

    move-result-wide v0

    return-wide v0
.end method

.method public static lookupShort([SI)I
    .locals 1
    .param p0, "data"    # [S
    .param p1, "index"    # I

    .prologue
    .line 89
    sget-object v0, Lorg/iq80/snappy/SnappyInternalUtils;->memory:Lorg/iq80/snappy/Memory;

    invoke-interface {v0, p0, p1}, Lorg/iq80/snappy/Memory;->lookupShort([SI)I

    move-result v0

    return v0
.end method

.method static readBytes(Ljava/io/InputStream;[BII)I
    .locals 6
    .param p0, "source"    # Ljava/io/InputStream;
    .param p1, "dest"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v4, -0x1

    .line 183
    const-string v2, "source is null"

    new-array v3, v5, [Ljava/lang/Object;

    invoke-static {p0, v2, v3}, Lorg/iq80/snappy/SnappyInternalUtils;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    const-string v2, "dest is null"

    new-array v3, v5, [Ljava/lang/Object;

    invoke-static {p1, v2, v3}, Lorg/iq80/snappy/SnappyInternalUtils;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    invoke-virtual {p0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 189
    .local v0, "lastRead":I
    move v1, v0

    .line 192
    .local v1, "totalRead":I
    if-ge v0, p3, :cond_1

    .line 194
    :cond_0
    :goto_0
    if-ge v1, p3, :cond_1

    if-eq v0, v4, :cond_1

    .line 195
    add-int v2, p2, v1

    sub-int v3, p3, v1

    invoke-virtual {p0, p1, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 198
    if-eq v0, v4, :cond_0

    .line 199
    add-int/2addr v1, v0

    goto :goto_0

    .line 204
    :cond_1
    return v1
.end method

.method static skip(Ljava/io/InputStream;I)I
    .locals 8
    .param p0, "source"    # Ljava/io/InputStream;
    .param p1, "skip"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 212
    if-gtz p1, :cond_0

    .line 213
    const/4 v2, 0x0

    .line 233
    :goto_0
    return v2

    .line 216
    :cond_0
    int-to-long v4, p1

    invoke-virtual {p0, v4, v5}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v4

    long-to-int v4, v4

    sub-int v3, p1, v4

    .line 218
    .local v3, "toSkip":I
    const/4 v0, 0x1

    .line 219
    .local v0, "more":Z
    :goto_1
    if-lez v3, :cond_2

    if-eqz v0, :cond_2

    .line 221
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v1

    .line 222
    .local v1, "read":I
    const/4 v4, -0x1

    if-ne v1, v4, :cond_1

    .line 223
    const/4 v0, 0x0

    goto :goto_1

    .line 226
    :cond_1
    add-int/lit8 v3, v3, -0x1

    .line 227
    int-to-long v4, v3

    int-to-long v6, v3

    invoke-virtual {p0, v6, v7}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v6

    sub-long/2addr v4, v6

    long-to-int v3, v4

    goto :goto_1

    .line 231
    .end local v1    # "read":I
    :cond_2
    sub-int v2, p1, v3

    .line 233
    .local v2, "skipped":I
    goto :goto_0
.end method
