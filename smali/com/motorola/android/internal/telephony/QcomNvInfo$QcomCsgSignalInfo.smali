.class public Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomCsgSignalInfo;
.super Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CsgSignalInfo;
.source "QcomNvInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/android/internal/telephony/QcomNvInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "QcomCsgSignalInfo"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2100
    invoke-direct {p0}, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CsgSignalInfo;-><init>()V

    return-void
.end method

.method public static deserialize(Ljava/nio/ByteBuffer;)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CsgSignalInfo;
    .locals 2
    .param p0, "buf"    # Ljava/nio/ByteBuffer;

    .line 2102
    new-instance v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CsgSignalInfo;

    invoke-direct {v0}, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CsgSignalInfo;-><init>()V

    .line 2103
    .local v0, "signalInfo":Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CsgSignalInfo;
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    iput v1, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CsgSignalInfo;->mMcc:I

    .line 2104
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    iput v1, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CsgSignalInfo;->mMnc:I

    .line 2105
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    iput-byte v1, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CsgSignalInfo;->mPcsDigit:B

    .line 2106
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CsgSignalInfo;->mCsgId:I

    .line 2107
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CsgSignalInfo;->mSignalStrength:I

    .line 2108
    return-object v0
.end method
