.class public Lorg/xerial/snappy/OSInfo;
.super Ljava/lang/Object;
.source "OSInfo.java"


# static fields
.field public static final IA64:Ljava/lang/String; = "ia64"

.field public static final IA64_32:Ljava/lang/String; = "ia64_32"

.field public static final IBMZ:Ljava/lang/String; = "s390"

.field public static final IBMZ_64:Ljava/lang/String; = "s390x"

.field public static final PPC:Ljava/lang/String; = "ppc"

.field public static final PPC64:Ljava/lang/String; = "ppc64"

.field public static final X86:Ljava/lang/String; = "x86"

.field public static final X86_64:Ljava/lang/String; = "x86_64"

.field private static archMapping:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 38
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    .line 51
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "x86"

    const-string v2, "x86"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "i386"

    const-string v2, "x86"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "i486"

    const-string v2, "x86"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "i586"

    const-string v2, "x86"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "i686"

    const-string v2, "x86"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "pentium"

    const-string v2, "x86"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "x86_64"

    const-string v2, "x86_64"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "amd64"

    const-string v2, "x86_64"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "em64t"

    const-string v2, "x86_64"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "universal"

    const-string v2, "x86_64"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "ia64"

    const-string v2, "ia64"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "ia64w"

    const-string v2, "ia64"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "ia64_32"

    const-string v2, "ia64_32"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "ia64n"

    const-string v2, "ia64_32"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "ppc"

    const-string v2, "ppc"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "power"

    const-string v2, "ppc"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "powerpc"

    const-string v2, "ppc"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "power_pc"

    const-string v2, "ppc"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "power_rs"

    const-string v2, "ppc"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "ppc64"

    const-string v2, "ppc64"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "power64"

    const-string v2, "ppc64"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "powerpc64"

    const-string v2, "ppc64"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "power_pc64"

    const-string v2, "ppc64"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "power_rs64"

    const-string v2, "ppc64"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "s390"

    const-string v2, "s390"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    const-string v1, "s390x"

    const-string v2, "s390x"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getArchName()Ljava/lang/String;
    .locals 6

    .prologue
    .line 122
    const-string v0, "os.arch"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 123
    const-string v1, "arm"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "os.name"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Linux"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 124
    const-string v1, "java.home"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 127
    const/4 v2, 0x3

    :try_start_0
    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "/bin/sh"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "-c"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "find \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "\' -name \'libjvm.so\' | head -1 | xargs readelf -A | "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "grep \'Tag_ABI_VFP_args: VFP registers\'"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v3

    .line 130
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Process;->waitFor()I

    move-result v1

    .line 131
    if-nez v1, :cond_1

    .line 132
    const-string v0, "armhf"
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 148
    :goto_0
    return-object v0

    .line 143
    :cond_0
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 144
    sget-object v2, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 145
    sget-object v0, Lorg/xerial/snappy/OSInfo;->archMapping:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    .line 138
    :catch_0
    move-exception v1

    .line 148
    :cond_1
    :goto_1
    invoke-static {v0}, Lorg/xerial/snappy/OSInfo;->translateArchNameToFolderName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 135
    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method public static getNativeLibFolderPathForCurrentOS()Ljava/lang/String;
    .locals 2

    .prologue
    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lorg/xerial/snappy/OSInfo;->getOSName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lorg/xerial/snappy/OSInfo;->getArchName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getOSName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 116
    const-string v0, "os.name"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/xerial/snappy/OSInfo;->translateOSNameToFolderName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static main([Ljava/lang/String;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 95
    array-length v0, p0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_1

    .line 96
    const-string v0, "--os"

    aget-object v1, p0, v2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 97
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {}, Lorg/xerial/snappy/OSInfo;->getOSName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 107
    :goto_0
    return-void

    .line 100
    :cond_0
    const-string v0, "--arch"

    aget-object v1, p0, v2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 101
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {}, Lorg/xerial/snappy/OSInfo;->getArchName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_0

    .line 106
    :cond_1
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {}, Lorg/xerial/snappy/OSInfo;->getNativeLibFolderPathForCurrentOS()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_0
.end method

.method static translateArchNameToFolderName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 172
    const-string v0, "\\W"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static translateOSNameToFolderName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 153
    const-string v0, "Windows"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 154
    const-string v0, "Windows"

    .line 166
    :goto_0
    return-object v0

    .line 156
    :cond_0
    const-string v0, "Mac"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 157
    const-string v0, "Mac"

    goto :goto_0

    .line 159
    :cond_1
    const-string v0, "Linux"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 160
    const-string v0, "Linux"

    goto :goto_0

    .line 162
    :cond_2
    const-string v0, "AIX"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 163
    const-string v0, "AIX"

    goto :goto_0

    .line 166
    :cond_3
    const-string v0, "\\W"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
