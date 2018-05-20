.class public Lorg/xerial/snappy/SnappyCodec;
.super Ljava/lang/Object;
.source "SnappyCodec.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final DEFAULT_VERSION:I = 0x1

.field public static final HEADER_SIZE:I

.field static final MAGIC_HEADER:[B

.field public static final MAGIC_HEADER_HEAD:I

.field public static final MAGIC_LEN:I

.field public static final MINIMUM_COMPATIBLE_VERSION:I = 0x1

.field public static final currentHeader:Lorg/xerial/snappy/SnappyCodec;


# instance fields
.field public final compatibleVersion:I

.field private final headerArray:[B

.field public final magic:[B

.field public final version:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 49
    const-class v0, Lorg/xerial/snappy/SnappyCodec;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    sput-boolean v0, Lorg/xerial/snappy/SnappyCodec;->$assertionsDisabled:Z

    .line 51
    const/16 v0, 0x8

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/xerial/snappy/SnappyCodec;->MAGIC_HEADER:[B

    .line 52
    sget-object v0, Lorg/xerial/snappy/SnappyCodec;->MAGIC_HEADER:[B

    array-length v0, v0

    sput v0, Lorg/xerial/snappy/SnappyCodec;->MAGIC_LEN:I

    .line 53
    sget v0, Lorg/xerial/snappy/SnappyCodec;->MAGIC_LEN:I

    add-int/lit8 v0, v0, 0x8

    sput v0, Lorg/xerial/snappy/SnappyCodec;->HEADER_SIZE:I

    .line 54
    sget-object v0, Lorg/xerial/snappy/SnappyCodec;->MAGIC_HEADER:[B

    invoke-static {v0, v2}, Lorg/xerial/snappy/SnappyOutputStream;->readInt([BI)I

    move-result v0

    sput v0, Lorg/xerial/snappy/SnappyCodec;->MAGIC_HEADER_HEAD:I

    .line 57
    sget-boolean v0, Lorg/xerial/snappy/SnappyCodec;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    sget v0, Lorg/xerial/snappy/SnappyCodec;->MAGIC_HEADER_HEAD:I

    if-ltz v0, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_0
    move v0, v2

    .line 49
    goto :goto_0

    .line 62
    :cond_1
    new-instance v0, Lorg/xerial/snappy/SnappyCodec;

    sget-object v2, Lorg/xerial/snappy/SnappyCodec;->MAGIC_HEADER:[B

    invoke-direct {v0, v2, v1, v1}, Lorg/xerial/snappy/SnappyCodec;-><init>([BII)V

    sput-object v0, Lorg/xerial/snappy/SnappyCodec;->currentHeader:Lorg/xerial/snappy/SnappyCodec;

    return-void

    .line 51
    nop

    :array_0
    .array-data 1
        -0x7et
        0x53t
        0x4et
        0x41t
        0x50t
        0x50t
        0x59t
        0x0t
    .end array-data
.end method

.method private constructor <init>([BII)V
    .locals 4

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p1, p0, Lorg/xerial/snappy/SnappyCodec;->magic:[B

    .line 72
    iput p2, p0, Lorg/xerial/snappy/SnappyCodec;->version:I

    .line 73
    iput p3, p0, Lorg/xerial/snappy/SnappyCodec;->compatibleVersion:I

    .line 75
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    sget v1, Lorg/xerial/snappy/SnappyCodec;->HEADER_SIZE:I

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 76
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 78
    const/4 v2, 0x0

    :try_start_0
    sget v3, Lorg/xerial/snappy/SnappyCodec;->MAGIC_LEN:I

    invoke-virtual {v1, p1, v2, v3}, Ljava/io/DataOutputStream;->write([BII)V

    .line 79
    invoke-virtual {v1, p2}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 80
    invoke-virtual {v1, p3}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 81
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    iput-object v0, p0, Lorg/xerial/snappy/SnappyCodec;->headerArray:[B

    .line 87
    return-void

    .line 83
    :catch_0
    move-exception v0

    .line 84
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static getMagicHeader()[B
    .locals 1

    .prologue
    .line 91
    sget-object v0, Lorg/xerial/snappy/SnappyCodec;->MAGIC_HEADER:[B

    invoke-virtual {v0}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method

.method public static hasMagicHeaderPrefix([B)Z
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 124
    sget v1, Lorg/xerial/snappy/SnappyCodec;->MAGIC_LEN:I

    array-length v2, p0

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    move v1, v0

    .line 126
    :goto_0
    if-ge v1, v2, :cond_1

    .line 127
    aget-byte v3, p0, v1

    sget-object v4, Lorg/xerial/snappy/SnappyCodec;->MAGIC_HEADER:[B

    aget-byte v4, v4, v1

    if-eq v3, v4, :cond_0

    .line 132
    :goto_1
    return v0

    .line 130
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 132
    :cond_1
    const/4 v0, 0x1

    goto :goto_1
.end method

.method public static headerSize()I
    .locals 1

    .prologue
    .line 102
    sget v0, Lorg/xerial/snappy/SnappyCodec;->HEADER_SIZE:I

    return v0
.end method

.method public static readHeader(Ljava/io/InputStream;)Lorg/xerial/snappy/SnappyCodec;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    new-instance v0, Ljava/io/DataInputStream;

    invoke-direct {v0, p0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 139
    sget v1, Lorg/xerial/snappy/SnappyCodec;->MAGIC_LEN:I

    new-array v1, v1, [B

    .line 140
    const/4 v2, 0x0

    sget v3, Lorg/xerial/snappy/SnappyCodec;->MAGIC_LEN:I

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/DataInputStream;->readFully([BII)V

    .line 141
    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result v2

    .line 142
    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    .line 143
    new-instance v3, Lorg/xerial/snappy/SnappyCodec;

    invoke-direct {v3, v1, v2, v0}, Lorg/xerial/snappy/SnappyCodec;-><init>([BII)V

    return-object v3
.end method


# virtual methods
.method public isValidMagicHeader()Z
    .locals 2

    .prologue
    .line 120
    sget-object v0, Lorg/xerial/snappy/SnappyCodec;->MAGIC_HEADER:[B

    iget-object v1, p0, Lorg/xerial/snappy/SnappyCodec;->magic:[B

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 97
    const-string v0, "version:%d, compatible version:%d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lorg/xerial/snappy/SnappyCodec;->version:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lorg/xerial/snappy/SnappyCodec;->compatibleVersion:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeHeader(Ljava/io/OutputStream;)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 114
    iget-object v0, p0, Lorg/xerial/snappy/SnappyCodec;->headerArray:[B

    const/4 v1, 0x0

    iget-object v2, p0, Lorg/xerial/snappy/SnappyCodec;->headerArray:[B

    array-length v2, v2

    invoke-virtual {p1, v0, v1, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 115
    iget-object v0, p0, Lorg/xerial/snappy/SnappyCodec;->headerArray:[B

    array-length v0, v0

    return v0
.end method

.method public writeHeader([BI)I
    .locals 3

    .prologue
    .line 107
    iget-object v0, p0, Lorg/xerial/snappy/SnappyCodec;->headerArray:[B

    const/4 v1, 0x0

    iget-object v2, p0, Lorg/xerial/snappy/SnappyCodec;->headerArray:[B

    array-length v2, v2

    invoke-static {v0, v1, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 108
    iget-object v0, p0, Lorg/xerial/snappy/SnappyCodec;->headerArray:[B

    array-length v0, v0

    return v0
.end method
