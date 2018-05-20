.class public final enum Lorg/iq80/leveldb/impl/Filename$FileType;
.super Ljava/lang/Enum;
.source "Filename.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/impl/Filename;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "FileType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/iq80/leveldb/impl/Filename$FileType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/iq80/leveldb/impl/Filename$FileType;

.field public static final enum CURRENT:Lorg/iq80/leveldb/impl/Filename$FileType;

.field public static final enum DB_LOCK:Lorg/iq80/leveldb/impl/Filename$FileType;

.field public static final enum DESCRIPTOR:Lorg/iq80/leveldb/impl/Filename$FileType;

.field public static final enum INFO_LOG:Lorg/iq80/leveldb/impl/Filename$FileType;

.field public static final enum LOG:Lorg/iq80/leveldb/impl/Filename$FileType;

.field public static final enum TABLE:Lorg/iq80/leveldb/impl/Filename$FileType;

.field public static final enum TEMP:Lorg/iq80/leveldb/impl/Filename$FileType;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 37
    new-instance v0, Lorg/iq80/leveldb/impl/Filename$FileType;

    const-string v1, "LOG"

    invoke-direct {v0, v1, v3}, Lorg/iq80/leveldb/impl/Filename$FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/iq80/leveldb/impl/Filename$FileType;->LOG:Lorg/iq80/leveldb/impl/Filename$FileType;

    .line 38
    new-instance v0, Lorg/iq80/leveldb/impl/Filename$FileType;

    const-string v1, "DB_LOCK"

    invoke-direct {v0, v1, v4}, Lorg/iq80/leveldb/impl/Filename$FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/iq80/leveldb/impl/Filename$FileType;->DB_LOCK:Lorg/iq80/leveldb/impl/Filename$FileType;

    .line 39
    new-instance v0, Lorg/iq80/leveldb/impl/Filename$FileType;

    const-string v1, "TABLE"

    invoke-direct {v0, v1, v5}, Lorg/iq80/leveldb/impl/Filename$FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/iq80/leveldb/impl/Filename$FileType;->TABLE:Lorg/iq80/leveldb/impl/Filename$FileType;

    .line 40
    new-instance v0, Lorg/iq80/leveldb/impl/Filename$FileType;

    const-string v1, "DESCRIPTOR"

    invoke-direct {v0, v1, v6}, Lorg/iq80/leveldb/impl/Filename$FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/iq80/leveldb/impl/Filename$FileType;->DESCRIPTOR:Lorg/iq80/leveldb/impl/Filename$FileType;

    .line 41
    new-instance v0, Lorg/iq80/leveldb/impl/Filename$FileType;

    const-string v1, "CURRENT"

    invoke-direct {v0, v1, v7}, Lorg/iq80/leveldb/impl/Filename$FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/iq80/leveldb/impl/Filename$FileType;->CURRENT:Lorg/iq80/leveldb/impl/Filename$FileType;

    .line 42
    new-instance v0, Lorg/iq80/leveldb/impl/Filename$FileType;

    const-string v1, "TEMP"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lorg/iq80/leveldb/impl/Filename$FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/iq80/leveldb/impl/Filename$FileType;->TEMP:Lorg/iq80/leveldb/impl/Filename$FileType;

    .line 43
    new-instance v0, Lorg/iq80/leveldb/impl/Filename$FileType;

    const-string v1, "INFO_LOG"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lorg/iq80/leveldb/impl/Filename$FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/iq80/leveldb/impl/Filename$FileType;->INFO_LOG:Lorg/iq80/leveldb/impl/Filename$FileType;

    .line 35
    const/4 v0, 0x7

    new-array v0, v0, [Lorg/iq80/leveldb/impl/Filename$FileType;

    sget-object v1, Lorg/iq80/leveldb/impl/Filename$FileType;->LOG:Lorg/iq80/leveldb/impl/Filename$FileType;

    aput-object v1, v0, v3

    sget-object v1, Lorg/iq80/leveldb/impl/Filename$FileType;->DB_LOCK:Lorg/iq80/leveldb/impl/Filename$FileType;

    aput-object v1, v0, v4

    sget-object v1, Lorg/iq80/leveldb/impl/Filename$FileType;->TABLE:Lorg/iq80/leveldb/impl/Filename$FileType;

    aput-object v1, v0, v5

    sget-object v1, Lorg/iq80/leveldb/impl/Filename$FileType;->DESCRIPTOR:Lorg/iq80/leveldb/impl/Filename$FileType;

    aput-object v1, v0, v6

    sget-object v1, Lorg/iq80/leveldb/impl/Filename$FileType;->CURRENT:Lorg/iq80/leveldb/impl/Filename$FileType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lorg/iq80/leveldb/impl/Filename$FileType;->TEMP:Lorg/iq80/leveldb/impl/Filename$FileType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/iq80/leveldb/impl/Filename$FileType;->INFO_LOG:Lorg/iq80/leveldb/impl/Filename$FileType;

    aput-object v2, v0, v1

    sput-object v0, Lorg/iq80/leveldb/impl/Filename$FileType;->$VALUES:[Lorg/iq80/leveldb/impl/Filename$FileType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 35
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/iq80/leveldb/impl/Filename$FileType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 35
    const-class v0, Lorg/iq80/leveldb/impl/Filename$FileType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/Filename$FileType;

    return-object v0
.end method

.method public static values()[Lorg/iq80/leveldb/impl/Filename$FileType;
    .locals 1

    .prologue
    .line 35
    sget-object v0, Lorg/iq80/leveldb/impl/Filename$FileType;->$VALUES:[Lorg/iq80/leveldb/impl/Filename$FileType;

    invoke-virtual {v0}, [Lorg/iq80/leveldb/impl/Filename$FileType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/iq80/leveldb/impl/Filename$FileType;

    return-object v0
.end method
