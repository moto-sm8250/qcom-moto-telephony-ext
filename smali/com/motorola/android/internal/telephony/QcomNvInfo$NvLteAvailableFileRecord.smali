.class public Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLteAvailableFileRecord;
.super Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteAvailableFileRecord;
.source "QcomNvInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/android/internal/telephony/QcomNvInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NvLteAvailableFileRecord"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1943
    invoke-direct {p0}, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteAvailableFileRecord;-><init>()V

    return-void
.end method

.method public static deserialize(Ljava/nio/ByteBuffer;)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLteAvailableFileRecord;
    .locals 2
    .param p0, "buf"    # Ljava/nio/ByteBuffer;

    .line 1955
    new-instance v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLteAvailableFileRecord;

    invoke-direct {v0}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLteAvailableFileRecord;-><init>()V

    .line 1956
    .local v0, "fileRec":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLteAvailableFileRecord;
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLteAvailableFileRecord;->sid:I

    .line 1957
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLteAvailableFileRecord;->nid:I

    .line 1958
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLteAvailableFileRecord;->bsid:I

    .line 1959
    return-object v0
.end method

.method public static size()I
    .locals 1

    .line 1945
    const/16 v0, 0xc

    return v0
.end method


# virtual methods
.method public serialize(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "buf"    # Ljava/nio/ByteBuffer;

    .line 1949
    iget v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLteAvailableFileRecord;->sid:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 1950
    iget v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLteAvailableFileRecord;->nid:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 1951
    iget v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLteAvailableFileRecord;->bsid:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 1952
    return-void
.end method
