.class final Lorg/iq80/snappy/SnappyFramed;
.super Ljava/lang/Object;
.source "SnappyFramed.java"


# static fields
.field public static final COMPRESSED_DATA_FLAG:I = 0x0

.field public static final HEADER_BYTES:[B

.field public static final STREAM_IDENTIFIER_FLAG:I = 0xff

.field public static final UNCOMPRESSED_DATA_FLAG:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const/16 v0, 0xa

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/iq80/snappy/SnappyFramed;->HEADER_BYTES:[B

    return-void

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

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    return-void
.end method
