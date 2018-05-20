.class public interface abstract Lorg/iq80/leveldb/DBFactory;
.super Ljava/lang/Object;
.source "DBFactory.java"


# virtual methods
.method public abstract destroy(Ljava/io/File;Lorg/iq80/leveldb/Options;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract open(Ljava/io/File;Lorg/iq80/leveldb/Options;)Lorg/iq80/leveldb/DB;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract repair(Ljava/io/File;Lorg/iq80/leveldb/Options;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
