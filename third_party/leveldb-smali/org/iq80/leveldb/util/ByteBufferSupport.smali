.class public final Lorg/iq80/leveldb/util/ByteBufferSupport;
.super Ljava/lang/Object;
.source "ByteBufferSupport.java"


# static fields
.field private static final INVOKE_CLEANER:Ljava/lang/invoke/MethodHandle;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .prologue
    .line 39
    :try_start_0
    const-string v11, "sun.misc.Unsafe"

    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    .line 40
    .local v10, "unsafeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v11, "theUnsafe"

    invoke-virtual {v10, v11}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v9

    .line 41
    .local v9, "theUnsafe":Ljava/lang/reflect/Field;
    const/4 v11, 0x1

    invoke-virtual {v9, v11}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 42
    invoke-static {}, Ljava/lang/invoke/MethodHandles;->lookup()Ljava/lang/invoke/MethodHandles$Lookup;

    move-result-object v11

    const-string v12, "invokeCleaner"

    sget-object v13, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    const-class v14, Ljava/nio/ByteBuffer;

    .line 43
    invoke-static {v13, v14}, Ljava/lang/invoke/MethodType;->methodType(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/invoke/MethodType;

    move-result-object v13

    invoke-virtual {v11, v10, v12, v13}, Ljava/lang/invoke/MethodHandles$Lookup;->findVirtual(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/invoke/MethodType;)Ljava/lang/invoke/MethodHandle;

    move-result-object v11

    const/4 v12, 0x0

    .line 44
    invoke-virtual {v9, v12}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/invoke/MethodHandle;->bindTo(Ljava/lang/Object;)Ljava/lang/invoke/MethodHandle;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    .line 67
    .end local v9    # "theUnsafe":Ljava/lang/reflect/Field;
    .local v8, "invoker":Ljava/lang/invoke/MethodHandle;
    :goto_0
    sput-object v8, Lorg/iq80/leveldb/util/ByteBufferSupport;->INVOKE_CLEANER:Ljava/lang/invoke/MethodHandle;

    .line 68
    return-void

    .line 46
    .end local v8    # "invoker":Ljava/lang/invoke/MethodHandle;
    :catch_0
    move-exception v5

    .line 49
    .local v5, "e":Ljava/lang/Exception;
    :try_start_1
    const-string v11, "java.nio.DirectByteBuffer"

    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 50
    .local v4, "directByteBufferClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v11, "sun.misc.Cleaner"

    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 52
    .local v2, "cleanerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v11, "cleaner"

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Class;

    invoke-virtual {v4, v11, v12}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 53
    .local v3, "cleanerMethod":Ljava/lang/reflect/Method;
    const/4 v11, 0x1

    invoke-virtual {v3, v11}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 54
    invoke-static {}, Ljava/lang/invoke/MethodHandles;->lookup()Ljava/lang/invoke/MethodHandles$Lookup;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/invoke/MethodHandles$Lookup;->unreflect(Ljava/lang/reflect/Method;)Ljava/lang/invoke/MethodHandle;

    move-result-object v7

    .line 56
    .local v7, "getCleaner":Ljava/lang/invoke/MethodHandle;
    const-string v11, "clean"

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Class;

    invoke-virtual {v2, v11, v12}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 57
    .local v1, "cleanMethod":Ljava/lang/reflect/Method;
    const/4 v11, 0x1

    invoke-virtual {v3, v11}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 58
    invoke-static {}, Ljava/lang/invoke/MethodHandles;->lookup()Ljava/lang/invoke/MethodHandles$Lookup;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/invoke/MethodHandles$Lookup;->unreflect(Ljava/lang/reflect/Method;)Ljava/lang/invoke/MethodHandle;

    move-result-object v0

    .line 60
    .local v0, "clean":Ljava/lang/invoke/MethodHandle;
    const/4 v11, 0x1

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Class;

    const/4 v13, 0x0

    aput-object v4, v12, v13

    invoke-static {v0, v11, v12}, Ljava/lang/invoke/MethodHandles;->dropArguments(Ljava/lang/invoke/MethodHandle;I[Ljava/lang/Class;)Ljava/lang/invoke/MethodHandle;

    move-result-object v0

    .line 61
    invoke-static {v0, v7}, Ljava/lang/invoke/MethodHandles;->foldArguments(Ljava/lang/invoke/MethodHandle;Ljava/lang/invoke/MethodHandle;)Ljava/lang/invoke/MethodHandle;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v8

    .restart local v8    # "invoker":Ljava/lang/invoke/MethodHandle;
    goto :goto_0

    .line 63
    .end local v0    # "clean":Ljava/lang/invoke/MethodHandle;
    .end local v1    # "cleanMethod":Ljava/lang/reflect/Method;
    .end local v2    # "cleanerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "cleanerMethod":Ljava/lang/reflect/Method;
    .end local v4    # "directByteBufferClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "getCleaner":Ljava/lang/invoke/MethodHandle;
    .end local v8    # "invoker":Ljava/lang/invoke/MethodHandle;
    :catch_1
    move-exception v6

    .line 64
    .local v6, "e1":Ljava/lang/Exception;
    new-instance v11, Ljava/lang/AssertionError;

    invoke-direct {v11, v6}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v11
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    return-void
.end method

.method public static unmap(Ljava/nio/MappedByteBuffer;)V
    .locals 2
    .param p0, "buffer"    # Ljava/nio/MappedByteBuffer;

    .prologue
    .line 77
    :try_start_0
    sget-object v1, Lorg/iq80/leveldb/util/ByteBufferSupport;->INVOKE_CLEANER:Ljava/lang/invoke/MethodHandle;

    invoke-virtual {v1, p0}, Ljava/lang/invoke/MethodHandle;->invoke(Ljava/nio/MappedByteBuffer;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    return-void

    .line 79
    :catch_0
    move-exception v0

    .line 80
    .local v0, "ignored":Ljava/lang/Throwable;
    invoke-static {v0}, Lcom/google/common/base/Throwables;->propagate(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method
