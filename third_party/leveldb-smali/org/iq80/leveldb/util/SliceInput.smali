.class public final Lorg/iq80/leveldb/util/SliceInput;
.super Ljava/io/InputStream;
.source "SliceInput.java"

# interfaces
.implements Ljava/io/DataInput;


# instance fields
.field private position:I

.field private final slice:Lorg/iq80/leveldb/util/Slice;


# direct methods
.method public constructor <init>(Lorg/iq80/leveldb/util/Slice;)V
    .locals 0
    .param p1, "slice"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 37
    iput-object p1, p0, Lorg/iq80/leveldb/util/SliceInput;->slice:Lorg/iq80/leveldb/util/Slice;

    .line 38
    return-void
.end method


# virtual methods
.method public available()I
    .locals 2

    .prologue
    .line 80
    iget-object v0, p0, Lorg/iq80/leveldb/util/SliceInput;->slice:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v0

    iget v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public isReadable()Z
    .locals 1

    .prologue
    .line 70
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/SliceInput;->available()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public position()I
    .locals 1

    .prologue
    .line 45
    iget v0, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    return v0
.end method

.method public read()I
    .locals 1

    .prologue
    .line 93
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/SliceInput;->readByte()B

    move-result v0

    return v0
.end method

.method public readBoolean()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/SliceInput;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public readByte()B
    .locals 3

    .prologue
    .line 105
    iget v0, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    iget-object v1, p0, Lorg/iq80/leveldb/util/SliceInput;->slice:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 106
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 108
    :cond_0
    iget-object v0, p0, Lorg/iq80/leveldb/util/SliceInput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    invoke-virtual {v0, v1}, Lorg/iq80/leveldb/util/Slice;->getByte(I)B

    move-result v0

    return v0
.end method

