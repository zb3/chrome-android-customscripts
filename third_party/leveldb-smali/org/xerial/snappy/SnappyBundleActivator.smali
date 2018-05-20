.class public Lorg/xerial/snappy/SnappyBundleActivator;
.super Ljava/lang/Object;
.source "SnappyBundleActivator.java"

# interfaces
.implements Lorg/osgi/framework/BundleActivator;


# static fields
.field public static final LIBRARY_NAME:Ljava/lang/String; = "snappyjava"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public start(Lorg/osgi/framework/BundleContext;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 53
    const-string v0, "snappyjava"

    invoke-static {v0}, Ljava/lang/System;->mapLibraryName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v2, ".dylib"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 56
    const-string v1, ".dylib"

    const-string v2, ".jnilib"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 58
    :cond_0
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 59
    new-instance v0, Lorg/xerial/snappy/SnappyNative;

    invoke-direct {v0}, Lorg/xerial/snappy/SnappyNative;-><init>()V

    invoke-static {v0}, Lorg/xerial/snappy/SnappyLoader;->setApi(Lorg/xerial/snappy/SnappyNative;)V

    .line 60
    return-void
.end method

.method public stop(Lorg/osgi/framework/BundleContext;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 65
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/xerial/snappy/SnappyLoader;->setApi(Lorg/xerial/snappy/SnappyNative;)V

    .line 66
    invoke-static {}, Lorg/xerial/snappy/SnappyLoader;->cleanUpExtractedNativeLib()V

    .line 67
    return-void
.end method
