.class public Lcom/motorola/android/internal/telephony/QcomNvInfo$NASTxRxDataType;
.super Ljava/lang/Object;
.source "QcomNvInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/android/internal/telephony/QcomNvInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NASTxRxDataType"
.end annotation


# static fields
.field private static final NAS_RX_INFO_LENGTH_INT:I = 0x6

.field private static final NAS_TX_INFO_LENGTH_INT:I = 0x2

.field private static final SIZE:I = 0x38


# instance fields
.field public txPower:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 2617
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2618
    const/4 v0, 0x0

    iput v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NASTxRxDataType;->txPower:I

    .line 2619
    return-void
.end method

.method public static deserialize(Ljava/nio/ByteBuffer;I)Lcom/motorola/android/internal/telephony/QcomNvInfo$NASTxRxDataType;
    .locals 3
    .param p0, "buffer"    # Ljava/nio/ByteBuffer;
    .param p1, "length"    # I

    .line 2622
    new-instance v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NASTxRxDataType;

    invoke-direct {v0}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NASTxRxDataType;-><init>()V

    .line 2624
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NASTxRxDataType;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    .line 2625
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 2626
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 2627
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 2628
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 2629
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 2630
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 2624
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2634
    .end local v1    # "i":I
    :cond_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 2635
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NASTxRxDataType;->txPower:I

    .line 2637
    return-object v0
.end method

.method public static size()I
    .locals 1

    .line 2641
    const/16 v0, 0x38

    return v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 2645
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2646
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "NASTxRxDataType"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2647
    const-string v1, ": txPower="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NASTxRxDataType;->txPower:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 2648
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
