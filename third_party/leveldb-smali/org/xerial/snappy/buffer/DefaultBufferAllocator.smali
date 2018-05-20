.class public Lorg/xerial/snappy/buffer/DefaultBufferAllocator;
.super Ljava/lang/Object;
.source "DefaultBufferAllocator.java"

# interfaces
.implements Lorg/xerial/snappy/buffer/BufferAllocator;


# static fields
.field public static factory:Lorg/xerial/snappy/buffer/BufferAllocatorFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 10
    new-instance v0, Lorg/xerial/snappy/buffer/DefaultBufferAllocator$1;

    invoke-direct {v0}, Lorg/xerial/snappy/buffer/DefaultBufferAllocator$1;-><init>()V

    sput-object v0, Lorg/xerial/snappy/buffer/DefaultBufferAllocator;->factory:Lorg/xerial/snappy/buffer/BufferAllocatorFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public allocate(I)[B
    .locals 1

    .prologue
    .line 24
    new-array v0, p1, [B

    return-object v0
.end method

.method public release([B)V
    .locals 0

    .prologue
    .line 31
    return-void
.end method
