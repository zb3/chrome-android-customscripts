.class final Lorg/iq80/leveldb/impl/TableCache$TableAndFile;
.super Ljava/lang/Object;
.source "TableCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/iq80/leveldb/impl/TableCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TableAndFile"
.end annotation


# instance fields
.field private final table:Lorg/iq80/leveldb/table/Table;


# direct methods
.method private constructor <init>(Ljava/io/File;JLorg/iq80/leveldb/table/UserComparator;Z)V
    .locals 10
    .param p1, "databaseDir"    # Ljava/io/File;
    .param p2, "fileNumber"    # J
    .param p4, "userComparator"    # Lorg/iq80/leveldb/table/UserComparator;
    .param p5, "verifyChecksums"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    invoke-static {p2, p3}, Lorg/iq80/leveldb/impl/Filename;->tableFileName(J)Ljava/lang/String;

    move-result-object v3

    .line 121
    .local v3, "tableFileName":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 122
    .local v2, "tableFile":Ljava/io/File;
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 123
    .local v1, "fis":Ljava/io/FileInputStream;
    :try_start_0
    invoke-virtual {v1}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    move-result-object v0

    .line 122
    .local v0, "fileChannel":Ljava/nio/channels/FileChannel;
    const/4 v4, 0x0

    .line 124
    :try_start_1
    sget-boolean v5, Lorg/iq80/leveldb/impl/Iq80DBFactory;->USE_MMAP:Z

    if-eqz v5, :cond_2

    .line 125
    new-instance v5, Lorg/iq80/leveldb/table/MMapTable;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7, v0, p4, p5}, Lorg/iq80/leveldb/table/MMapTable;-><init>(Ljava/lang/String;Ljava/nio/channels/FileChannel;Ljava/util/Comparator;Z)V

    iput-object v5, p0, Lorg/iq80/leveldb/impl/TableCache$TableAndFile;->table:Lorg/iq80/leveldb/table/Table;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 130
    :goto_0
    if-eqz v0, :cond_0

    if-eqz v6, :cond_5

    :try_start_2
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :cond_0
    :goto_1
    if-eqz v1, :cond_1

    if-eqz v6, :cond_7

    :try_start_3
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_4

    .line 131
    :cond_1
    :goto_2
    return-void

    .line 128
    :cond_2
    :try_start_4
    new-instance v5, Lorg/iq80/leveldb/table/FileChannelTable;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7, v0, p4, p5}, Lorg/iq80/leveldb/table/FileChannelTable;-><init>(Ljava/lang/String;Ljava/nio/channels/FileChannel;Ljava/util/Comparator;Z)V

    iput-object v5, p0, Lorg/iq80/leveldb/impl/TableCache$TableAndFile;->table:Lorg/iq80/leveldb/table/Table;
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    goto :goto_0

    .line 122
    :catch_0
    move-exception v4

    :try_start_5
    throw v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 130
    :catchall_0
    move-exception v5

    move-object v8, v5

    move-object v5, v4

    move-object v4, v8

    :goto_3
    if-eqz v0, :cond_3

    if-eqz v5, :cond_6

    :try_start_6
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :cond_3
    :goto_4
    :try_start_7
    throw v4
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 122
    .end local v0    # "fileChannel":Ljava/nio/channels/FileChannel;
    :catch_1
    move-exception v4

    :try_start_8
    throw v4
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 130
    :catchall_1
    move-exception v5

    move-object v6, v4

    move-object v4, v5

    :goto_5
    if-eqz v1, :cond_4

    if-eqz v6, :cond_8

    :try_start_9
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_5

    :cond_4
    :goto_6
    throw v4

    .restart local v0    # "fileChannel":Ljava/nio/channels/FileChannel;
    :catch_2
    move-exception v5

    :try_start_a
    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    .end local v0    # "fileChannel":Ljava/nio/channels/FileChannel;
    :catchall_2
    move-exception v4

    goto :goto_5

    .restart local v0    # "fileChannel":Ljava/nio/channels/FileChannel;
    :cond_5
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V

    goto :goto_1

    :catch_3
    move-exception v7

    invoke-virtual {v5, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_4

    :cond_6
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    goto :goto_4

    :catch_4
    move-exception v4

    invoke-virtual {v6, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_2

    :cond_7
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    goto :goto_2

    .end local v0    # "fileChannel":Ljava/nio/channels/FileChannel;
    :catch_5
    move-exception v5

    invoke-virtual {v6, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_6

    :cond_8
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    goto :goto_6

    .restart local v0    # "fileChannel":Ljava/nio/channels/FileChannel;
    :catchall_3
    move-exception v4

    move-object v5, v6

    goto :goto_3
.end method

.method synthetic constructor <init>(Ljava/io/File;JLorg/iq80/leveldb/table/UserComparator;ZLorg/iq80/leveldb/impl/TableCache$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/io/File;
    .param p2, "x1"    # J
    .param p4, "x2"    # Lorg/iq80/leveldb/table/UserComparator;
    .param p5, "x3"    # Z
    .param p6, "x4"    # Lorg/iq80/leveldb/impl/TableCache$1;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    invoke-direct/range {p0 .. p5}, Lorg/iq80/leveldb/impl/TableCache$TableAndFile;-><init>(Ljava/io/File;JLorg/iq80/leveldb/table/UserComparator;Z)V

    return-void
.end method


# virtual methods
.method public getTable()Lorg/iq80/leveldb/table/Table;
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lorg/iq80/leveldb/impl/TableCache$TableAndFile;->table:Lorg/iq80/leveldb/table/Table;

    return-object v0
.end method
