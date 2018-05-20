.class public final enum Lorg/iq80/leveldb/impl/LogChunkType;
.super Ljava/lang/Enum;
.source "LogChunkType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/iq80/leveldb/impl/LogChunkType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/iq80/leveldb/impl/LogChunkType;

.field public static final enum BAD_CHUNK:Lorg/iq80/leveldb/impl/LogChunkType;

.field public static final enum EOF:Lorg/iq80/leveldb/impl/LogChunkType;

.field public static final enum FIRST:Lorg/iq80/leveldb/impl/LogChunkType;

.field public static final enum FULL:Lorg/iq80/leveldb/impl/LogChunkType;

.field public static final enum LAST:Lorg/iq80/leveldb/impl/LogChunkType;

.field public static final enum MIDDLE:Lorg/iq80/leveldb/impl/LogChunkType;

.field public static final enum UNKNOWN:Lorg/iq80/leveldb/impl/LogChunkType;

.field public static final enum ZERO_TYPE:Lorg/iq80/leveldb/impl/LogChunkType;


# instance fields
.field private final persistentId:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 24
    new-instance v0, Lorg/iq80/leveldb/impl/LogChunkType;

    const-string v1, "ZERO_TYPE"

    invoke-direct {v0, v1, v3, v3}, Lorg/iq80/leveldb/impl/LogChunkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/iq80/leveldb/impl/LogChunkType;->ZERO_TYPE:Lorg/iq80/leveldb/impl/LogChunkType;

    .line 25
    new-instance v0, Lorg/iq80/leveldb/impl/LogChunkType;

    const-string v1, "FULL"

    invoke-direct {v0, v1, v4, v4}, Lorg/iq80/leveldb/impl/LogChunkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/iq80/leveldb/impl/LogChunkType;->FULL:Lorg/iq80/leveldb/impl/LogChunkType;

    .line 26
    new-instance v0, Lorg/iq80/leveldb/impl/LogChunkType;

    const-string v1, "FIRST"

    invoke-direct {v0, v1, v5, v5}, Lorg/iq80/leveldb/impl/LogChunkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/iq80/leveldb/impl/LogChunkType;->FIRST:Lorg/iq80/leveldb/impl/LogChunkType;

    .line 27
    new-instance v0, Lorg/iq80/leveldb/impl/LogChunkType;

    const-string v1, "MIDDLE"

    invoke-direct {v0, v1, v6, v6}, Lorg/iq80/leveldb/impl/LogChunkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/iq80/leveldb/impl/LogChunkType;->MIDDLE:Lorg/iq80/leveldb/impl/LogChunkType;

    .line 28
    new-instance v0, Lorg/iq80/leveldb/impl/LogChunkType;

    const-string v1, "LAST"

    invoke-direct {v0, v1, v7, v7}, Lorg/iq80/leveldb/impl/LogChunkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/iq80/leveldb/impl/LogChunkType;->LAST:Lorg/iq80/leveldb/impl/LogChunkType;

    .line 29
    new-instance v0, Lorg/iq80/leveldb/impl/LogChunkType;

    const-string v1, "EOF"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lorg/iq80/leveldb/impl/LogChunkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/iq80/leveldb/impl/LogChunkType;->EOF:Lorg/iq80/leveldb/impl/LogChunkType;

    .line 30
    new-instance v0, Lorg/iq80/leveldb/impl/LogChunkType;

    const-string v1, "BAD_CHUNK"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lorg/iq80/leveldb/impl/LogChunkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/iq80/leveldb/impl/LogChunkType;->BAD_CHUNK:Lorg/iq80/leveldb/impl/LogChunkType;

    .line 31
    new-instance v0, Lorg/iq80/leveldb/impl/LogChunkType;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lorg/iq80/leveldb/impl/LogChunkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/iq80/leveldb/impl/LogChunkType;->UNKNOWN:Lorg/iq80/leveldb/impl/LogChunkType;

    .line 22
    const/16 v0, 0x8

    new-array v0, v0, [Lorg/iq80/leveldb/impl/LogChunkType;

    sget-object v1, Lorg/iq80/leveldb/impl/LogChunkType;->ZERO_TYPE:Lorg/iq80/leveldb/impl/LogChunkType;

    aput-object v1, v0, v3

    sget-object v1, Lorg/iq80/leveldb/impl/LogChunkType;->FULL:Lorg/iq80/leveldb/impl/LogChunkType;

    aput-object v1, v0, v4

    sget-object v1, Lorg/iq80/leveldb/impl/LogChunkType;->FIRST:Lorg/iq80/leveldb/impl/LogChunkType;

    aput-object v1, v0, v5

    sget-object v1, Lorg/iq80/leveldb/impl/LogChunkType;->MIDDLE:Lorg/iq80/leveldb/impl/LogChunkType;

    aput-object v1, v0, v6

    sget-object v1, Lorg/iq80/leveldb/impl/LogChunkType;->LAST:Lorg/iq80/leveldb/impl/LogChunkType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lorg/iq80/leveldb/impl/LogChunkType;->EOF:Lorg/iq80/leveldb/impl/LogChunkType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/iq80/leveldb/impl/LogChunkType;->BAD_CHUNK:Lorg/iq80/leveldb/impl/LogChunkType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/iq80/leveldb/impl/LogChunkType;->UNKNOWN:Lorg/iq80/leveldb/impl/LogChunkType;

    aput-object v2, v0, v1

    sput-object v0, Lorg/iq80/leveldb/impl/LogChunkType;->$VALUES:[Lorg/iq80/leveldb/impl/LogChunkType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 47
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/LogChunkType;->persistentId:Ljava/lang/Integer;

    .line 48
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 1
    .param p3, "persistentId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 51
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 52
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/LogChunkType;->persistentId:Ljava/lang/Integer;

    .line 53
    return-void
.end method

.method public static getLogChunkTypeByPersistentId(I)Lorg/iq80/leveldb/impl/LogChunkType;
    .locals 5
    .param p0, "persistentId"    # I

    .prologue
    .line 35
    invoke-static {}, Lorg/iq80/leveldb/impl/LogChunkType;->values()[Lorg/iq80/leveldb/impl/LogChunkType;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_1

    aget-object v0, v2, v1

    .line 36
    .local v0, "logChunkType":Lorg/iq80/leveldb/impl/LogChunkType;
    iget-object v4, v0, Lorg/iq80/leveldb/impl/LogChunkType;->persistentId:Ljava/lang/Integer;

    if-eqz v4, :cond_0

    iget-object v4, v0, Lorg/iq80/leveldb/impl/LogChunkType;->persistentId:Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, p0, :cond_0

    .line 40
    .end local v0    # "logChunkType":Lorg/iq80/leveldb/impl/LogChunkType;
    :goto_1
    return-object v0

    .line 35
    .restart local v0    # "logChunkType":Lorg/iq80/leveldb/impl/LogChunkType;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 40
    .end local v0    # "logChunkType":Lorg/iq80/leveldb/impl/LogChunkType;
    :cond_1
    sget-object v0, Lorg/iq80/leveldb/impl/LogChunkType;->UNKNOWN:Lorg/iq80/leveldb/impl/LogChunkType;

    goto :goto_1
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/iq80/leveldb/impl/LogChunkType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 22
    const-class v0, Lorg/iq80/leveldb/impl/LogChunkType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/LogChunkType;

    return-object v0
.end method

.method public static values()[Lorg/iq80/leveldb/impl/LogChunkType;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lorg/iq80/leveldb/impl/LogChunkType;->$VALUES:[Lorg/iq80/leveldb/impl/LogChunkType;

    invoke-virtual {v0}, [Lorg/iq80/leveldb/impl/LogChunkType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/iq80/leveldb/impl/LogChunkType;

    return-object v0
.end method


# virtual methods
.method public getPersistentId()I
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 57
    iget-object v0, p0, Lorg/iq80/leveldb/impl/LogChunkType;->persistentId:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    const-string v3, "%s is not a persistent chunk type"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/iq80/leveldb/impl/LogChunkType;->name()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v2

    invoke-static {v0, v3, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 58
    iget-object v0, p0, Lorg/iq80/leveldb/impl/LogChunkType;->persistentId:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    :cond_0
    move v0, v2

    .line 57
    goto :goto_0
.end method
