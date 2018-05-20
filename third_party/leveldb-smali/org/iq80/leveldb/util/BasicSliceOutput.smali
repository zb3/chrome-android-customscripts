.class public Lorg/iq80/leveldb/util/BasicSliceOutput;
.super Lorg/iq80/leveldb/util/SliceOutput;
.source "BasicSliceOutput.java"


# instance fields
.field private size:I

.field private final slice:Lorg/iq80/leveldb/util/Slice;


# direct methods
.method protected constructor <init>(Lorg/iq80/leveldb/util/Slice;)V
    .locals 0
    .param p1, "slice"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/iq80/leveldb/util/SliceOutput;-><init>()V

    .line 35
    iput-object p1, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->slice:Lorg/iq80/leveldb/util/Slice;

    .line 36
    return-void
.end method


# virtual methods
.method public isWritable()Z
    .locals 1

    .prologue
    .line 53
    invoke-virtual {p0}, Lorg/iq80/leveldb/util/BasicSliceOutput;->writableBytes()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 41
    const/4 v0, 0x0

    iput v0, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    .line 42
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    return v0
.end method

.method public slice()Lorg/iq80/leveldb/util/Slice;
    .locals 3

    .prologue
    .line 199
    iget-object v0, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->slice:Lorg/iq80/leveldb/util/Slice;

    const/4 v1, 0x0

    iget v2, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    invoke-virtual {v0, v1, v2}, Lorg/iq80/leveldb/util/Slice;->slice(II)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    return-object v0
.end method

