.class final Lorg/xerial/snappy/SnappyFramed;
.super Ljava/lang/Object;
.source "SnappyFramed.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final COMPRESSED_DATA_FLAG:I = 0x0

.field public static final HEADER_BYTES:[B

.field private static final MASK_DELTA:I = -0x5d7d1528

.field public static final STREAM_IDENTIFIER_FLAG:I = 0xff

.field private static final SUN_BUFFER_CLEANER:Ljava/lang/reflect/Method;

.field private static final SUN_CLEANER_CLEAN:Ljava/lang/reflect/Method;

.field private static final SUN_DIRECT_BUFFER:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field public static final UNCOMPRESSED_DATA_FLAG:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v1, 0x0

    .line 19
    const-class v0, Lorg/xerial/snappy/SnappyFramed;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/xerial/snappy/SnappyFramed;->$assertionsDisabled:Z

    .line 33
    const-string v0, "sun.nio.ch.DirectBuffer"

    invoke-static {v0}, Lorg/xerial/snappy/SnappyFramed;->lookupClassQuietly(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/xerial/snappy/SnappyFramed;->SUN_DIRECT_BUFFER:Ljava/lang/Class;

    .line 43
    :try_start_0
    sget-object v0, Lorg/xerial/snappy/SnappyFramed;->SUN_DIRECT_BUFFER:Ljava/lang/Class;

    if-eqz v0, :cond_1

    .line 44
    sget-object v2, Lorg/xerial/snappy/SnappyFramed;->SUN_DIRECT_BUFFER:Ljava/lang/Class;

    const-string v3, "cleaner"

    const/4 v0, 0x0

    check-cast v0, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 45
    :try_start_1
    const-string v0, "sun.misc.Cleaner"

    invoke-static {v0}, Lorg/xerial/snappy/SnappyFramed;->lookupClassQuietly(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 46
    const-string v4, "clean"

    const/4 v0, 0x0

    check-cast v0, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    move-object v1, v2

    .line 52
    :goto_1
    sput-object v1, Lorg/xerial/snappy/SnappyFramed;->SUN_BUFFER_CLEANER:Ljava/lang/reflect/Method;

    .line 53
    sput-object v0, Lorg/xerial/snappy/SnappyFramed;->SUN_CLEANER_CLEAN:Ljava/lang/reflect/Method;

    .line 60
    const/16 v0, 0xa

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/xerial/snappy/SnappyFramed;->HEADER_BYTES:[B

    return-void

    .line 19
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 49
    :catch_0
    move-exception v0

    move-object v2, v0

    move-object v0, v1

    .line 50
    :goto_2
    const-class v3, Lorg/xerial/snappy/SnappyFramed;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v3

    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v5, "Exception occurred attempting to lookup Sun specific DirectByteBuffer cleaner classes."

    invoke-virtual {v3, v4, v5, v2}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v6, v1

    move-object v1, v0

    move-object v0, v6

    goto :goto_1

    .line 49
    :catch_1
    move-exception v0

    move-object v6, v0

    move-object v0, v2

    move-object v2, v6

    goto :goto_2

    :cond_1
    move-object v0, v1

    goto :goto_1

    .line 60
    :array_0
    .array-data 1
        -0x1t
        0x6t
        0x0t
        0x0t
        0x73t
        0x4et
        0x61t
        0x50t
        0x70t
        0x59t
    .end array-data
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static lookupClassQuietly(Ljava/lang/String;)Ljava/lang/Class;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 159
    :try_start_0
    const-class v0, Lorg/xerial/snappy/SnappyFramed;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 165
    :goto_0
    return-object v0

    .line 161
    :catch_0
    move-exception v0

    .line 162
    const-class v1, Lorg/xerial/snappy/SnappyFramed;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v1

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Did not find requested class: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 165
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static mask(I)I
    .locals 2

    .prologue
    .line 92
    ushr-int/lit8 v0, p0, 0xf

    shl-int/lit8 v1, p0, 0x11

    or-int/2addr v0, v1

    const v1, -0x5d7d1528

    add-int/2addr v0, v1

    return v0
.end method

.method public static maskedCrc32c([B)I
    .locals 2

    .prologue
    .line 66
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lorg/xerial/snappy/SnappyFramed;->maskedCrc32c([BII)I

    move-result v0

    return v0
.end method

.method public static maskedCrc32c([BII)I
    .locals 1

    .prologue
    .line 71
    new-instance v0, Lorg/xerial/snappy/PureJavaCrc32C;

    invoke-direct {v0}, Lorg/xerial/snappy/PureJavaCrc32C;-><init>()V

    .line 72
    invoke-virtual {v0, p0, p1, p2}, Lorg/xerial/snappy/PureJavaCrc32C;->update([BII)V

    .line 73
    invoke-virtual {v0}, Lorg/xerial/snappy/PureJavaCrc32C;->getIntegerValue()I

    move-result v0

    invoke-static {v0}, Lorg/xerial/snappy/SnappyFramed;->mask(I)I

    move-result v0

    return v0
.end method

.method static final readBytes(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/ByteBuffer;)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, -0x1

    .line 99
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    .line 104
    invoke-interface {p0, p1}, Ljava/nio/channels/ReadableByteChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v0

    .line 109
    if-ge v0, v1, :cond_1

    move v1, v0

    .line 111
    :cond_0
    :goto_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    if-eqz v2, :cond_2

    if-eq v0, v3, :cond_2

    .line 112
    invoke-interface {p0, p1}, Ljava/nio/channels/ReadableByteChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v0

    .line 115
    if-eq v0, v3, :cond_0

    .line 116
    add-int/2addr v1, v0

    goto :goto_0

    :cond_1
    move v1, v0

    .line 121
    :cond_2
    if-lez v1, :cond_3

    .line 122
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 128
    :goto_1
    return v1

    .line 125
    :cond_3
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_1
.end method

.method static releaseDirectByteBuffer(Ljava/nio/ByteBuffer;)V
    .locals 4

    .prologue
    .line 175
    sget-boolean v0, Lorg/xerial/snappy/SnappyFramed;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 177
    :cond_1
    sget-object v0, Lorg/xerial/snappy/SnappyFramed;->SUN_DIRECT_BUFFER:Ljava/lang/Class;

    if-eqz v0, :cond_2

    sget-object v0, Lorg/xerial/snappy/SnappyFramed;->SUN_DIRECT_BUFFER:Ljava/lang/Class;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 179
    :try_start_0
    sget-object v1, Lorg/xerial/snappy/SnappyFramed;->SUN_BUFFER_CLEANER:Ljava/lang/reflect/Method;

    const/4 v0, 0x0

    check-cast v0, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 180
    sget-object v2, Lorg/xerial/snappy/SnappyFramed;->SUN_CLEANER_CLEAN:Ljava/lang/reflect/Method;

    const/4 v0, 0x0

    check-cast v0, [Ljava/lang/Object;

    invoke-virtual {v2, v1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    :cond_2
    :goto_0
    return-void

    .line 182
    :catch_0
    move-exception v0

    .line 183
    const-class v1, Lorg/xerial/snappy/SnappyFramed;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v1

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v3, "Exception occurred attempting to clean up Sun specific DirectByteBuffer."

    invoke-virtual {v1, v2, v3, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method static skip(Ljava/nio/channels/ReadableByteChannel;ILjava/nio/ByteBuffer;)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 134
    if-gtz p1, :cond_0

    .line 153
    :goto_0
    return v0

    :cond_0
    move v1, p1

    .line 140
    :cond_1
    :goto_1
    if-lez v1, :cond_3

    const/4 v2, -0x1

    if-eq v0, v2, :cond_3

    .line 141
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 142
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    if-ge v1, v0, :cond_2

    .line 143
    invoke-virtual {p2, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 146
    :cond_2
    invoke-interface {p0, p2}, Ljava/nio/channels/ReadableByteChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v0

    .line 147
    if-lez v0, :cond_1

    .line 148
    sub-int/2addr v1, v0

    goto :goto_1

    .line 152
    :cond_3
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 153
    sub-int v0, p1, v1

    goto :goto_0
.end method
