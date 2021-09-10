.class public Lcom/motorola/android/internal/telephony/QcomNvManager;
.super Ljava/lang/Object;
.source "QcomNvManager.java"


# static fields
.field private static final DBG:Z

.field private static final GET_ACTIVE_SINGLE_SLOT_DATA_LENGTH:I = 0x2

.field private static final GET_CAMPCA_BAND_COMBO_LENGTH:I = 0x5

.field private static final SET_ACTIVE_SINGLE_SLOT_DATA_LENGTH:I = 0x1

.field private static final TAG:Ljava/lang/String; = "MotoExtTM: QcomNvManager"


# instance fields
.field private VOICE_DOMAIN_SETTING_LENGTH_BYTE:I

.field private mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 72
    sget-boolean v0, Landroid/os/Build;->IS_DEBUGGABLE:Z

    sput-boolean v0, Lcom/motorola/android/internal/telephony/QcomNvManager;->DBG:Z

    return-void
.end method

.method public constructor <init>(Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;)V
    .locals 1
    .param p1, "service"    # Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1285
    const/4 v0, 0x1

    iput v0, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->VOICE_DOMAIN_SETTING_LENGTH_BYTE:I

    .line 78
    iput-object p1, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    .line 79
    return-void
.end method

.method static synthetic access$000(Lcom/motorola/android/internal/telephony/QcomNvManager;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/QcomNvManager;
    .param p1, "x1"    # Ljava/lang/String;

    .line 70
    invoke-direct {p0, p1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->logd(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/motorola/android/internal/telephony/QcomNvManager;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/QcomNvManager;
    .param p1, "x1"    # Ljava/lang/String;

    .line 70
    invoke-direct {p0, p1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->loge(Ljava/lang/String;)V

    return-void
.end method

.method private getFactoryResetType(I)B
    .locals 2
    .param p1, "resetType"    # I

    .line 540
    const/4 v0, -0x1

    .line 541
    .local v0, "type":B
    const/4 v1, 0x1

    if-eq p1, v1, :cond_1

    const/4 v1, 0x2

    if-eq p1, v1, :cond_0

    goto :goto_0

    .line 546
    :cond_0
    const/4 v0, 0x3

    goto :goto_0

    .line 543
    :cond_1
    const/4 v0, -0x1

    .line 544
    nop

    .line 549
    :goto_0
    return v0
.end method

.method private getNVIndexForCA(I)I
    .locals 3
    .param p1, "primaryBandId"    # I

    .line 1545
    invoke-static {p1}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->isValidBand(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1549
    add-int/lit16 v0, p1, 0x4e20

    add-int/lit8 v0, v0, -0x1

    return v0

    .line 1546
    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getNVIndexForCA: invalid primaryBandId "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "rdeElementId"    # I

    .line 1378
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(III)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v0

    return-object v0
.end method

.method private getRdeNvValueByElementId(III)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "rdeElementId"    # I
    .param p3, "recordNum"    # I

    .line 1467
    const/4 v0, 0x0

    if-gez p2, :cond_0

    return-object v0

    .line 1469
    :cond_0
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    invoke-direct {v1}, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;-><init>()V

    .line 1470
    .local v1, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    iput p2, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->elementId:I

    .line 1471
    iput p3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->recordNum:I

    .line 1472
    invoke-static {v1}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getReadingRdeNvReqData(Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;)[B

    move-result-object v2

    .line 1473
    .local v2, "reqRdeData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateReadingRdeNvRespBuffer()[B

    move-result-object v3

    .line 1474
    .local v3, "respRdeData":[B
    iget-object v4, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v4, p1, v2, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v4

    if-ltz v4, :cond_1

    .line 1475
    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->decodeReadingRdeNvResult([B)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v0

    return-object v0

    .line 1478
    :cond_1
    return-object v0
.end method

.method private getWritingNvRespResult(II[B[B)Z
    .locals 4
    .param p1, "phoneId"    # I
    .param p2, "reqId"    # I
    .param p3, "reqData"    # [B
    .param p4, "respData"    # [B

    .line 1532
    const/4 v0, 0x0

    .line 1533
    .local v0, "result":Z
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v1, p1, p3, p4}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v1

    if-ltz v1, :cond_1

    .line 1534
    invoke-static {p2, p4}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->readOemHookRespHeader(I[B)Lcom/motorola/android/internal/telephony/QcomNvUtils$OemHookDataHeader;

    move-result-object v1

    .line 1535
    .local v1, "respHeader":Lcom/motorola/android/internal/telephony/QcomNvUtils$OemHookDataHeader;
    sget-boolean v2, Lcom/motorola/android/internal/telephony/QcomNvManager;->DBG:Z

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "get Writing NV result for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v1, Lcom/motorola/android/internal/telephony/QcomNvUtils$OemHookDataHeader;->reqId:I

    .line 1536
    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getRequestName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1535
    const-string v3, "MotoExtTM: QcomNvManager"

    invoke-static {v3, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1537
    :cond_0
    iget-object v2, v1, Lcom/motorola/android/internal/telephony/QcomNvUtils$OemHookDataHeader;->error:Lcom/motorola/android/internal/telephony/QcomNvUtils$OemHookRespError;

    sget-object v3, Lcom/motorola/android/internal/telephony/QcomNvUtils$OemHookRespError;->OEM_RIL_CDMA_SUCCESS:Lcom/motorola/android/internal/telephony/QcomNvUtils$OemHookRespError;

    if-ne v2, v3, :cond_1

    .line 1538
    const/4 v0, 0x1

    .line 1541
    .end local v1    # "respHeader":Lcom/motorola/android/internal/telephony/QcomNvUtils$OemHookDataHeader;
    :cond_1
    return v0
.end method

.method private getWritingRdeNvRespResult(I[B[B)Z
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "reqData"    # [B
    .param p3, "respData"    # [B

    .line 1527
    const v0, 0x2000015

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getWritingNvRespResult(II[B[B)Z

    move-result v0

    return v0
.end method

.method private logd(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .line 1554
    const-string v0, "MotoExtTM: QcomNvManager"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1555
    return-void
.end method

.method private loge(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .line 1558
    const-string v0, "MotoExtTM: QcomNvManager"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1559
    return-void
.end method

.method private setBandClassSupport(ILcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;)Z
    .locals 6
    .param p1, "phoneId"    # I
    .param p2, "bc"    # Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;

    .line 187
    const/4 v0, 0x0

    if-eqz p2, :cond_2

    invoke-virtual {p2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->isVersionUnknown()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 189
    :cond_0
    const v1, 0x5002c

    .line 190
    .local v1, "reqId":I
    invoke-virtual {p2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->size()I

    move-result v2

    add-int/lit8 v2, v2, 0x8

    new-array v2, v2, [B

    .line 192
    .local v2, "data":[B
    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 193
    .local v3, "buf":Ljava/nio/ByteBuffer;
    invoke-static {v1}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 194
    invoke-virtual {v3, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {p2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 197
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 198
    invoke-virtual {p2, v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->serialize(Ljava/nio/ByteBuffer;)V

    .line 200
    iget-object v4, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    const/4 v5, 0x0

    invoke-virtual {v4, p1, v2, v5}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v4

    if-ltz v4, :cond_1

    .line 201
    const/4 v0, 0x1

    return v0

    .line 203
    :cond_1
    return v0

    .line 187
    .end local v1    # "reqId":I
    .end local v2    # "data":[B
    .end local v3    # "buf":Ljava/nio/ByteBuffer;
    :cond_2
    :goto_0
    return v0
.end method

.method private setRdeNvValue(IIB)Z
    .locals 2
    .param p1, "phoneId"    # I
    .param p2, "rdeElementId"    # I
    .param p3, "value"    # B

    .line 1488
    new-instance v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    invoke-direct {v0, p3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;-><init>(B)V

    .line 1489
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;
    invoke-direct {p0, p1, p2, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(IILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;)Z

    move-result v1

    return v1
.end method

.method private setRdeNvValue(III)Z
    .locals 2
    .param p1, "phoneId"    # I
    .param p2, "rdeElementId"    # I
    .param p3, "value"    # I

    .line 1503
    new-instance v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvInfo;->getRdeByteOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-direct {v0, p3, v1}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;-><init>(ILjava/nio/ByteOrder;)V

    .line 1504
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;
    invoke-direct {p0, p1, p2, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(IILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;)Z

    move-result v1

    return v1
.end method

.method private setRdeNvValue(IIILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;)Z
    .locals 2
    .param p1, "phoneId"    # I
    .param p2, "rdeElementId"    # I
    .param p3, "rdeRecordNum"    # I
    .param p4, "nvData"    # Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    .line 1513
    new-instance v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    invoke-direct {v0}, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;-><init>()V

    .line 1514
    .local v0, "nv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    iput p2, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->elementId:I

    .line 1515
    iput p3, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->recordNum:I

    .line 1516
    iput-object p4, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    .line 1517
    invoke-direct {p0, p1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(ILcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;)Z

    move-result v1

    return v1
.end method

.method private setRdeNvValue(IILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;)Z
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "rdeElementId"    # I
    .param p3, "nvData"    # Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    .line 1508
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(IIILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;)Z

    move-result v0

    return v0
.end method

.method private setRdeNvValue(IIS)Z
    .locals 2
    .param p1, "phoneId"    # I
    .param p2, "rdeElementId"    # I
    .param p3, "value"    # S

    .line 1498
    new-instance v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvInfo;->getRdeByteOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-direct {v0, p3, v1}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;-><init>(SLjava/nio/ByteOrder;)V

    .line 1499
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;
    invoke-direct {p0, p1, p2, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(IILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;)Z

    move-result v1

    return v1
.end method

.method private setRdeNvValue(IIZ)Z
    .locals 3
    .param p1, "phoneId"    # I
    .param p2, "rdeElementId"    # I
    .param p3, "bValue"    # Z

    .line 1482
    move v0, p3

    .line 1483
    .local v0, "val":B
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    invoke-direct {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;-><init>(B)V

    .line 1484
    .local v1, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;
    invoke-direct {p0, p1, p2, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(IILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;)Z

    move-result v2

    return v2
.end method

.method private setRdeNvValue(II[B)Z
    .locals 2
    .param p1, "phoneId"    # I
    .param p2, "rdeElementId"    # I
    .param p3, "value"    # [B

    .line 1493
    new-instance v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    invoke-direct {v0, p3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;-><init>([B)V

    .line 1494
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;
    invoke-direct {p0, p1, p2, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(IILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;)Z

    move-result v1

    return v1
.end method

.method private setRdeNvValue(ILcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;)Z
    .locals 3
    .param p1, "phoneId"    # I
    .param p2, "nv"    # Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    .line 1521
    invoke-static {p2}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getWritingRdeNvReqData(Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;)[B

    move-result-object v0

    .line 1522
    .local v0, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateWritingRdeNvRespBuffer()[B

    move-result-object v1

    .line 1523
    .local v1, "respData":[B
    invoke-direct {p0, p1, v0, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getWritingRdeNvRespResult(I[B[B)Z

    move-result v2

    return v2
.end method


# virtual methods
.method public CSGPerformNWScan(ILcom/motorola/android/internal/telephony/IMotoCSGNWScanCB;)V
    .locals 4
    .param p1, "phoneId"    # I
    .param p2, "scanCB"    # Lcom/motorola/android/internal/telephony/IMotoCSGNWScanCB;

    .line 978
    const/4 v0, 0x3

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    .line 979
    .local v0, "payload":[B
    const v1, 0x80096

    invoke-static {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->writeQcomOemHookReqHeader(I[B)[B

    move-result-object v1

    .line 982
    .local v1, "oemReq":[B
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    new-instance v3, Lcom/motorola/android/internal/telephony/QcomNvManager$1;

    invoke-direct {v3, p0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager$1;-><init>(Lcom/motorola/android/internal/telephony/QcomNvManager;Lcom/motorola/android/internal/telephony/IMotoCSGNWScanCB;)V

    invoke-virtual {v2, p1, v1, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawAsync(I[BLcom/motorola/android/internal/telephony/IMotoOemCB;)I

    .line 1004
    return-void

    :array_0
    .array-data 1
        0x11t
        0x0t
        0x0t
    .end array-data
.end method

.method public CSGSetSysSelectPref(ILcom/motorola/android/telephony/MotoExtTelephonyInfo$CsgSelectionInfo;Lcom/motorola/android/internal/telephony/IMotoCSGSelectionCB;)V
    .locals 4
    .param p1, "phoneId"    # I
    .param p2, "info"    # Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CsgSelectionInfo;
    .param p3, "selectionCB"    # Lcom/motorola/android/internal/telephony/IMotoCSGSelectionCB;

    .line 1007
    invoke-static {p2}, Lcom/motorola/android/internal/telephony/QcomNvInfo;->getCSGSelectionPayload(Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CsgSelectionInfo;)[B

    move-result-object v0

    .line 1008
    .local v0, "payload":[B
    const v1, 0x80097

    invoke-static {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->writeQcomOemHookReqHeader(I[B)[B

    move-result-object v1

    .line 1012
    .local v1, "oemReq":[B
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    new-instance v3, Lcom/motorola/android/internal/telephony/QcomNvManager$2;

    invoke-direct {v3, p0, p3}, Lcom/motorola/android/internal/telephony/QcomNvManager$2;-><init>(Lcom/motorola/android/internal/telephony/QcomNvManager;Lcom/motorola/android/internal/telephony/IMotoCSGSelectionCB;)V

    invoke-virtual {v2, p1, v1, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawAsync(I[BLcom/motorola/android/internal/telephony/IMotoOemCB;)I

    .line 1025
    return-void
.end method

.method public clearLteAvailableFile(I)Z
    .locals 2
    .param p1, "phoneId"    # I

    .line 793
    const/4 v0, 0x0

    check-cast v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    const/16 v1, 0x2727

    invoke-direct {p0, p1, v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(IILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;)Z

    move-result v0

    return v0
.end method

.method public disableAllCAMultiDL(I)Z
    .locals 2
    .param p1, "phoneId"    # I

    .line 620
    const/16 v0, 0x1ff

    new-array v0, v0, [B

    .line 621
    .local v0, "bytes":[B
    const/16 v1, 0x5209

    invoke-direct {p0, p1, v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(II[B)Z

    move-result v1

    return v1
.end method

.method public enableCAPlusBandWidthFilter(IZ)Z
    .locals 6
    .param p1, "phoneId"    # I
    .param p2, "enable"    # Z

    .line 568
    const v0, 0x5002e

    .line 570
    .local v0, "reqId":I
    const/16 v1, 0x9

    new-array v1, v1, [B

    .line 571
    .local v1, "data":[B
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 572
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 574
    .local v2, "buf":Ljava/nio/ByteBuffer;
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 575
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 576
    int-to-byte v5, p2

    invoke-virtual {v3, v5}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 578
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    const/4 v5, 0x0

    invoke-virtual {v3, p1, v1, v5}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v3

    if-ltz v3, :cond_0

    .line 579
    return v4

    .line 581
    :cond_0
    const/4 v3, 0x0

    return v3
.end method

.method public get1xAdvancedEnabled(I)Z
    .locals 4
    .param p1, "phoneId"    # I

    .line 106
    const/4 v0, 0x0

    .line 107
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/16 v1, 0x271f

    invoke-direct {p0, p1, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v1

    .line 108
    .local v1, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    if-eqz v1, :cond_0

    iget-object v2, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v2, :cond_0

    .line 109
    iget-object v2, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 110
    .local v2, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v2, :cond_0

    .line 111
    invoke-static {v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->toBool(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)Z

    move-result v3

    return v3

    .line 114
    .end local v2    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    const/4 v2, 0x0

    return v2
.end method

.method public get256QAMDLEnabled(I)Z
    .locals 6
    .param p1, "phoneId"    # I

    .line 362
    const/4 v0, 0x0

    .line 364
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/16 v1, 0x2739

    invoke-direct {p0, p1, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v1

    .line 365
    .local v1, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    const/4 v2, 0x0

    if-eqz v1, :cond_2

    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v3, :cond_2

    .line 366
    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 367
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/4 v4, 0x1

    if-eqz v3, :cond_0

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->toInteger(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)I

    move-result v5

    if-ne v5, v4, :cond_0

    move v2, v4

    .line 368
    .local v2, "ret":Z
    :cond_0
    sget-boolean v4, Lcom/motorola/android/internal/telephony/QcomNvManager;->DBG:Z

    if-eqz v4, :cond_1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "get256QAMDLEnabled:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "MotoExtTM: QcomNvManager"

    invoke-static {v5, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 369
    :cond_1
    return v2

    .line 371
    .end local v2    # "ret":Z
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_2
    return v2
.end method

.method public get4x4MimoEnabled(I)Z
    .locals 6
    .param p1, "phoneId"    # I

    .line 345
    const/4 v0, 0x0

    .line 347
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/16 v1, 0x2738

    invoke-direct {p0, p1, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v1

    .line 348
    .local v1, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    const/4 v2, 0x0

    if-eqz v1, :cond_2

    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v3, :cond_2

    .line 349
    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 350
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/4 v4, 0x1

    if-eqz v3, :cond_0

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->toInteger(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)I

    move-result v5

    if-ne v5, v4, :cond_0

    move v2, v4

    .line 351
    .local v2, "ret":Z
    :cond_0
    sget-boolean v4, Lcom/motorola/android/internal/telephony/QcomNvManager;->DBG:Z

    if-eqz v4, :cond_1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "get4x4MimoEnabled:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "MotoExtTM: QcomNvManager"

    invoke-static {v5, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 352
    :cond_1
    return v2

    .line 354
    .end local v2    # "ret":Z
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_2
    return v2
.end method

.method public get64QAMULEnabled(I)Z
    .locals 6
    .param p1, "phoneId"    # I

    .line 379
    const/4 v0, 0x0

    .line 381
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/16 v1, 0x273a

    invoke-direct {p0, p1, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v1

    .line 382
    .local v1, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    const/4 v2, 0x0

    if-eqz v1, :cond_2

    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v3, :cond_2

    .line 383
    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 384
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/4 v4, 0x1

    if-eqz v3, :cond_0

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->toInteger(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)I

    move-result v5

    if-ne v5, v4, :cond_0

    move v2, v4

    .line 385
    .local v2, "ret":Z
    :cond_0
    sget-boolean v4, Lcom/motorola/android/internal/telephony/QcomNvManager;->DBG:Z

    if-eqz v4, :cond_1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "get64QAMULEnabled:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "MotoExtTM: QcomNvManager"

    invoke-static {v5, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 386
    :cond_1
    return v2

    .line 388
    .end local v2    # "ret":Z
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_2
    return v2
.end method

.method public getActiveSingleSimSlot(I)I
    .locals 6
    .param p1, "phoneId"    # I

    .line 1400
    const v0, 0x5004b

    .line 1401
    .local v0, "reqId":I
    const/16 v1, 0x8

    new-array v1, v1, [B

    .line 1402
    .local v1, "reqData":[B
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 1403
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 1404
    .local v2, "reqBuf":Ljava/nio/ByteBuffer;
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 1405
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 1407
    const/4 v4, 0x2

    new-array v4, v4, [B

    .line 1408
    .local v4, "resp":[B
    iget-object v5, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v5, p1, v1, v4}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v5

    .line 1409
    .local v5, "ret":I
    if-ltz v5, :cond_0

    .line 1410
    aget-byte v3, v4, v3

    and-int/lit16 v3, v3, 0xff

    if-nez v3, :cond_0

    .line 1411
    const/4 v3, 0x1

    aget-byte v3, v4, v3

    and-int/lit16 v3, v3, 0xff

    return v3

    .line 1414
    :cond_0
    const/4 v3, -0x1

    return v3
.end method

.method public getBC10Enabled(I)Z
    .locals 7
    .param p1, "phoneId"    # I

    .line 82
    const v0, 0x20000b0

    .line 83
    .local v0, "reqId":I
    const/4 v1, 0x0

    .line 84
    .local v1, "bc10":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandClassDataType;
    const/4 v2, 0x0

    .line 85
    .local v2, "ret":Z
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getReadingNvReqData(I)[B

    move-result-object v3

    .line 86
    .local v3, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateReadingNvRespBuffer()[B

    move-result-object v4

    .line 87
    .local v4, "respData":[B
    iget-object v5, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v5, p1, v3, v4}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v5

    if-ltz v5, :cond_1

    .line 88
    invoke-static {v0, v4}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->decodeReadingNvResult(I[B)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    move-result-object v5

    move-object v1, v5

    check-cast v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandClassDataType;

    .line 89
    if-eqz v1, :cond_1

    .line 90
    iget v5, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandClassDataType;->status:I

    const/4 v6, 0x1

    if-ne v5, v6, :cond_0

    goto :goto_0

    :cond_0
    const/4 v6, 0x0

    :goto_0
    move v2, v6

    .line 93
    :cond_1
    return v2
.end method

.method public getBandClassSupport(I)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;
    .locals 7
    .param p1, "phoneId"    # I

    .line 170
    const v0, 0x5002b

    .line 171
    .local v0, "reqId":I
    const/16 v1, 0x8

    new-array v1, v1, [B

    .line 172
    .local v1, "reqData":[B
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 173
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 174
    .local v2, "reqBuf":Ljava/nio/ByteBuffer;
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 175
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 177
    new-instance v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;

    invoke-direct {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;-><init>()V

    invoke-virtual {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->size()I

    move-result v3

    new-array v3, v3, [B

    .line 178
    .local v3, "resp":[B
    iget-object v4, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v4, p1, v1, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v4

    .line 179
    .local v4, "ret":I
    if-ltz v4, :cond_0

    .line 180
    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v5

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 181
    .local v5, "buf":Ljava/nio/ByteBuffer;
    invoke-static {v5, v4}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->deserialize(Ljava/nio/ByteBuffer;I)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;

    move-result-object v6

    return-object v6

    .line 183
    .end local v5    # "buf":Ljava/nio/ByteBuffer;
    :cond_0
    const/4 v5, 0x0

    return-object v5
.end method

.method public getBandPriorityList(I)[I
    .locals 6
    .param p1, "phoneId"    # I

    .line 818
    const/16 v0, 0x272a

    invoke-direct {p0, p1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v0

    .line 819
    .local v0, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    if-eqz v0, :cond_1

    iget-object v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v1, :cond_1

    .line 820
    iget-object v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    iget-object v1, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    .line 821
    .local v1, "resp":[B
    if-eqz v1, :cond_1

    array-length v2, v1

    if-lez v2, :cond_1

    array-length v2, v1

    rem-int/lit8 v2, v2, 0x2

    if-nez v2, :cond_1

    .line 822
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvInfo;->getRdeByteOrder()Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 823
    .local v2, "buf":Ljava/nio/ByteBuffer;
    array-length v3, v1

    div-int/lit8 v3, v3, 0x2

    new-array v3, v3, [I

    .line 824
    .local v3, "priList":[I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v5, v3

    if-ge v4, v5, :cond_0

    .line 825
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v5

    aput v5, v3, v4

    .line 824
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 827
    .end local v4    # "i":I
    :cond_0
    return-object v3

    .line 830
    .end local v1    # "resp":[B
    .end local v2    # "buf":Ljava/nio/ByteBuffer;
    .end local v3    # "priList":[I
    :cond_1
    const/4 v1, 0x0

    return-object v1
.end method

.method public getCABitmapForBand(II)[B
    .locals 4
    .param p1, "phoneId"    # I
    .param p2, "primaryBandId"    # I

    .line 802
    const/4 v0, 0x0

    .line 804
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    invoke-direct {p0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getNVIndexForCA(I)I

    move-result v1

    invoke-direct {p0, p1, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v1

    .line 805
    .local v1, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    if-eqz v1, :cond_0

    iget-object v2, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v2, :cond_0

    .line 807
    iget-object v2, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 808
    .local v2, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    iget-object v3, v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    return-object v3

    .line 810
    .end local v2    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    const/4 v2, 0x0

    return-object v2
.end method

.method public getCDMADataRate(I)I
    .locals 5
    .param p1, "phoneId"    # I

    .line 897
    const v0, 0x2000005

    .line 898
    .local v0, "reqId":I
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getReadingNvReqData(I)[B

    move-result-object v1

    .line 899
    .local v1, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateReadingNvRespBuffer()[B

    move-result-object v2

    .line 900
    .local v2, "respData":[B
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v3, p1, v1, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v3

    if-ltz v3, :cond_0

    .line 901
    invoke-static {v0, v2}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->decodeReadingNvResult(I[B)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    move-result-object v3

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 903
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_0

    .line 904
    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->toInteger(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)I

    move-result v4

    return v4

    .line 907
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    const/4 v3, -0x1

    return v3
.end method

.method public getCDMAServiceOption(I)I
    .locals 5
    .param p1, "phoneId"    # I

    .line 848
    const v0, 0x200000b

    .line 849
    .local v0, "reqId":I
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getReadingNvReqData(I)[B

    move-result-object v1

    .line 850
    .local v1, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateReadingNvRespBuffer()[B

    move-result-object v2

    .line 851
    .local v2, "respData":[B
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v3, p1, v1, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v3

    if-ltz v3, :cond_0

    .line 852
    invoke-static {v0, v2}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->decodeReadingNvResult(I[B)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    move-result-object v3

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 854
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_0

    .line 855
    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->toInteger(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)I

    move-result v4

    return v4

    .line 858
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    const/4 v3, -0x1

    return v3
.end method

.method public getCaBwCombo(I)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;
    .locals 3
    .param p1, "phoneId"    # I

    .line 601
    const/16 v0, 0x5209

    invoke-direct {p0, p1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v0

    .line 602
    .local v0, "rdeNV":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    const/4 v1, 0x0

    .line 603
    .local v1, "caBwComboList":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;
    if-eqz v0, :cond_0

    iget-object v2, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v2, :cond_0

    .line 604
    iget-object v2, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    move-object v1, v2

    check-cast v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;

    .line 606
    :cond_0
    return-object v1
.end method

.method public getCampCABandCombo(IIII)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CABandCombo;
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "mcc"    # I
    .param p3, "mnc"    # I
    .param p4, "mncLength"    # I

    .line 1438
    sget-boolean v0, Lcom/motorola/android/internal/telephony/QcomNvManager;->DBG:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getCampCABandCombo mcc:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mnc:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mncLength:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MotoExtTM: QcomNvManager"

    invoke-static {v1, v0}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1448
    :cond_0
    const v0, 0x5004f

    .line 1449
    .local v0, "reqId":I
    const/16 v1, 0xd

    new-array v1, v1, [B

    .line 1450
    .local v1, "reqData":[B
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 1451
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 1452
    .local v2, "reqBuf":Ljava/nio/ByteBuffer;
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 1453
    const/4 v3, 0x5

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 1454
    int-to-byte v3, p2

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 1455
    shr-int/lit8 v3, p2, 0x8

    int-to-byte v3, v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 1456
    int-to-byte v3, p3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 1457
    shr-int/lit8 v3, p3, 0x8

    int-to-byte v3, v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 1458
    int-to-byte v3, p4

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 1459
    const/16 v3, 0x905

    new-array v3, v3, [B

    .line 1460
    .local v3, "resp":[B
    iget-object v4, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v4, p1, v1, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v4

    if-ltz v4, :cond_1

    .line 1461
    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomCABandCombo;->deserialize([B)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CABandCombo;

    move-result-object v4

    return-object v4

    .line 1463
    :cond_1
    const/4 v4, 0x0

    return-object v4
.end method

.method public getCampedCsgInfo(I)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CsgInfo;
    .locals 5
    .param p1, "phoneId"    # I

    .line 1028
    const v0, 0x50046

    .line 1029
    .local v0, "reqId":I
    const/16 v1, 0x8

    new-array v1, v1, [B

    .line 1030
    .local v1, "reqData":[B
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 1031
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 1032
    .local v2, "reqBuf":Ljava/nio/ByteBuffer;
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 1033
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 1035
    const/16 v3, 0x64

    new-array v3, v3, [B

    .line 1036
    .local v3, "resp":[B
    iget-object v4, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v4, p1, v1, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v4

    if-ltz v4, :cond_0

    .line 1037
    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomCsgInfo;->deserialize([B)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CsgInfo;

    move-result-object v4

    return-object v4

    .line 1039
    :cond_0
    const/4 v4, 0x0

    return-object v4
.end method

.method public getCdmaCallProcessingData(I)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CallProcessingData;
    .locals 6
    .param p1, "phoneId"    # I

    .line 1058
    const v0, 0x2000011

    .line 1059
    .local v0, "reqId":I
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getReadingNvReqData(I)[B

    move-result-object v1

    .line 1060
    .local v1, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateReadingNvRespBuffer()[B

    move-result-object v2

    .line 1061
    .local v2, "respData":[B
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v3, p1, v1, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v3

    if-ltz v3, :cond_0

    .line 1062
    invoke-static {v0, v2}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->decodeReadingNvResult(I[B)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    move-result-object v3

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 1064
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_0

    .line 1065
    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    invoke-static {v4}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 1066
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 1065
    invoke-static {v4}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCallProcessingData;->deserialize(Ljava/nio/ByteBuffer;)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CallProcessingData;

    move-result-object v4

    return-object v4

    .line 1069
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    const/4 v3, 0x0

    return-object v3
.end method

.method public getCdmaHybridMode(I)I
    .locals 5
    .param p1, "phoneId"    # I

    .line 954
    const v0, 0x200000d

    .line 955
    .local v0, "reqId":I
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getReadingNvReqData(I)[B

    move-result-object v1

    .line 956
    .local v1, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateReadingNvRespBuffer()[B

    move-result-object v2

    .line 957
    .local v2, "respData":[B
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v3, p1, v1, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v3

    if-ltz v3, :cond_0

    .line 958
    invoke-static {v0, v2}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->decodeReadingNvResult(I[B)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    move-result-object v3

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 960
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_0

    .line 961
    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->toInteger(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)I

    move-result v4

    return v4

    .line 964
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    const/4 v3, -0x1

    return v3
.end method

.method public getCdmaRxDiversity(I)I
    .locals 6
    .param p1, "phoneId"    # I

    .line 1073
    const/4 v0, 0x0

    .line 1074
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/4 v1, -0x1

    .line 1076
    .local v1, "result":I
    const/16 v2, 0x26

    invoke-direct {p0, p1, v2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v2

    .line 1077
    .local v2, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    if-eqz v2, :cond_0

    iget-object v3, v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v3, :cond_0

    .line 1078
    iget-object v3, v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 1079
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_0

    .line 1080
    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    const/4 v5, 0x0

    aget-byte v4, v4, v5

    and-int/lit16 v1, v4, 0xff

    .line 1083
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    return v1
.end method

.method public getCdmaSidNidPairs(I)[Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaSidNidPair;
    .locals 6
    .param p1, "phoneId"    # I

    .line 930
    const v0, 0x2000003

    .line 931
    .local v0, "reqId":I
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getReadingNvReqData(I)[B

    move-result-object v1

    .line 932
    .local v1, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateReadingNvRespBuffer()[B

    move-result-object v2

    .line 933
    .local v2, "respData":[B
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v3, p1, v1, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v3

    if-ltz v3, :cond_0

    .line 934
    invoke-static {v0, v2}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->decodeReadingNvResult(I[B)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    move-result-object v3

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 936
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_0

    .line 937
    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    invoke-static {v4}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 938
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 937
    invoke-static {v4}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaSidNidPairDataType;->deserialize(Ljava/nio/ByteBuffer;)[Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaSidNidPair;

    move-result-object v4

    return-object v4

    .line 941
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    const/4 v3, 0x0

    return-object v3
.end method

.method public getDDTMDefaultPreference(I)I
    .locals 5
    .param p1, "phoneId"    # I

    .line 1223
    const v0, 0x20000b7

    .line 1224
    .local v0, "reqId":I
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getReadingNvReqData(I)[B

    move-result-object v1

    .line 1225
    .local v1, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateReadingNvRespBuffer()[B

    move-result-object v2

    .line 1226
    .local v2, "respData":[B
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v3, p1, v1, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v3

    if-ltz v3, :cond_0

    .line 1227
    invoke-static {v0, v2}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->decodeReadingNvResult(I[B)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    move-result-object v3

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 1229
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_0

    .line 1230
    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->toInteger(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)I

    move-result v4

    return v4

    .line 1233
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    const/4 v3, -0x1

    return v3
.end method

.method public getDSSEnabled(I)B
    .locals 5
    .param p1, "phoneId"    # I

    .line 1350
    const/4 v0, 0x0

    .line 1351
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/16 v1, 0x272e

    invoke-direct {p0, p1, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v1

    .line 1352
    .local v1, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    if-eqz v1, :cond_0

    iget-object v2, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v2, :cond_0

    .line 1353
    iget-object v2, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 1354
    .local v2, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v2, :cond_0

    .line 1355
    iget-object v3, v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    const/4 v4, 0x0

    aget-byte v3, v3, v4

    return v3

    .line 1359
    .end local v2    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    const/4 v2, 0x2

    return v2
.end method

.method public getEhrpdEnabled(I)Z
    .locals 6
    .param p1, "phoneId"    # I

    .line 430
    const/4 v0, 0x0

    .line 432
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/16 v1, 0x2b

    invoke-direct {p0, p1, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v1

    .line 433
    .local v1, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    const/4 v2, 0x0

    if-eqz v1, :cond_2

    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v3, :cond_2

    .line 434
    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 435
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_0

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->toBool(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v2, 0x1

    .line 436
    .local v2, "ret":Z
    :cond_0
    sget-boolean v4, Lcom/motorola/android/internal/telephony/QcomNvManager;->DBG:Z

    if-eqz v4, :cond_1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getEhrpdEnabled:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "MotoExtTM: QcomNvManager"

    invoke-static {v5, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 437
    :cond_1
    return v2

    .line 439
    .end local v2    # "ret":Z
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_2
    return v2
.end method

.method public getEmergencyNumber(II)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$EmergencyNumber;
    .locals 2
    .param p1, "phoneId"    # I
    .param p2, "emergencyAddress"    # I

    .line 1137
    const/4 v0, 0x6

    invoke-direct {p0, p1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(III)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v0

    .line 1138
    .local v0, "rdeNV":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    iget-object v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v1, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$EmergencyNumber;

    .line 1139
    .local v1, "emergencyNumber":Lcom/motorola/android/telephony/MotoExtTelephonyInfo$EmergencyNumber;
    return-object v1
.end method

.method public getEvdoData(I)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$EvdoData;
    .locals 6
    .param p1, "phoneId"    # I

    .line 1043
    const v0, 0x2000012

    .line 1044
    .local v0, "reqId":I
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getReadingNvReqData(I)[B

    move-result-object v1

    .line 1045
    .local v1, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateReadingNvRespBuffer()[B

    move-result-object v2

    .line 1046
    .local v2, "respData":[B
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v3, p1, v1, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v3

    if-ltz v3, :cond_0

    .line 1047
    invoke-static {v0, v2}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->decodeReadingNvResult(I[B)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    move-result-object v3

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 1049
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_0

    .line 1050
    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    invoke-static {v4}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 1051
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 1050
    invoke-static {v4}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvEvdoData;->deserialize(Ljava/nio/ByteBuffer;)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$EvdoData;

    move-result-object v4

    return-object v4

    .line 1054
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    const/4 v3, 0x0

    return-object v3
.end method

.method public getEvdoRevisionOption(I)I
    .locals 5
    .param p1, "phoneId"    # I

    .line 872
    const v0, 0x200000f

    .line 873
    .local v0, "reqId":I
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getReadingNvReqData(I)[B

    move-result-object v1

    .line 874
    .local v1, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateReadingNvRespBuffer()[B

    move-result-object v2

    .line 875
    .local v2, "respData":[B
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v3, p1, v1, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v3

    if-ltz v3, :cond_0

    .line 876
    invoke-static {v0, v2}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->decodeReadingNvResult(I[B)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    move-result-object v3

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 878
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_0

    .line 879
    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->toInteger(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)I

    move-result v4

    return v4

    .line 882
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    const/4 v3, -0x1

    return v3
.end method

.method public getFDDTM9Enabled(I)Z
    .locals 6
    .param p1, "phoneId"    # I

    .line 396
    const/4 v0, 0x0

    .line 398
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/16 v1, 0x273b

    invoke-direct {p0, p1, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v1

    .line 399
    .local v1, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    const/4 v2, 0x0

    if-eqz v1, :cond_2

    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v3, :cond_2

    .line 400
    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 401
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/4 v4, 0x1

    if-eqz v3, :cond_0

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->toInteger(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)I

    move-result v5

    if-ne v5, v4, :cond_0

    move v2, v4

    .line 402
    .local v2, "ret":Z
    :cond_0
    sget-boolean v4, Lcom/motorola/android/internal/telephony/QcomNvManager;->DBG:Z

    if-eqz v4, :cond_1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getFDDTM9Enabled:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "MotoExtTM: QcomNvManager"

    invoke-static {v5, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 403
    :cond_1
    return v2

    .line 405
    .end local v2    # "ret":Z
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_2
    return v2
.end method

.method public getForNIDReg(I)Z
    .locals 6
    .param p1, "phoneId"    # I

    .line 1273
    const/4 v0, 0x0

    .line 1274
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/16 v1, 0x34

    invoke-direct {p0, p1, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v1

    .line 1275
    .local v1, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    const/4 v2, 0x0

    .line 1276
    .local v2, "ret":Z
    if-eqz v1, :cond_1

    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v3, :cond_1

    .line 1277
    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 1278
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_1

    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    if-eqz v4, :cond_1

    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    array-length v4, v4

    const/4 v5, 0x3

    if-lt v4, v5, :cond_1

    .line 1279
    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    const/4 v5, 0x2

    aget-byte v4, v4, v5

    if-nez v4, :cond_0

    const/4 v4, 0x0

    goto :goto_0

    :cond_0
    const/4 v4, 0x1

    :goto_0
    move v2, v4

    .line 1282
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_1
    return v2
.end method

.method public getForSIDReg(I)Z
    .locals 6
    .param p1, "phoneId"    # I

    .line 1260
    const/4 v0, 0x0

    .line 1261
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/16 v1, 0x33

    invoke-direct {p0, p1, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v1

    .line 1262
    .local v1, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    const/4 v2, 0x0

    .line 1263
    .local v2, "ret":Z
    if-eqz v1, :cond_1

    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v3, :cond_1

    .line 1264
    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 1265
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_1

    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    if-eqz v4, :cond_1

    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    array-length v4, v4

    const/4 v5, 0x3

    if-lt v4, v5, :cond_1

    .line 1266
    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    const/4 v5, 0x2

    aget-byte v4, v4, v5

    if-nez v4, :cond_0

    const/4 v4, 0x0

    goto :goto_0

    :cond_0
    const/4 v4, 0x1

    :goto_0
    move v2, v4

    .line 1269
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_1
    return v2
.end method

.method public getHdrRxDiversity(I)I
    .locals 6
    .param p1, "phoneId"    # I

    .line 1091
    const/4 v0, 0x0

    .line 1092
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/4 v1, -0x1

    .line 1094
    .local v1, "result":I
    const/16 v2, 0x27

    invoke-direct {p0, p1, v2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v2

    .line 1095
    .local v2, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    if-eqz v2, :cond_0

    iget-object v3, v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v3, :cond_0

    .line 1096
    iget-object v3, v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 1097
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_0

    .line 1098
    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    const/4 v5, 0x0

    aget-byte v4, v4, v5

    and-int/lit16 v1, v4, 0xff

    .line 1101
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    return v1
.end method

.method public getHomeSIDReg(I)Z
    .locals 6
    .param p1, "phoneId"    # I

    .line 1247
    const/4 v0, 0x0

    .line 1248
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/16 v1, 0x32

    invoke-direct {p0, p1, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v1

    .line 1249
    .local v1, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    const/4 v2, 0x0

    .line 1250
    .local v2, "ret":Z
    if-eqz v1, :cond_1

    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v3, :cond_1

    .line 1251
    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 1252
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_1

    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    if-eqz v4, :cond_1

    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    array-length v4, v4

    const/4 v5, 0x3

    if-lt v4, v5, :cond_1

    .line 1253
    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    const/4 v5, 0x2

    aget-byte v4, v4, v5

    if-nez v4, :cond_0

    const/4 v4, 0x0

    goto :goto_0

    :cond_0
    const/4 v4, 0x1

    :goto_0
    move v2, v4

    .line 1256
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_1
    return v2
.end method

.method public getLTEBandEnable(II)Z
    .locals 3
    .param p1, "phoneId"    # I
    .param p2, "bandId"    # I

    .line 208
    const/4 v0, 0x0

    if-gez p2, :cond_0

    return v0

    .line 210
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getBandClassSupport(I)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;

    move-result-object v1

    .line 211
    .local v1, "bc":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;
    if-eqz v1, :cond_1

    invoke-virtual {v1, p2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->isLTEBandEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 212
    const/4 v0, 0x1

    return v0

    .line 214
    :cond_1
    return v0
.end method

.method public getLTERRCState(I)I
    .locals 5
    .param p1, "phoneId"    # I

    .line 586
    const v0, 0x50045

    .line 587
    .local v0, "reqId":I
    const/16 v1, 0x8

    new-array v1, v1, [B

    .line 588
    .local v1, "reqData":[B
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 589
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 590
    .local v2, "reqBuf":Ljava/nio/ByteBuffer;
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 591
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 593
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTERRCStateDataType;->size()I

    move-result v3

    new-array v3, v3, [B

    .line 594
    .local v3, "resp":[B
    iget-object v4, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v4, p1, v1, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v4

    if-ltz v4, :cond_0

    .line 595
    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTERRCStateDataType;->deserialize([B)I

    move-result v4

    return v4

    .line 597
    :cond_0
    const/16 v4, 0xff

    return v4
.end method

.method public getLteAvailableFileRecords(I)Ljava/util/List;
    .locals 7
    .param p1, "phoneId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteAvailableFileRecord;",
            ">;"
        }
    .end annotation

    .line 766
    const/4 v0, 0x0

    .line 767
    .local v0, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/4 v1, 0x0

    .line 768
    .local v1, "fileRecords":Ljava/util/List;, "Ljava/util/List<Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteAvailableFileRecord;>;"
    const/16 v2, 0x2727

    invoke-direct {p0, p1, v2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v2

    .line 770
    .local v2, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    if-eqz v2, :cond_0

    .line 771
    iget-object v3, v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    move-object v0, v3

    check-cast v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 774
    :cond_0
    if-eqz v0, :cond_1

    iget-object v3, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    if-eqz v3, :cond_1

    .line 775
    iget-object v3, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvInfo;->getRdeByteOrder()Ljava/nio/ByteOrder;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 776
    .local v3, "bf":Ljava/nio/ByteBuffer;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    move-object v1, v4

    .line 777
    iget-object v4, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    array-length v4, v4

    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLteAvailableFileRecord;->size()I

    move-result v5

    div-int/2addr v4, v5

    .line 778
    .local v4, "numRec":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-ge v5, v4, :cond_1

    .line 779
    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLteAvailableFileRecord;->deserialize(Ljava/nio/ByteBuffer;)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLteAvailableFileRecord;

    move-result-object v6

    .line 780
    .local v6, "rec":Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteAvailableFileRecord;
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 778
    .end local v6    # "rec":Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteAvailableFileRecord;
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 784
    .end local v3    # "bf":Ljava/nio/ByteBuffer;
    .end local v4    # "numRec":I
    .end local v5    # "i":I
    :cond_1
    return-object v1
.end method

.method public getLteBsrTimer(I)I
    .locals 6
    .param p1, "phoneId"    # I

    .line 730
    const v0, 0x20000bc

    .line 731
    .local v0, "reqId":I
    const/4 v1, -0x1

    .line 732
    .local v1, "bsrTimer":I
    const/4 v2, 0x0

    .line 734
    .local v2, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getReadingNvReqData(I)[B

    move-result-object v3

    .line 735
    .local v3, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateReadingNvRespBuffer()[B

    move-result-object v4

    .line 736
    .local v4, "respData":[B
    iget-object v5, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v5, p1, v3, v4}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v5

    if-ltz v5, :cond_0

    .line 737
    invoke-static {v0, v4}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->decodeReadingNvResult(I[B)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    move-result-object v5

    move-object v2, v5

    check-cast v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 738
    if-eqz v2, :cond_0

    .line 739
    invoke-static {v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->toInteger(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)I

    move-result v1

    .line 742
    :cond_0
    return v1
.end method

.method public getLteData(I)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteData;
    .locals 7
    .param p1, "phoneId"    # I

    .line 625
    const v0, 0x20000c0

    .line 626
    .local v0, "reqId":I
    const/4 v1, 0x0

    .line 627
    .local v1, "lteData":Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteData;
    const/4 v2, 0x0

    .line 628
    .local v2, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getReadingNvReqData(I)[B

    move-result-object v3

    .line 629
    .local v3, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateReadingNvRespBuffer()[B

    move-result-object v4

    .line 630
    .local v4, "respData":[B
    iget-object v5, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v5, p1, v3, v4}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v5

    if-ltz v5, :cond_0

    .line 631
    invoke-static {v0, v4}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->decodeReadingNvResult(I[B)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    move-result-object v5

    move-object v2, v5

    check-cast v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 632
    if-eqz v2, :cond_0

    .line 633
    iget-object v5, v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    invoke-static {v5}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 634
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 633
    invoke-static {v5}, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;->deserialize(Ljava/nio/ByteBuffer;)Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomLteData;

    move-result-object v1

    .line 637
    :cond_0
    return-object v1
.end method

.method public getMaxBsrTimer(I)I
    .locals 4
    .param p1, "phoneId"    # I

    .line 679
    const/4 v0, 0x0

    .line 680
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/4 v1, -0x1

    .line 682
    .local v1, "result":I
    const/16 v2, 0x2725

    invoke-direct {p0, p1, v2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v2

    .line 683
    .local v2, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    if-eqz v2, :cond_0

    iget-object v3, v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v3, :cond_0

    .line 684
    iget-object v3, v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 685
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_0

    .line 686
    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->toInteger(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)I

    move-result v1

    .line 689
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    return v1
.end method

.method public getMaxBsrTimerStages(I)I
    .locals 4
    .param p1, "phoneId"    # I

    .line 699
    const/4 v0, 0x0

    .line 700
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/4 v1, -0x1

    .line 702
    .local v1, "result":I
    const/16 v2, 0x2726

    invoke-direct {p0, p1, v2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v2

    .line 703
    .local v2, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    if-eqz v2, :cond_0

    iget-object v3, v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v3, :cond_0

    .line 704
    iget-object v3, v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 705
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_0

    .line 706
    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->toInteger(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)I

    move-result v1

    .line 709
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    return v1
.end method

.method public getMipErrorCode(I)I
    .locals 7
    .param p1, "phoneId"    # I

    .line 1183
    const/4 v0, 0x0

    .line 1184
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/16 v1, 0x2723

    invoke-direct {p0, p1, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v1

    .line 1185
    .local v1, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    const/4 v2, 0x0

    .line 1186
    .local v2, "ret":I
    if-eqz v1, :cond_0

    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v3, :cond_0

    .line 1187
    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 1188
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_0

    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    if-eqz v4, :cond_0

    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    array-length v4, v4

    const/4 v5, 0x2

    if-lt v4, v5, :cond_0

    .line 1189
    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    const/4 v5, 0x0

    aget-byte v4, v4, v5

    and-int/lit16 v4, v4, 0xff

    iget-object v5, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    const/4 v6, 0x1

    aget-byte v5, v5, v6

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x8

    add-int v2, v4, v5

    .line 1192
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    return v2
.end method

.method public getMobilePRev(I)I
    .locals 5
    .param p1, "phoneId"    # I

    .line 1109
    const v0, 0x2000007

    .line 1110
    .local v0, "reqId":I
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getReadingNvReqData(I)[B

    move-result-object v1

    .line 1111
    .local v1, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateReadingNvRespBuffer()[B

    move-result-object v2

    .line 1112
    .local v2, "respData":[B
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v3, p1, v1, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v3

    if-ltz v3, :cond_0

    .line 1113
    invoke-static {v0, v2}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->decodeReadingNvResult(I[B)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    move-result-object v3

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 1115
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_0

    .line 1116
    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->toInteger(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)I

    move-result v4

    return v4

    .line 1119
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    const v3, 0xffff

    return v3
.end method

.method public getNamInfo(I)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;
    .locals 6
    .param p1, "phoneId"    # I

    .line 1159
    const v0, 0x2000001

    .line 1160
    .local v0, "reqId":I
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getReadingNvReqData(I)[B

    move-result-object v1

    .line 1161
    .local v1, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateReadingNvRespBuffer()[B

    move-result-object v2

    .line 1162
    .local v2, "respData":[B
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v3, p1, v1, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v3

    if-ltz v3, :cond_0

    .line 1163
    invoke-static {v0, v2}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->decodeReadingNvResult(I[B)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    move-result-object v3

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 1165
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_0

    .line 1166
    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    invoke-static {v4}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 1167
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 1166
    invoke-static {v4}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;->deserialize(Ljava/nio/ByteBuffer;)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;

    move-result-object v4

    return-object v4

    .line 1170
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    const/4 v3, 0x0

    return-object v3
.end method

.method public getNextLteScan(I)I
    .locals 4
    .param p1, "phoneId"    # I

    .line 648
    const/4 v0, 0x0

    .line 649
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/4 v1, -0x1

    .line 651
    .local v1, "result":I
    const/16 v2, 0x2724

    invoke-direct {p0, p1, v2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v2

    .line 652
    .local v2, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    if-eqz v2, :cond_0

    iget-object v3, v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v3, :cond_0

    .line 653
    iget-object v3, v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 654
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_0

    .line 655
    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->toInteger(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)I

    move-result v1

    .line 658
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    return v1
.end method

.method public getProvisionUpdateRequest(I)Z
    .locals 10
    .param p1, "phoneId"    # I

    .line 488
    const v0, 0x50007

    .line 489
    .local v0, "reqId":I
    const/4 v1, 0x0

    .line 490
    .local v1, "ret":Z
    const/16 v2, 0x8

    new-array v2, v2, [B

    .line 491
    .local v2, "reqData":[B
    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 492
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 493
    .local v3, "reqBuf":Ljava/nio/ByteBuffer;
    invoke-virtual {v3, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 494
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 496
    new-instance v5, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvProvisionUpdateDataType;

    invoke-direct {v5}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvProvisionUpdateDataType;-><init>()V

    invoke-virtual {v5}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvProvisionUpdateDataType;->size()I

    move-result v5

    new-array v5, v5, [B

    .line 497
    .local v5, "resp":[B
    iget-object v6, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v6, p1, v2, v5}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v6

    if-ltz v6, :cond_1

    .line 498
    invoke-static {v5}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v6

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 499
    .local v6, "respBuf":Ljava/nio/ByteBuffer;
    invoke-static {v6}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvProvisionUpdateDataType;->deserialize(Ljava/nio/ByteBuffer;)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvProvisionUpdateDataType;

    move-result-object v7

    .line 500
    .local v7, "config":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvProvisionUpdateDataType;
    iget-byte v8, v7, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvProvisionUpdateDataType;->status:B

    const/4 v9, 0x1

    if-ne v8, v9, :cond_0

    move v4, v9

    :cond_0
    move v1, v4

    .line 503
    .end local v6    # "respBuf":Ljava/nio/ByteBuffer;
    .end local v7    # "config":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvProvisionUpdateDataType;
    :cond_1
    return v1
.end method

.method public getResponseWithSimpleHeader(IILjava/nio/ByteBuffer;I)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    .locals 6
    .param p1, "phoneId"    # I
    .param p2, "reqId"    # I
    .param p3, "payLoad"    # Ljava/nio/ByteBuffer;
    .param p4, "respSize"    # I

    .line 447
    const/4 v0, 0x0

    .line 448
    .local v0, "dataLength":I
    if-eqz p3, :cond_0

    .line 449
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 450
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    .line 453
    :cond_0
    add-int/lit8 v1, v0, 0x8

    new-array v1, v1, [B

    .line 454
    .local v1, "reqData":[B
    invoke-static {p2}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v2

    .line 455
    .local v2, "byteOrder":Ljava/nio/ByteOrder;
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 456
    .local v3, "reqBuf":Ljava/nio/ByteBuffer;
    invoke-virtual {v3, p2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 457
    invoke-virtual {v3, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 459
    if-lez v0, :cond_1

    .line 460
    invoke-virtual {v3, p3}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 463
    :cond_1
    new-array v4, p4, [B

    .line 465
    .local v4, "respData":[B
    iget-object v5, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v5, p1, v1, v4}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v5

    if-ltz v5, :cond_2

    .line 466
    new-instance v5, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    invoke-direct {v5, v4}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;-><init>([B)V

    return-object v5

    .line 468
    :cond_2
    const/4 v5, 0x0

    return-object v5
.end method

.method public getSO68Enabled(I)Z
    .locals 4
    .param p1, "phoneId"    # I

    .line 122
    const/4 v0, 0x0

    .line 123
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/16 v1, 0x30

    invoke-direct {p0, p1, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v1

    .line 124
    .local v1, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    if-eqz v1, :cond_0

    iget-object v2, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v2, :cond_0

    .line 125
    iget-object v2, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 126
    .local v2, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v2, :cond_0

    .line 127
    invoke-static {v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->toBool(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)Z

    move-result v3

    return v3

    .line 130
    .end local v2    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    const/4 v2, 0x0

    return v2
.end method

.method public getSO73COP0Enabled(I)Z
    .locals 4
    .param p1, "phoneId"    # I

    .line 138
    const/4 v0, 0x0

    .line 139
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/16 v1, 0x2720

    invoke-direct {p0, p1, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v1

    .line 140
    .local v1, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    if-eqz v1, :cond_0

    iget-object v2, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v2, :cond_0

    .line 141
    iget-object v2, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 142
    .local v2, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v2, :cond_0

    .line 143
    invoke-static {v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->toBool(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)Z

    move-result v3

    return v3

    .line 146
    .end local v2    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    const/4 v2, 0x0

    return v2
.end method

.method public getSO73COP1To7Enabled(I)Z
    .locals 4
    .param p1, "phoneId"    # I

    .line 154
    const/4 v0, 0x0

    .line 155
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/16 v1, 0x2d

    invoke-direct {p0, p1, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v1

    .line 156
    .local v1, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    if-eqz v1, :cond_0

    iget-object v2, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v2, :cond_0

    .line 157
    iget-object v2, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 158
    .local v2, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v2, :cond_0

    .line 159
    invoke-static {v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->toBool(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)Z

    move-result v3

    return v3

    .line 162
    .end local v2    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    const/4 v2, 0x0

    return v2
.end method

.method public getSecuritySimLockData(I)[B
    .locals 6
    .param p1, "phoneId"    # I

    .line 1382
    const v0, 0x50047

    .line 1383
    .local v0, "reqId":I
    const/16 v1, 0x8

    new-array v1, v1, [B

    .line 1384
    .local v1, "reqData":[B
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 1385
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 1386
    .local v2, "reqBuf":Ljava/nio/ByteBuffer;
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 1387
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 1389
    const/16 v3, 0x200

    new-array v3, v3, [B

    .line 1390
    .local v3, "resp":[B
    iget-object v4, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v4, p1, v1, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v4

    .line 1391
    .local v4, "respLen":I
    if-lez v4, :cond_0

    .line 1392
    invoke-static {v3, v4}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v5

    .line 1393
    .local v5, "result":[B
    return-object v5

    .line 1395
    .end local v5    # "result":[B
    :cond_0
    const/4 v5, 0x0

    return-object v5
.end method

.method public getSimLock(I)I
    .locals 6
    .param p1, "phoneId"    # I

    .line 314
    const/4 v0, 0x0

    .line 316
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/16 v1, 0x1f5b

    invoke-direct {p0, p1, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v1

    .line 317
    .local v1, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    if-eqz v1, :cond_1

    iget-object v2, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v2, :cond_1

    .line 318
    iget-object v2, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 319
    .local v2, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    iget-object v3, v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    const/4 v4, 0x0

    aget-byte v3, v3, v4

    .line 320
    .local v3, "lock":I
    sget-boolean v4, Lcom/motorola/android/internal/telephony/QcomNvManager;->DBG:Z

    if-eqz v4, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SimLock value is:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "MotoExtTM: QcomNvManager"

    invoke-static {v5, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 321
    :cond_0
    if-ltz v3, :cond_1

    const/4 v4, 0x2

    if-gt v3, v4, :cond_1

    .line 322
    return v3

    .line 325
    .end local v2    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    .end local v3    # "lock":I
    :cond_1
    const/4 v2, -0x1

    return v2
.end method

.method public getSimNonce(I)[B
    .locals 4
    .param p1, "phoneId"    # I

    .line 334
    const/4 v0, 0x0

    .line 336
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/16 v1, 0x1f60

    invoke-direct {p0, p1, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v1

    .line 337
    .local v1, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    if-eqz v1, :cond_0

    iget-object v2, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v2, :cond_0

    .line 338
    iget-object v2, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 339
    .local v2, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    iget-object v3, v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    return-object v3

    .line 341
    .end local v2    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    const/4 v2, 0x0

    return-object v2
.end method

.method public getSlotCycleIndex(I)I
    .locals 6
    .param p1, "phoneId"    # I

    .line 1210
    const/4 v0, 0x0

    .line 1211
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/16 v1, 0x2f

    invoke-direct {p0, p1, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v1

    .line 1212
    .local v1, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    const/4 v2, 0x0

    .line 1213
    .local v2, "ret":I
    if-eqz v1, :cond_0

    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v3, :cond_0

    .line 1214
    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 1215
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_0

    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    if-eqz v4, :cond_0

    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    array-length v4, v4

    const/4 v5, 0x1

    if-lt v4, v5, :cond_0

    .line 1216
    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    const/4 v5, 0x0

    aget-byte v4, v4, v5

    and-int/lit16 v2, v4, 0xff

    .line 1219
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_0
    return v2
.end method

.method public getSlotCycleMode(I)Z
    .locals 7
    .param p1, "phoneId"    # I

    .line 1196
    const/4 v0, 0x0

    .line 1197
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/16 v1, 0x24

    invoke-direct {p0, p1, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v1

    .line 1198
    .local v1, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    const/4 v2, 0x0

    .line 1199
    .local v2, "ret":Z
    if-eqz v1, :cond_1

    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v3, :cond_1

    .line 1200
    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 1201
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_1

    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    if-eqz v4, :cond_1

    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    array-length v4, v4

    const/4 v5, 0x1

    if-lt v4, v5, :cond_1

    .line 1202
    iget-object v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    const/4 v6, 0x0

    aget-byte v4, v4, v6

    and-int/lit8 v4, v4, 0x20

    shr-int/lit8 v4, v4, 0x5

    .line 1203
    .local v4, "value":I
    if-ne v4, v5, :cond_0

    goto :goto_0

    :cond_0
    move v5, v6

    :goto_0
    move v2, v5

    .line 1206
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    .end local v4    # "value":I
    :cond_1
    return v2
.end method

.method public getSprintVoiceServiceOption(I)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;
    .locals 4
    .param p1, "phoneId"    # I

    .line 1319
    const/4 v0, 0x0

    .line 1320
    .local v0, "so":Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;
    const/16 v1, 0x1e

    invoke-direct {p0, p1, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v1

    .line 1322
    .local v1, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    if-eqz v1, :cond_0

    iget-object v2, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v2, :cond_0

    .line 1323
    iget-object v2, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;

    .line 1324
    .local v2, "nvSo":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;
    new-instance v3, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;

    invoke-direct {v3}, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;-><init>()V

    move-object v0, v3

    .line 1325
    iget-short v3, v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->homePageVoiceSo:S

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->toOemSo(S)I

    move-result v3

    iput v3, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;->homePageVoice:I

    .line 1326
    iget-short v3, v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->homeOrigVoiceSo:S

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->toOemSo(S)I

    move-result v3

    iput v3, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;->homeOrigVoice:I

    .line 1327
    iget-short v3, v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->roamOrigVoiceSo:S

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->toOemSo(S)I

    move-result v3

    iput v3, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;->roamOrigVoice:I

    .line 1329
    .end local v2    # "nvSo":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;
    :cond_0
    return-object v0
.end method

.method public getSubsidyLockDetail(I)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SubsidyLockDetail;
    .locals 4
    .param p1, "phoneId"    # I

    .line 472
    const/4 v0, 0x0

    .line 473
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/4 v1, 0x0

    .line 474
    .local v1, "slDetail":Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SubsidyLockDetail;
    const/16 v2, 0x20d8

    invoke-direct {p0, p1, v2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v2

    .line 476
    .local v2, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    if-eqz v2, :cond_0

    .line 477
    iget-object v3, v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    move-object v0, v3

    check-cast v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 480
    :cond_0
    if-eqz v0, :cond_1

    .line 481
    iget-object v3, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomSubsidyLockDetail;->deserialize([B)Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomSubsidyLockDetail;

    move-result-object v1

    .line 484
    :cond_1
    return-object v1
.end method

.method public getTDDTM9Enabled(I)Z
    .locals 6
    .param p1, "phoneId"    # I

    .line 413
    const/4 v0, 0x0

    .line 415
    .local v0, "data":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/16 v1, 0x273c

    invoke-direct {p0, p1, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v1

    .line 416
    .local v1, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    const/4 v2, 0x0

    if-eqz v1, :cond_2

    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v3, :cond_2

    .line 417
    iget-object v3, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 418
    .local v3, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    const/4 v4, 0x1

    if-eqz v3, :cond_0

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->toInteger(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)I

    move-result v5

    if-ne v5, v4, :cond_0

    move v2, v4

    .line 419
    .local v2, "ret":Z
    :cond_0
    sget-boolean v4, Lcom/motorola/android/internal/telephony/QcomNvManager;->DBG:Z

    if-eqz v4, :cond_1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getTDDTM9Enabled:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "MotoExtTM: QcomNvManager"

    invoke-static {v5, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 420
    :cond_1
    return v2

    .line 422
    .end local v2    # "ret":Z
    .end local v3    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_2
    return v2
.end method

.method public getVoiceDomainSetting(I)I
    .locals 6
    .param p1, "phoneId"    # I

    .line 1287
    const v0, 0x50040

    .line 1288
    .local v0, "reqId":I
    const/16 v1, 0x8

    new-array v1, v1, [B

    .line 1289
    .local v1, "reqData":[B
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 1290
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 1291
    .local v2, "reqBuf":Ljava/nio/ByteBuffer;
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 1292
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 1294
    iget v4, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->VOICE_DOMAIN_SETTING_LENGTH_BYTE:I

    new-array v4, v4, [B

    .line 1295
    .local v4, "resp":[B
    iget-object v5, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v5, p1, v1, v4}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v5

    .line 1296
    .local v5, "ret":I
    if-ltz v5, :cond_0

    .line 1297
    aget-byte v3, v4, v3

    and-int/lit16 v3, v3, 0xff

    return v3

    .line 1299
    :cond_0
    const/4 v3, -0x1

    return v3
.end method

.method public radioConfigReset(II)Z
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "resetType"    # I

    .line 532
    const v0, 0x20000b6

    .line 533
    .local v0, "reqId":I
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvFactoryResetDataType;

    invoke-direct {p0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getFactoryResetType(I)B

    move-result v2

    invoke-direct {v1, v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvFactoryResetDataType;-><init>(B)V

    .line 534
    .local v1, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvFactoryResetDataType;
    invoke-static {v0, v1}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getWritingNvReqData(ILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;)[B

    move-result-object v2

    .line 535
    .local v2, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateWritingNvRespBuffer()[B

    move-result-object v3

    .line 536
    .local v3, "respData":[B
    invoke-direct {p0, p1, v0, v2, v3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getWritingNvRespResult(II[B[B)Z

    move-result v4

    return v4
.end method

.method public set1xAdvancedEnabled(IZ)Z
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "enabled"    # Z

    .line 118
    const/16 v0, 0x271f

    invoke-direct {p0, p1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(IIZ)Z

    move-result v0

    return v0
.end method

.method public set256QAMDLEnabled(IZ)Z
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "enabled"    # Z

    .line 375
    const/16 v0, 0x2739

    invoke-direct {p0, p1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(III)Z

    move-result v0

    return v0
.end method

.method public set4x4MimoEnabled(IZ)Z
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "enabled"    # Z

    .line 358
    const/16 v0, 0x2738

    invoke-direct {p0, p1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(III)Z

    move-result v0

    return v0
.end method

.method public set64QAMULEnabled(IZ)Z
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "enabled"    # Z

    .line 392
    const/16 v0, 0x273a

    invoke-direct {p0, p1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(III)Z

    move-result v0

    return v0
.end method

.method public setActiveSingleSimSlot(II)Z
    .locals 8
    .param p1, "phoneId"    # I
    .param p2, "slotType"    # I

    .line 1419
    const v0, 0x5004a

    .line 1420
    .local v0, "reqId":I
    const/16 v1, 0x9

    new-array v1, v1, [B

    .line 1423
    .local v1, "data":[B
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 1424
    .local v2, "buf":Ljava/nio/ByteBuffer;
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 1425
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    int-to-byte v5, p2

    invoke-virtual {v3, v5}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 1427
    new-array v3, v4, [B

    const/4 v5, 0x0

    aput-byte v4, v3, v5

    .line 1428
    .local v3, "resp":[B
    iget-object v6, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v6, p1, v1, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v6

    .line 1429
    .local v6, "ret":I
    if-ltz v6, :cond_0

    aget-byte v7, v3, v5

    and-int/lit16 v7, v7, 0xff

    if-nez v7, :cond_0

    .line 1430
    return v4

    .line 1432
    :cond_0
    return v5
.end method

.method public setAkeyInfo(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 6
    .param p1, "phoneId"    # I
    .param p2, "akey"    # Ljava/lang/String;
    .param p3, "spcLockCode"    # Ljava/lang/String;

    .line 921
    const v0, 0x2000013

    .line 922
    .local v0, "reqId":I
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvAKeyDataType;

    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvAKeyDataType;-><init>([B)V

    .line 923
    .local v1, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvAKeyDataType;
    invoke-static {v0, v1, p3}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getWritingNvReqData(ILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;Ljava/lang/String;)[B

    move-result-object v2

    .line 924
    .local v2, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateWritingNvRespBuffer()[B

    move-result-object v3

    .line 925
    .local v3, "respData":[B
    sget-boolean v4, Lcom/motorola/android/internal/telephony/QcomNvManager;->DBG:Z

    if-eqz v4, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SetAkeyInfo:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v2}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->byteArrToStringLog([B)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "MotoExtTM: QcomNvManager"

    invoke-static {v5, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 926
    :cond_0
    invoke-direct {p0, p1, v0, v2, v3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getWritingNvRespResult(II[B[B)Z

    move-result v4

    return v4
.end method

.method public setBC10Enabled(IZ)Z
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "enabled"    # Z

    .line 97
    const v0, 0x20000b1

    .line 98
    .local v0, "reqId":I
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandClassDataType;

    invoke-direct {v1, p2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandClassDataType;-><init>(I)V

    .line 99
    .local v1, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;
    invoke-static {v0, v1}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getWritingNvReqData(ILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;)[B

    move-result-object v2

    .line 100
    .local v2, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateWritingNvRespBuffer()[B

    move-result-object v3

    .line 102
    .local v3, "respData":[B
    invoke-direct {p0, p1, v0, v2, v3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getWritingNvRespResult(II[B[B)Z

    move-result v4

    return v4
.end method

.method public setBandPriorityList(I[I)Z
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "priList"    # [I

    .line 834
    const/4 v0, 0x0

    if-eqz p2, :cond_2

    array-length v1, p2

    if-nez v1, :cond_0

    goto :goto_1

    .line 836
    :cond_0
    array-length v1, p2

    mul-int/lit8 v1, v1, 0x2

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 837
    .local v1, "buf":Ljava/nio/ByteBuffer;
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvInfo;->getRdeByteOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 838
    array-length v2, p2

    :goto_0
    if-ge v0, v2, :cond_1

    aget v3, p2, v0

    .line 839
    .local v3, "pri":I
    int-to-short v4, v3

    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 838
    .end local v3    # "pri":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 842
    :cond_1
    new-instance v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    invoke-direct {v0}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;-><init>()V

    .line 843
    .local v0, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    iput-object v2, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    .line 844
    const/16 v2, 0x272a

    invoke-direct {p0, p1, v2, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(IILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;)Z

    move-result v2

    return v2

    .line 834
    .end local v0    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    .end local v1    # "buf":Ljava/nio/ByteBuffer;
    :cond_2
    :goto_1
    return v0
.end method

.method public setCABitmapForBand(II[B)Z
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "primaryBandId"    # I
    .param p3, "enabledSecBands"    # [B

    .line 814
    invoke-direct {p0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getNVIndexForCA(I)I

    move-result v0

    invoke-direct {p0, p1, v0, p3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(II[B)Z

    move-result v0

    return v0
.end method

.method public setCDMADataRate(IILjava/lang/String;)Z
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "rate"    # I
    .param p3, "spcLockCode"    # Ljava/lang/String;

    .line 911
    const v0, 0x2000006

    .line 912
    .local v0, "reqId":I
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 913
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-direct {v1, p2, v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;-><init>(ILjava/nio/ByteOrder;)V

    .line 914
    .local v1, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;
    invoke-static {v0, v1, p3}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getWritingNvReqData(ILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;Ljava/lang/String;)[B

    move-result-object v2

    .line 915
    .local v2, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateWritingNvRespBuffer()[B

    move-result-object v3

    .line 917
    .local v3, "respData":[B
    invoke-direct {p0, p1, v0, v2, v3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getWritingNvRespResult(II[B[B)Z

    move-result v4

    return v4
.end method

.method public setCDMAServiceOption(IILjava/lang/String;)Z
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "serviceOption"    # I
    .param p3, "spcLockCode"    # Ljava/lang/String;

    .line 862
    const v0, 0x200000c

    .line 863
    .local v0, "reqId":I
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 864
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-direct {v1, p2, v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;-><init>(ILjava/nio/ByteOrder;)V

    .line 865
    .local v1, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;
    invoke-static {v0, v1, p3}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getWritingNvReqData(ILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;Ljava/lang/String;)[B

    move-result-object v2

    .line 866
    .local v2, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateWritingNvRespBuffer()[B

    move-result-object v3

    .line 868
    .local v3, "respData":[B
    invoke-direct {p0, p1, v0, v2, v3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getWritingNvRespResult(II[B[B)Z

    move-result v4

    return v4
.end method

.method public setCdmaHybridMode(IILjava/lang/String;)Z
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "mode"    # I
    .param p3, "spcLockCode"    # Ljava/lang/String;

    .line 968
    const v0, 0x200000e

    .line 969
    .local v0, "reqId":I
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 970
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-direct {v1, p2, v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;-><init>(ILjava/nio/ByteOrder;)V

    .line 971
    .local v1, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;
    invoke-static {v0, v1, p3}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getWritingNvReqData(ILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;Ljava/lang/String;)[B

    move-result-object v2

    .line 972
    .local v2, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateWritingNvRespBuffer()[B

    move-result-object v3

    .line 974
    .local v3, "respData":[B
    invoke-direct {p0, p1, v0, v2, v3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getWritingNvRespResult(II[B[B)Z

    move-result v4

    return v4
.end method

.method public setCdmaRxDiversity(II)Z
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "value"    # I

    .line 1087
    const/16 v0, 0x26

    invoke-direct {p0, p1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(III)Z

    move-result v0

    return v0
.end method

.method public setCdmaSidNidPairs(I[Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaSidNidPair;Ljava/lang/String;)Z
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "pairs"    # [Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaSidNidPair;
    .param p3, "spcLockCode"    # Ljava/lang/String;

    .line 945
    const v0, 0x2000004

    .line 946
    .local v0, "reqId":I
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaSidNidPairDataType;

    invoke-direct {v1, p2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaSidNidPairDataType;-><init>([Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaSidNidPair;)V

    .line 947
    .local v1, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaSidNidPairDataType;
    invoke-static {v0, v1, p3}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getWritingNvReqData(ILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;Ljava/lang/String;)[B

    move-result-object v2

    .line 948
    .local v2, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateWritingNvRespBuffer()[B

    move-result-object v3

    .line 950
    .local v3, "respData":[B
    invoke-direct {p0, p1, v0, v2, v3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getWritingNvRespResult(II[B[B)Z

    move-result v4

    return v4
.end method

.method public setDDTMDefaultPreference(IILjava/lang/String;)Z
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "setting"    # I
    .param p3, "spcLockCode"    # Ljava/lang/String;

    .line 1237
    const v0, 0x20000b8

    .line 1238
    .local v0, "reqId":I
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 1239
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-direct {v1, p2, v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;-><init>(ILjava/nio/ByteOrder;)V

    .line 1240
    .local v1, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;
    invoke-static {v0, v1, p3}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getWritingNvReqData(ILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;Ljava/lang/String;)[B

    move-result-object v2

    .line 1241
    .local v2, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateWritingNvRespBuffer()[B

    move-result-object v3

    .line 1243
    .local v3, "respData":[B
    invoke-direct {p0, p1, v0, v2, v3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getWritingNvRespResult(II[B[B)Z

    move-result v4

    return v4
.end method

.method public setDSSEnabled(IB)Z
    .locals 3
    .param p1, "phoneId"    # I
    .param p2, "enabled"    # B

    .line 1369
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getDSSEnabled(I)B

    move-result v0

    .line 1370
    .local v0, "prev":B
    if-ne v0, p2, :cond_1

    .line 1371
    sget-boolean v1, Lcom/motorola/android/internal/telephony/QcomNvManager;->DBG:Z

    if-eqz v1, :cond_0

    const-string v1, "MotoExtTM: QcomNvManager"

    const-string v2, "Skip setDSSEnabled as no change."

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1372
    :cond_0
    const/4 v1, 0x1

    return v1

    .line 1374
    :cond_1
    const/16 v1, 0x272e

    invoke-direct {p0, p1, v1, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(IIB)Z

    move-result v1

    return v1
.end method

.method public setEhrpdEnabled(IZ)Z
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "enabled"    # Z

    .line 443
    const/16 v0, 0x2b

    invoke-direct {p0, p1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(IIS)Z

    move-result v0

    return v0
.end method

.method public setEmergencyNumber(ILjava/lang/String;ILjava/lang/String;)Z
    .locals 4
    .param p1, "phoneId"    # I
    .param p2, "number"    # Ljava/lang/String;
    .param p3, "emergencyAddress"    # I
    .param p4, "spcLockCode"    # Ljava/lang/String;

    .line 1143
    new-instance v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomEmergencyNumber;

    invoke-direct {v0}, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomEmergencyNumber;-><init>()V

    .line 1144
    .local v0, "emergencyNumber":Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomEmergencyNumber;
    invoke-static {p3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomEmergencyNumber;->isValidAddress(I)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 1145
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setEmergencyNumber(): address is not valid! address: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->loge(Ljava/lang/String;)V

    .line 1146
    return v2

    .line 1148
    :cond_0
    iput p3, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomEmergencyNumber;->address:I

    .line 1149
    const/4 v1, 0x3

    iput-byte v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomEmergencyNumber;->status:B

    .line 1150
    invoke-virtual {v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$QcomEmergencyNumber;->setNumber(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1151
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setEmergencyNumber(): unable to set number: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->loge(Ljava/lang/String;)V

    .line 1152
    return v2

    .line 1155
    :cond_1
    const/4 v1, 0x6

    invoke-direct {p0, p1, v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(IILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;)Z

    move-result v1

    return v1
.end method

.method public setEvdoRevisionOption(IILjava/lang/String;)Z
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "revOption"    # I
    .param p3, "spcLockCode"    # Ljava/lang/String;

    .line 886
    const v0, 0x2000010

    .line 887
    .local v0, "reqId":I
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 888
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-direct {v1, p2, v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;-><init>(ILjava/nio/ByteOrder;)V

    .line 889
    .local v1, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;
    invoke-static {v0, v1, p3}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getWritingNvReqData(ILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;Ljava/lang/String;)[B

    move-result-object v2

    .line 890
    .local v2, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateWritingNvRespBuffer()[B

    move-result-object v3

    .line 892
    .local v3, "respData":[B
    invoke-direct {p0, p1, v0, v2, v3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getWritingNvRespResult(II[B[B)Z

    move-result v4

    return v4
.end method

.method public setFDDTM9Enabled(IZ)Z
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "enabled"    # Z

    .line 409
    const/16 v0, 0x273b

    invoke-direct {p0, p1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(III)Z

    move-result v0

    return v0
.end method

.method public setHdrRxDiversity(II)Z
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "value"    # I

    .line 1105
    const/16 v0, 0x27

    invoke-direct {p0, p1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(III)Z

    move-result v0

    return v0
.end method

.method public setLTEBandEnable(IIZ)Z
    .locals 2
    .param p1, "phoneId"    # I
    .param p2, "bandId"    # I
    .param p3, "enabled"    # Z

    .line 218
    const/4 v0, 0x0

    if-gez p2, :cond_0

    return v0

    .line 219
    :cond_0
    const/4 v1, 0x1

    new-array v1, v1, [I

    .line 220
    .local v1, "bandIds":[I
    aput p2, v1, v0

    .line 221
    const/4 v0, 0x0

    if-eqz p3, :cond_1

    .line 222
    invoke-virtual {p0, p1, v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setLTEBandsEnableDisable(I[I[I)Z

    move-result v0

    return v0

    .line 224
    :cond_1
    invoke-virtual {p0, p1, v0, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setLTEBandsEnableDisable(I[I[I)Z

    move-result v0

    return v0
.end method

.method public setLTEBandsEnableDisable(I[I[I)Z
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "enableBands"    # [I
    .param p3, "disableBands"    # [I

    .line 237
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getBandClassSupport(I)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;

    move-result-object v0

    .line 238
    .local v0, "bc":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 239
    return v1

    .line 242
    :cond_0
    if-eqz p2, :cond_2

    .line 243
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, p2

    if-ge v2, v3, :cond_2

    .line 244
    aget v3, p2, v2

    .line 245
    .local v3, "enableBand":I
    if-gez v3, :cond_1

    return v1

    .line 246
    :cond_1
    const/4 v4, 0x1

    invoke-virtual {v0, v3, v4}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->enableLTEBand(IZ)V

    .line 243
    .end local v3    # "enableBand":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 250
    .end local v2    # "i":I
    :cond_2
    if-eqz p3, :cond_4

    .line 251
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_1
    array-length v3, p3

    if-ge v2, v3, :cond_4

    .line 252
    aget v3, p3, v2

    .line 253
    .local v3, "disableBand":I
    if-gez v3, :cond_3

    return v1

    .line 254
    :cond_3
    invoke-virtual {v0, v3, v1}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->enableLTEBand(IZ)V

    .line 251
    .end local v3    # "disableBand":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 258
    .end local v2    # "j":I
    :cond_4
    invoke-direct {p0, p1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setBandClassSupport(ILcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;)Z

    move-result v1

    return v1
.end method

.method public setLteBsrTimer(IILjava/lang/String;)Z
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "timer"    # I
    .param p3, "spcLockCode"    # Ljava/lang/String;

    .line 752
    const v0, 0x20000bd

    .line 753
    .local v0, "reqId":I
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 754
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-direct {v1, p2, v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;-><init>(ILjava/nio/ByteOrder;)V

    .line 755
    .local v1, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;
    invoke-static {v0, v1, p3}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getWritingNvReqData(ILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;Ljava/lang/String;)[B

    move-result-object v2

    .line 756
    .local v2, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateWritingNvRespBuffer()[B

    move-result-object v3

    .line 758
    .local v3, "respData":[B
    invoke-direct {p0, p1, v0, v2, v3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getWritingNvRespResult(II[B[B)Z

    move-result v4

    return v4
.end method

.method public setMaxBsrTimerStages(II)Z
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "stages"    # I

    .line 719
    const/16 v0, 0x2726

    invoke-direct {p0, p1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(III)Z

    move-result v0

    return v0
.end method

.method public setMobilePRev(IILjava/lang/String;)Z
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "PRevValue"    # I
    .param p3, "spcLockCode"    # Ljava/lang/String;

    .line 1123
    if-eqz p3, :cond_1

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x6

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 1127
    :cond_0
    const v0, 0x2000008

    .line 1128
    .local v0, "reqId":I
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 1129
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-direct {v1, p2, v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;-><init>(ILjava/nio/ByteOrder;)V

    .line 1130
    .local v1, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;
    invoke-static {v0, v1, p3}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getWritingNvReqData(ILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;Ljava/lang/String;)[B

    move-result-object v2

    .line 1131
    .local v2, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateWritingNvRespBuffer()[B

    move-result-object v3

    .line 1133
    .local v3, "respData":[B
    invoke-direct {p0, p1, v0, v2, v3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getWritingNvRespResult(II[B[B)Z

    move-result v4

    return v4

    .line 1124
    .end local v0    # "reqId":I
    .end local v1    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;
    .end local v2    # "reqData":[B
    .end local v3    # "respData":[B
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public setNRBandsEnableDisable(I[I[I[I[I)Z
    .locals 6
    .param p1, "phoneId"    # I
    .param p2, "enableSABands"    # [I
    .param p3, "disableSABands"    # [I
    .param p4, "enableNSABands"    # [I
    .param p5, "disableNSABands"    # [I

    .line 273
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getBandClassSupport(I)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;

    move-result-object v0

    .line 274
    .local v0, "bc":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 275
    return v1

    .line 278
    :cond_0
    const/4 v2, 0x1

    if-eqz p2, :cond_2

    .line 279
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, p2

    if-ge v3, v4, :cond_2

    .line 280
    aget v4, p2, v3

    .line 281
    .local v4, "enableBand":I
    invoke-virtual {v0, v4}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->isSABandValid(I)Z

    move-result v5

    if-nez v5, :cond_1

    return v1

    .line 282
    :cond_1
    invoke-virtual {v0, v4, v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->enableSABand(IZ)V

    .line 279
    .end local v4    # "enableBand":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 286
    .end local v3    # "i":I
    :cond_2
    if-eqz p3, :cond_4

    .line 287
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    array-length v4, p3

    if-ge v3, v4, :cond_4

    .line 288
    aget v4, p3, v3

    .line 289
    .local v4, "disableBand":I
    invoke-virtual {v0, v4}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->isSABandValid(I)Z

    move-result v5

    if-nez v5, :cond_3

    return v1

    .line 290
    :cond_3
    invoke-virtual {v0, v4, v1}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->enableSABand(IZ)V

    .line 287
    .end local v4    # "disableBand":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 294
    .end local v3    # "j":I
    :cond_4
    if-eqz p4, :cond_6

    .line 295
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    array-length v4, p4

    if-ge v3, v4, :cond_6

    .line 296
    aget v4, p4, v3

    .line 297
    .local v4, "enableBand":I
    invoke-virtual {v0, v4}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->isNSABandValid(I)Z

    move-result v5

    if-nez v5, :cond_5

    return v1

    .line 298
    :cond_5
    invoke-virtual {v0, v4, v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->enableNSABand(IZ)V

    .line 295
    .end local v4    # "enableBand":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 302
    .end local v3    # "i":I
    :cond_6
    if-eqz p5, :cond_8

    .line 303
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_3
    array-length v3, p5

    if-ge v2, v3, :cond_8

    .line 304
    aget v3, p5, v2

    .line 305
    .local v3, "disableBand":I
    invoke-virtual {v0, v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->isNSABandValid(I)Z

    move-result v4

    if-nez v4, :cond_7

    return v1

    .line 306
    :cond_7
    invoke-virtual {v0, v3, v1}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->enableNSABand(IZ)V

    .line 303
    .end local v3    # "disableBand":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 310
    .end local v2    # "j":I
    :cond_8
    invoke-direct {p0, p1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setBandClassSupport(ILcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;)Z

    move-result v1

    return v1
.end method

.method public setNamInfo(ILcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;Ljava/lang/String;)Z
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "namInfo"    # Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;
    .param p3, "spcLockCode"    # Ljava/lang/String;

    .line 1174
    const v0, 0x2000002

    .line 1175
    .local v0, "reqId":I
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;

    invoke-direct {v1, p2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;-><init>(Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;)V

    .line 1176
    .local v1, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;
    invoke-static {v0, v1, p3}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getWritingNvReqData(ILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;Ljava/lang/String;)[B

    move-result-object v2

    .line 1177
    .local v2, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateWritingNvRespBuffer()[B

    move-result-object v3

    .line 1179
    .local v3, "respData":[B
    invoke-direct {p0, p1, v0, v2, v3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getWritingNvRespResult(II[B[B)Z

    move-result v4

    return v4
.end method

.method public setNextLteScan(II)Z
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "timer"    # I

    .line 670
    const/16 v0, 0x2724

    invoke-direct {p0, p1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(III)Z

    move-result v0

    return v0
.end method

.method public setProvisionUpdateRequest(IB)Z
    .locals 7
    .param p1, "phoneId"    # I
    .param p2, "carrierId"    # B

    .line 507
    const v0, 0x50008

    .line 509
    .local v0, "reqId":I
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvProvisionUpdateDataType;

    const/4 v2, 0x1

    invoke-direct {v1, v2, p2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvProvisionUpdateDataType;-><init>(BB)V

    .line 511
    .local v1, "config":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvProvisionUpdateDataType;
    invoke-virtual {v1}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvProvisionUpdateDataType;->size()I

    move-result v3

    add-int/lit8 v3, v3, 0x8

    new-array v3, v3, [B

    .line 513
    .local v3, "data":[B
    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 514
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 516
    .local v4, "buf":Ljava/nio/ByteBuffer;
    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 517
    invoke-virtual {v1}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvProvisionUpdateDataType;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    iget-byte v6, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvProvisionUpdateDataType;->status:B

    .line 518
    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    move-result-object v5

    iget-byte v6, v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvProvisionUpdateDataType;->carrierId:B

    .line 519
    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 521
    sget-boolean v5, Lcom/motorola/android/internal/telephony/QcomNvManager;->DBG:Z

    if-eqz v5, :cond_0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Set setProvisionUpdateRequest:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 522
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v6

    invoke-static {v6}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->byteArrToStringLog([B)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 521
    const-string v6, "MotoExtTM: QcomNvManager"

    invoke-static {v6, v5}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 523
    :cond_0
    iget-object v5, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    const/4 v6, 0x0

    invoke-virtual {v5, p1, v3, v6}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v5

    if-ltz v5, :cond_1

    .line 524
    return v2

    .line 526
    :cond_1
    const/4 v2, 0x0

    return v2
.end method

.method public setSO68Enabled(IZ)Z
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "enabled"    # Z

    .line 134
    const/16 v0, 0x30

    invoke-direct {p0, p1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(IIZ)Z

    move-result v0

    return v0
.end method

.method public setSO73COP0Enabled(IZ)Z
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "enabled"    # Z

    .line 150
    const/16 v0, 0x2720

    invoke-direct {p0, p1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(IIZ)Z

    move-result v0

    return v0
.end method

.method public setSO73COP1To7Enabled(IZ)Z
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "enabled"    # Z

    .line 166
    const/16 v0, 0x2d

    invoke-direct {p0, p1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(IIZ)Z

    move-result v0

    return v0
.end method

.method public setSimLock(I[B)Z
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "lock"    # [B

    .line 329
    if-eqz p2, :cond_1

    array-length v0, p2

    if-nez v0, :cond_0

    goto :goto_0

    .line 330
    :cond_0
    const/16 v0, 0x1f5b

    invoke-direct {p0, p1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(II[B)Z

    move-result v0

    return v0

    .line 329
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public setSprintVoiceServiceOption(ILcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;)Z
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "serviceOption"    # Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;

    .line 1333
    new-instance v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;

    invoke-direct {v0}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;-><init>()V

    .line 1335
    .local v0, "nvSo":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;
    const/16 v1, 0x1e

    invoke-direct {p0, p1, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getRdeNvValueByElementId(II)Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;

    move-result-object v2

    .line 1336
    .local v2, "rdeNv":Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;
    if-eqz v2, :cond_0

    iget-object v3, v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    if-eqz v3, :cond_0

    .line 1337
    iget-object v3, v2, Lcom/motorola/android/internal/telephony/QcomNvInfo$RdeNvValue;->dataObj:Lcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;

    check-cast v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;

    .line 1338
    .local v3, "ret":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;
    iget-byte v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->nam:B

    iput-byte v4, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->nam:B

    .line 1339
    iget-byte v4, v3, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->evrcCapabilityEnabled:B

    iput-byte v4, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->evrcCapabilityEnabled:B

    .line 1342
    .end local v3    # "ret":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;
    :cond_0
    iget v3, p2, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;->homePageVoice:I

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->toNvSo(I)S

    move-result v3

    iput-short v3, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->homePageVoiceSo:S

    .line 1343
    iget v3, p2, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;->homeOrigVoice:I

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->toNvSo(I)S

    move-result v3

    iput-short v3, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->homeOrigVoiceSo:S

    .line 1344
    iget v3, p2, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;->roamOrigVoice:I

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->toNvSo(I)S

    move-result v3

    iput-short v3, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->roamOrigVoiceSo:S

    .line 1346
    invoke-direct {p0, p1, v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(IILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;)Z

    move-result v1

    return v1
.end method

.method public setTDDTM9Enabled(IZ)Z
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "enabled"    # Z

    .line 426
    const/16 v0, 0x273c

    invoke-direct {p0, p1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(III)Z

    move-result v0

    return v0
.end method

.method public setVoiceDomainSetting(II)Z
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "setting"    # I

    .line 1303
    const v0, 0x50041

    .line 1304
    .local v0, "reqId":I
    iget v1, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->VOICE_DOMAIN_SETTING_LENGTH_BYTE:I

    add-int/lit8 v1, v1, 0x8

    new-array v1, v1, [B

    .line 1307
    .local v1, "data":[B
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 1308
    .local v2, "buf":Ljava/nio/ByteBuffer;
    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 1309
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    iget v4, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->VOICE_DOMAIN_SETTING_LENGTH_BYTE:I

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    int-to-byte v4, p2

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 1311
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomNvManager;->mExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    const/4 v4, 0x0

    invoke-virtual {v3, p1, v1, v4}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v3

    if-ltz v3, :cond_0

    .line 1312
    const/4 v3, 0x1

    return v3

    .line 1314
    :cond_0
    const/4 v3, 0x0

    return v3
.end method

.method public verifyMsl(ILjava/lang/String;)Z
    .locals 6
    .param p1, "phoneId"    # I
    .param p2, "spc"    # Ljava/lang/String;

    .line 553
    if-eqz p2, :cond_2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x6

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 557
    :cond_0
    const v0, 0x200000a

    .line 558
    .local v0, "reqId":I
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaSpcDataType;

    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaSpcDataType;-><init>([B)V

    .line 559
    .local v1, "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaSpcDataType;
    invoke-static {v0, v1, p2}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->getWritingNvReqData(ILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;Ljava/lang/String;)[B

    move-result-object v2

    .line 560
    .local v2, "reqData":[B
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->allocateWritingNvRespBuffer()[B

    move-result-object v3

    .line 561
    .local v3, "respData":[B
    sget-boolean v4, Lcom/motorola/android/internal/telephony/QcomNvManager;->DBG:Z

    if-eqz v4, :cond_1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "verifyMsl :"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 562
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-static {v5}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->byteArrToStringLog([B)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 561
    const-string v5, "MotoExtTM: QcomNvManager"

    invoke-static {v5, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 564
    :cond_1
    invoke-direct {p0, p1, v0, v2, v3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getWritingNvRespResult(II[B[B)Z

    move-result v4

    return v4

    .line 554
    .end local v0    # "reqId":I
    .end local v1    # "nvData":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaSpcDataType;
    .end local v2    # "reqData":[B
    .end local v3    # "respData":[B
    :cond_2
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public writeCaBwCombo(ILcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;)Z
    .locals 2
    .param p1, "phoneId"    # I
    .param p2, "comboList"    # Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;

    .line 610
    sget-boolean v0, Lcom/motorola/android/internal/telephony/QcomNvManager;->DBG:Z

    if-eqz v0, :cond_0

    .line 611
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "writeCaBwCombo "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MotoExtTM: QcomNvManager"

    invoke-static {v1, v0}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 613
    :cond_0
    if-nez p2, :cond_1

    .line 614
    const/4 v0, 0x0

    return v0

    .line 616
    :cond_1
    const/16 v0, 0x5209

    invoke-direct {p0, p1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setRdeNvValue(IILcom/motorola/android/internal/telephony/QcomNvInfo$NvDataType;)Z

    move-result v0

    return v0
.end method