.method public toByteBuffer()Ljava/nio/ByteBuffer;
    .locals 3

    .prologue
    .line 205
    iget-object v0, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->slice:Lorg/iq80/leveldb/util/Slice;

    const/4 v1, 0x0

    iget v2, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    invoke-virtual {v0, v1, v2}, Lorg/iq80/leveldb/util/Slice;->toByteBuffer(II)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 211
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

    const-string v1, "size="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", capacity="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->slice:Lorg/iq80/leveldb/util/Slice;

    .line 213
    invoke-virtual {v1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 211
    return-object v0
.end method

.method public toString(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 3
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 219
    iget-object v0, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->slice:Lorg/iq80/leveldb/util/Slice;

    const/4 v1, 0x0

    iget v2, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    invoke-virtual {v0, v1, v2, p1}, Lorg/iq80/leveldb/util/Slice;->toString(IILjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writableBytes()I
    .locals 2

    .prologue
    .line 59
    iget-object v0, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->slice:Lorg/iq80/leveldb/util/Slice;

    invoke-virtual {v0}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v0

    iget v1, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public writeByte(I)V
    .locals 3
    .param p1, "value"    # I

    .prologue
    .line 65
    iget-object v0, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v1, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    invoke-virtual {v0, v1, p1}, Lorg/iq80/leveldb/util/Slice;->setByte(II)V

    .line 66
    return-void
.end method

.method public writeBytes(Ljava/io/InputStream;I)I
    .locals 3
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 136
    iget-object v1, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v2, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    invoke-virtual {v1, v2, p1, p2}, Lorg/iq80/leveldb/util/Slice;->setBytes(ILjava/io/InputStream;I)I

    move-result v0

    .line 137
    .local v0, "writtenBytes":I
    if-lez v0, :cond_0

    .line 138
    iget v1, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    .line 140
    :cond_0
    return v0
.end method

.method public writeBytes(Ljava/nio/channels/FileChannel;II)I
    .locals 3
    .param p1, "in"    # Ljava/nio/channels/FileChannel;
    .param p2, "position"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 158
    iget-object v1, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v2, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    invoke-virtual {v1, v2, p1, p2, p3}, Lorg/iq80/leveldb/util/Slice;->setBytes(ILjava/nio/channels/FileChannel;II)I

    move-result v0

    .line 159
    .local v0, "writtenBytes":I
    if-lez v0, :cond_0

    .line 160
    iget v1, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    .line 162
    :cond_0
    return v0
.end method

.method public writeBytes(Ljava/nio/channels/ScatteringByteChannel;I)I
    .locals 3
    .param p1, "in"    # Ljava/nio/channels/ScatteringByteChannel;
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    iget-object v1, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v2, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    invoke-virtual {v1, v2, p1, p2}, Lorg/iq80/leveldb/util/Slice;->setBytes(ILjava/nio/channels/ScatteringByteChannel;I)I

    move-result v0

    .line 148
    .local v0, "writtenBytes":I
    if-lez v0, :cond_0

    .line 149
    iget v1, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    .line 151
    :cond_0
    return v0
.end method

.method public writeBytes(Ljava/nio/ByteBuffer;)V
    .locals 3
    .param p1, "source"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 127
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    .line 128
    .local v0, "length":I
    iget-object v1, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v2, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    invoke-virtual {v1, v2, p1}, Lorg/iq80/leveldb/util/Slice;->setBytes(ILjava/nio/ByteBuffer;)V

    .line 129
    iget v1, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    .line 130
    return-void
.end method

.method public writeBytes(Lorg/iq80/leveldb/util/Slice;)V
    .locals 2
    .param p1, "source"    # Lorg/iq80/leveldb/util/Slice;

    .prologue
    .line 105
    const/4 v0, 0x0

    invoke-virtual {p1}, Lorg/iq80/leveldb/util/Slice;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lorg/iq80/leveldb/util/BasicSliceOutput;->writeBytes(Lorg/iq80/leveldb/util/Slice;II)V

    .line 106
    return-void
.end method

.method public writeBytes(Lorg/iq80/leveldb/util/Slice;II)V
    .locals 2
    .param p1, "source"    # Lorg/iq80/leveldb/util/Slice;
    .param p2, "sourceIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 120
    iget-object v0, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v1, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    invoke-virtual {v0, v1, p1, p2, p3}, Lorg/iq80/leveldb/util/Slice;->setBytes(ILorg/iq80/leveldb/util/Slice;II)V

    .line 121
    iget v0, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    add-int/2addr v0, p3

    iput v0, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    .line 122
    return-void
.end method

.method public writeBytes(Lorg/iq80/leveldb/util/SliceInput;I)V
    .locals 1
    .param p1, "source"    # Lorg/iq80/leveldb/util/SliceInput;
    .param p2, "length"    # I

    .prologue
    .line 111
    invoke-virtual {p1}, Lorg/iq80/leveldb/util/SliceInput;->available()I

    move-result v0

    if-le p2, v0, :cond_0

    .line 112
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 114
    :cond_0
    invoke-virtual {p1, p2}, Lorg/iq80/leveldb/util/SliceInput;->readBytes(I)Lorg/iq80/leveldb/util/Slice;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/iq80/leveldb/util/BasicSliceOutput;->writeBytes(Lorg/iq80/leveldb/util/Slice;)V

    .line 115
    return-void
.end method

.method public writeBytes([B)V
    .locals 2
    .param p1, "source"    # [B

    .prologue
    .line 99
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/iq80/leveldb/util/BasicSliceOutput;->writeBytes([BII)V

    .line 100
    return-void
.end method

.method public writeBytes([BII)V
    .locals 2
    .param p1, "source"    # [B
    .param p2, "sourceIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 92
    iget-object v0, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v1, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    invoke-virtual {v0, v1, p1, p2, p3}, Lorg/iq80/leveldb/util/Slice;->setBytes(I[BII)V

    .line 93
    iget v0, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    add-int/2addr v0, p3

    iput v0, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    .line 94
    return-void
.end method

.method public writeInt(I)V
    .locals 2
    .param p1, "value"    # I

    .prologue
    .line 78
    iget-object v0, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v1, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    invoke-virtual {v0, v1, p1}, Lorg/iq80/leveldb/util/Slice;->setInt(II)V

    .line 79
    iget v0, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    add-int/lit8 v0, v0, 0x4

    iput v0, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    .line 80
    return-void
.end method

.method public writeLong(J)V
    .locals 3
    .param p1, "value"    # J

    .prologue
    .line 85
    iget-object v0, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v1, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    invoke-virtual {v0, v1, p1, p2}, Lorg/iq80/leveldb/util/Slice;->setLong(IJ)V

    .line 86
    iget v0, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    add-int/lit8 v0, v0, 0x8

    iput v0, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    .line 87
    return-void
.end method

.method public writeShort(I)V
    .locals 2
    .param p1, "value"    # I

    .prologue
    .line 71
    iget-object v0, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->slice:Lorg/iq80/leveldb/util/Slice;

    iget v1, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    invoke-virtual {v0, v1, p1}, Lorg/iq80/leveldb/util/Slice;->setShort(II)V

    .line 72
    iget v0, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    add-int/lit8 v0, v0, 0x2

    iput v0, p0, Lorg/iq80/leveldb/util/BasicSliceOutput;->size:I

    .line 73
    return-void
.end method

.method public writeZero(I)V
    .locals 7
    .param p1, "length"    # I

    .prologue
    const/4 v6, 0x4

    const/4 v3, 0x0

    .line 168
    if-nez p1, :cond_1

    .line 194
    :cond_0
    :goto_0
    return-void

    .line 171
    :cond_1
    if-gez p1, :cond_2

    .line 172
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "length must be 0 or greater than 0."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 175
    :cond_2
    ushr-int/lit8 v2, p1, 0x3

    .line 176
    .local v2, "nLong":I
    and-int/lit8 v1, p1, 0x7

    .line 177
    .local v1, "nBytes":I
    move v0, v2

    .local v0, "i":I
    :goto_1
    if-lez v0, :cond_3

    .line 178
    const-wide/16 v4, 0x0

    invoke-virtual {p0, v4, v5}, Lorg/iq80/leveldb/util/BasicSliceOutput;->writeLong(J)V

    .line 177
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 180
    :cond_3
    if-ne v1, v6, :cond_4

    .line 181
    invoke-virtual {p0, v3}, Lorg/iq80/leveldb/util/BasicSliceOutput;->writeInt(I)V

    goto :goto_0

    .line 183
    :cond_4
    if-ge v1, v6, :cond_5

    .line 184
    move v0, v1

    :goto_2
    if-lez v0, :cond_0

    .line 185
    invoke-virtual {p0, v3}, Lorg/iq80/leveldb/util/BasicSliceOutput;->writeByte(I)V

    .line 184
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    .line 189
    :cond_5
    invoke-virtual {p0, v3}, Lorg/iq80/leveldb/util/BasicSliceOutput;->writeInt(I)V

    .line 190
    add-int/lit8 v0, v1, -0x4

    :goto_3
    if-lez v0, :cond_0

    .line 191
    invoke-virtual {p0, v3}, Lorg/iq80/leveldb/util/BasicSliceOutput;->writeByte(I)V

    .line 190
    add-int/lit8 v0, v0, -0x1

    goto :goto_3
.end method
