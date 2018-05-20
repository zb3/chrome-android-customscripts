.class public final enum Lorg/iq80/leveldb/impl/ValueType;
.super Ljava/lang/Enum;
.source "ValueType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/iq80/leveldb/impl/ValueType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/iq80/leveldb/impl/ValueType;

.field public static final enum DELETION:Lorg/iq80/leveldb/impl/ValueType;

.field public static final enum VALUE:Lorg/iq80/leveldb/impl/ValueType;


# instance fields
.field private final persistentId:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 22
    new-instance v0, Lorg/iq80/leveldb/impl/ValueType;

    const-string v1, "DELETION"

    invoke-direct {v0, v1, v2, v2}, Lorg/iq80/leveldb/impl/ValueType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/iq80/leveldb/impl/ValueType;->DELETION:Lorg/iq80/leveldb/impl/ValueType;

    .line 23
    new-instance v0, Lorg/iq80/leveldb/impl/ValueType;

    const-string v1, "VALUE"

    invoke-direct {v0, v1, v3, v3}, Lorg/iq80/leveldb/impl/ValueType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/iq80/leveldb/impl/ValueType;->VALUE:Lorg/iq80/leveldb/impl/ValueType;

    .line 20
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/iq80/leveldb/impl/ValueType;

    sget-object v1, Lorg/iq80/leveldb/impl/ValueType;->DELETION:Lorg/iq80/leveldb/impl/ValueType;

    aput-object v1, v0, v2

    sget-object v1, Lorg/iq80/leveldb/impl/ValueType;->VALUE:Lorg/iq80/leveldb/impl/ValueType;

    aput-object v1, v0, v3

    sput-object v0, Lorg/iq80/leveldb/impl/ValueType;->$VALUES:[Lorg/iq80/leveldb/impl/ValueType;

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
    .line 40
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 41
    iput p3, p0, Lorg/iq80/leveldb/impl/ValueType;->persistentId:I

    .line 42
    return-void
.end method

.method public static getValueTypeByPersistentId(I)Lorg/iq80/leveldb/impl/ValueType;
    .locals 3
    .param p0, "persistentId"    # I

    .prologue
    .line 27
    packed-switch p0, :pswitch_data_0

    .line 33
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown persistentId "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 29
    :pswitch_0
    sget-object v0, Lorg/iq80/leveldb/impl/ValueType;->DELETION:Lorg/iq80/leveldb/impl/ValueType;

    .line 31
    :goto_0
    return-object v0

    :pswitch_1
    sget-object v0, Lorg/iq80/leveldb/impl/ValueType;->VALUE:Lorg/iq80/leveldb/impl/ValueType;

    goto :goto_0

    .line 27
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/iq80/leveldb/impl/ValueType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 20
    const-class v0, Lorg/iq80/leveldb/impl/ValueType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/iq80/leveldb/impl/ValueType;

    return-object v0
.end method

.method public static values()[Lorg/iq80/leveldb/impl/ValueType;
    .locals 1

    .prologue
    .line 20
    sget-object v0, Lorg/iq80/leveldb/impl/ValueType;->$VALUES:[Lorg/iq80/leveldb/impl/ValueType;

    invoke-virtual {v0}, [Lorg/iq80/leveldb/impl/ValueType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/iq80/leveldb/impl/ValueType;

    return-object v0
.end method


# virtual methods
.method public getPersistentId()I
    .locals 1

    .prologue
    .line 46
    iget v0, p0, Lorg/iq80/leveldb/impl/ValueType;->persistentId:I

    return v0
.end method
