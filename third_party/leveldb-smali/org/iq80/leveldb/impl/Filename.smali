.class public final Lorg/iq80/leveldb/impl/Filename;
.super Ljava/lang/Object;
.source "Filename.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/iq80/leveldb/impl/Filename$FileInfo;,
        Lorg/iq80/leveldb/impl/Filename$FileType;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    return-void
.end method

.method public static currentFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 76
    const-string v0, "CURRENT"

    return-object v0
.end method

.method public static descriptorFileName(J)Ljava/lang/String;
    .locals 6
    .param p0, "number"    # J

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 67
    const-wide/16 v4, 0x0

    cmp-long v0, p0, v4

    if-ltz v0, :cond_0

    move v0, v1

    :goto_0
    const-string v3, "number is negative"

    invoke-static {v0, v3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 68
    const-string v0, "MANIFEST-%06d"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    move v0, v2

    .line 67
    goto :goto_0
.end method

.method public static infoLogFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    const-string v0, "LOG"

    return-object v0
.end method

.method public static listFiles(Ljava/io/File;)Ljava/util/List;
    .locals 2
    .param p0, "dir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 193
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 194
    .local v0, "files":[Ljava/io/File;
    if-nez v0, :cond_0

    .line 195
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    .line 197
    :goto_0
    return-object v1

    :cond_0
    invoke-static {v0}, Lcom/google/common/collect/ImmutableList;->copyOf([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    goto :goto_0
.end method

.method public static lockFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    const-string v0, "LOCK"

    return-object v0
.end method

.method public static logFileName(J)Ljava/lang/String;
    .locals 2
    .param p0, "number"    # J

    .prologue
    .line 51
    const-string v0, "log"

    invoke-static {p0, p1, v0}, Lorg/iq80/leveldb/impl/Filename;->makeFileName(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static makeFileName(JLjava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "number"    # J
    .param p2, "suffix"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 202
    const-wide/16 v4, 0x0

    cmp-long v0, p0, v4

    if-ltz v0, :cond_0

    move v0, v1

    :goto_0
    const-string v3, "number is negative"

    invoke-static {v0, v3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 203
    const-string v0, "suffix is null"

    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    const-string v0, "%06d.%s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v3, v2

    aput-object p2, v3, v1

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    move v0, v2

    .line 202
    goto :goto_0
.end method

.method public static oldInfoLogFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 108
    const-string v0, "LOG.old"

    return-object v0
.end method

.method public static parseFileName(Ljava/io/File;)Lorg/iq80/leveldb/impl/Filename$FileInfo;
    .locals 5
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 125
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    .line 126
    .local v0, "fileName":Ljava/lang/String;
    const-string v1, "CURRENT"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 127
    new-instance v1, Lorg/iq80/leveldb/impl/Filename$FileInfo;

    sget-object v4, Lorg/iq80/leveldb/impl/Filename$FileType;->CURRENT:Lorg/iq80/leveldb/impl/Filename$FileType;

    invoke-direct {v1, v4}, Lorg/iq80/leveldb/impl/Filename$FileInfo;-><init>(Lorg/iq80/leveldb/impl/Filename$FileType;)V

    .line 154
    :goto_0
    return-object v1

    .line 129
    :cond_0
    const-string v1, "LOCK"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 130
    new-instance v1, Lorg/iq80/leveldb/impl/Filename$FileInfo;

    sget-object v4, Lorg/iq80/leveldb/impl/Filename$FileType;->DB_LOCK:Lorg/iq80/leveldb/impl/Filename$FileType;

    invoke-direct {v1, v4}, Lorg/iq80/leveldb/impl/Filename$FileInfo;-><init>(Lorg/iq80/leveldb/impl/Filename$FileType;)V

    goto :goto_0

    .line 132
    :cond_1
    const-string v1, "LOG"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 133
    new-instance v1, Lorg/iq80/leveldb/impl/Filename$FileInfo;

    sget-object v4, Lorg/iq80/leveldb/impl/Filename$FileType;->INFO_LOG:Lorg/iq80/leveldb/impl/Filename$FileType;

    invoke-direct {v1, v4}, Lorg/iq80/leveldb/impl/Filename$FileInfo;-><init>(Lorg/iq80/leveldb/impl/Filename$FileType;)V

    goto :goto_0

    .line 135
    :cond_2
    const-string v1, "LOG.old"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 136
    new-instance v1, Lorg/iq80/leveldb/impl/Filename$FileInfo;

    sget-object v4, Lorg/iq80/leveldb/impl/Filename$FileType;->INFO_LOG:Lorg/iq80/leveldb/impl/Filename$FileType;

    invoke-direct {v1, v4}, Lorg/iq80/leveldb/impl/Filename$FileInfo;-><init>(Lorg/iq80/leveldb/impl/Filename$FileType;)V

    goto :goto_0

    .line 138
    :cond_3
    const-string v1, "MANIFEST-"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 139
    const-string v1, "MANIFEST-"

    invoke-static {v0, v1}, Lorg/iq80/leveldb/impl/Filename;->removePrefix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 140
    .local v2, "fileNumber":J
    new-instance v1, Lorg/iq80/leveldb/impl/Filename$FileInfo;

    sget-object v4, Lorg/iq80/leveldb/impl/Filename$FileType;->DESCRIPTOR:Lorg/iq80/leveldb/impl/Filename$FileType;

    invoke-direct {v1, v4, v2, v3}, Lorg/iq80/leveldb/impl/Filename$FileInfo;-><init>(Lorg/iq80/leveldb/impl/Filename$FileType;J)V

    goto :goto_0

    .line 142
    .end local v2    # "fileNumber":J
    :cond_4
    const-string v1, ".log"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 143
    const-string v1, ".log"

    invoke-static {v0, v1}, Lorg/iq80/leveldb/impl/Filename;->removeSuffix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 144
    .restart local v2    # "fileNumber":J
    new-instance v1, Lorg/iq80/leveldb/impl/Filename$FileInfo;

    sget-object v4, Lorg/iq80/leveldb/impl/Filename$FileType;->LOG:Lorg/iq80/leveldb/impl/Filename$FileType;

    invoke-direct {v1, v4, v2, v3}, Lorg/iq80/leveldb/impl/Filename$FileInfo;-><init>(Lorg/iq80/leveldb/impl/Filename$FileType;J)V

    goto :goto_0

    .line 146
    .end local v2    # "fileNumber":J
    :cond_5
    const-string v1, ".sst"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 147
    const-string v1, ".sst"

    invoke-static {v0, v1}, Lorg/iq80/leveldb/impl/Filename;->removeSuffix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 148
    .restart local v2    # "fileNumber":J
    new-instance v1, Lorg/iq80/leveldb/impl/Filename$FileInfo;

    sget-object v4, Lorg/iq80/leveldb/impl/Filename$FileType;->TABLE:Lorg/iq80/leveldb/impl/Filename$FileType;

    invoke-direct {v1, v4, v2, v3}, Lorg/iq80/leveldb/impl/Filename$FileInfo;-><init>(Lorg/iq80/leveldb/impl/Filename$FileType;J)V

    goto :goto_0

    .line 150
    .end local v2    # "fileNumber":J
    :cond_6
    const-string v1, ".dbtmp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 151
    const-string v1, ".dbtmp"

    invoke-static {v0, v1}, Lorg/iq80/leveldb/impl/Filename;->removeSuffix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 152
    .restart local v2    # "fileNumber":J
    new-instance v1, Lorg/iq80/leveldb/impl/Filename$FileInfo;

    sget-object v4, Lorg/iq80/leveldb/impl/Filename$FileType;->TEMP:Lorg/iq80/leveldb/impl/Filename$FileType;

    invoke-direct {v1, v4, v2, v3}, Lorg/iq80/leveldb/impl/Filename$FileInfo;-><init>(Lorg/iq80/leveldb/impl/Filename$FileType;J)V

    goto/16 :goto_0

    .line 154
    .end local v2    # "fileNumber":J
    :cond_7
    const/4 v1, 0x0

    goto/16 :goto_0
.end method

.method private static removePrefix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 209
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static removeSuffix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "suffix"    # Ljava/lang/String;

    .prologue
    .line 214
    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static setCurrentFile(Ljava/io/File;J)Z
    .locals 7
    .param p0, "databaseDir"    # Ljava/io/File;
    .param p1, "descriptorNumber"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 166
    invoke-static {p1, p2}, Lorg/iq80/leveldb/impl/Filename;->descriptorFileName(J)Ljava/lang/String;

    move-result-object v0

    .line 167
    .local v0, "manifest":Ljava/lang/String;
    invoke-static {p1, p2}, Lorg/iq80/leveldb/impl/Filename;->tempFileName(J)Ljava/lang/String;

    move-result-object v2

    .line 169
    .local v2, "temp":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 170
    .local v3, "tempFile":Ljava/io/File;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v3}, Lorg/iq80/leveldb/impl/Filename;->writeStringToFileSync(Ljava/lang/String;Ljava/io/File;)V

    .line 172
    new-instance v4, Ljava/io/File;

    invoke-static {}, Lorg/iq80/leveldb/impl/Filename;->currentFileName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, p0, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 173
    .local v4, "to":Ljava/io/File;
    invoke-virtual {v3, v4}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v1

    .line 174
    .local v1, "ok":Z
    if-nez v1, :cond_0

    .line 175
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 176
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v4}, Lorg/iq80/leveldb/impl/Filename;->writeStringToFileSync(Ljava/lang/String;Ljava/io/File;)V

    .line 178
    :cond_0
    return v1
.end method

.method public static tableFileName(J)Ljava/lang/String;
    .locals 2
    .param p0, "number"    # J

    .prologue
    .line 59
    const-string v0, "sst"

    invoke-static {p0, p1, v0}, Lorg/iq80/leveldb/impl/Filename;->makeFileName(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static tempFileName(J)Ljava/lang/String;
    .locals 2
    .param p0, "number"    # J

    .prologue
    .line 92
    const-string v0, "dbtmp"

    invoke-static {p0, p1, v0}, Lorg/iq80/leveldb/impl/Filename;->makeFileName(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static writeStringToFileSync(Ljava/lang/String;Ljava/io/File;)V
    .locals 5
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 184
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .local v0, "stream":Ljava/io/FileOutputStream;
    const/4 v2, 0x0

    .line 185
    :try_start_0
    sget-object v1, Lcom/google/common/base/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/FileOutputStream;->write([B)V

    .line 186
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->flush()V

    .line 187
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/FileDescriptor;->sync()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 188
    if-eqz v0, :cond_0

    if-eqz v2, :cond_1

    :try_start_1
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    .line 189
    :cond_0
    :goto_0
    return-void

    .line 188
    :catch_0
    move-exception v1

    invoke-virtual {v2, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    goto :goto_0

    .line 184
    :catch_1
    move-exception v1

    :try_start_2
    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 188
    :catchall_0
    move-exception v2

    move-object v4, v2

    move-object v2, v1

    move-object v1, v4

    :goto_1
    if-eqz v0, :cond_2

    if-eqz v2, :cond_3

    :try_start_3
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_2

    :cond_2
    :goto_2
    throw v1

    :catch_2
    move-exception v3

    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_2

    :cond_3
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    goto :goto_2

    :catchall_1
    move-exception v1

    goto :goto_1
.end method
