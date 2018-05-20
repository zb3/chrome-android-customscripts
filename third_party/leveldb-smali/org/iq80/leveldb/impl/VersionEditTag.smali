.class public abstract enum Lorg/iq80/leveldb/impl/VersionEditTag;
.super Ljava/lang/Enum;
.source "VersionEditTag.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/iq80/leveldb/impl/VersionEditTag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/iq80/leveldb/impl/VersionEditTag;

.field public static final enum COMPACT_POINTER:Lorg/iq80/leveldb/impl/VersionEditTag;

.field public static final enum COMPARATOR:Lorg/iq80/leveldb/impl/VersionEditTag;

.field public static final enum DELETED_FILE:Lorg/iq80/leveldb/impl/VersionEditTag;

.field public static final enum LAST_SEQUENCE:Lorg/iq80/leveldb/impl/VersionEditTag;

.field public static final enum LOG_NUMBER:Lorg/iq80/leveldb/impl/VersionEditTag;

.field public static final enum NEW_FILE:Lorg/iq80/leveldb/impl/VersionEditTag;

.field public static final enum NEXT_FILE_NUMBER:Lorg/iq80/leveldb/impl/VersionEditTag;

.field public static final enum PREVIOUS_LOG_NUMBER:Lorg/iq80/leveldb/impl/VersionEditTag;


