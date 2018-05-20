.class public Lorg/iq80/leveldb/Options;
.super Ljava/lang/Object;
.source "Options.java"


# instance fields
.field private blockRestartInterval:I

.field private blockSize:I

.field private cacheSize:J

.field private comparator:Lorg/iq80/leveldb/DBComparator;

.field private compressionType:Lorg/iq80/leveldb/CompressionType;

.field private createIfMissing:Z

.field private errorIfExists:Z

.field private logger:Lorg/iq80/leveldb/Logger;

.field private maxOpenFiles:I

.field private paranoidChecks:Z

.field private verifyChecksums:Z

.field private writeBufferSize:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-boolean v1, p0, Lorg/iq80/leveldb/Options;->createIfMissing:Z

    .line 24
    const/high16 v0, 0x400000

    iput v0, p0, Lorg/iq80/leveldb/Options;->writeBufferSize:I

    .line 26
    const/16 v0, 0x3e8

    iput v0, p0, Lorg/iq80/leveldb/Options;->maxOpenFiles:I

    .line 28
    const/16 v0, 0x10

    iput v0, p0, Lorg/iq80/leveldb/Options;->blockRestartInterval:I

    .line 29
    const/16 v0, 0x1000

    iput v0, p0, Lorg/iq80/leveldb/Options;->blockSize:I

    .line 30
    sget-object v0, Lorg/iq80/leveldb/CompressionType;->SNAPPY:Lorg/iq80/leveldb/CompressionType;

    iput-object v0, p0, Lorg/iq80/leveldb/Options;->compressionType:Lorg/iq80/leveldb/CompressionType;

    .line 31
    iput-boolean v1, p0, Lorg/iq80/leveldb/Options;->verifyChecksums:Z

    return-void
.end method

