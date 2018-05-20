.class public abstract Lorg/iq80/leveldb/util/SliceOutput;
.super Ljava/io/OutputStream;
.source "SliceOutput.java"

# interfaces
.implements Ljava/io/DataOutput;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract isWritable()Z
.end method

.method public abstract reset()V
.end method

.method public abstract size()I
.end method

.method public abstract slice()Lorg/iq80/leveldb/util/Slice;
.end method

.method public abstract toByteBuffer()Ljava/nio/ByteBuffer;
.end method

.method public abstract toString(Ljava/nio/charset/Charset;)Ljava/lang/String;
.end method

.method public abstract writableBytes()I
.end method

.method public final write(I)V
    .locals 0
    .param p1, "value"    # I

    .prologue
    .line 65
    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 66
    return-void
.end method

.method public final write([B)V
    .locals 0
    .param p1, "source"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 155
    invoke-virtual {p0, p1}, Lorg/iq80/leveldb/util/SliceOutput;->writeBytes([B)V

    .line 156
    return-void
.end method

.method public final write([BII)V
    .locals 0
    .param p1, "source"    # [B
    .param p2, "sourceIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 170
    invoke-virtual {p0, p1, p2, p3}, Lorg/iq80/leveldb/util/SliceOutput;->writeBytes([BII)V

    .line 171
    return-void
.end method

.method public final writeBoolean(Z)V
    .locals 1
    .param p1, "value"    # Z

    .prologue
    .line 59
    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v0}, Lorg/iq80/leveldb/util/SliceOutput;->writeByte(I)V

    .line 60
    return-void

    .line 59
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public abstract writeByte(I)V
.end method

.method public abstract writeBytes(Ljava/io/InputStream;I)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract writeBytes(Ljava/nio/channels/FileChannel;II)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract writeBytes(Ljava/nio/channels/ScatteringByteChannel;I)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public writeBytes(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 336
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public abstract writeBytes(Ljava/nio/ByteBuffer;)V
.end method

.method public abstract writeBytes(Lorg/iq80/leveldb/util/Slice;)V
.end method

.method public abstract writeBytes(Lorg/iq80/leveldb/util/Slice;II)V
.end method

.method public abstract writeBytes(Lorg/iq80/leveldb/util/SliceInput;I)V
.end method

.method public abstract writeBytes([B)V
.end method

.method public abstract writeBytes([BII)V
.end method

.method public writeChar(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 281
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public writeChars(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 314
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public writeDouble(D)V
    .locals 1
    .param p1, "v"    # D

    .prologue
    .line 303
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public writeFloat(F)V
    .locals 1
    .param p1, "v"    # F

    .prologue
    .line 292
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public abstract writeInt(I)V
.end method

.method public abstract writeLong(J)V
.end method

.method public abstract writeShort(I)V
.end method

.method public writeUTF(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 325
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public abstract writeZero(I)V
.end method
