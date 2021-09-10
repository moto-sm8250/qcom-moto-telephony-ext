.class public Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;
.super Ljava/lang/Object;
.source "QcomOemHookIndicationProcess.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess$TLV;
    }
.end annotation


# static fields
.field private static final DBG:Z

.field private static final EMBMS_MESSAGE_UNSOLSIB16_COVERAGE:I = 0x19

.field private static final MOT_QMI_SPRINT_DS_PROFILE_MAX_APN_STRING_LEN_V01:I = 0x67

.field private static final NR5G_SCS_120:B = 0x3t

.field private static final NR5G_SCS_15:B = 0x0t

.field private static final NR5G_SCS_240:B = 0x4t

.field private static final NR5G_SCS_30:B = 0x1t

.field private static final NR5G_SCS_60:B = 0x2t

.field private static final OEMHOOK_TUNNELING_SERVICE_EMBMS:I = 0x2

.field private static final TAG:Ljava/lang/String; = "MotoExtTM: QcomOemHookIndicationProcess"


# instance fields
.field private mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 29
    sget-boolean v0, Landroid/os/Build;->IS_DEBUGGABLE:Z

    sput-boolean v0, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->DBG:Z

    return-void
.end method

.method public constructor <init>(Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;)V
    .locals 0
    .param p1, "service"    # Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    .line 38
    return-void
.end method

.method private handleBandInfo(ILjava/nio/ByteBuffer;)V
    .locals 7
    .param p1, "phoneId"    # I
    .param p2, "bf"    # Ljava/nio/ByteBuffer;

    .line 132
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 133
    .local v0, "dataLength":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    .line 134
    .local v1, "bandArrayLength":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 135
    .local v2, "bandInfos":Ljava/util/List;, "Ljava/util/List<Lcom/motorola/android/telephony/MotoExtTelephonyInfo$RadioBandInfo;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v1, :cond_1

    .line 136
    new-instance v4, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$RadioBandInfo;

    invoke-direct {v4}, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$RadioBandInfo;-><init>()V

    .line 137
    .local v4, "bandInfo":Lcom/motorola/android/telephony/MotoExtTelephonyInfo$RadioBandInfo;
    invoke-virtual {v4, p2}, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$RadioBandInfo;->readFromByteBuffer(Ljava/nio/ByteBuffer;)V

    .line 138
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    sget-boolean v5, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->DBG:Z

    if-eqz v5, :cond_0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " band Info changed: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "MotoExtTM: QcomOemHookIndicationProcess"

    invoke-static {v6, v5}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    .end local v4    # "bandInfo":Lcom/motorola/android/telephony/MotoExtTelephonyInfo$RadioBandInfo;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 141
    .end local v3    # "i":I
    :cond_1
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v3, p1, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->setBandInfo(ILjava/util/List;)V

    .line 142
    return-void
.end method

.method private handleCaInfo(ILjava/nio/ByteBuffer;)V
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "bf"    # Ljava/nio/ByteBuffer;

    .line 145
    new-instance v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CaInfoData;

    invoke-direct {v0}, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CaInfoData;-><init>()V

    .line 146
    .local v0, "caInfo":Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CaInfoData;
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    .line 147
    .local v1, "len":I
    const-string v2, "MotoExtTM: QcomOemHookIndicationProcess"

    const/4 v3, 0x3

    if-ge v1, v3, :cond_1

    .line 148
    sget-boolean v3, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->DBG:Z

    if-eqz v3, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Response OEM_RIL_UNSOL_LTE_CA_INFO  size is Invalid "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    :cond_0
    return-void

    .line 153
    :cond_1
    if-lt v1, v3, :cond_2

    .line 155
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    .line 156
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    .line 158
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v3

    iput-byte v3, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CaInfoData;->caConfigured:B

    .line 161
    :cond_2
    const/16 v3, 0x9

    if-lt v1, v3, :cond_3

    .line 163
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    .line 164
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    .line 166
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v3

    iput v3, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CaInfoData;->totalNRB:I

    .line 169
    :cond_3
    sget-boolean v3, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->DBG:Z

    if-eqz v3, :cond_4

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "OEM_RIL_UNSOL_LTE_CA_INFO len = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    :cond_4
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v2, p1, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->notifyCAInfoForPhone(ILcom/motorola/android/telephony/MotoExtTelephonyInfo$CaInfoData;)V

    .line 171
    return-void
