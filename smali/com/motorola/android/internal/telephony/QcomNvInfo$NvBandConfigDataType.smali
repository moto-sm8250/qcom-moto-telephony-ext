.class public Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;
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
    name = "NvBandConfigDataType"
.end annotation


# static fields
.field private static final BAND_CONFIG_LENGTH_VERSION_1:I = 0x10

.field private static final BAND_CONFIG_LENGTH_VERSION_2:I = 0x28

.field private static final BAND_CONFIG_LENGTH_VERSION_3:I = 0xa8

.field private static final LTE_CONFIG_LENGTH_LONG_VERSION_1:I = 0x1

.field private static final LTE_CONFIG_LENGTH_LONG_VERSION_2:I = 0x4

.field private static final NAS_CONFIG_LENGTH_LONG:I = 0x1

.field private static final NSA_CONFIG_LENGTH_LONG_VERSION:I = 0x8

.field private static final SA_CONFIG_LENGTH_LONG_VERSION:I = 0x8

.field private static final VERSION_1:I = 0x1

.field private static final VERSION_2:I = 0x2

.field private static final VERSION_3:I = 0x3

.field private static final VERSION_UNKNOWN:I


# instance fields
.field private lteConfigs:[J

.field private nasConfig:J

.field private nsaConfigs:[J

.field private saConfigs:[J

.field private size:I

.field private version:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 609
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 610
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->lteConfigs:[J

    .line 611
    iput-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->saConfigs:[J

    .line 612
    iput-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->nsaConfigs:[J

    .line 613
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->nasConfig:J

    .line 614
    const/16 v0, 0xa8

    iput v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->size:I

    .line 615
    const/4 v0, 0x0

    iput v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->version:I

    .line 616
    return-void
.end method

.method public static deserialize(Ljava/nio/ByteBuffer;I)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;
    .locals 7
    .param p0, "buf"    # Ljava/nio/ByteBuffer;
    .param p1, "length"    # I

    .line 646
    new-instance v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;

    invoke-direct {v0}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;-><init>()V

    .line 647
    .local v0, "bc":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;
    const/16 v1, 0x10

    if-ne v1, p1, :cond_0

    .line 648
    const/4 v2, 0x1

    iput v2, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->version:I

    .line 649
    iput v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->size:I

    .line 650
    new-array v1, v2, [J

    iput-object v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->lteConfigs:[J

    .line 651
    const/4 v2, 0x0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v3

    aput-wide v3, v1, v2

    .line 652
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->nasConfig:J

    goto/16 :goto_5

    .line 653
    :cond_0
    const/16 v1, 0x28

    const/4 v2, 0x4

    if-ne v1, p1, :cond_2

    .line 654
    const/4 v3, 0x2

    iput v3, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->version:I

    .line 655
    iput v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->size:I

    .line 656
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v3

    iput-wide v3, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->nasConfig:J

    .line 657
    const/4 v1, 0x0

    .line 658
    .local v1, "idx":I
    new-array v3, v2, [J

    iput-object v3, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->lteConfigs:[J

    .line 659
    :goto_0
    if-ge v1, v2, :cond_1

    .line 660
    iget-object v3, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->lteConfigs:[J

    add-int/lit8 v4, v1, 0x1

    .end local v1    # "idx":I
    .local v4, "idx":I
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v5

    aput-wide v5, v3, v1

    move v1, v4

    goto :goto_0

    .line 659
    .end local v4    # "idx":I
    :cond_1
    goto :goto_4

    .line 662
    :cond_2
    const/16 v1, 0xa8

    if-ne v1, p1, :cond_5

    .line 663
    const/4 v3, 0x3

    iput v3, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->version:I

    .line 664
    iput v1, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->size:I

    .line 665
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v3

    iput-wide v3, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->nasConfig:J

    .line 667
    const/4 v1, 0x0

    .line 668
    .restart local v1    # "idx":I
    new-array v3, v2, [J

    iput-object v3, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->lteConfigs:[J

    .line 669
    :goto_1
    if-ge v1, v2, :cond_3

    .line 670
    iget-object v3, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->lteConfigs:[J

    add-int/lit8 v4, v1, 0x1

    .end local v1    # "idx":I
    .restart local v4    # "idx":I
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v5

    aput-wide v5, v3, v1

    move v1, v4

    goto :goto_1

    .line 673
    .end local v4    # "idx":I
    .restart local v1    # "idx":I
    :cond_3
    const/4 v1, 0x0

    .line 674
    const/16 v2, 0x8

    new-array v3, v2, [J

    iput-object v3, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->saConfigs:[J

    .line 675
    :goto_2
    if-ge v1, v2, :cond_4

    .line 676
    iget-object v3, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->saConfigs:[J

    add-int/lit8 v4, v1, 0x1

    .end local v1    # "idx":I
    .restart local v4    # "idx":I
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v5

    aput-wide v5, v3, v1

    move v1, v4

    goto :goto_2

    .line 679
    .end local v4    # "idx":I
    .restart local v1    # "idx":I
    :cond_4
    const/4 v1, 0x0

    .line 680
    new-array v3, v2, [J

    iput-object v3, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->nsaConfigs:[J

    .line 681
    :goto_3
    if-ge v1, v2, :cond_6

    .line 682
    iget-object v3, v0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->nsaConfigs:[J

    add-int/lit8 v4, v1, 0x1

    .end local v1    # "idx":I
    .restart local v4    # "idx":I
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v5

    aput-wide v5, v3, v1

    move v1, v4

    goto :goto_3

    .line 662
    .end local v4    # "idx":I
    :cond_5
    :goto_4
    nop

    .line 685
    :cond_6
    :goto_5
    return-object v0
.end method

.method private isLTEBandValid(I)Z
    .locals 3
    .param p1, "bandId"    # I

    .line 689
    iget v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->version:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    if-lez p1, :cond_0

    const/16 v0, 0x40

    if-le p1, v0, :cond_2

    :cond_0
    iget v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->version:I

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    const/4 v2, 0x3

    if-ne v0, v2, :cond_3

    :cond_1
    if-lez p1, :cond_3

    const/16 v0, 0x100

    if-gt p1, v0, :cond_3

    .line 693
    :cond_2
    return v1

    .line 695
    :cond_3
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public enableLTEBand(IZ)V
    .locals 7
    .param p1, "bandId"    # I
    .param p2, "enabled"    # Z

    .line 710
    invoke-direct {p0, p1}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->isLTEBandValid(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 711
    add-int/lit8 v0, p1, -0x1

    div-int/lit8 v0, v0, 0x40

    .line 712
    .local v0, "row":I
    add-int/lit8 v1, p1, -0x1

    rem-int/lit8 v1, v1, 0x40

    .line 713
    .local v1, "col":I
    const-wide/16 v2, 0x1

    if-eqz p2, :cond_0

    .line 714
    iget-object v4, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->lteConfigs:[J

    aget-wide v5, v4, v0

    shl-long/2addr v2, v1

    or-long/2addr v2, v5

    aput-wide v2, v4, v0

    goto :goto_0

    .line 716
    :cond_0
    iget-object v4, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->lteConfigs:[J

    aget-wide v5, v4, v0

    shl-long/2addr v2, v1

    not-long v2, v2

    and-long/2addr v2, v5

    aput-wide v2, v4, v0

    .line 719
    .end local v0    # "row":I
    .end local v1    # "col":I
    :cond_1
    :goto_0
    return-void
.end method

.method public enableNSABand(IZ)V
    .locals 7
    .param p1, "bandId"    # I
    .param p2, "enabled"    # Z

    .line 783
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->isNSABandValid(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 784
    add-int/lit8 v0, p1, -0x1

    div-int/lit8 v0, v0, 0x40

    .line 785
    .local v0, "row":I
    add-int/lit8 v1, p1, -0x1

    rem-int/lit8 v1, v1, 0x40

    .line 786
    .local v1, "col":I
    const-wide/16 v2, 0x1

    if-eqz p2, :cond_0

    .line 787
    iget-object v4, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->nsaConfigs:[J

    aget-wide v5, v4, v0

    shl-long/2addr v2, v1

    or-long/2addr v2, v5

    aput-wide v2, v4, v0

    goto :goto_0

    .line 789
    :cond_0
    iget-object v4, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->nsaConfigs:[J

    aget-wide v5, v4, v0

    shl-long/2addr v2, v1

    not-long v2, v2

    and-long/2addr v2, v5

    aput-wide v2, v4, v0

    .line 792
    .end local v0    # "row":I
    .end local v1    # "col":I
    :cond_1
    :goto_0
    return-void
.end method

.method public enableSABand(IZ)V
    .locals 7
    .param p1, "bandId"    # I
    .param p2, "enabled"    # Z

    .line 763
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->isSABandValid(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 764
    add-int/lit8 v0, p1, -0x1

    div-int/lit8 v0, v0, 0x40

    .line 765
    .local v0, "row":I
    add-int/lit8 v1, p1, -0x1

    rem-int/lit8 v1, v1, 0x40

    .line 766
    .local v1, "col":I
    const-wide/16 v2, 0x1

    if-eqz p2, :cond_0

    .line 767
    iget-object v4, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->saConfigs:[J

    aget-wide v5, v4, v0

    shl-long/2addr v2, v1

    or-long/2addr v2, v5

    aput-wide v2, v4, v0

    goto :goto_0

    .line 769
    :cond_0
    iget-object v4, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->saConfigs:[J

    aget-wide v5, v4, v0

    shl-long/2addr v2, v1

    not-long v2, v2

    and-long/2addr v2, v5

    aput-wide v2, v4, v0

    .line 772
    .end local v0    # "row":I
    .end local v1    # "col":I
    :cond_1
    :goto_0
    return-void
.end method

.method public getLteConfigBytes()[B
    .locals 4

    .line 722
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->lteConfigs:[J

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x8

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 723
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 724
    .local v0, "bf":Ljava/nio/ByteBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->lteConfigs:[J

    array-length v3, v2

    if-ge v1, v3, :cond_0

    .line 725
    aget-wide v2, v2, v1

    invoke-virtual {v0, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 724
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 727
    .end local v1    # "i":I
    :cond_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    return-object v1
.end method

.method public getNRDeviceType()I
    .locals 7

    .line 795
    const/4 v0, 0x0

    .line 796
    .local v0, "res":I
    iget v1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->version:I

    const/4 v2, 0x3

    if-eq v1, v2, :cond_0

    .line 797
    return v0

    .line 801
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const-wide/16 v3, 0x0

    if-ge v1, v2, :cond_3

    .line 802
    iget-object v5, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->nsaConfigs:[J

    aget-wide v5, v5, v1

    cmp-long v5, v5, v3

    if-nez v5, :cond_2

    iget-object v5, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->saConfigs:[J

    aget-wide v5, v5, v1

    cmp-long v5, v5, v3

    if-eqz v5, :cond_1

    goto :goto_1

    .line 801
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 803
    :cond_2
    :goto_1
    or-int/lit8 v0, v0, 0x1

    .line 809
    .end local v1    # "i":I
    :cond_3
    const/4 v1, 0x4

    .restart local v1    # "i":I
    :goto_2
    const/16 v2, 0x8

    if-ge v1, v2, :cond_6

    .line 810
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->nsaConfigs:[J

    aget-wide v5, v2, v1

    cmp-long v2, v5, v3

    if-nez v2, :cond_5

    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->saConfigs:[J

    aget-wide v5, v2, v1

    cmp-long v2, v5, v3

    if-eqz v2, :cond_4

    goto :goto_3

    .line 809
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 811
    :cond_5
    :goto_3
    or-int/lit8 v0, v0, 0x2

    .line 815
    .end local v1    # "i":I
    :cond_6
    return v0
.end method

.method public getNRModeBitMask()I
    .locals 7

    .line 819
    const/4 v0, 0x0

    .line 820
    .local v0, "res":I
    iget v1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->version:I

    const/4 v2, 0x3

    if-ge v1, v2, :cond_0

    .line 821
    return v0

    .line 824
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const-wide/16 v2, 0x0

    const/16 v4, 0x8

    if-ge v1, v4, :cond_2

    .line 825
    iget-object v5, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->saConfigs:[J

    aget-wide v5, v5, v1

    cmp-long v5, v5, v2

    if-eqz v5, :cond_1

    .line 826
    or-int/lit8 v0, v0, 0x1

    .line 827
    goto :goto_1

    .line 824
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 831
    .end local v1    # "i":I
    :cond_2
    :goto_1
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_2
    if-ge v1, v4, :cond_4

    .line 832
    iget-object v5, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->nsaConfigs:[J

    aget-wide v5, v5, v1

    cmp-long v5, v5, v2

    if-eqz v5, :cond_3

    .line 833
    or-int/lit8 v0, v0, 0x2

    .line 834
    goto :goto_3

    .line 831
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 837
    .end local v1    # "i":I
    :cond_4
    :goto_3
    return v0
.end method

.method public getNSAConfigBytes()[B
    .locals 4

    .line 741
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->nsaConfigs:[J

    if-nez v0, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [B

    return-object v0

    .line 742
    :cond_0
    array-length v0, v0

    mul-int/lit8 v0, v0, 0x8

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 743
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 744
    .local v0, "bf":Ljava/nio/ByteBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->nsaConfigs:[J

    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 745
    aget-wide v2, v2, v1

    invoke-virtual {v0, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 744
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 747
    .end local v1    # "i":I
    :cond_1
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    return-object v1
.end method

.method public getSAConfigBytes()[B
    .locals 4

    .line 731
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->saConfigs:[J

    if-nez v0, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [B

    return-object v0

    .line 732
    :cond_0
    array-length v0, v0

    mul-int/lit8 v0, v0, 0x8

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 733
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 734
    .local v0, "bf":Ljava/nio/ByteBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->saConfigs:[J

    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 735
    aget-wide v2, v2, v1

    invoke-virtual {v0, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 734
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 737
    .end local v1    # "i":I
    :cond_1
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    return-object v1
.end method

.method public isLTEBandEnabled(I)Z
    .locals 7
    .param p1, "bandId"    # I

    .line 699
    const/4 v0, 0x0

    .line 700
    .local v0, "enabled":Z
    invoke-direct {p0, p1}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->isLTEBandValid(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 701
    add-int/lit8 v1, p1, -0x1

    div-int/lit8 v1, v1, 0x40

    .line 702
    .local v1, "row":I
    add-int/lit8 v2, p1, -0x1

    rem-int/lit8 v2, v2, 0x40

    .line 703
    .local v2, "col":I
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->lteConfigs:[J

    aget-wide v3, v3, v1

    const-wide/16 v5, 0x1

    shl-long/2addr v5, v2

    and-long/2addr v3, v5

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    move v0, v3

    .line 706
    .end local v1    # "row":I
    .end local v2    # "col":I
    :cond_1
    return v0
.end method

.method public isNRSupported()Z
    .locals 2

    .line 751
    iget v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->version:I

    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isNSABandValid(I)Z
    .locals 2
    .param p1, "bandId"    # I

    .line 775
    iget v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->version:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    if-lez p1, :cond_0

    const/16 v0, 0x200

    if-gt p1, v0, :cond_0

    .line 777
    const/4 v0, 0x1

    return v0

    .line 779
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSABandValid(I)Z
    .locals 2
    .param p1, "bandId"    # I

    .line 755
    iget v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->version:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    if-lez p1, :cond_0

    const/16 v0, 0x200

    if-gt p1, v0, :cond_0

    .line 757
    const/4 v0, 0x1

    return v0

    .line 759
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isVersionUnknown()Z
    .locals 1

    .line 841
    iget v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->version:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public serialize(Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "buf"    # Ljava/nio/ByteBuffer;

    .line 619
    iget v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->version:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 620
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->lteConfigs:[J

    const/4 v1, 0x0

    aget-wide v0, v0, v1

    invoke-virtual {p1, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 621
    iget-wide v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->nasConfig:J

    invoke-virtual {p1, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    goto :goto_5

    .line 622
    :cond_0
    const/4 v1, 0x2

    const/4 v2, 0x4

    if-ne v0, v1, :cond_2

    .line 623
    iget-wide v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->nasConfig:J

    invoke-virtual {p1, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 624
    const/4 v0, 0x0

    .line 625
    .local v0, "idx":I
    :goto_0
    if-ge v0, v2, :cond_1

    .line 626
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->lteConfigs:[J

    add-int/lit8 v3, v0, 0x1

    .end local v0    # "idx":I
    .local v3, "idx":I
    aget-wide v0, v1, v0

    invoke-virtual {p1, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    move v0, v3

    goto :goto_0

    .line 625
    .end local v3    # "idx":I
    :cond_1
    goto :goto_4

    .line 628
    :cond_2
    const/4 v1, 0x3

    if-ne v0, v1, :cond_5

    .line 629
    iget-wide v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->nasConfig:J

    invoke-virtual {p1, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 630
    const/4 v0, 0x0

    .line 631
    .restart local v0    # "idx":I
    :goto_1
    if-ge v0, v2, :cond_3

    .line 632
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->lteConfigs:[J

    add-int/lit8 v3, v0, 0x1

    .end local v0    # "idx":I
    .restart local v3    # "idx":I
    aget-wide v0, v1, v0

    invoke-virtual {p1, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    move v0, v3

    goto :goto_1

    .line 634
    .end local v3    # "idx":I
    .restart local v0    # "idx":I
    :cond_3
    const/4 v0, 0x0

    .line 635
    :goto_2
    const/16 v1, 0x8

    if-ge v0, v1, :cond_4

    .line 636
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->saConfigs:[J

    add-int/lit8 v2, v0, 0x1

    .end local v0    # "idx":I
    .local v2, "idx":I
    aget-wide v0, v1, v0

    invoke-virtual {p1, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    move v0, v2

    goto :goto_2

    .line 638
    .end local v2    # "idx":I
    .restart local v0    # "idx":I
    :cond_4
    const/4 v0, 0x0

    .line 639
    :goto_3
    if-ge v0, v1, :cond_6

    .line 640
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->nsaConfigs:[J

    add-int/lit8 v3, v0, 0x1

    .end local v0    # "idx":I
    .restart local v3    # "idx":I
    aget-wide v4, v2, v0

    invoke-virtual {p1, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    move v0, v3

    goto :goto_3

    .line 628
    .end local v3    # "idx":I
    :cond_5
    :goto_4
    nop

    .line 643
    :cond_6
    :goto_5
    return-void
.end method

.method public size()I
    .locals 1

    .line 845
    iget v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->size:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 849
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 850
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "NvBandConfigData"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 851
    const-string v1, ": version="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->version:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 852
    const-string v1, ", nasConfig="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->nasConfig:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 853
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->lteConfigs:[J

    const-string v2, "]="

    if-eqz v1, :cond_0

    .line 854
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->lteConfigs:[J

    array-length v3, v3

    if-ge v1, v3, :cond_0

    .line 855
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ", lteConfigs["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->lteConfigs:[J

    aget-wide v3, v3, v1

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 854
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 858
    .end local v1    # "i":I
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->saConfigs:[J

    if-eqz v1, :cond_1

    .line 859
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_1
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->saConfigs:[J

    array-length v3, v3

    if-ge v1, v3, :cond_1

    .line 860
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ", saConfigs["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->saConfigs:[J

    aget-wide v3, v3, v1

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 859
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 863
    .end local v1    # "i":I
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->nsaConfigs:[J

    if-eqz v1, :cond_2

    .line 864
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_2
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->nsaConfigs:[J

    array-length v3, v3

    if-ge v1, v3, :cond_2

    .line 865
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ", nsaConfigs["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->nsaConfigs:[J

    aget-wide v3, v3, v1

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 864
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 868
    .end local v1    # "i":I
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
