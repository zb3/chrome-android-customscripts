.class public Lorg/iq80/leveldb/impl/LookupResult;
.super Ljava/lang/Object;
.source "LookupResult.java"


# instance fields
.field private final deleted:Z

.field private final key:Lorg/iq80/leveldb/impl/LookupKey;

.field private final value:Lorg/iq80/leveldb/util/Slice;


# direct methods
.method private constructor <init>(Lorg/iq80/leveldb/impl/LookupKey;Lorg/iq80/leveldb/util/Slice;Z)V
    .locals 1
    .param p1, "key"    # Lorg/iq80/leveldb/impl/LookupKey;
    .param p2, "value"    # Lorg/iq80/leveldb/util/Slice;
    .param p3, "deleted"    # Z

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const-string v0, "key is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    iput-object p1, p0, Lorg/iq80/leveldb/impl/LookupResult;->key:Lorg/iq80/leveldb/impl/LookupKey;

    .line 43
    if-eqz p2, :cond_0

    .line 44
    invoke-virtual {p2}, Lorg/iq80/leveldb/util/Slice;->slice()Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/LookupResult;->value:Lorg/iq80/leveldb/util/Slice;

    .line 49
    :goto_0
    iput-boolean p3, p0, Lorg/iq80/leveldb/impl/LookupResult;->deleted:Z

    .line 50
    return-void

    .line 47
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/iq80/leveldb/impl/LookupResult;->value:Lorg/iq80/leveldb/util/Slice;

    goto :goto_0
.end method

.method public static deleted(Lorg/iq80/leveldb/impl/LookupKey;)Lorg/iq80/leveldb/impl/LookupResult;
    .locals 3
    .param p0, "key"    # Lorg/iq80/leveldb/impl/LookupKey;

    .prologue
    .line 32
    new-instance v0, Lorg/iq80/leveldb/impl/LookupResult;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, p0, v1, v2}, Lorg/iq80/leveldb/impl/LookupResult;-><init>(Lorg/iq80/leveldb/impl/LookupKey;Lorg/iq80/leveldb/util/Slice;Z)V

    return-object v0
.end method

.method public static ok(Lorg/iq80/leveldb/impl/LookupKey;Lorg/iq80/leveldb/util/Slice;)Lorg/iq80/leveldb/impl/LookupResult;
    .locals 2
    .param p0, "key"    # Lorg/iq80/leveldb/impl/LookupKey;
    .param p1, "value"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 27
    new-instance v0, Lorg/iq80/leveldb/impl/LookupResult;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lorg/iq80/leveldb/impl/LookupResult;-><init>(Lorg/iq80/leveldb/impl/LookupKey;Lorg/iq80/leveldb/util/Slice;Z)V

    return-object v0
.end method


# virtual methods
.method public getKey()Lorg/iq80/leveldb/impl/LookupKey;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lorg/iq80/leveldb/impl/LookupResult;->key:Lorg/iq80/leveldb/impl/LookupKey;

    return-object v0
.end method

.method public getValue()Lorg/iq80/leveldb/util/Slice;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lorg/iq80/leveldb/impl/LookupResult;->value:Lorg/iq80/leveldb/util/Slice;

    if-nez v0, :cond_0

    .line 60
    const/4 v0, 0x0

    .line 62
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/iq80/leveldb/impl/LookupResult;->value:Lorg/iq80/leveldb/util/Slice;

    goto :goto_0
.end method

.method public isDeleted()Z
    .locals 1

    .prologue
    .line 67
    iget-boolean v0, p0, Lorg/iq80/leveldb/impl/LookupResult;->deleted:Z

    return v0
.end method
