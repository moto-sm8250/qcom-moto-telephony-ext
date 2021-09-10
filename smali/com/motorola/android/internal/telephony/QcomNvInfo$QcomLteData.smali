.class public Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;
.super Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteData;
.source "QcomNvInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/android/internal/telephony/QcomNvInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "QcomLteData"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1023
    invoke-direct {p0}, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteData;-><init>()V

    return-void
.end method

.method public static deserialize(Ljava/nio/ByteBuffer;)Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;
    .locals 2
    .param p0, "buf"    # Ljava/nio/ByteBuffer;

    .line 1044
    new-instance v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;

    invoke-direct {v0}, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;-><init>()V

    .line 1045
    .local v0, "lteData":Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->state:I

    .line 1046
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    iput v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->mcc:I

    .line 1047
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    iput v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->mnc:I

    .line 1048
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->cellId:I

    .line 1049
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    iput-byte v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->band:B

    .line 1050
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    iput-byte v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->bandwidth:B

    .line 1051
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->ulChannel:I

    .line 1052
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->dlChannel:I

    .line 1053
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    iput-byte v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->rssi:B

    .line 1054
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    iput v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->rsrp:I

    .line 1055
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    iput-byte v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->rsrq:B

    .line 1056
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->txPower:I

    .line 1057
    return-object v0
.end method


# virtual methods
.method public serialize(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "buf"    # Ljava/nio/ByteBuffer;

    .line 1029
    iget v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->state:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 1030
    iget v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->mcc:I

    int-to-short v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 1031
    iget v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->mnc:I

    int-to-short v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 1032
    iget v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->cellId:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 1033
    iget-byte v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->band:B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 1034
    iget-byte v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->bandwidth:B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 1035
    iget v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->ulChannel:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 1036
    iget v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->dlChannel:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 1037
    iget-byte v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->rssi:B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 1038
    iget v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->rsrp:I

    int-to-short v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 1039
    iget-byte v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->rsrq:B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 1040
    iget v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->txPower:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 1041
    return-void
.end method

.method public size()I
    .locals 1

    .line 1025
    const/16 v0, 0x1e

    return v0
.end method