.method static checkArgNotNull(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 3
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 39
    if-nez p0, :cond_0

    .line 40
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " argument cannot be null"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 42
    :cond_0
    return-void
.end method


# virtual methods
.method public blockRestartInterval()I
    .locals 1

    .prologue
    .line 90
    iget v0, p0, Lorg/iq80/leveldb/Options;->blockRestartInterval:I

    return v0
.end method

.method public blockRestartInterval(I)Lorg/iq80/leveldb/Options;
    .locals 0
    .param p1, "blockRestartInterval"    # I

    .prologue
    .line 95
    iput p1, p0, Lorg/iq80/leveldb/Options;->blockRestartInterval:I

    .line 96
    return-object p0
.end method

.method public blockSize()I
    .locals 1

    .prologue
    .line 101
    iget v0, p0, Lorg/iq80/leveldb/Options;->blockSize:I

    return v0
.end method

.method public blockSize(I)Lorg/iq80/leveldb/Options;
    .locals 0
    .param p1, "blockSize"    # I

    .prologue
    .line 106
    iput p1, p0, Lorg/iq80/leveldb/Options;->blockSize:I

    .line 107
    return-object p0
.end method

.method public cacheSize()J
    .locals 2

    .prologue
    .line 135
    iget-wide v0, p0, Lorg/iq80/leveldb/Options;->cacheSize:J

    return-wide v0
.end method

.method public cacheSize(J)Lorg/iq80/leveldb/Options;
    .locals 1
    .param p1, "cacheSize"    # J

    .prologue
    .line 140
    iput-wide p1, p0, Lorg/iq80/leveldb/Options;->cacheSize:J

    .line 141
    return-object p0
.end method

.method public comparator()Lorg/iq80/leveldb/DBComparator;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lorg/iq80/leveldb/Options;->comparator:Lorg/iq80/leveldb/DBComparator;

    return-object v0
.end method

.method public comparator(Lorg/iq80/leveldb/DBComparator;)Lorg/iq80/leveldb/Options;
    .locals 0
    .param p1, "comparator"    # Lorg/iq80/leveldb/DBComparator;

    .prologue
    .line 151
    iput-object p1, p0, Lorg/iq80/leveldb/Options;->comparator:Lorg/iq80/leveldb/DBComparator;

    .line 152
    return-object p0
.end method

.method public compressionType()Lorg/iq80/leveldb/CompressionType;
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lorg/iq80/leveldb/Options;->compressionType:Lorg/iq80/leveldb/CompressionType;

    return-object v0
.end method

.method public compressionType(Lorg/iq80/leveldb/CompressionType;)Lorg/iq80/leveldb/Options;
    .locals 1
    .param p1, "compressionType"    # Lorg/iq80/leveldb/CompressionType;

    .prologue
    .line 117
    const-string v0, "compressionType"

    invoke-static {p1, v0}, Lorg/iq80/leveldb/Options;->checkArgNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 118
    iput-object p1, p0, Lorg/iq80/leveldb/Options;->compressionType:Lorg/iq80/leveldb/CompressionType;

    .line 119
    return-object p0
.end method

.method public createIfMissing(Z)Lorg/iq80/leveldb/Options;
    .locals 0
    .param p1, "createIfMissing"    # Z

    .prologue
    .line 51
    iput-boolean p1, p0, Lorg/iq80/leveldb/Options;->createIfMissing:Z

    .line 52
    return-object p0
.end method

.method public createIfMissing()Z
    .locals 1

    .prologue
    .line 46
    iget-boolean v0, p0, Lorg/iq80/leveldb/Options;->createIfMissing:Z

    return v0
.end method

.method public errorIfExists(Z)Lorg/iq80/leveldb/Options;
    .locals 0
    .param p1, "errorIfExists"    # Z

    .prologue
    .line 62
    iput-boolean p1, p0, Lorg/iq80/leveldb/Options;->errorIfExists:Z

    .line 63
    return-object p0
.end method

.method public errorIfExists()Z
    .locals 1

    .prologue
    .line 57
    iget-boolean v0, p0, Lorg/iq80/leveldb/Options;->errorIfExists:Z

    return v0
.end method

.method public logger()Lorg/iq80/leveldb/Logger;
    .locals 1

    .prologue
    .line 157
    iget-object v0, p0, Lorg/iq80/leveldb/Options;->logger:Lorg/iq80/leveldb/Logger;

    return-object v0
.end method

.method public logger(Lorg/iq80/leveldb/Logger;)Lorg/iq80/leveldb/Options;
    .locals 0
    .param p1, "logger"    # Lorg/iq80/leveldb/Logger;

    .prologue
    .line 162
    iput-object p1, p0, Lorg/iq80/leveldb/Options;->logger:Lorg/iq80/leveldb/Logger;

    .line 163
    return-object p0
.end method

.method public maxOpenFiles()I
    .locals 1

    .prologue
    .line 79
    iget v0, p0, Lorg/iq80/leveldb/Options;->maxOpenFiles:I

    return v0
.end method

.method public maxOpenFiles(I)Lorg/iq80/leveldb/Options;
    .locals 0
    .param p1, "maxOpenFiles"    # I

    .prologue
    .line 84
    iput p1, p0, Lorg/iq80/leveldb/Options;->maxOpenFiles:I

    .line 85
    return-object p0
.end method

.method public paranoidChecks(Z)Lorg/iq80/leveldb/Options;
    .locals 0
    .param p1, "paranoidChecks"    # Z

    .prologue
    .line 173
    iput-boolean p1, p0, Lorg/iq80/leveldb/Options;->paranoidChecks:Z

    .line 174
    return-object p0
.end method

.method public paranoidChecks()Z
    .locals 1

    .prologue
    .line 168
    iget-boolean v0, p0, Lorg/iq80/leveldb/Options;->paranoidChecks:Z

    return v0
.end method

.method public verifyChecksums(Z)Lorg/iq80/leveldb/Options;
    .locals 0
    .param p1, "verifyChecksums"    # Z

    .prologue
    .line 129
    iput-boolean p1, p0, Lorg/iq80/leveldb/Options;->verifyChecksums:Z

    .line 130
    return-object p0
.end method

.method public verifyChecksums()Z
    .locals 1

    .prologue
    .line 124
    iget-boolean v0, p0, Lorg/iq80/leveldb/Options;->verifyChecksums:Z

    return v0
.end method

.method public writeBufferSize()I
    .locals 1

    .prologue
    .line 68
    iget v0, p0, Lorg/iq80/leveldb/Options;->writeBufferSize:I

    return v0
.end method

.method public writeBufferSize(I)Lorg/iq80/leveldb/Options;
    .locals 0
    .param p1, "writeBufferSize"    # I

    .prologue
    .line 73
    iput p1, p0, Lorg/iq80/leveldb/Options;->writeBufferSize:I

    .line 74
    return-object p0
.end method
