.class public Lorg/iq80/snappy/Main;
.super Ljava/lang/Object;
.source "Main.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static compress()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    sget-object v0, Ljava/lang/System;->in:Ljava/io/InputStream;

    new-instance v1, Lorg/iq80/snappy/SnappyOutputStream;

    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-direct {v1, v2}, Lorg/iq80/snappy/SnappyOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-static {v0, v1}, Lorg/iq80/snappy/Main;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 54
    return-void
.end method

.method private static copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 3
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 65
    const/16 v2, 0x1000

    new-array v0, v2, [B

    .line 67
    .local v0, "buf":[B
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .line 68
    .local v1, "r":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 69
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V

    .line 70
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 71
    return-void

    .line 73
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0
.end method

.method public static main([Ljava/lang/String;)V
    .locals 4
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 29
    array-length v0, p0

    if-ne v0, v3, :cond_0

    aget-object v0, p0, v2

    const-string v1, "-c"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 30
    invoke-static {}, Lorg/iq80/snappy/Main;->compress()V

    .line 38
    :goto_0
    return-void

    .line 32
    :cond_0
    array-length v0, p0

    if-ne v0, v3, :cond_1

    aget-object v0, p0, v2

    const-string v1, "-d"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 33
    invoke-static {}, Lorg/iq80/snappy/Main;->uncompress()V

    goto :goto_0

    .line 36
    :cond_1
    invoke-static {}, Lorg/iq80/snappy/Main;->usage()V

    goto :goto_0
.end method

.method private static uncompress()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    new-instance v0, Lorg/iq80/snappy/SnappyInputStream;

    sget-object v1, Ljava/lang/System;->in:Ljava/io/InputStream;

    invoke-direct {v0, v1}, Lorg/iq80/snappy/SnappyInputStream;-><init>(Ljava/io/InputStream;)V

    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {v0, v1}, Lorg/iq80/snappy/Main;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 60
    return-void
.end method

.method private static usage()V
    .locals 2

    .prologue
    .line 42
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "Usage: java -jar snappy.jar OPTION"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 43
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "Compress or uncompress with Snappy."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 44
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 45
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "  -c     compress from stdin to stdout"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 46
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "  -d     uncompress from stdin to stdout"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 47
    const/16 v0, 0x64

    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    .line 48
    return-void
.end method
