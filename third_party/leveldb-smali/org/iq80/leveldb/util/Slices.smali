.class public final Lorg/iq80/leveldb/util/Slices;
.super Ljava/lang/Object;
.source "Slices.java"


# static fields
.field public static final EMPTY_SLICE:Lorg/iq80/leveldb/util/Slice;

.field private static final decoders:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/nio/charset/Charset;",
            "Ljava/nio/charset/CharsetDecoder;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final encoders:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/nio/charset/Charset;",
            "Ljava/nio/charset/CharsetEncoder;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 51
    new-instance v0, Lorg/iq80/leveldb/util/Slice;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/iq80/leveldb/util/Slice;-><init>(I)V

    sput-object v0, Lorg/iq80/leveldb/util/Slices;->EMPTY_SLICE:Lorg/iq80/leveldb/util/Slice;

    .line 166
    new-instance v0, Lorg/iq80/leveldb/util/Slices$1;

    invoke-direct {v0}, Lorg/iq80/leveldb/util/Slices$1;-><init>()V

    sput-object v0, Lorg/iq80/leveldb/util/Slices;->encoders:Ljava/lang/ThreadLocal;

    .line 176
    new-instance v0, Lorg/iq80/leveldb/util/Slices$2;

    invoke-direct {v0}, Lorg/iq80/leveldb/util/Slices$2;-><init>()V

    sput-object v0, Lorg/iq80/leveldb/util/Slices;->decoders:Ljava/lang/ThreadLocal;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    return-void
.end method

.method public static allocate(I)Lorg/iq80/leveldb/util/Slice;
    .locals 1
    .param p0, "capacity"    # I

    .prologue
    .line 86
    if-nez p0, :cond_0

    .line 87
    sget-object v0, Lorg/iq80/leveldb/util/Slices;->EMPTY_SLICE:Lorg/iq80/leveldb/util/Slice;

    .line 89
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/iq80/leveldb/util/Slice;

    invoke-direct {v0, p0}, Lorg/iq80/leveldb/util/Slice;-><init>(I)V

    goto :goto_0
.end method

