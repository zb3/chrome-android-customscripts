.class final Lorg/xerial/snappy/buffer/DefaultBufferAllocator$1;
.super Ljava/lang/Object;
.source "DefaultBufferAllocator.java"

# interfaces
.implements Lorg/xerial/snappy/buffer/BufferAllocatorFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/xerial/snappy/buffer/DefaultBufferAllocator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field public singleton:Lorg/xerial/snappy/buffer/BufferAllocator;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Lorg/xerial/snappy/buffer/DefaultBufferAllocator;

    invoke-direct {v0}, Lorg/xerial/snappy/buffer/DefaultBufferAllocator;-><init>()V

    iput-object v0, p0, Lorg/xerial/snappy/buffer/DefaultBufferAllocator$1;->singleton:Lorg/xerial/snappy/buffer/BufferAllocator;

    return-void
.end method


# virtual methods
.method public getBufferAllocator(I)Lorg/xerial/snappy/buffer/BufferAllocator;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lorg/xerial/snappy/buffer/DefaultBufferAllocator$1;->singleton:Lorg/xerial/snappy/buffer/BufferAllocator;

    return-object v0
.end method
