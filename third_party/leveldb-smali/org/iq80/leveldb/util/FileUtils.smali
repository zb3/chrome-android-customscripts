.class public final Lorg/iq80/leveldb/util/FileUtils;
.super Ljava/lang/Object;
.source "FileUtils.java"


# static fields
.field private static final TEMP_DIR_ATTEMPTS:I = 0x2710


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method public static copyDirectoryContents(Ljava/io/File;Ljava/io/File;)Z
    .locals 7
    .param p0, "src"    # Ljava/io/File;
    .param p1, "target"    # Ljava/io/File;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 124
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    const-string v5, "Source dir is not a directory: %s"

    new-array v6, v2, [Ljava/lang/Object;

    aput-object p0, v6, v3

    invoke-static {v4, v5, v6}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 127
    invoke-static {p0}, Lorg/iq80/leveldb/util/FileUtils;->isSymbolicLink(Ljava/io/File;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 138
    :goto_0
    return v3

    .line 131
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    .line 132
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v4

    const-string v5, "Target dir is not a directory: %s"

    new-array v6, v2, [Ljava/lang/Object;

    aput-object p0, v6, v3

    invoke-static {v4, v5, v6}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 134
    const/4 v1, 0x1

    .line 135
    .local v1, "success":Z
    invoke-static {p0}, Lorg/iq80/leveldb/util/FileUtils;->listFiles(Ljava/io/File;)Lcom/google/common/collect/ImmutableList;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/common/collect/ImmutableList;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 136
    .local v0, "file":Ljava/io/File;
    new-instance v5, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, p1, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0, v5}, Lorg/iq80/leveldb/util/FileUtils;->copyRecursively(Ljava/io/File;Ljava/io/File;)Z

    move-result v5

    if-eqz v5, :cond_1

    if-eqz v1, :cond_1

    move v1, v2

    .line 137
    :goto_2
    goto :goto_1

    :cond_1
    move v1, v3

    .line 136
    goto :goto_2

    .end local v0    # "file":Ljava/io/File;
    :cond_2
    move v3, v1

    .line 138
    goto :goto_0
.end method

.method public static copyRecursively(Ljava/io/File;Ljava/io/File;)Z
    .locals 2
    .param p0, "src"    # Ljava/io/File;
    .param p1, "target"    # Ljava/io/File;

    .prologue
    .line 143
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 144
    invoke-static {p0, p1}, Lorg/iq80/leveldb/util/FileUtils;->copyDirectoryContents(Ljava/io/File;Ljava/io/File;)Z

    move-result v1

    .line 152
    :goto_0
    return v1

    .line 148
    :cond_0
    :try_start_0
    invoke-static {p0, p1}, Lcom/google/common/io/Files;->copy(Ljava/io/File;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 149
    const/4 v1, 0x1

    goto :goto_0

    .line 151
    :catch_0
    move-exception v0

    .line 152
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static createTempDir(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    .locals 6
    .param p0, "parentDir"    # Ljava/io/File;
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 79
    const-string v0, ""

    .line 80
    .local v0, "baseName":Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 81
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 84
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 85
    const/4 v1, 0x0

    .local v1, "counter":I
    :goto_0
    const/16 v3, 0x2710

    if-ge v1, v3, :cond_2

    .line 86
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 87
    .local v2, "tempDir":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->mkdir()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 88
    return-object v2

    .line 85
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 91
    .end local v2    # "tempDir":Ljava/io/File;
    :cond_2
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to create directory within 10000 attempts (tried "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "0 to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x270f

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x29

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public static createTempDir(Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .param p0, "prefix"    # Ljava/lang/String;

    .prologue
    .line 74
    new-instance v0, Ljava/io/File;

    const-string v1, "java.io.tmpdir"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p0}, Lorg/iq80/leveldb/util/FileUtils;->createTempDir(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static deleteDirectoryContents(Ljava/io/File;)Z
    .locals 7
    .param p0, "directory"    # Ljava/io/File;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 98
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    const-string v5, "Not a directory: %s"

    new-array v6, v2, [Ljava/lang/Object;

    aput-object p0, v6, v3

    invoke-static {v4, v5, v6}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 101
    invoke-static {p0}, Lorg/iq80/leveldb/util/FileUtils;->isSymbolicLink(Ljava/io/File;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 109
    :goto_0
    return v3

    .line 105
    :cond_0
    const/4 v1, 0x1

    .line 106
    .local v1, "success":Z
    invoke-static {p0}, Lorg/iq80/leveldb/util/FileUtils;->listFiles(Ljava/io/File;)Lcom/google/common/collect/ImmutableList;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/common/collect/ImmutableList;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 107
    .local v0, "file":Ljava/io/File;
    invoke-static {v0}, Lorg/iq80/leveldb/util/FileUtils;->deleteRecursively(Ljava/io/File;)Z

    move-result v5

    if-eqz v5, :cond_1

    if-eqz v1, :cond_1

    move v1, v2

    .line 108
    :goto_2
    goto :goto_1

    :cond_1
    move v1, v3

    .line 107
    goto :goto_2

    .end local v0    # "file":Ljava/io/File;
    :cond_2
    move v3, v1

    .line 109
    goto :goto_0
.end method

.method public static deleteRecursively(Ljava/io/File;)Z
    .locals 2
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 114
    const/4 v0, 0x1

    .line 115
    .local v0, "success":Z
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 116
    invoke-static {p0}, Lorg/iq80/leveldb/util/FileUtils;->deleteDirectoryContents(Ljava/io/File;)Z

    move-result v0

    .line 119
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v1

    if-eqz v1, :cond_1

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isSymbolicLink(Ljava/io/File;)Z
    .locals 7
    .param p0, "file"    # Ljava/io/File;

    .prologue
    const/4 v4, 0x1

    .line 39
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v1

    .line 40
    .local v1, "canonicalFile":Ljava/io/File;
    invoke-virtual {p0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v0

    .line 41
    .local v0, "absoluteFile":Ljava/io/File;
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v3

    .line 43
    .local v3, "parentFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    if-eqz v3, :cond_1

    .line 46
    invoke-virtual {v3}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    if-nez v5, :cond_1

    .line 50
    .end local v0    # "absoluteFile":Ljava/io/File;
    .end local v1    # "canonicalFile":Ljava/io/File;
    .end local v3    # "parentFile":Ljava/io/File;
    :cond_0
    :goto_0
    return v4

    .line 46
    .restart local v0    # "absoluteFile":Ljava/io/File;
    .restart local v1    # "canonicalFile":Ljava/io/File;
    .restart local v3    # "parentFile":Ljava/io/File;
    :cond_1
    const/4 v4, 0x0

    goto :goto_0

    .line 48
    .end local v0    # "absoluteFile":Ljava/io/File;
    .end local v1    # "canonicalFile":Ljava/io/File;
    .end local v3    # "parentFile":Ljava/io/File;
    :catch_0
    move-exception v2

    .line 50
    .local v2, "e":Ljava/io/IOException;
    goto :goto_0
.end method

.method public static listFiles(Ljava/io/File;)Lcom/google/common/collect/ImmutableList;
    .locals 2
    .param p0, "dir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 56
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 57
    .local v0, "files":[Ljava/io/File;
    if-nez v0, :cond_0

    .line 58
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    .line 60
    :goto_0
    return-object v1

    :cond_0
    invoke-static {v0}, Lcom/google/common/collect/ImmutableList;->copyOf([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    goto :goto_0
.end method

.method public static listFiles(Ljava/io/File;Ljava/io/FilenameFilter;)Lcom/google/common/collect/ImmutableList;
    .locals 2
    .param p0, "dir"    # Ljava/io/File;
    .param p1, "filter"    # Ljava/io/FilenameFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/io/FilenameFilter;",
            ")",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 65
    invoke-virtual {p0, p1}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v0

    .line 66
    .local v0, "files":[Ljava/io/File;
    if-nez v0, :cond_0

    .line 67
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    .line 69
    :goto_0
    return-object v1

    :cond_0
    invoke-static {v0}, Lcom/google/common/collect/ImmutableList;->copyOf([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    goto :goto_0
.end method

.method public static newFile(Ljava/io/File;Ljava/lang/Iterable;)Ljava/io/File;
    .locals 5
    .param p0, "parent"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/io/File;"
        }
    .end annotation

    .prologue
    .line 175
    .local p1, "paths":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/String;>;"
    const-string v3, "parent is null"

    invoke-static {p0, v3}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    const-string v3, "paths is null"

    invoke-static {p1, v3}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    move-object v1, p0

    .line 179
    .local v1, "result":Ljava/io/File;
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 180
    .local v0, "path":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .end local v1    # "result":Ljava/io/File;
    .local v2, "result":Ljava/io/File;
    move-object v1, v2

    .line 181
    .end local v2    # "result":Ljava/io/File;
    .restart local v1    # "result":Ljava/io/File;
    goto :goto_0

    .line 182
    .end local v0    # "path":Ljava/lang/String;
    :cond_0
    return-object v1
.end method

.method public static varargs newFile(Ljava/io/File;[Ljava/lang/String;)Ljava/io/File;
    .locals 1
    .param p0, "parent"    # Ljava/io/File;
    .param p1, "paths"    # [Ljava/lang/String;

    .prologue
    .line 167
    const-string v0, "parent is null"

    invoke-static {p0, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    const-string v0, "paths is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    invoke-static {p1}, Lcom/google/common/collect/ImmutableList;->copyOf([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/iq80/leveldb/util/FileUtils;->newFile(Ljava/io/File;Ljava/lang/Iterable;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static varargs newFile(Ljava/lang/String;[Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .param p0, "parent"    # Ljava/lang/String;
    .param p1, "paths"    # [Ljava/lang/String;

    .prologue
    .line 159
    const-string v0, "parent is null"

    invoke-static {p0, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    const-string v0, "paths is null"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/google/common/collect/ImmutableList;->copyOf([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/iq80/leveldb/util/FileUtils;->newFile(Ljava/io/File;Ljava/lang/Iterable;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method
