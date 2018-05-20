.class public final enum Lorg/iq80/leveldb/CompressionType;
.super Ljava/lang/Enum;
.source "CompressionType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/iq80/leveldb/CompressionType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/iq80/leveldb/CompressionType;

.field public static final enum NONE:Lorg/iq80/leveldb/CompressionType;

.field public static final enum SNAPPY:Lorg/iq80/leveldb/CompressionType;


# instance fields
.field private final persistentId:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 22
    new-instance v0, Lorg/iq80/leveldb/CompressionType;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v2, v2}, Lorg/iq80/leveldb/CompressionType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/iq80/leveldb/CompressionType;->NONE:Lorg/iq80/leveldb/CompressionType;

    .line 23
    new-instance v0, Lorg/iq80/leveldb/CompressionType;

    const-string v1, "SNAPPY"

    invoke-direct {v0, v1, v3, v3}, Lorg/iq80/leveldb/CompressionType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/iq80/leveldb/CompressionType;->SNAPPY:Lorg/iq80/leveldb/CompressionType;

    .line 20
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/iq80/leveldb/CompressionType;

    sget-object v1, Lorg/iq80/leveldb/CompressionType;->NONE:Lorg/iq80/leveldb/CompressionType;

    aput-object v1, v0, v2

    sget-object v1, Lorg/iq80/leveldb/CompressionType;->SNAPPY:Lorg/iq80/leveldb/CompressionType;

    aput-object v1, v0, v3

    sput-object v0, Lorg/iq80/leveldb/CompressionType;->$VALUES:[Lorg/iq80/leveldb/CompressionType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "persistentId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 38
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 39
    iput p3, p0, Lorg/iq80/leveldb/CompressionType;->persistentId:I

    .line 40
    return-void
.end method

.method public static getCompressionTypeByPersistentId(I)Lorg/iq80/leveldb/CompressionType;
    .locals 5
    .param p0, "persistentId"    # I

    .prologue
    .line 27
    invoke-static {}, Lorg/iq80/leveldb/CompressionType;->values()[Lorg/iq80/leveldb/CompressionType;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_1

    aget-object v0, v2, v1

    .line 28
    .local v0, "compressionType":Lorg/iq80/leveldb/CompressionType;
    iget v4, v0, Lorg/iq80/leveldb/CompressionType;->persistentId:I

    if-ne v4, p0, :cond_0

    .line 29
    return-object v0

    .line 27
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 32
    .end local v0    # "compressionType":Lorg/iq80/leveldb/CompressionType;
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown persistentId "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/iq80/leveldb/CompressionType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 20
    const-class v0, Lorg/iq80/leveldb/CompressionType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/CompressionType;

    return-object v0
.end method

.method public static values()[Lorg/iq80/leveldb/CompressionType;
    .locals 1

    .prologue
    .line 20
    sget-object v0, Lorg/iq80/leveldb/CompressionType;->$VALUES:[Lorg/iq80/leveldb/CompressionType;

    invoke-virtual {v0}, [Lorg/iq80/leveldb/CompressionType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/iq80/leveldb/CompressionType;

    return-object v0
.end method


# virtual methods
.method public persistentId()I
    .locals 1

    .prologue
    .line 44
    iget v0, p0, Lorg/iq80/leveldb/CompressionType;->persistentId:I

    return v0
.end method
