.class public interface abstract Lorg/iq80/leveldb/impl/LogWriter;
.super Ljava/lang/Object;
.source "LogWriter.java"


# virtual methods
.method public abstract addRecord(Lorg/iq80/leveldb/util/Slice;Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract close()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract delete()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getFile()Ljava/io/File;
.end method

.method public abstract getFileNumber()J
.end method

.method public abstract isClosed()Z
.end method