.method public readByteArray(I)[B
    .locals 3
    .param p1, "length"    # I

    .prologue
    .line 185
    iget-object v1, p0, Lorg/iq80/leveldb/util/SliceInput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v2, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    invoke-virtual {v1, v2, p1}, Lorg/iq80/leveldb/util/Slice;->copyBytes(II)[B

    move-result-object v0

    .line 186
    .local v0, "value":[B
    iget v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    add-int/2addr v1, p1

    iput v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    .line 187
    return-object v0
.end method

.method public readBytes(Ljava/nio/channels/GatheringByteChannel;I)I
    .locals 3
    .param p1, "out"    # Ljava/nio/channels/GatheringByteChannel;
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 352
    iget-object v1, p0, Lorg/iq80/leveldb/util/SliceInput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v2, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    invoke-virtual {v1, v2, p1, p2}, Lorg/iq80/leveldb/util/Slice;->getBytes(ILjava/nio/channels/GatheringByteChannel;I)I

    move-result v0

    .line 353
    .local v0, "readBytes":I
    iget v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    .line 354
    return v0
.end method

.method public readBytes(I)Lorg/iq80/leveldb/util/Slice;
    .locals 3
    .param p1, "length"    # I

    .prologue
    .line 203
    if-nez p1, :cond_0

    .line 204
    sget-object v0, Lorg/iq80/leveldb/util/Slices;->EMPTY_SLICE:Lorg/iq80/leveldb/util/Slice;

    .line 208
    :goto_0
    return-object v0

    .line 206
    :cond_0
    iget-object v1, p0, Lorg/iq80/leveldb/util/SliceInput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v2, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    invoke-virtual {v1, v2, p1}, Lorg/iq80/leveldb/util/Slice;->slice(II)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    .line 207
    .local v0, "value":Lorg/iq80/leveldb/util/Slice;
    iget v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    add-int/2addr v1, p1

    iput v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    goto :goto_0
.end method

.method public readBytes(Ljava/io/OutputStream;I)V
    .locals 2
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 368
    iget-object v0, p0, Lorg/iq80/leveldb/util/SliceInput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    invoke-virtual {v0, v1, p1, p2}, Lorg/iq80/leveldb/util/Slice;->getBytes(ILjava/io/OutputStream;I)V

    .line 369
    iget v0, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    add-int/2addr v0, p2

    iput v0, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    .line 370
    return-void
.end method

.method public readBytes(Ljava/nio/ByteBuffer;)V
    .locals 3
    .param p1, "destination"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 335
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    .line 336
    .local v0, "length":I
    iget-object v1, p0, Lorg/iq80/leveldb/util/SliceInput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v2, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    invoke-virtual {v1, v2, p1}, Lorg/iq80/leveldb/util/Slice;->getBytes(ILjava/nio/ByteBuffer;)V

    .line 337
    iget v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    .line 338
    return-void
.end method

.method public readBytes(Lorg/iq80/leveldb/util/Slice;)V
    .locals 1
    .param p1, "destination"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 283
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lorg/iq80/leveldb/util/SliceInput;->readBytes(Lorg/iq80/leveldb/util/Slice;I)V

    .line 284
    return-void
.end method

.method public readBytes(Lorg/iq80/leveldb/util/Slice;I)V
    .locals 1
    .param p1, "destination"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "length"    # I

    .prologue
    .line 300
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v0

    if-le p2, v0, :cond_0

    .line 301
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 303
    :cond_0
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v0

    invoke-virtual {p0, p1, v0, p2}, Lorg/iq80/leveldb/util/SliceInput;->readBytes(Lorg/iq80/leveldb/util/Slice;II)V

    .line 304
    return-void
.end method

.method public readBytes(Lorg/iq80/leveldb/util/Slice;II)V
    .locals 2
    .param p1, "destination"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "destinationIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 320
    iget-object v0, p0, Lorg/iq80/leveldb/util/SliceInput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    invoke-virtual {v0, v1, p1, p2, p3}, Lorg/iq80/leveldb/util/Slice;->getBytes(ILorg/iq80/leveldb/util/Slice;II)V

    .line 321
    iget v0, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    add-int/2addr v0, p3

    iput v0, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    .line 322
    return-void
.end method

.method public readBytes([B)V
    .locals 2
    .param p1, "destination"    # [B

    .prologue
    .line 242
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/iq80/leveldb/util/SliceInput;->readBytes([BII)V

    .line 243
    return-void
.end method

.method public readBytes([BII)V
    .locals 2
    .param p1, "destination"    # [B
    .param p2, "destinationIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 264
    iget-object v0, p0, Lorg/iq80/leveldb/util/SliceInput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    invoke-virtual {v0, v1, p1, p2, p3}, Lorg/iq80/leveldb/util/Slice;->getBytes(I[BII)V

    .line 265
    iget v0, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    add-int/2addr v0, p3

    iput v0, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    .line 266
    return-void
.end method

.method public readChar()C
    .locals 1

    .prologue
    .line 441
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public readDouble()D
    .locals 1

    .prologue
    .line 458
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public readFloat()F
    .locals 1

    .prologue
    .line 452
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public readFully([B)V
    .locals 0
    .param p1, "destination"    # [B

    .prologue
    .line 230
    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/util/SliceInput;->readBytes([B)V

    .line 231
    return-void
.end method

.method public readFully([BII)V
    .locals 0
    .param p1, "destination"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 248
    invoke-virtual {p0, p1, p2, p3}, Lorg/iq80/leveldb/util/SliceInput;->readBytes([BII)V

    .line 249
    return-void
.end method

.method public readInt()I
    .locals 3

    .prologue
    .line 153
    iget-object v1, p0, Lorg/iq80/leveldb/util/SliceInput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v2, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    invoke-virtual {v1, v2}, Lorg/iq80/leveldb/util/Slice;->getInt(I)I

    move-result v0

    .line 154
    .local v0, "v":I
    iget v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    add-int/lit8 v1, v1, 0x4

    iput v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    .line 155
    return v0
.end method

.method public readLine()Ljava/lang/String;
    .locals 1

    .prologue
    .line 469
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public readLong()J
    .locals 4

    .prologue
    .line 178
    iget-object v2, p0, Lorg/iq80/leveldb/util/SliceInput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v3, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    invoke-virtual {v2, v3}, Lorg/iq80/leveldb/util/Slice;->getLong(I)J

    move-result-wide v0

    .line 179
    .local v0, "v":J
    iget v2, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    add-int/lit8 v2, v2, 0x8

    iput v2, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    .line 180
    return-wide v0
.end method

.method public readShort()S
    .locals 3

    .prologue
    .line 132
    iget-object v1, p0, Lorg/iq80/leveldb/util/SliceInput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v2, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    invoke-virtual {v1, v2}, Lorg/iq80/leveldb/util/Slice;->getShort(I)S

    move-result v0

    .line 133
    .local v0, "v":S
    iget v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    add-int/lit8 v1, v1, 0x2

    iput v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    .line 134
    return v0
.end method

.method public readSlice(I)Lorg/iq80/leveldb/util/Slice;
    .locals 3
    .param p1, "length"    # I

    .prologue
    .line 222
    iget-object v1, p0, Lorg/iq80/leveldb/util/SliceInput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v2, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    invoke-virtual {v1, v2, p1}, Lorg/iq80/leveldb/util/Slice;->slice(II)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    .line 223
    .local v0, "newSlice":Lorg/iq80/leveldb/util/Slice;
    iget v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    add-int/2addr v1, p1

    iput v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    .line 224
    return-object v0
.end method

.method public readUTF()Ljava/lang/String;
    .locals 1

    .prologue
    .line 480
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public readUnsignedByte()I
    .locals 1

    .prologue
    .line 120
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/SliceInput;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    int-to-short v0, v0

    return v0
.end method

.method public readUnsignedInt()J
    .locals 4

    .prologue
    .line 166
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/SliceInput;->readInt()I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method public readUnsignedShort()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 141
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/SliceInput;->readShort()S

    move-result v0

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method public setPosition(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 57
    if-ltz p1, :cond_0

    iget-object v0, p0, Lorg/iq80/leveldb/util/SliceInput;->slice:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v0

    if-le p1, v0, :cond_1

    .line 58
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 60
    :cond_1
    iput p1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    .line 61
    return-void
.end method

.method public skipBytes(I)I
    .locals 1
    .param p1, "length"    # I

    .prologue
    .line 374
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/SliceInput;->available()I

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 375
    iget v0, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    add-int/2addr v0, p1

    iput v0, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    .line 376
    return p1
.end method

.method public slice()Lorg/iq80/leveldb/util/Slice;
    .locals 3

    .prologue
    .line 389
    iget-object v0, p0, Lorg/iq80/leveldb/util/SliceInput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    invoke-virtual {p0}, Lorg/iq80/leveldb/util/SliceInput;->available()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/iq80/leveldb/util/Slice;->slice(II)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    return-object v0
.end method

.method public toByteBuffer()Ljava/nio/ByteBuffer;
    .locals 3

    .prologue
    .line 402
    iget-object v0, p0, Lorg/iq80/leveldb/util/SliceInput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    invoke-virtual {p0}, Lorg/iq80/leveldb/util/SliceInput;->available()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/iq80/leveldb/util/Slice;->toByteBuffer(II)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 423
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "ridx="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", cap="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/iq80/leveldb/util/SliceInput;->slice:Lorg/iq80/leveldb/util/Slice;

    .line 425
    invoke-virtual {v1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 423
    return-object v0
.end method

.method public toString(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 3
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 417
    iget-object v0, p0, Lorg/iq80/leveldb/util/SliceInput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v1, p0, Lorg/iq80/leveldb/util/SliceInput;->position:I

    invoke-virtual {p0}, Lorg/iq80/leveldb/util/SliceInput;->available()I

    move-result v2

    invoke-virtual {v0, v1, v2, p1}, Lorg/iq80/leveldb/util/Slice;->toString(IILjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