# instance fields
.field private final persistentId:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x5

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    .line 34
    new-instance v0, Lorg/iq80/leveldb/impl/VersionEditTag$1;

    const-string v1, "COMPARATOR"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v4}, Lorg/iq80/leveldb/impl/VersionEditTag$1;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/iq80/leveldb/impl/VersionEditTag;->COMPARATOR:Lorg/iq80/leveldb/impl/VersionEditTag;

    .line 56
    new-instance v0, Lorg/iq80/leveldb/impl/VersionEditTag$2;

    const-string v1, "LOG_NUMBER"

    invoke-direct {v0, v1, v4, v5}, Lorg/iq80/leveldb/impl/VersionEditTag$2;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/iq80/leveldb/impl/VersionEditTag;->LOG_NUMBER:Lorg/iq80/leveldb/impl/VersionEditTag;

    .line 75
    new-instance v0, Lorg/iq80/leveldb/impl/VersionEditTag$3;

    const-string v1, "PREVIOUS_LOG_NUMBER"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v5, v2}, Lorg/iq80/leveldb/impl/VersionEditTag$3;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/iq80/leveldb/impl/VersionEditTag;->PREVIOUS_LOG_NUMBER:Lorg/iq80/leveldb/impl/VersionEditTag;

    .line 95
    new-instance v0, Lorg/iq80/leveldb/impl/VersionEditTag$4;

    const-string v1, "NEXT_FILE_NUMBER"

    invoke-direct {v0, v1, v6, v6}, Lorg/iq80/leveldb/impl/VersionEditTag$4;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/iq80/leveldb/impl/VersionEditTag;->NEXT_FILE_NUMBER:Lorg/iq80/leveldb/impl/VersionEditTag;

    .line 114
    new-instance v0, Lorg/iq80/leveldb/impl/VersionEditTag$5;

    const-string v1, "LAST_SEQUENCE"

    invoke-direct {v0, v1, v7, v7}, Lorg/iq80/leveldb/impl/VersionEditTag$5;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/iq80/leveldb/impl/VersionEditTag;->LAST_SEQUENCE:Lorg/iq80/leveldb/impl/VersionEditTag;

    .line 133
    new-instance v0, Lorg/iq80/leveldb/impl/VersionEditTag$6;

    const-string v1, "COMPACT_POINTER"

    invoke-direct {v0, v1, v8, v8}, Lorg/iq80/leveldb/impl/VersionEditTag$6;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/iq80/leveldb/impl/VersionEditTag;->COMPACT_POINTER:Lorg/iq80/leveldb/impl/VersionEditTag;

    .line 162
    new-instance v0, Lorg/iq80/leveldb/impl/VersionEditTag$7;

    const-string v1, "DELETED_FILE"

    const/4 v2, 0x6

    const/4 v3, 0x6

    invoke-direct {v0, v1, v2, v3}, Lorg/iq80/leveldb/impl/VersionEditTag$7;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/iq80/leveldb/impl/VersionEditTag;->DELETED_FILE:Lorg/iq80/leveldb/impl/VersionEditTag;

    .line 191
    new-instance v0, Lorg/iq80/leveldb/impl/VersionEditTag$8;

    const-string v1, "NEW_FILE"

    const/4 v2, 0x7

    const/4 v3, 0x7

    invoke-direct {v0, v1, v2, v3}, Lorg/iq80/leveldb/impl/VersionEditTag$8;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/iq80/leveldb/impl/VersionEditTag;->NEW_FILE:Lorg/iq80/leveldb/impl/VersionEditTag;

    .line 30
    const/16 v0, 0x8

    new-array v0, v0, [Lorg/iq80/leveldb/impl/VersionEditTag;

    const/4 v1, 0x0

    sget-object v2, Lorg/iq80/leveldb/impl/VersionEditTag;->COMPARATOR:Lorg/iq80/leveldb/impl/VersionEditTag;

    aput-object v2, v0, v1

    sget-object v1, Lorg/iq80/leveldb/impl/VersionEditTag;->LOG_NUMBER:Lorg/iq80/leveldb/impl/VersionEditTag;

    aput-object v1, v0, v4

    sget-object v1, Lorg/iq80/leveldb/impl/VersionEditTag;->PREVIOUS_LOG_NUMBER:Lorg/iq80/leveldb/impl/VersionEditTag;

    aput-object v1, v0, v5

    sget-object v1, Lorg/iq80/leveldb/impl/VersionEditTag;->NEXT_FILE_NUMBER:Lorg/iq80/leveldb/impl/VersionEditTag;

    aput-object v1, v0, v6

    sget-object v1, Lorg/iq80/leveldb/impl/VersionEditTag;->LAST_SEQUENCE:Lorg/iq80/leveldb/impl/VersionEditTag;

    aput-object v1, v0, v7

    sget-object v1, Lorg/iq80/leveldb/impl/VersionEditTag;->COMPACT_POINTER:Lorg/iq80/leveldb/impl/VersionEditTag;

    aput-object v1, v0, v8

    const/4 v1, 0x6

    sget-object v2, Lorg/iq80/leveldb/impl/VersionEditTag;->DELETED_FILE:Lorg/iq80/leveldb/impl/VersionEditTag;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/iq80/leveldb/impl/VersionEditTag;->NEW_FILE:Lorg/iq80/leveldb/impl/VersionEditTag;

    aput-object v2, v0, v1

    sput-object v0, Lorg/iq80/leveldb/impl/VersionEditTag;->$VALUES:[Lorg/iq80/leveldb/impl/VersionEditTag;

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
    .line 252
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 253
    iput p3, p0, Lorg/iq80/leveldb/impl/VersionEditTag;->persistentId:I

    .line 254
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;IILorg/iq80/leveldb/impl/VersionEditTag$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .param p4, "x3"    # Lorg/iq80/leveldb/impl/VersionEditTag$1;

    .prologue
    .line 30
    invoke-direct {p0, p1, p2, p3}, Lorg/iq80/leveldb/impl/VersionEditTag;-><init>(Ljava/lang/String;II)V

    return-void
.end method

.method public static getValueTypeByPersistentId(I)Lorg/iq80/leveldb/impl/VersionEditTag;
    .locals 6
    .param p0, "persistentId"    # I

    .prologue
    const/4 v2, 0x0

    .line 241
    invoke-static {}, Lorg/iq80/leveldb/impl/VersionEditTag;->values()[Lorg/iq80/leveldb/impl/VersionEditTag;

    move-result-object v3

    array-length v4, v3

    move v1, v2

    :goto_0
    if-ge v1, v4, :cond_1

    aget-object v0, v3, v1

    .line 242
    .local v0, "compressionType":Lorg/iq80/leveldb/impl/VersionEditTag;
    iget v5, v0, Lorg/iq80/leveldb/impl/VersionEditTag;->persistentId:I

    if-ne v5, p0, :cond_0

    .line 243
    return-object v0

    .line 241
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 246
    .end local v0    # "compressionType":Lorg/iq80/leveldb/impl/VersionEditTag;
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v3, "Unknown %s persistentId %d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const-class v5, Lorg/iq80/leveldb/impl/VersionEditTag;

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v2

    const/4 v2, 0x1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v2

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/iq80/leveldb/impl/VersionEditTag;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 30
    const-class v0, Lorg/iq80/leveldb/impl/VersionEditTag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/VersionEditTag;

    return-object v0
.end method

.method public static values()[Lorg/iq80/leveldb/impl/VersionEditTag;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lorg/iq80/leveldb/impl/VersionEditTag;->$VALUES:[Lorg/iq80/leveldb/impl/VersionEditTag;

    invoke-virtual {v0}, [Lorg/iq80/leveldb/impl/VersionEditTag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/iq80/leveldb/impl/VersionEditTag;

    return-object v0
.end method


# virtual methods
.method public getPersistentId()I
    .locals 1

    .prologue
    .line 258
    iget v0, p0, Lorg/iq80/leveldb/impl/VersionEditTag;->persistentId:I

    return v0
.end method

.method public abstract readValue(Lorg/iq80/leveldb/util/SliceInput;Lorg/iq80/leveldb/impl/VersionEdit;)V
.end method

.method public abstract writeValue(Lorg/iq80/leveldb/util/SliceOutput;Lorg/iq80/leveldb/impl/VersionEdit;)V
.end method
