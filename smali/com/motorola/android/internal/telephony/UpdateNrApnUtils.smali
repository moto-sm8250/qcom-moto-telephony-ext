.class public Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;
.super Ljava/lang/Object;
.source "UpdateNrApnUtils.java"


# static fields
.field private static final ATT_4G_DEFAULT_APN:Ljava/lang/String; = "nxtgenphone"

.field private static final ATT_4G_DEFAULT_APN_LABEL:Ljava/lang/String; = "ATT Nxtgenphone"

.field private static final ATT_CONSUMER_CELLULAR_GID1:Ljava/lang/String; = "2AC9"

.field private static final ATT_CONSUMER_CELLULAR_LTE_DEFAULT_APN:Ljava/lang/String; = "reseller"

.field private static final ATT_CONSUMER_CELLULAR_LTE_DEFAULT_APN_LABEL:Ljava/lang/String; = "reseller"

.field private static final ATT_CONSUMER_CELLULAR_NR_DEFAULT_APN:Ljava/lang/String; = "ereseller"

.field private static final ATT_CONSUMER_CELLULAR_NR_DEFAULT_APN_LABEL:Ljava/lang/String; = "ereseller"

.field private static final ATT_NSA_4G_DUN_APN:Ljava/lang/String; = "hotspot"

.field private static final ATT_NSA_4G_DUN_APN_LABEL:Ljava/lang/String; = "ATT Hotspot"

.field private static final ATT_NSA_DEFAULT_APN:Ljava/lang/String; = "enhancedphone"

.field private static final ATT_NSA_DEFAULT_APN_LABEL:Ljava/lang/String; = "ATT Enhancedphone"

.field private static final ATT_NSA_GID1:Ljava/lang/String; = "53FF"

.field private static final ATT_SA_DEFAULT_APN:Ljava/lang/String; = "nrphone"

.field private static final ATT_SA_DEFAULT_APN_LABEL:Ljava/lang/String; = "ATT Nrphone"

.field private static final ATT_SA_DUN_APN:Ljava/lang/String; = "nrhotspot"

.field private static final ATT_SA_GID1:Ljava/lang/String; = "52FF"

.field protected static final DBG:Z

.field protected static final TAG:Ljava/lang/String; = "MotoExtTM: UpdateNrApnUtils"

