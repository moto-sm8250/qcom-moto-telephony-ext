.class public Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;
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
    name = "NvSprintCDMAVoiceSOType"
.end annotation


# static fields
.field private static final RDE_VOICE_CAI_SO_FULL_TDSO:S = 0x20s

.field private static final RDE_VOICE_CAI_SO_LOOPBACK:S = 0x2s

.field private static final RDE_VOICE_CAI_SO_LOOPBACK_13K:S = 0x9s

.field private static final RDE_VOICE_CAI_SO_LOOPBACK_SO55:S = 0x37s

.field private static final RDE_VOICE_CAI_SO_MARKOV:S = -0x7ffes

.field private static final RDE_VOICE_CAI_SO_MARKOV_13K:S = -0x7fe4s

.field private static final RDE_VOICE_CAI_SO_MARKOV_SO54:S = 0x36s

.field private static final RDE_VOICE_CAI_SO_RS1_MARKOV:S = -0x7fe2s

.field private static final RDE_VOICE_CAI_SO_RS2_MARKOV:S = -0x7fe1s

.field private static final RDE_VOICE_CAI_SO_TDSO:S = -0x7ff8s

.field private static final RDE_VOICE_CAI_SO_VOICE_13K:S = -0x8000s

.field private static final RDE_VOICE_CAI_SO_VOICE_4GV_NB:S = 0x44s

.field private static final RDE_VOICE_CAI_SO_VOICE_EVRC:S = 0x3s


# instance fields
.field public evrcCapabilityEnabled:B

.field public homeOrigVoiceSo:S

.field public homePageVoiceSo:S

.field public nam:B

.field public roamOrigVoiceSo:S


# direct methods
.method constructor <init>()V
    .locals 1

    .line 2498
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2499
    const/4 v0, 0x0

    iput-byte v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->nam:B

    .line 2500
    iput-byte v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->evrcCapabilityEnabled:B

    .line 2501
    iput-short v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->homePageVoiceSo:S

    .line 2502
    iput-short v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->homeOrigVoiceSo:S

    .line 2503
    iput-short v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->roamOrigVoiceSo:S

    .line 2504
    return-void
.end method

.method public static deserialize(Ljava/nio/ByteBuffer;)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;
    .locals 2
    .param p0, "buf"    # Ljava/nio/ByteBuffer;

    .line 2515
    const-string v0, "deserialize NvSprintCDMAVoiceSOType"

    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomNvInfo;->access$300(Ljava/lang/String;)V

    .line 2516
    new-instance v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;

    invoke-direct {v0}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;-><init>()V

    .line 2517
    .local v0, "so":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    iput-byte v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->nam:B

    .line 2518
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    iput-byte v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->evrcCapabilityEnabled:B

    .line 2519
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    iput-short v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->homePageVoiceSo:S

    .line 2520
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    iput-short v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->homeOrigVoiceSo:S

    .line 2521
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    iput-short v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->roamOrigVoiceSo:S

    .line 2522
    return-object v0
.end method

.method public static toNvSo(I)S
    .locals 1
    .param p0, "oemSo"    # I

    .line 2526
    packed-switch p0, :pswitch_data_0

    .line 2543
    const/16 v0, -0x8000

    return v0

    .line 2540
    :pswitch_0
    const/16 v0, 0x44

    return v0

    .line 2538
    :pswitch_1
    const/4 v0, 0x3

    return v0

    .line 2536
    :pswitch_2
    const/16 v0, 0x9

    return v0

    .line 2534
    :pswitch_3
    const/4 v0, 0x2

    return v0

    .line 2532
    :pswitch_4
    const/16 v0, -0x7fe4

    return v0

    .line 2530
    :pswitch_5
    const/16 v0, -0x7ffe

    return v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static toOemSo(S)I
    .locals 2
    .param p0, "nvSo"    # S

    .line 2547
    const/4 v0, -0x1

    .line 2548
    .local v0, "oemSo":I
    const/16 v1, -0x8000

    if-eq p0, v1, :cond_6

    const/16 v1, -0x7ffe

    if-eq p0, v1, :cond_5

    const/16 v1, -0x7fe4

    if-eq p0, v1, :cond_4

    const/16 v1, 0x9

    if-eq p0, v1, :cond_3

    const/16 v1, 0x44

    if-eq p0, v1, :cond_2

    const/4 v1, 0x2

    if-eq p0, v1, :cond_1

    const/4 v1, 0x3

    if-eq p0, v1, :cond_0

    .line 2571
    const/4 v0, -0x1

    goto :goto_0

    .line 2565
    :cond_0
    const/4 v0, 0x5

    .line 2566
    goto :goto_0

    .line 2553
    :cond_1
    const/4 v0, 0x3

    .line 2554
    goto :goto_0

    .line 2568
    :cond_2
    const/4 v0, 0x6

    .line 2569
    goto :goto_0

    .line 2556
    :cond_3
    const/4 v0, 0x4

    .line 2557
    goto :goto_0

    .line 2562
    :cond_4
    const/4 v0, 0x2

    .line 2563
    goto :goto_0

    .line 2559
    :cond_5
    const/4 v0, 0x1

    .line 2560
    goto :goto_0

    .line 2550
    :cond_6
    const/4 v0, 0x0

    .line 2551
    nop

    .line 2574
    :goto_0
    return v0
.end method


# virtual methods
.method public serialize(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "buf"    # Ljava/nio/ByteBuffer;

    .line 2507
    iget-byte v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->nam:B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 2508
    iget-byte v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->evrcCapabilityEnabled:B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 2509
    iget-short v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->homePageVoiceSo:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 2510
    iget-short v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->homeOrigVoiceSo:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 2511
    iget-short v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvSprintCDMAVoiceSOType;->roamOrigVoiceSo:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 2512
    return-void
.end method

.method public size()I
    .locals 1

    .line 2578
    const/16 v0, 0x8

    return v0
.end method
