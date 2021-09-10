.class public Lcom/motorola/android/internal/telephony/QcomNvInfo$NvAKeyDataType;
.super Ljava/lang/Object;
.source "QcomNvInfo.java"

# interfaces
.implements Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/android/internal/telephony/QcomNvInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NvAKeyDataType"
.end annotation


# instance fields
.field private akey:[B


# direct methods
.method public constructor <init>([B)V
    .locals 0
    .param p1, "akey"    # [B

    .line 1971
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1972
    iput-object p1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvAKeyDataType;->akey:[B

    .line 1973
    return-void
.end method


# virtual methods
.method public serialize(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "buf"    # Ljava/nio/ByteBuffer;

    .line 1976
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvAKeyDataType;->akey:[B

    if-nez v0, :cond_0

    return-void

    .line 1978
    :cond_0
    array-length v0, v0

    rsub-int/lit8 v0, v0, 0x1a

    .line 1979
    .local v0, "gap":I
    :goto_0
    add-int/lit8 v1, v0, -0x1

    .end local v0    # "gap":I
    .local v1, "gap":I
    if-lez v0, :cond_1

    .line 1980
    const/16 v0, 0x30

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    move v0, v1

    goto :goto_0

    .line 1983
    :cond_1
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvAKeyDataType;->akey:[B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 1984
    return-void
.end method

.method public size()I
    .locals 1

    .line 1987
    const/16 v0, 0x1a

    return v0
.end method
