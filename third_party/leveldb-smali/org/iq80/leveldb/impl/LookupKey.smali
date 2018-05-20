.class public Lorg/iq80/leveldb/impl/LookupKey;
.super Ljava/lang/Object;
.source "LookupKey.java"


# instance fields
.field private final key:Lorg/iq80/leveldb/impl/InternalKey;


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/util/Slice;J)V
    .locals 2
    .param p1, "userKey"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "sequenceNumber"    # J

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Lorg/iq80/leveldb/impl/InternalKey;

    sget-object v1, Lorg/iq80/leveldb/impl/ValueType;->VALUE:Lorg/iq80/leveldb/impl/ValueType;

    invoke-direct {v0, p1, p2, p3, v1}, Lorg/iq80/leveldb/impl/InternalKey;-><init>(Lorg/iq80/leveldb/util/Slice;JLorg/iq80/leveldb/impl/ValueType;)V

    iput-object v0, p0, Lorg/iq80/leveldb/impl/LookupKey;->key:Lorg/iq80/leveldb/impl/InternalKey;

    .line 29
    return-void
.end method


# virtual methods
.method public getInternalKey()Lorg/iq80/leveldb/impl/InternalKey;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lorg/iq80/leveldb/impl/LookupKey;->key:Lorg/iq80/leveldb/impl/InternalKey;

    return-object v0
.end method

.method public getUserKey()Lorg/iq80/leveldb/util/Slice;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lorg/iq80/leveldb/impl/LookupKey;->key:Lorg/iq80/leveldb/impl/InternalKey;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/InternalKey;->getUserKey()Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lorg/iq80/leveldb/impl/LookupKey;->key:Lorg/iq80/leveldb/impl/InternalKey;

    invoke-virtual {v0}, Lorg/iq80/leveldb/impl/InternalKey;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