.end method

.method private handleLteError(ILjava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "phoneId"    # I
    .param p2, "bf"    # Ljava/nio/ByteBuffer;

    .line 210
    new-instance v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteError;

    invoke-direct {v0}, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteError;-><init>()V

    .line 211
    .local v0, "lteError":Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteError;
    const/4 v1, 0x0

    .line 212
    .local v1, "apnNameLength":I
    const/16 v2, 0x67

    new-array v3, v2, [B

    .line 214
    .local v3, "apnNameAsByteArray":[B
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 215
    invoke-static {p2}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->readOemHookRespHeader(Ljava/nio/ByteBuffer;)Lcom/motorola/android/internal/telephony/QcomNvUtils$OemHookDataHeader;

    .line 217
    :try_start_0
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v4

    iput v4, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteError;->emmCode:I

    .line 218
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    move v4, v5

    :goto_0
    iput-boolean v4, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteError;->apnValid:Z

    .line 219
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v4

    move v1, v4

    .line 220
    invoke-virtual {p2, v3, v5, v2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 221
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    move v1, v2

    .line 223
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v3, v5, v1}, Ljava/lang/String;-><init>([BII)V

    iput-object v2, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteError;->apnName:Ljava/lang/String;

    .line 224
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    iput v2, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteError;->esmCode:I
    :try_end_0
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_0

    .line 228
    nop

    .line 230
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v2, p1, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->setLteError(ILcom/motorola/android/telephony/MotoExtTelephonyInfo$LteError;)V

    .line 231
    return-void

    .line 225
    :catch_0
    move-exception v2

    .line 226
    .local v2, "e":Ljava/nio/BufferUnderflowException;
    const-string v4, "MotoExtTM: QcomOemHookIndicationProcess"

    const-string v5, "handleLteError fails."

    invoke-static {v4, v5, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 227
    return-void
.end method

.method private handleMipError(ILjava/nio/ByteBuffer;)V
    .locals 3
    .param p1, "phoneId"    # I
    .param p2, "bf"    # Ljava/nio/ByteBuffer;

    .line 234
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 235
    invoke-static {p2}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->readOemHookRespHeader(Ljava/nio/ByteBuffer;)Lcom/motorola/android/internal/telephony/QcomNvUtils$OemHookDataHeader;

    .line 237
    :try_start_0
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 238
    .local v0, "error":I
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v1, p1, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->notifyMipErrorForPhone(II)V
    :try_end_0
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_0

    .line 241
    .end local v0    # "error":I
    goto :goto_0

    .line 239
    :catch_0
    move-exception v0

    .line 240
    .local v0, "e":Ljava/nio/BufferUnderflowException;
    const-string v1, "MotoExtTM: QcomOemHookIndicationProcess"

    const-string v2, "handleMipError fails."

    invoke-static {v1, v2, v0}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 242
    .end local v0    # "e":Ljava/nio/BufferUnderflowException;
    :goto_0
    return-void
.end method

.method private handleNASSysInfo(ILjava/nio/ByteBuffer;)V
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "bf"    # Ljava/nio/ByteBuffer;

    .line 314
    new-instance v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$NRSysInfo;

    invoke-direct {v0}, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$NRSysInfo;-><init>()V

    .line 315
    .local v0, "info":Lcom/motorola/android/telephony/MotoExtTelephonyInfo$NRSysInfo;
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getInt()I

    .line 316
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    .line 317
    .local v1, "isValid":B
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v2

    .line 318
    .local v2, "upperlayerIndR15Available":B
    const/4 v3, 0x1

    if-ne v1, v3, :cond_1

    .line 320
    if-ne v2, v3, :cond_0

    move v4, v3

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    iput-boolean v4, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$NRSysInfo;->upperlayerIndR15Available:Z

    .line 323
    :cond_1
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    .line 324
    if-ne v1, v3, :cond_6

    .line 326
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v4

    .line 327
    .local v4, "scs":B
    if-nez v4, :cond_2

    .line 328
    const/16 v3, 0xf

    iput v3, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$NRSysInfo;->nrSubcarrierSpacingKHz:I

    goto :goto_1

    .line 329
    :cond_2
    if-ne v4, v3, :cond_3

    .line 330
    const/16 v3, 0x1e

    iput v3, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$NRSysInfo;->nrSubcarrierSpacingKHz:I

    goto :goto_1

    .line 331
    :cond_3
    const/4 v3, 0x2

    if-ne v4, v3, :cond_4

    .line 332
    const/16 v3, 0x3c

    iput v3, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$NRSysInfo;->nrSubcarrierSpacingKHz:I

    goto :goto_1

    .line 333
    :cond_4
    const/4 v3, 0x3

    if-ne v4, v3, :cond_5

    .line 334
    const/16 v3, 0x78

    iput v3, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$NRSysInfo;->nrSubcarrierSpacingKHz:I

    goto :goto_1

    .line 335
    :cond_5
    const/4 v3, 0x4

    if-ne v4, v3, :cond_6

    .line 336
    const/16 v3, 0xf0

    iput v3, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$NRSysInfo;->nrSubcarrierSpacingKHz:I

    .line 340
    .end local v4    # "scs":B
    :cond_6
    :goto_1
    sget-boolean v3, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->DBG:Z

    if-eqz v3, :cond_7

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "handleNASSysInfo "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "MotoExtTM: QcomOemHookIndicationProcess"

    invoke-static {v4, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 341
    :cond_7
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v3, p1, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->notifyNRSysInfoForPhone(ILcom/motorola/android/telephony/MotoExtTelephonyInfo$NRSysInfo;)V

    .line 342
    return-void
.end method

.method private handleNITZInfo(ILjava/nio/ByteBuffer;)V
    .locals 7
    .param p1, "phoneId"    # I
    .param p2, "bf"    # Ljava/nio/ByteBuffer;

    .line 266
    new-instance v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$TOEInfo;

    invoke-direct {v0}, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$TOEInfo;-><init>()V

    .line 267
    .local v0, "info":Lcom/motorola/android/telephony/MotoExtTelephonyInfo$TOEInfo;
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getInt()I

    .line 268
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    .line 269
    .local v1, "isValid":B
    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 270
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    .line 271
    .local v2, "longNameLen":I
    new-array v3, v2, [B

    .line 272
    .local v3, "longNamebyteArr":[B
    const/4 v4, 0x0

    invoke-virtual {p2, v3, v4, v2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 273
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v3}, Ljava/lang/String;-><init>([B)V

    iput-object v5, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$TOEInfo;->operatorAlphaLong:Ljava/lang/String;

    .line 274
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v5

    .line 275
    .local v5, "shortNameLen":I
    new-array v6, v5, [B

    .line 276
    .local v6, "shortNamebyteArr":[B
    invoke-virtual {p2, v6, v4, v5}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 277
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v6}, Ljava/lang/String;-><init>([B)V

    iput-object v4, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$TOEInfo;->operatorAlphaShort:Ljava/lang/String;

    .line 280
    .end local v2    # "longNameLen":I
    .end local v3    # "longNamebyteArr":[B
    .end local v5    # "shortNameLen":I
    .end local v6    # "shortNamebyteArr":[B
    :cond_0
    sget-boolean v2, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->DBG:Z

    if-eqz v2, :cond_1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "OEM_RIL_UNSOL_NITZ_INFO_IND "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "MotoExtTM: QcomOemHookIndicationProcess"

    invoke-static {v3, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    :cond_1
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v2, p1, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->notifyTOEInfoForPhone(ILcom/motorola/android/telephony/MotoExtTelephonyInfo$TOEInfo;)V

    .line 282
    return-void
.end method

.method private handlePCOInfo(ILjava/nio/ByteBuffer;)V
    .locals 11
    .param p1, "phoneId"    # I
    .param p2, "bf"    # Ljava/nio/ByteBuffer;

    .line 174
    new-instance v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$PCOInfoData;

    invoke-direct {v0}, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$PCOInfoData;-><init>()V

    .line 176
    .local v0, "pcoInfo":Lcom/motorola/android/telephony/MotoExtTelephonyInfo$PCOInfoData;
    const/4 v1, -0x1

    iput v1, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$PCOInfoData;->value:I

    .line 177
    iput p1, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$PCOInfoData;->phoneId:I

    .line 178
    iput v1, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$PCOInfoData;->subId:I

    .line 180
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    .line 181
    .local v1, "apn_name_length":I
    new-array v2, v1, [B

    .line 182
    .local v2, "apnArray":[B
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    invoke-virtual {p2, v2, v3, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 183
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v2}, Ljava/lang/String;-><init>([B)V

    iput-object v3, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$PCOInfoData;->apnName:Ljava/lang/String;

    .line 185
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v3

    .line 186
    .local v3, "mcc":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v4

    .line 187
    .local v4, "mnc":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v5

    .line 188
    .local v5, "mnc_includes_pcs_digit":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v6

    .line 190
    .local v6, "app_specific_info_len":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v7

    iput v7, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$PCOInfoData;->value:I

    .line 192
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->position()I

    move-result v7

    add-int/2addr v7, v6

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {p2, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 194
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v7

    .line 195
    .local v7, "container_id":I
    sget-boolean v8, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->DBG:Z

    const-string v9, "MotoExtTM: QcomOemHookIndicationProcess"

    if-eqz v8, :cond_0

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "notify pco info updated, mcc="

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ", mnc="

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ", mnc_includes_pcs_digit="

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ", app_specific_info_len = "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ", pco value="

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v10, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$PCOInfoData;->value:I

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ", container_id="

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, " , apn name ="

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$PCOInfoData;->apnName:Ljava/lang/String;

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v9, v8}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    :cond_0
    iget v8, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$PCOInfoData;->value:I

    if-gez v8, :cond_1

    .line 201
    const-string v8, "PCO value is invalid, will not notify to app!"

    invoke-static {v9, v8}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 203
    :cond_1
    iget-object v8, p0, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v8, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getSubIdUsingPhoneId(I)I

    move-result v8

    iput v8, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$PCOInfoData;->subId:I

    .line 204
    iget-object v8, p0, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v8, p1, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->notifyPCOInfoForPhone(ILcom/motorola/android/telephony/MotoExtTelephonyInfo$PCOInfoData;)V

    .line 206
    :goto_0
    return-void
.end method

.method private handleQCGenericUnsol(ILjava/nio/ByteBuffer;)V
    .locals 3
    .param p1, "phoneId"    # I
    .param p2, "bf"    # Ljava/nio/ByteBuffer;

    .line 345
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 347
    .local v0, "responseSize":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    .line 348
    .local v1, "serviceId":S
    const/4 v2, 0x2

    if-eq v1, v2, :cond_0

    goto :goto_0

    .line 350
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->handleTunnelingServiceEMBMS(ILjava/nio/ByteBuffer;)V

    .line 351
    nop

    .line 356
    :goto_0
    return-void
.end method

.method private handleSimLockInfoChanged(I)V
    .locals 1
    .param p1, "phoneId"    # I

    .line 245
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->notifySimLockInfoChangedForPhone(I)V

    .line 246
    return-void
.end method

.method private handleTunnelingServiceEMBMS(ILjava/nio/ByteBuffer;)V
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "oemHookResponse"    # Ljava/nio/ByteBuffer;

    .line 360
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    .line 361
    .local v0, "messageId":S
    const/16 v1, 0x19

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 363
    :cond_0
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess$TLV;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess$TLV;-><init>(Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess$1;)V

    .line 364
    .local v1, "tlvObj":Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess$TLV;
    invoke-static {v1, p2}, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess$TLV;->access$100(Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess$TLV;Ljava/nio/ByteBuffer;)V

    .line 366
    invoke-static {v1}, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess$TLV;->access$200(Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess$TLV;)[B

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-static {v1}, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess$TLV;->access$200(Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess$TLV;)[B

    move-result-object v2

    array-length v2, v2

    if-lez v2, :cond_3

    .line 367
    invoke-static {v1}, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess$TLV;->access$200(Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess$TLV;)[B

    move-result-object v2

    const/4 v3, 0x0

    aget-byte v2, v2, v3

    const/4 v4, 0x1

    if-ne v2, v4, :cond_1

    move v3, v4

    :cond_1
    move v2, v3

    .line 368
    .local v2, "isInSIB16Coverage":Z
    sget-boolean v3, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->DBG:Z

    if-eqz v3, :cond_2

    .line 369
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "EMBMS_MESSAGE_UNSOLSIB16_COVERAGE : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "MotoExtTM: QcomOemHookIndicationProcess"

    invoke-static {v4, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 371
    :cond_2
    invoke-direct {p0, p1, v2}, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->notifySIB16Coverage(IZ)V

    .line 378
    .end local v1    # "tlvObj":Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess$TLV;
    .end local v2    # "isInSIB16Coverage":Z
    :cond_3
    :goto_0
    return-void
.end method

.method private static isQcUnsolOemHookResp(Ljava/nio/ByteBuffer;)Z
    .locals 7
    .param p0, "bf"    # Ljava/nio/ByteBuffer;

    .line 107
    const-string v0, "QOEMHOOK"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 108
    .local v1, "identifierSize":I
    add-int/lit8 v2, v1, 0x8

    .line 109
    .local v2, "headerSize":I
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v3

    .line 112
    .local v3, "buffSize":I
    const/4 v4, 0x0

    if-ge v3, v2, :cond_0

    .line 117
    return v4

    .line 119
    :cond_0
    new-array v5, v1, [B

    .line 120
    .local v5, "oemIdBytes":[B
    invoke-virtual {p0, v5}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 121
    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v5}, Ljava/lang/String;-><init>([B)V

    .line 122
    .local v6, "oemIdString":Ljava/lang/String;
    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 124
    return v4

    .line 127
    .end local v5    # "oemIdBytes":[B
    .end local v6    # "oemIdString":Ljava/lang/String;
    :cond_1
    sget-boolean v0, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->DBG:Z

    if-eqz v0, :cond_2

    const-string v0, "MotoExtTM: QcomOemHookIndicationProcess"

    const-string v4, "it\'s a Qcom Unsolicited oem hook message"

    invoke-static {v0, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    :cond_2
    const/4 v0, 0x1

    return v0
.end method

.method private static isQcUnsolOemHookRespSupported(I)Z
    .locals 1
    .param p0, "oemHookRespId"    # I

    .line 97
    const v0, 0x80425

    if-eq p0, v0, :cond_1

    const v0, 0x80443

    if-eq p0, v0, :cond_1

    const v0, 0x80444

    if-eq p0, v0, :cond_1

    const v0, 0x8044c

    if-ne p0, v0, :cond_0

    goto :goto_0

    .line 103
    :cond_0
    const/4 v0, 0x0

    return v0

    .line 101
    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method private notifySIB16Coverage(IZ)V
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "inCoverage"    # Z

    .line 396
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v0, p1, p2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->notifySIB16CoverageForPhone(IZ)V

    .line 397
    return-void
.end method


# virtual methods
.method public processUnsolOemhookIndication(I[B)V
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "response"    # [B

    .line 41
    sget-boolean v0, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->DBG:Z

    const-string v1, "MotoExtTM: QcomOemHookIndicationProcess"

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "processUnsolOemhookIndication: raw message="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    invoke-static {p2}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->byteArrToStringLog([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 41
    invoke-static {v1, v0}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    :cond_0
    invoke-static {p2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 45
    .local v0, "bf":Ljava/nio/ByteBuffer;
    const/4 v2, -0x1

    .line 47
    .local v2, "msgId":I
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->isQcUnsolOemHookResp(Ljava/nio/ByteBuffer;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 48
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    .line 49
    invoke-static {v2}, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->isQcUnsolOemHookRespSupported(I)Z

    move-result v3

    if-nez v3, :cond_3

    .line 50
    sget-boolean v3, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->DBG:Z

    if-eqz v3, :cond_1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Not support QCOM  Unsolicted Oem Hook Message: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    :cond_1
    return-void

    .line 54
    :cond_2
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 55
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    .line 58
    :cond_3
    sget-boolean v3, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->DBG:Z

    if-eqz v3, :cond_4

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "processUnsolOemhookIndication: msgId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    :cond_4
    sparse-switch v2, :sswitch_data_0

    goto :goto_0

    .line 86
    :sswitch_0
    invoke-direct {p0, p1, v0}, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->handleNASSysInfo(ILjava/nio/ByteBuffer;)V

    .line 87
    goto :goto_0

    .line 83
    :sswitch_1
    invoke-direct {p0, p1, v0}, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->handleNITZInfo(ILjava/nio/ByteBuffer;)V

    .line 84
    goto :goto_0

    .line 80
    :sswitch_2
    invoke-direct {p0, p1}, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->handleSimLockInfoChanged(I)V

    .line 81
    goto :goto_0

    .line 65
    :sswitch_3
    invoke-direct {p0, p1, v0}, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->handleCaInfo(ILjava/nio/ByteBuffer;)V

    .line 66
    goto :goto_0

    .line 62
    :sswitch_4
    invoke-direct {p0, p1, v0}, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->handleBandInfo(ILjava/nio/ByteBuffer;)V

    .line 63
    goto :goto_0

    .line 74
    :sswitch_5
    invoke-direct {p0, p1, v0}, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->handleLteError(ILjava/nio/ByteBuffer;)V

    .line 75
    goto :goto_0

    .line 77
    :sswitch_6
    invoke-direct {p0, p1, v0}, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->handleMipError(ILjava/nio/ByteBuffer;)V

    .line 78
    goto :goto_0

    .line 71
    :sswitch_7
    invoke-direct {p0, p1, v0}, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->handleQCGenericUnsol(ILjava/nio/ByteBuffer;)V

    .line 72
    goto :goto_0

    .line 68
    :sswitch_8
    invoke-direct {p0, p1, v0}, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->handlePCOInfo(ILjava/nio/ByteBuffer;)V

    .line 69
    nop

    .line 92
    :goto_0
    sget-boolean v3, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->DBG:Z

    if-eqz v3, :cond_5

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "notifyOemHookRawEventForPhone "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    :cond_5
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v1, p1, p2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->notifyOemHookRawEventForPhone(I[B)V

    .line 94
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x80425 -> :sswitch_8
        0x8044c -> :sswitch_7
        0x20001b0 -> :sswitch_6
        0x20001b1 -> :sswitch_5
        0x4001000 -> :sswitch_4
        0x4001100 -> :sswitch_3
        0x4001a00 -> :sswitch_2
        0x4001b00 -> :sswitch_1
        0x4001c00 -> :sswitch_0
    .end sparse-switch
.end method