.field private static final sATTPLMNs:[Ljava/lang/String;

.field private static final sCricketPLMNs:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 35
    sget-boolean v0, Landroid/os/Build;->IS_DEBUGGABLE:Z

    sput-boolean v0, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->DBG:Z

    .line 38
    const-string v1, "310030"

    const-string v2, "310170"

    const-string v3, "310280"

    const-string v4, "310380"

    const-string v5, "310410"

    const-string v6, "310560"

    const-string v7, "311180"

    const-string v8, "310950"

    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->sATTPLMNs:[Ljava/lang/String;

    .line 41
    const-string v0, "310150"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->sCricketPLMNs:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static isATTSIM(Lcom/android/internal/telephony/Phone;)Z
    .locals 7
    .param p0, "phone"    # Lcom/android/internal/telephony/Phone;

    .line 180
    invoke-virtual {p0}, Lcom/android/internal/telephony/Phone;->getOperatorNumeric()Ljava/lang/String;

    move-result-object v0

    .line 181
    .local v0, "operator":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 182
    return v2

    .line 184
    :cond_0
    sget-object v1, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->sATTPLMNs:[Ljava/lang/String;

    array-length v3, v1

    move v4, v2

    :goto_0
    if-ge v4, v3, :cond_2

    aget-object v5, v1, v4

    .line 185
    .local v5, "plmn":Ljava/lang/String;
    invoke-static {v5, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 186
    const/4 v1, 0x1

    return v1

    .line 184
    .end local v5    # "plmn":Ljava/lang/String;
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 189
    :cond_2
    return v2
.end method

.method private static isCarrierConfigReady(Lcom/android/internal/telephony/Phone;)Z
    .locals 4
    .param p0, "phone"    # Lcom/android/internal/telephony/Phone;

    .line 225
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 226
    return v0

    .line 228
    :cond_0
    invoke-virtual {p0}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Landroid/telephony/CarrierConfigManager;

    .line 229
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/CarrierConfigManager;

    .line 230
    .local v1, "ccManager":Landroid/telephony/CarrierConfigManager;
    if-nez v1, :cond_1

    .line 231
    return v0

    .line 233
    :cond_1
    invoke-virtual {p0}, Lcom/android/internal/telephony/Phone;->getSubId()I

    move-result v2

    .line 234
    .local v2, "subId":I
    invoke-static {v2}, Landroid/telephony/SubscriptionManager;->isValidSubscriptionId(I)Z

    move-result v3

    if-nez v3, :cond_2

    .line 235
    return v0

    .line 237
    :cond_2
    invoke-virtual {v1, v2}, Landroid/telephony/CarrierConfigManager;->getConfigForSubId(I)Landroid/os/PersistableBundle;

    move-result-object v0

    .line 238
    .local v0, "bundle":Landroid/os/PersistableBundle;
    invoke-static {v0}, Landroid/telephony/CarrierConfigManager;->isConfigForIdentifiedCarrier(Landroid/os/PersistableBundle;)Z

    move-result v3

    return v3
.end method

.method private static isCricketSIM(Lcom/android/internal/telephony/Phone;)Z
    .locals 7
    .param p0, "phone"    # Lcom/android/internal/telephony/Phone;

    .line 193
    invoke-virtual {p0}, Lcom/android/internal/telephony/Phone;->getOperatorNumeric()Ljava/lang/String;

    move-result-object v0

    .line 194
    .local v0, "operator":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 195
    return v2

    .line 197
    :cond_0
    sget-object v1, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->sCricketPLMNs:[Ljava/lang/String;

    array-length v3, v1

    move v4, v2

    :goto_0
    if-ge v4, v3, :cond_2

    aget-object v5, v1, v4

    .line 198
    .local v5, "plmn":Ljava/lang/String;
    invoke-static {v5, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 199
    const/4 v1, 0x1

    return v1

    .line 197
    .end local v5    # "plmn":Ljava/lang/String;
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 202
    :cond_2
    return v2
.end method

.method private static isNREnabled(Lcom/android/internal/telephony/Phone;)Z
    .locals 4
    .param p0, "phone"    # Lcom/android/internal/telephony/Phone;

    .line 242
    invoke-virtual {p0}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v0

    const-class v1, Landroid/telephony/CarrierConfigManager;

    .line 243
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/CarrierConfigManager;

    .line 244
    .local v0, "ccManager":Landroid/telephony/CarrierConfigManager;
    invoke-virtual {p0}, Lcom/android/internal/telephony/Phone;->getSubId()I

    move-result v1

    .line 245
    .local v1, "subId":I
    invoke-virtual {v0, v1}, Landroid/telephony/CarrierConfigManager;->getConfigForSubId(I)Landroid/os/PersistableBundle;

    move-result-object v2

    .line 246
    .local v2, "bundle":Landroid/os/PersistableBundle;
    const-string v3, "nr_enabled_bool"

    invoke-virtual {v2, v3}, Landroid/os/PersistableBundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    return v3
.end method

.method public static isNeedToUpdateNrApns(Lcom/android/internal/telephony/Phone;)Z
    .locals 3
    .param p0, "phone"    # Lcom/android/internal/telephony/Phone;

    .line 69
    invoke-static {p0}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->isCarrierConfigReady(Lcom/android/internal/telephony/Phone;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 70
    sget-boolean v0, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->DBG:Z

    if-eqz v0, :cond_0

    const-string v0, "Carrier Config not ready!"

    invoke-static {v0}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->logd(Ljava/lang/String;)V

    .line 71
    :cond_0
    return v1

    .line 74
    :cond_1
    invoke-static {p0}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->isATTSIM(Lcom/android/internal/telephony/Phone;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-static {p0}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->isCricketSIM(Lcom/android/internal/telephony/Phone;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 75
    sget-boolean v0, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->DBG:Z

    if-eqz v0, :cond_2

    const-string v0, "Not ATT or Cricket SIM"

    invoke-static {v0}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->logd(Ljava/lang/String;)V

    .line 76
    :cond_2
    return v1

    .line 79
    :cond_3
    invoke-virtual {p0}, Lcom/android/internal/telephony/Phone;->getGroupIdLevel1()Ljava/lang/String;

    move-result-object v0

    .line 80
    .local v0, "simGid1":Ljava/lang/String;
    const-string v2, "52FF"

    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "53FF"

    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 82
    const-string v2, "2AC9"

    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 83
    sget-boolean v2, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->DBG:Z

    if-eqz v2, :cond_4

    const-string v2, "Not match any GID."

    invoke-static {v2}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->logd(Ljava/lang/String;)V

    .line 84
    :cond_4
    return v1

    .line 87
    :cond_5
    const/4 v1, 0x1

    return v1
.end method

.method private static logd(Ljava/lang/String;)V
    .locals 1
    .param p0, "msg"    # Ljava/lang/String;

    .line 250
    const-string v0, "MotoExtTM: UpdateNrApnUtils"

    invoke-static {v0, p0}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    return-void
.end method

.method private static updateApnName(Lcom/android/internal/telephony/Phone;Landroid/telephony/data/ApnSetting;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 7
    .param p0, "phone"    # Lcom/android/internal/telephony/Phone;
    .param p1, "originApn"    # Landroid/telephony/data/ApnSetting;
    .param p2, "newApnName"    # Ljava/lang/String;
    .param p3, "newApnLabel"    # Ljava/lang/String;

    .line 207
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 208
    .local v0, "updatedApn":Landroid/content/ContentValues;
    const-string v1, "apn"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 210
    const-string v2, "name"

    invoke-virtual {v0, v2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 212
    :cond_0
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "edited"

    invoke-virtual {v0, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 213
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "_ID=? AND "

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    const-string v1, "=? AND "

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "="

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 216
    .local v1, "where":Ljava/lang/String;
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    .line 217
    invoke-virtual {p1}, Landroid/telephony/data/ApnSetting;->getId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v2

    invoke-virtual {p1}, Landroid/telephony/data/ApnSetting;->getApnName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    .line 219
    .local v3, "args":[Ljava/lang/String;
    invoke-virtual {p0}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v6, Landroid/provider/Telephony$Carriers;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v4, v6, v0, v1, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v4

    .line 221
    .local v4, "rst":I
    if-lez v4, :cond_1

    move v2, v5

    :cond_1
    return v2
.end method

.method public static updateNrApns(Lcom/android/internal/telephony/Phone;ILjava/util/List;)Z
    .locals 12
    .param p0, "phone"    # Lcom/android/internal/telephony/Phone;
    .param p1, "nrModebitMask"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/internal/telephony/Phone;",
            "I",
            "Ljava/util/List<",
            "Landroid/telephony/data/ApnSetting;",
            ">;)Z"
        }
    .end annotation

    .line 92
    .local p2, "curApnSettings":Ljava/util/List;, "Ljava/util/List<Landroid/telephony/data/ApnSetting;>;"
    invoke-static {p0}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->isCarrierConfigReady(Lcom/android/internal/telephony/Phone;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 93
    sget-boolean v0, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->DBG:Z

    if-eqz v0, :cond_0

    const-string v0, "Carrier Config not ready!"

    invoke-static {v0}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->logd(Ljava/lang/String;)V

    .line 94
    :cond_0
    return v1

    .line 97
    :cond_1
    const/4 v0, 0x0

    .line 98
    .local v0, "apnUpdated":Z
    if-eqz p2, :cond_2c

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    goto/16 :goto_1c

    .line 104
    :cond_2
    invoke-virtual {p0}, Lcom/android/internal/telephony/Phone;->getGroupIdLevel1()Ljava/lang/String;

    move-result-object v2

    .line 105
    .local v2, "simGid1":Ljava/lang/String;
    invoke-static {p0}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->isATTSIM(Lcom/android/internal/telephony/Phone;)Z

    move-result v3

    const-string v4, "ATT Nxtgenphone"

    const-string v5, "nxtgenphone"

    const/4 v6, 0x1

    if-eqz v3, :cond_14

    const-string v3, "52FF"

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 107
    and-int/lit8 v3, p1, 0x1

    const-string v7, "hotspot"

    const-string v8, "nrhotspot"

    const-string v9, "nrphone"

    if-eqz v3, :cond_b

    invoke-static {p0}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->isNREnabled(Lcom/android/internal/telephony/Phone;)Z

    move-result v3

    if-nez v3, :cond_3

    goto :goto_6

    .line 121
    :cond_3
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/telephony/data/ApnSetting;

    .line 122
    .local v4, "apn":Landroid/telephony/data/ApnSetting;
    invoke-virtual {v4}, Landroid/telephony/data/ApnSetting;->getApnName()Ljava/lang/String;

    move-result-object v10

    invoke-static {v5, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 123
    if-nez v0, :cond_5

    const-string v10, "ATT Nrphone"

    invoke-static {p0, v4, v9, v10}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->updateApnName(Lcom/android/internal/telephony/Phone;Landroid/telephony/data/ApnSetting;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_4

    goto :goto_1

    :cond_4
    move v10, v1

    goto :goto_2

    :cond_5
    :goto_1
    move v10, v6

    :goto_2
    move v0, v10

    goto :goto_5

    .line 125
    :cond_6
    invoke-virtual {v4}, Landroid/telephony/data/ApnSetting;->getApnName()Ljava/lang/String;

    move-result-object v10

    invoke-static {v7, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_9

    .line 126
    if-nez v0, :cond_8

    const/4 v10, 0x0

    invoke-static {p0, v4, v8, v10}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->updateApnName(Lcom/android/internal/telephony/Phone;Landroid/telephony/data/ApnSetting;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_7

    goto :goto_3

    :cond_7
    move v10, v1

    goto :goto_4

    :cond_8
    :goto_3
    move v10, v6

    :goto_4
    move v0, v10

    .line 128
    .end local v4    # "apn":Landroid/telephony/data/ApnSetting;
    :cond_9
    :goto_5
    goto :goto_0

    :cond_a
    goto/16 :goto_1b

    .line 108
    :cond_b
    :goto_6
    sget-boolean v3, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->DBG:Z

    if-eqz v3, :cond_c

    const-string v3, "Not a SA device."

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->logd(Ljava/lang/String;)V

    .line 110
    :cond_c
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_7
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_13

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/telephony/data/ApnSetting;

    .line 111
    .local v10, "apn":Landroid/telephony/data/ApnSetting;
    invoke-virtual {v10}, Landroid/telephony/data/ApnSetting;->getApnName()Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v11}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_f

    .line 112
    if-nez v0, :cond_e

    invoke-static {p0, v10, v5, v4}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->updateApnName(Lcom/android/internal/telephony/Phone;Landroid/telephony/data/ApnSetting;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_d

    goto :goto_8

    :cond_d
    move v11, v1

    goto :goto_9

    :cond_e
    :goto_8
    move v11, v6

    :goto_9
    move v0, v11

    goto :goto_c

    .line 114
    :cond_f
    invoke-virtual {v10}, Landroid/telephony/data/ApnSetting;->getApnName()Ljava/lang/String;

    move-result-object v11

    invoke-static {v8, v11}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_12

    .line 115
    if-nez v0, :cond_11

    const-string v11, "ATT Hotspot"

    invoke-static {p0, v10, v7, v11}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->updateApnName(Lcom/android/internal/telephony/Phone;Landroid/telephony/data/ApnSetting;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_10

    goto :goto_a

    :cond_10
    move v11, v1

    goto :goto_b

    :cond_11
    :goto_a
    move v11, v6

    :goto_b
    move v0, v11

    .line 118
    .end local v10    # "apn":Landroid/telephony/data/ApnSetting;
    :cond_12
    :goto_c
    goto :goto_7

    :cond_13
    goto/16 :goto_1b

    .line 130
    :cond_14
    invoke-static {p0}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->isATTSIM(Lcom/android/internal/telephony/Phone;)Z

    move-result v3

    if-eqz v3, :cond_20

    const-string v3, "53FF"

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_20

    .line 132
    and-int/lit8 v3, p1, 0x2

    const-string v7, "enhancedphone"

    if-eqz v3, :cond_1a

    invoke-static {p0}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->isNREnabled(Lcom/android/internal/telephony/Phone;)Z

    move-result v3

    if-nez v3, :cond_15

    goto :goto_10

    .line 143
    :cond_15
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_19

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/telephony/data/ApnSetting;

    .line 144
    .restart local v4    # "apn":Landroid/telephony/data/ApnSetting;
    invoke-virtual {v4}, Landroid/telephony/data/ApnSetting;->getApnName()Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_18

    .line 145
    if-nez v0, :cond_17

    const-string v8, "ATT Enhancedphone"

    invoke-static {p0, v4, v7, v8}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->updateApnName(Lcom/android/internal/telephony/Phone;Landroid/telephony/data/ApnSetting;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_16

    goto :goto_e

    :cond_16
    move v8, v1

    goto :goto_f

    :cond_17
    :goto_e
    move v8, v6

    :goto_f
    move v0, v8

    .line 148
    .end local v4    # "apn":Landroid/telephony/data/ApnSetting;
    :cond_18
    goto :goto_d

    :cond_19
    goto/16 :goto_1b

    .line 133
    :cond_1a
    :goto_10
    sget-boolean v3, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->DBG:Z

    if-eqz v3, :cond_1b

    const-string v3, "Not a NSA device."

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->logd(Ljava/lang/String;)V

    .line 135
    :cond_1b
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_11
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/telephony/data/ApnSetting;

    .line 136
    .local v8, "apn":Landroid/telephony/data/ApnSetting;
    invoke-virtual {v8}, Landroid/telephony/data/ApnSetting;->getApnName()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_1e

    .line 137
    if-nez v0, :cond_1d

    invoke-static {p0, v8, v5, v4}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->updateApnName(Lcom/android/internal/telephony/Phone;Landroid/telephony/data/ApnSetting;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1c

    goto :goto_12

    :cond_1c
    move v9, v1

    goto :goto_13

    :cond_1d
    :goto_12
    move v9, v6

    :goto_13
    move v0, v9

    .line 140
    .end local v8    # "apn":Landroid/telephony/data/ApnSetting;
    :cond_1e
    goto :goto_11

    :cond_1f
    goto/16 :goto_1b

    .line 151
    :cond_20
    invoke-static {p0}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->isATTSIM(Lcom/android/internal/telephony/Phone;)Z

    move-result v3

    if-eqz v3, :cond_2a

    const-string v3, "2AC9"

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 152
    const-string v3, "reseller"

    const-string v4, "ereseller"

    if-eqz p1, :cond_25

    invoke-static {p0}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->isNREnabled(Lcom/android/internal/telephony/Phone;)Z

    move-result v5

    if-nez v5, :cond_21

    goto :goto_17

    .line 165
    :cond_21
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_14
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2a

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/telephony/data/ApnSetting;

    .line 166
    .local v7, "apn":Landroid/telephony/data/ApnSetting;
    invoke-virtual {v7}, Landroid/telephony/data/ApnSetting;->getApnName()Ljava/lang/String;

    move-result-object v8

    invoke-static {v3, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_24

    .line 167
    if-nez v0, :cond_23

    .line 168
    invoke-static {p0, v7, v4, v4}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->updateApnName(Lcom/android/internal/telephony/Phone;Landroid/telephony/data/ApnSetting;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_22

    goto :goto_15

    :cond_22
    move v8, v1

    goto :goto_16

    :cond_23
    :goto_15
    move v8, v6

    :goto_16
    move v0, v8

    .line 171
    .end local v7    # "apn":Landroid/telephony/data/ApnSetting;
    :cond_24
    goto :goto_14

    .line 154
    :cond_25
    :goto_17
    sget-boolean v5, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->DBG:Z

    if-eqz v5, :cond_26

    const-string v5, "Not a NR device."

    invoke-static {v5}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->logd(Ljava/lang/String;)V

    .line 156
    :cond_26
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_18
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2a

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/telephony/data/ApnSetting;

    .line 157
    .restart local v7    # "apn":Landroid/telephony/data/ApnSetting;
    invoke-virtual {v7}, Landroid/telephony/data/ApnSetting;->getApnName()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_29

    .line 158
    if-nez v0, :cond_28

    .line 159
    invoke-static {p0, v7, v3, v3}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->updateApnName(Lcom/android/internal/telephony/Phone;Landroid/telephony/data/ApnSetting;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_27

    goto :goto_19

    :cond_27
    move v8, v1

    goto :goto_1a

    :cond_28
    :goto_19
    move v8, v6

    :goto_1a
    move v0, v8

    .line 162
    .end local v7    # "apn":Landroid/telephony/data/ApnSetting;
    :cond_29
    goto :goto_18

    .line 175
    :cond_2a
    :goto_1b
    sget-boolean v1, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->DBG:Z

    if-eqz v1, :cond_2b

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "APN updated = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->logd(Ljava/lang/String;)V

    .line 176
    :cond_2b
    return v0

    .line 100
    .end local v2    # "simGid1":Ljava/lang/String;
    :cond_2c
    :goto_1c
    sget-boolean v2, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->DBG:Z

    if-eqz v2, :cond_2d

    const-string v2, "No APN to update."

    invoke-static {v2}, Lcom/motorola/android/internal/telephony/UpdateNrApnUtils;->logd(Ljava/lang/String;)V

    .line 101
    :cond_2d
    return v1
.end method
