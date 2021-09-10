.class public Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;
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
    name = "NvCdmaNAMInfo"
.end annotation


# static fields
.field private static final OEM_RIL_CDMA_IMSI_11_12_ALIGNED_LENGTH:I = 0x4

.field private static final OEM_RIL_CDMA_IMSI_MCC_ALIGNED_LENGTH:I = 0x4

.field private static final OEM_RIL_CDMA_IMSI_MCC_T_ALIGNED_LENGTH:I = 0x4

.field private static final OEM_RIL_CDMA_IMSI_T_ALIGNED_LENGTH:I = 0x10

.field private static final OEM_RIL_CDMA_MDN_ALIGNED_LENGTH:I = 0x10

.field private static final OEM_RIL_CDMA_MIN_ALIGNED_LENGTH:I = 0x10

.field private static final SIZE:I = 0x66


# instance fields
.field private mNamInfo:Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;


# direct methods
.method constructor <init>(Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;)V
    .locals 0
    .param p1, "namInfo"    # Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;

    .line 2318
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2319
    iput-object p1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;->mNamInfo:Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;

    .line 2320
    return-void
.end method

.method public static deserialize(Ljava/nio/ByteBuffer;)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;
    .locals 7
    .param p0, "buf"    # Ljava/nio/ByteBuffer;

    .line 2392
    new-instance v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;

    invoke-direct {v0}, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;-><init>()V

    .line 2394
    .local v0, "data":Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/16 v2, 0xa

    if-ge v1, v2, :cond_0

    .line 2395
    :try_start_0
    iget-object v2, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->mdn:[B

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v3

    aput-byte v3, v2, v1

    .line 2394
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2457
    .end local v1    # "i":I
    :catch_0
    move-exception v1

    goto/16 :goto_d

    .line 2398
    :cond_0
    const/16 v1, 0xa

    .restart local v1    # "i":I
    :goto_1
    const/16 v3, 0x10

    if-ge v1, v3, :cond_1

    .line 2399
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    .line 2398
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2402
    .end local v1    # "i":I
    :cond_1
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_2
    if-ge v1, v2, :cond_2

    .line 2403
    iget-object v4, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->min:[B

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v5

    aput-byte v5, v4, v1

    .line 2402
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 2406
    .end local v1    # "i":I
    :cond_2
    const/16 v1, 0xa

    .restart local v1    # "i":I
    :goto_3
    if-ge v1, v3, :cond_3

    .line 2407
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    .line 2406
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 2410
    .end local v1    # "i":I
    :cond_3
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->h_sid:I

    .line 2411
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->h_nid:I

    .line 2412
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->scm:I

    .line 2414
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_4
    const/4 v2, 0x2

    if-ge v1, v2, :cond_4

    .line 2415
    iget-object v2, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->imsi11_12:[B

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v4

    aput-byte v4, v2, v1

    .line 2414
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 2418
    .end local v1    # "i":I
    :cond_4
    const/4 v1, 0x2

    .restart local v1    # "i":I
    :goto_5
    const/4 v2, 0x4

    if-ge v1, v2, :cond_5

    .line 2419
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    .line 2418
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 2422
    .end local v1    # "i":I
    :cond_5
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_6
    const/4 v4, 0x3

    if-ge v1, v4, :cond_6

    .line 2423
    iget-object v4, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->imsiMcc:[B

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v5

    aput-byte v5, v4, v1

    .line 2422
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 2426
    .end local v1    # "i":I
    :cond_6
    const/4 v1, 0x3

    .restart local v1    # "i":I
    :goto_7
    if-ge v1, v2, :cond_7

    .line 2427
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    .line 2426
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 2430
    .end local v1    # "i":I
    :cond_7
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->priCdmaA:I

    .line 2431
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->priCdmaB:I

    .line 2432
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->secCdmaA:I

    .line 2433
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->secCdmaB:I

    .line 2434
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->vocoderType:I

    .line 2436
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_8
    if-ge v1, v4, :cond_8

    .line 2437
    iget-object v5, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->imsiMccT:[B

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v6

    aput-byte v6, v5, v1

    .line 2436
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 2440
    .end local v1    # "i":I
    :cond_8
    const/4 v1, 0x3

    .restart local v1    # "i":I
    :goto_9
    if-ge v1, v2, :cond_9

    .line 2441
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    .line 2440
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 2444
    .end local v1    # "i":I
    :cond_9
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_a
    const/16 v2, 0xf

    if-ge v1, v2, :cond_a

    .line 2445
    iget-object v2, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->imsiT:[B

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v4

    aput-byte v4, v2, v1

    .line 2444
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 2448
    .end local v1    # "i":I
    :cond_a
    const/16 v1, 0xf

    .restart local v1    # "i":I
    :goto_b
    if-ge v1, v3, :cond_b

    .line 2449
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    .line 2448
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 2452
    .end local v1    # "i":I
    :cond_b
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->accessOverloadClass:I

    .line 2454
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_c
    const/4 v2, 0x6

    if-ge v1, v2, :cond_c

    .line 2455
    iget-object v2, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->newSpcCode:[B

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v3

    aput-byte v3, v2, v1
    :try_end_0
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2454
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 2459
    .end local v1    # "i":I
    :cond_c
    goto :goto_e

    .line 2458
    .local v1, "e":Ljava/nio/BufferUnderflowException;
    :goto_d
    const/4 v0, 0x0

    .line 2461
    .end local v1    # "e":Ljava/nio/BufferUnderflowException;
    :goto_e
    return-object v0
.end method


# virtual methods
.method public serialize(Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "buf"    # Ljava/nio/ByteBuffer;

    .line 2323
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;->mNamInfo:Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;

    if-nez v0, :cond_0

    return-void

    .line 2325
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v1, 0xa

    if-ge v0, v1, :cond_1

    .line 2326
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;->mNamInfo:Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;

    iget-object v1, v1, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->mdn:[B

    aget-byte v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 2325
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2329
    .end local v0    # "i":I
    :cond_1
    const/16 v0, 0xa

    .restart local v0    # "i":I
    :goto_1
    const/16 v2, 0x10

    const/4 v3, 0x0

    if-ge v0, v2, :cond_2

    .line 2330
    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 2329
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 2333
    .end local v0    # "i":I
    :cond_2
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2
    if-ge v0, v1, :cond_3

    .line 2334
    iget-object v4, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;->mNamInfo:Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;

    iget-object v4, v4, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->min:[B

    aget-byte v4, v4, v0

    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 2333
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 2337
    .end local v0    # "i":I
    :cond_3
    const/16 v0, 0xa

    .restart local v0    # "i":I
    :goto_3
    if-ge v0, v2, :cond_4

    .line 2338
    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 2337
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 2341
    .end local v0    # "i":I
    :cond_4
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;->mNamInfo:Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;

    iget v0, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->h_sid:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 2342
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;->mNamInfo:Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;

    iget v0, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->h_nid:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 2343
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;->mNamInfo:Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;

    iget v0, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->scm:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 2345
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_4
    const/4 v1, 0x2

    if-ge v0, v1, :cond_5

    .line 2346
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;->mNamInfo:Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;

    iget-object v1, v1, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->imsi11_12:[B

    aget-byte v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 2345
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 2349
    .end local v0    # "i":I
    :cond_5
    const/4 v0, 0x2

    .restart local v0    # "i":I
    :goto_5
    const/4 v1, 0x4

    if-ge v0, v1, :cond_6

    .line 2350
    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 2349
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 2353
    .end local v0    # "i":I
    :cond_6
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_6
    const/4 v4, 0x3

    if-ge v0, v4, :cond_7

    .line 2354
    iget-object v4, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;->mNamInfo:Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;

    iget-object v4, v4, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->imsiMcc:[B

    aget-byte v4, v4, v0

    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 2353
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 2357
    .end local v0    # "i":I
    :cond_7
    const/4 v0, 0x3

    .restart local v0    # "i":I
    :goto_7
    if-ge v0, v1, :cond_8

    .line 2358
    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 2357
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 2361
    .end local v0    # "i":I
    :cond_8
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;->mNamInfo:Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;

    iget v0, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->priCdmaA:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 2362
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;->mNamInfo:Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;

    iget v0, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->priCdmaB:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 2363
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;->mNamInfo:Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;

    iget v0, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->secCdmaA:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 2364
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;->mNamInfo:Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;

    iget v0, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->secCdmaB:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 2365
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;->mNamInfo:Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;

    iget v0, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->vocoderType:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 2367
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_8
    if-ge v0, v4, :cond_9

    .line 2368
    iget-object v5, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;->mNamInfo:Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;

    iget-object v5, v5, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->imsiMccT:[B

    aget-byte v5, v5, v0

    invoke-virtual {p1, v5}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 2367
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 2371
    .end local v0    # "i":I
    :cond_9
    const/4 v0, 0x3

    .restart local v0    # "i":I
    :goto_9
    if-ge v0, v1, :cond_a

    .line 2372
    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 2371
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 2375
    .end local v0    # "i":I
    :cond_a
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_a
    const/16 v1, 0xf

    if-ge v0, v1, :cond_b

    .line 2376
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;->mNamInfo:Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;

    iget-object v1, v1, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->imsiT:[B

    aget-byte v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 2375
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 2379
    .end local v0    # "i":I
    :cond_b
    const/16 v0, 0xf

    .restart local v0    # "i":I
    :goto_b
    if-ge v0, v2, :cond_c

    .line 2380
    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 2379
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 2383
    .end local v0    # "i":I
    :cond_c
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;->mNamInfo:Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;

    iget v0, v0, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->accessOverloadClass:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 2385
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_c
    const/4 v1, 0x6

    if-ge v0, v1, :cond_d

    .line 2386
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvCdmaNAMInfo;->mNamInfo:Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;

    iget-object v1, v1, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;->newSpcCode:[B

    aget-byte v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 2385
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 2389
    .end local v0    # "i":I
    :cond_d
    return-void
.end method

.method public size()I
    .locals 1

    .line 2465
    const/16 v0, 0x66

    return v0
.end method
