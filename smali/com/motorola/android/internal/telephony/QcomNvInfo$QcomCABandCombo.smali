.class public Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomCABandCombo;
.super Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CABandCombo;
.source "QcomNvInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/android/internal/telephony/QcomNvInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "QcomCABandCombo"
.end annotation


# static fields
.field public static final BYTES:I = 0x905


# instance fields
.field protected mCABandComboLength:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2739
    invoke-direct {p0}, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CABandCombo;-><init>()V

    return-void
.end method

.method public static deserialize([B)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CABandCombo;
    .locals 6
    .param p0, "data"    # [B

    .line 2745
    if-eqz p0, :cond_2

    array-length v0, p0

    const/16 v1, 0x905

    if-ge v0, v1, :cond_0

    goto :goto_1

    .line 2751
    :cond_0
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 2752
    .local v0, "buf":Ljava/nio/ByteBuffer;
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomCABandCombo;

    invoke-direct {v1}, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomCABandCombo;-><init>()V

    .line 2753
    .local v1, "caBandCombo":Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomCABandCombo;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    iput v2, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomCABandCombo;->mCABandComboLength:I

    .line 2754
    const/4 v2, 0x4

    .line 2755
    .local v2, "i":I
    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_1

    aget-byte v3, p0, v2

    if-eqz v3, :cond_1

    .line 2756
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2758
    :cond_1
    new-instance v3, Ljava/lang/String;

    add-int/lit8 v4, v2, -0x4

    const/4 v5, 0x4

    invoke-direct {v3, p0, v5, v4}, Ljava/lang/String;-><init>([BII)V

    iput-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomCABandCombo;->mCACombo:Ljava/lang/String;

    .line 2759
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "deserialize mCABandComboLength:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomCABandCombo;->mCABandComboLength:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", mCACombo:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomCABandCombo;->mCACombo:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo;->access$300(Ljava/lang/String;)V

    .line 2760
    return-object v1

    .line 2746
    .end local v0    # "buf":Ljava/nio/ByteBuffer;
    .end local v1    # "caBandCombo":Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomCABandCombo;
    .end local v2    # "i":I
    :cond_2
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid QcomCABandCombo data returned from modem! data:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "size:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2747
    if-nez p0, :cond_3

    const/4 v1, 0x0

    goto :goto_2

    :cond_3
    array-length v1, p0

    :goto_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2746
    const-string v1, "MotoExtTM: QcomNvInfo"

    invoke-static {v1, v0}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2748
    const/4 v0, 0x0

    return-object v0
.end method