.method public static copiedBuffer(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/iq80/leveldb/util/Slice;
    .locals 1
    .param p0, "string"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 117
    const-string v0, "string is null"

    invoke-static {p0, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    const-string v0, "charset is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-static {v0}, Lorg/iq80/leveldb/util/Slices;->wrappedBuffer([B)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    return-object v0
.end method

.method public static copiedBuffer(Ljava/nio/ByteBuffer;)Lorg/iq80/leveldb/util/Slice;
    .locals 4
    .param p0, "source"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 109
    const-string v1, "source is null"

    invoke-static {p0, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-static {v1}, Lorg/iq80/leveldb/util/Slices;->allocate(I)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    .line 111
    .local v0, "copy":Lorg/iq80/leveldb/util/Slice;
    const/4 v1, 0x0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v2

    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/iq80/leveldb/util/Slice;->setBytes(ILjava/nio/ByteBuffer;)V

    .line 112
    return-object v0
.end method

.method public static copiedBuffer(Ljava/nio/ByteBuffer;II)Lorg/iq80/leveldb/util/Slice;
    .locals 3
    .param p0, "source"    # Ljava/nio/ByteBuffer;
    .param p1, "sourceOffset"    # I
    .param p2, "length"    # I

    .prologue
    .line 102
    const-string v1, "source is null"

    invoke-static {p0, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    add-int v0, v1, p1

    .line 104
    .local v0, "newPosition":I
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v1

    sget-object v2, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    move-result-object v1

    add-int v2, v0, p2

    invoke-virtual {v1, v2}, Ljava/nio/Buffer;->limit(I)Ljava/nio/Buffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/nio/Buffer;->position(I)Ljava/nio/Buffer;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-static {v1}, Lorg/iq80/leveldb/util/Slices;->copiedBuffer(Ljava/nio/ByteBuffer;)Lorg/iq80/leveldb/util/Slice;

    move-result-object v1

    return-object v1
.end method

.method public static decodeString(Ljava/nio/ByteBuffer;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 8
    .param p0, "src"    # Ljava/nio/ByteBuffer;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 147
    invoke-static {p1}, Lorg/iq80/leveldb/util/Slices;->getDecoder(Ljava/nio/charset/Charset;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v1

    .line 149
    .local v1, "decoder":Ljava/nio/charset/CharsetDecoder;
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    int-to-double v4, v4

    invoke-virtual {v1}, Ljava/nio/charset/CharsetDecoder;->maxCharsPerByte()F

    move-result v6

    float-to-double v6, v6

    mul-double/2addr v4, v6

    double-to-int v4, v4

    .line 148
    invoke-static {v4}, Ljava/nio/CharBuffer;->allocate(I)Ljava/nio/CharBuffer;

    move-result-object v2

    .line 151
    .local v2, "dst":Ljava/nio/CharBuffer;
    const/4 v4, 0x1

    :try_start_0
    invoke-virtual {v1, p0, v2, v4}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;Ljava/nio/CharBuffer;Z)Ljava/nio/charset/CoderResult;

    move-result-object v0

    .line 152
    .local v0, "cr":Ljava/nio/charset/CoderResult;
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->isUnderflow()Z

    move-result v4

    if-nez v4, :cond_0

    .line 153
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->throwException()V

    .line 155
    :cond_0
    invoke-virtual {v1, v2}, Ljava/nio/charset/CharsetDecoder;->flush(Ljava/nio/CharBuffer;)Ljava/nio/charset/CoderResult;

    move-result-object v0

    .line 156
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->isUnderflow()Z

    move-result v4

    if-nez v4, :cond_1

    .line 157
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->throwException()V
    :try_end_0
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 163
    :cond_1
    invoke-virtual {v2}, Ljava/nio/CharBuffer;->flip()Ljava/nio/Buffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 160
    .end local v0    # "cr":Ljava/nio/charset/CoderResult;
    :catch_0
    move-exception v3

    .line 161
    .local v3, "x":Ljava/nio/charset/CharacterCodingException;
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public static encodeString(Ljava/nio/CharBuffer;Ljava/nio/charset/Charset;)Ljava/nio/ByteBuffer;
    .locals 8
    .param p0, "src"    # Ljava/nio/CharBuffer;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 125
    invoke-static {p1}, Lorg/iq80/leveldb/util/Slices;->getEncoder(Ljava/nio/charset/Charset;)Ljava/nio/charset/CharsetEncoder;

    move-result-object v2

    .line 127
    .local v2, "encoder":Ljava/nio/charset/CharsetEncoder;
    invoke-virtual {p0}, Ljava/nio/CharBuffer;->remaining()I

    move-result v4

    int-to-double v4, v4

    invoke-virtual {v2}, Ljava/nio/charset/CharsetEncoder;->maxBytesPerChar()F

    move-result v6

    float-to-double v6, v6

    mul-double/2addr v4, v6

    double-to-int v4, v4

    .line 126
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 129
    .local v1, "dst":Ljava/nio/ByteBuffer;
    const/4 v4, 0x1

    :try_start_0
    invoke-virtual {v2, p0, v1, v4}, Ljava/nio/charset/CharsetEncoder;->encode(Ljava/nio/CharBuffer;Ljava/nio/ByteBuffer;Z)Ljava/nio/charset/CoderResult;

    move-result-object v0

    .line 130
    .local v0, "cr":Ljava/nio/charset/CoderResult;
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->isUnderflow()Z

    move-result v4

    if-nez v4, :cond_0

    .line 131
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->throwException()V

    .line 133
    :cond_0
    invoke-virtual {v2, v1}, Ljava/nio/charset/CharsetEncoder;->flush(Ljava/nio/ByteBuffer;)Ljava/nio/charset/CoderResult;

    move-result-object v0

    .line 134
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->isUnderflow()Z

    move-result v4

    if-nez v4, :cond_1

    .line 135
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->throwException()V
    :try_end_0
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 141
    :cond_1
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 142
    return-object v1

    .line 138
    .end local v0    # "cr":Ljava/nio/charset/CoderResult;
    :catch_0
    move-exception v3

    .line 139
    .local v3, "x":Ljava/nio/charset/CharacterCodingException;
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public static ensureSize(Lorg/iq80/leveldb/util/Slice;I)Lorg/iq80/leveldb/util/Slice;
    .locals 5
    .param p0, "existingSlice"    # Lorg/iq80/leveldb/util/Slice;
    .param p1, "minWritableBytes"    # I

    .prologue
    const/4 v4, 0x0

    .line 59
    if-nez p0, :cond_0

    .line 60
    sget-object p0, Lorg/iq80/leveldb/util/Slices;->EMPTY_SLICE:Lorg/iq80/leveldb/util/Slice;

    .line 63
    :cond_0
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v3

    if-gt p1, v3, :cond_1

    .line 81
    .end local p0    # "existingSlice":Lorg/iq80/leveldb/util/Slice;
    :goto_0
    return-object p0

    .line 68
    .restart local p0    # "existingSlice":Lorg/iq80/leveldb/util/Slice;
    :cond_1
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v3

    if-nez v3, :cond_2

    .line 69
    const/4 v1, 0x1

    .line 74
    .local v1, "newCapacity":I
    :goto_1
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v3

    add-int v0, v3, p1

    .line 75
    .local v0, "minNewCapacity":I
    :goto_2
    if-ge v1, v0, :cond_3

    .line 76
    shl-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 72
    .end local v0    # "minNewCapacity":I
    .end local v1    # "newCapacity":I
    :cond_2
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v1

    .restart local v1    # "newCapacity":I
    goto :goto_1

    .line 79
    .restart local v0    # "minNewCapacity":I
    :cond_3
    invoke-static {v1}, Lorg/iq80/leveldb/util/Slices;->allocate(I)Lorg/iq80/leveldb/util/Slice;

    move-result-object v2

    .line 80
    .local v2, "newSlice":Lorg/iq80/leveldb/util/Slice;
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v3

    invoke-virtual {v2, v4, p0, v4, v3}, Lorg/iq80/leveldb/util/Slice;->setBytes(ILorg/iq80/leveldb/util/Slice;II)V

    move-object p0, v2

    .line 81
    goto :goto_0
.end method

.method private static getDecoder(Ljava/nio/charset/Charset;)Ljava/nio/charset/CharsetDecoder;
    .locals 5
    .param p0, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 218
    if-nez p0, :cond_0

    .line 219
    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "charset"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 222
    :cond_0
    sget-object v3, Lorg/iq80/leveldb/util/Slices;->decoders:Ljava/lang/ThreadLocal;

    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 223
    .local v2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/nio/charset/Charset;Ljava/nio/charset/CharsetDecoder;>;"
    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/charset/CharsetDecoder;

    .line 224
    .local v0, "d":Ljava/nio/charset/CharsetDecoder;
    if-eqz v0, :cond_1

    .line 225
    invoke-virtual {v0}, Ljava/nio/charset/CharsetDecoder;->reset()Ljava/nio/charset/CharsetDecoder;

    .line 226
    sget-object v3, Ljava/nio/charset/CodingErrorAction;->REPLACE:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v0, v3}, Ljava/nio/charset/CharsetDecoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    .line 227
    sget-object v3, Ljava/nio/charset/CodingErrorAction;->REPLACE:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v0, v3}, Ljava/nio/charset/CharsetDecoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-object v1, v0

    .line 235
    .end local v0    # "d":Ljava/nio/charset/CharsetDecoder;
    .local v1, "d":Ljava/nio/charset/CharsetDecoder;
    :goto_0
    return-object v1

    .line 231
    .end local v1    # "d":Ljava/nio/charset/CharsetDecoder;
    .restart local v0    # "d":Ljava/nio/charset/CharsetDecoder;
    :cond_1
    invoke-virtual {p0}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object v0

    .line 232
    sget-object v3, Ljava/nio/charset/CodingErrorAction;->REPLACE:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v0, v3}, Ljava/nio/charset/CharsetDecoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    .line 233
    sget-object v3, Ljava/nio/charset/CodingErrorAction;->REPLACE:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v0, v3}, Ljava/nio/charset/CharsetDecoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    .line 234
    invoke-interface {v2, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v0

    .line 235
    .end local v0    # "d":Ljava/nio/charset/CharsetDecoder;
    .restart local v1    # "d":Ljava/nio/charset/CharsetDecoder;
    goto :goto_0
.end method

.method private static getEncoder(Ljava/nio/charset/Charset;)Ljava/nio/charset/CharsetEncoder;
    .locals 5
    .param p0, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 192
    if-nez p0, :cond_0

    .line 193
    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "charset"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 196
    :cond_0
    sget-object v3, Lorg/iq80/leveldb/util/Slices;->encoders:Ljava/lang/ThreadLocal;

    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 197
    .local v2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/nio/charset/Charset;Ljava/nio/charset/CharsetEncoder;>;"
    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/charset/CharsetEncoder;

    .line 198
    .local v0, "e":Ljava/nio/charset/CharsetEncoder;
    if-eqz v0, :cond_1

    .line 199
    invoke-virtual {v0}, Ljava/nio/charset/CharsetEncoder;->reset()Ljava/nio/charset/CharsetEncoder;

    .line 200
    sget-object v3, Ljava/nio/charset/CodingErrorAction;->REPLACE:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v0, v3}, Ljava/nio/charset/CharsetEncoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetEncoder;

    .line 201
    sget-object v3, Ljava/nio/charset/CodingErrorAction;->REPLACE:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v0, v3}, Ljava/nio/charset/CharsetEncoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetEncoder;

    move-object v1, v0

    .line 209
    .end local v0    # "e":Ljava/nio/charset/CharsetEncoder;
    .local v1, "e":Ljava/nio/charset/CharsetEncoder;
    :goto_0
    return-object v1

    .line 205
    .end local v1    # "e":Ljava/nio/charset/CharsetEncoder;
    .restart local v0    # "e":Ljava/nio/charset/CharsetEncoder;
    :cond_1
    invoke-virtual {p0}, Ljava/nio/charset/Charset;->newEncoder()Ljava/nio/charset/CharsetEncoder;

    move-result-object v0

    .line 206
    sget-object v3, Ljava/nio/charset/CodingErrorAction;->REPLACE:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v0, v3}, Ljava/nio/charset/CharsetEncoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetEncoder;

    .line 207
    sget-object v3, Ljava/nio/charset/CodingErrorAction;->REPLACE:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v0, v3}, Ljava/nio/charset/CharsetEncoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetEncoder;

    .line 208
    invoke-interface {v2, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v0

    .line 209
    .end local v0    # "e":Ljava/nio/charset/CharsetEncoder;
    .restart local v1    # "e":Ljava/nio/charset/CharsetEncoder;
    goto :goto_0
.end method

.method public static readLengthPrefixedBytes(Lorg/iq80/leveldb/util/SliceInput;)Lorg/iq80/leveldb/util/Slice;
    .locals 2
    .param p0, "sliceInput"    # Lorg/iq80/leveldb/util/SliceInput;

    .prologue
    .line 38
    invoke-static {p0}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->readVariableLengthInt(Lorg/iq80/leveldb/util/SliceInput;)I

    move-result v0

    .line 39
    .local v0, "length":I
    invoke-virtual {p0, v0}, Lorg/iq80/leveldb/util/SliceInput;->readBytes(I)Lorg/iq80/leveldb/util/Slice;

    move-result-object v1

    return-object v1
.end method

.method public static wrappedBuffer([B)Lorg/iq80/leveldb/util/Slice;
    .locals 1
    .param p0, "array"    # [B

    .prologue
    .line 94
    array-length v0, p0

    if-nez v0, :cond_0

    .line 95
    sget-object v0, Lorg/iq80/leveldb/util/Slices;->EMPTY_SLICE:Lorg/iq80/leveldb/util/Slice;

    .line 97
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/iq80/leveldb/util/Slice;

    invoke-direct {v0, p0}, Lorg/iq80/leveldb/util/Slice;-><init>([B)V

    goto :goto_0
.end method

.method public static writeLengthPrefixedBytes(Lorg/iq80/leveldb/util/SliceOutput;Lorg/iq80/leveldb/util/Slice;)V
    .locals 1
    .param p0, "sliceOutput"    # Lorg/iq80/leveldb/util/SliceOutput;
    .param p1, "value"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 44
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v0

    invoke-static {v0, p0}, Lorg/iq80/leveldb/util/VariableLengthQuantity;->writeVariableLengthInt(ILorg/iq80/leveldb/util/SliceOutput;)V

    .line 45
    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/util/SliceOutput;->writeBytes(Lorg/iq80/leveldb/util/Slice;)V

    .line 46
    return-void
.end method
