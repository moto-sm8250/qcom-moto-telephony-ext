.class public Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;
.super Lcom/motorola/android/internal/telephony/MotoExtTelephonyServiceBase;
.source "QcomMotoExtTelephonyService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$QcrilMsgTunnelConnection;,
        Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$MessageHandler;,
        Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$MessageRequest;
    }
.end annotation


# static fields
.field private static final CMD_SET_SIMCARD_NUMBER:I = 0x7d5

.field private static final CMD_UNLOCK_PERSO:I = 0x7d4

.field private static final DBG:Z

.field private static final EVENT_MOTO_OEM_RIL_START:I = 0x7d0

.field private static final EVENT_SET_SIMCARD_NUMBER_DONE:I = 0x7d6

.field private static final EVENT_UNSOL_OEM_HOOK_RAW:I = 0x7d1

.field private static final EVENT_VENDOR_SERVICE_DIED:I = 0x7d2

.field private static final GENERIC_FAILURE:I = -0x1

.field private static final INVALID_INPUT:I = -0x2

.field private static final QCRILMSGSERVICE_CONNECT_DELAY_MILLIS:I = 0xfa0

.field private static final QCRIL_MSG_TUNNEL_PACKAGE_NAME:Ljava/lang/String; = "com.qualcomm.qcrilmsgtunnel"

.field private static final QCRIL_MSG_TUNNEL_SERVICE_NAME:Ljava/lang/String; = "com.qualcomm.qcrilmsgtunnel.QcrilMsgTunnelService"

.field private static final REQUEST_IN_PROGRESS:I = -0x3

.field private static final SUCCESS:I = 0x0

.field private static final TAG:Ljava/lang/String; = "MotoExtTM: QcomMotoExtTelephonyService"

.field private static final UNLOCK_DEVICE_ERROR:I = 0x1

.field private static final VDBG:Z = false

.field private static sInstance:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

.field private static final sPhoneCount:I


# instance fields
.field private mEndcStatus:[Z

.field private mExtTelephony:Lorg/codeaurora/internal/IExtTelephony;

.field private mHandler:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$MessageHandler;

.field private mHandlerThread:Landroid/os/HandlerThread;

.field private mLteErrorList:[Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/util/List<",
            "Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteError;",
            ">;"
        }
    .end annotation
.end field

.field private mNrBearers:[I

.field private mNrDataIconTypes:[I

.field private mNrStateManager:Lcom/motorola/android/internal/telephony/NrStateManager;

.field private mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

.field private mOemHookIndication:[Lcom/motorola/android/internal/telephony/IMotoOemHookIndication;

.field private mOemHookIndicationProcess:Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;

.field private mQcrilMsgService:Lcom/qualcomm/qcrilmsgtunnel/IQcrilMsgTunnel;

.field private final mQcrilMsgServiceDeathRecipient:Landroid/os/IBinder$DeathRecipient;

.field private mQcrilMsgTunnelConnection:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$QcrilMsgTunnelConnection;

.field private mSubCtrl:Lcom/android/internal/telephony/SubscriptionController;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 103
    sget-boolean v0, Lcom/motorola/android/internal/telephony/MotoExtTelephonyServiceBase;->DBG:Z

    sput-boolean v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    .line 107
    const/4 v0, 0x0

    sput-object v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->sInstance:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    .line 138
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getPhoneCount()I

    move-result v0

    sput v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->sPhoneCount:I

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .line 168
    invoke-direct {p0, p1}, Lcom/motorola/android/internal/telephony/MotoExtTelephonyServiceBase;-><init>(Landroid/content/Context;)V

    .line 111
    invoke-direct {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getIExtTelephony()Lorg/codeaurora/internal/IExtTelephony;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mExtTelephony:Lorg/codeaurora/internal/IExtTelephony;

    .line 136
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mQcrilMsgService:Lcom/qualcomm/qcrilmsgtunnel/IQcrilMsgTunnel;

    .line 139
    sget v1, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->sPhoneCount:I

    new-array v2, v1, [Lcom/motorola/android/internal/telephony/MotoOemHookIndication;

    iput-object v2, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mOemHookIndication:[Lcom/motorola/android/internal/telephony/IMotoOemHookIndication;

    .line 140
    new-array v2, v1, [Ljava/util/ArrayList;

    iput-object v2, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mLteErrorList:[Ljava/util/List;

    .line 142
    iput-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mQcrilMsgTunnelConnection:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$QcrilMsgTunnelConnection;

    .line 147
    new-array v2, v1, [I

    iput-object v2, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNrDataIconTypes:[I

    .line 148
    new-array v2, v1, [I

    iput-object v2, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNrBearers:[I

    .line 149
    new-array v1, v1, [Z

    iput-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mEndcStatus:[Z

    .line 3217
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$3;

    invoke-direct {v1, p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$3;-><init>(Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;)V

    iput-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mQcrilMsgServiceDeathRecipient:Landroid/os/IBinder$DeathRecipient;

    .line 169
    sget-boolean v1, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v1, :cond_0

    const-string v1, "QcomMotoExtTelephonyService init"

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 171
    :cond_0
    invoke-static {}, Lcom/android/internal/telephony/SubscriptionController;->getInstance()Lcom/android/internal/telephony/SubscriptionController;

    move-result-object v1

    iput-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mSubCtrl:Lcom/android/internal/telephony/SubscriptionController;

    .line 172
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-direct {v1, p0}, Lcom/motorola/android/internal/telephony/QcomNvManager;-><init>(Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;)V

    iput-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    .line 173
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;

    invoke-direct {v1, p0}, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;-><init>(Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;)V

    iput-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mOemHookIndicationProcess:Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;

    .line 175
    new-instance v1, Landroid/os/HandlerThread;

    const-string v2, "MotoExtTM: QcomMotoExtTelephonyService"

    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mHandlerThread:Landroid/os/HandlerThread;

    .line 176
    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    .line 177
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$MessageHandler;

    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$MessageHandler;-><init>(Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mHandler:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$MessageHandler;

    .line 179
    invoke-direct {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->registerForAllEvents()V

    .line 180
    new-instance v1, Lcom/motorola/android/internal/telephony/NrStateManager;

    sget v2, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->sPhoneCount:I

    invoke-direct {v1, p0, v2, p1}, Lcom/motorola/android/internal/telephony/NrStateManager;-><init>(Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;ILandroid/content/Context;)V

    iput-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNrStateManager:Lcom/motorola/android/internal/telephony/NrStateManager;

    .line 182
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    sget v2, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->sPhoneCount:I

    if-ge v1, v2, :cond_1

    .line 183
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mOemHookIndication:[Lcom/motorola/android/internal/telephony/IMotoOemHookIndication;

    new-instance v3, Lcom/motorola/android/internal/telephony/MotoOemHookIndication;

    invoke-direct {v3, p0}, Lcom/motorola/android/internal/telephony/MotoOemHookIndication;-><init>(Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;)V

    aput-object v3, v2, v1

    .line 184
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mLteErrorList:[Ljava/util/List;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    aput-object v3, v2, v1

    .line 182
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 187
    .end local v1    # "i":I
    :cond_1
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$QcrilMsgTunnelConnection;

    invoke-direct {v1, p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$QcrilMsgTunnelConnection;-><init>(Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$1;)V

    iput-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mQcrilMsgTunnelConnection:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$QcrilMsgTunnelConnection;

    .line 189
    invoke-direct {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->bindToQcrilMsgTunnelService()V

    .line 191
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->publish()V

    .line 192
    return-void
.end method

.method static synthetic access$100()Z
    .locals 1

    .line 101
    sget-boolean v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    return v0
.end method

.method static synthetic access$200(Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;)V
    .locals 0
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    .line 101
    invoke-direct {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->bindToQcrilMsgTunnelService()V

    return-void
.end method

.method static synthetic access$300(Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;)Lorg/codeaurora/internal/IExtTelephony;
    .locals 1
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    .line 101
    invoke-direct {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getIExtTelephony()Lorg/codeaurora/internal/IExtTelephony;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Ljava/lang/String;)Z
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;

    .line 101
    invoke-static {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->isEVDOOnFemto(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;)Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$MessageHandler;
    .locals 1
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    .line 101
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mHandler:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$MessageHandler;

    return-object v0
.end method

.method static synthetic access$600(Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;)Lcom/qualcomm/qcrilmsgtunnel/IQcrilMsgTunnel;
    .locals 1
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    .line 101
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mQcrilMsgService:Lcom/qualcomm/qcrilmsgtunnel/IQcrilMsgTunnel;

    return-object v0
.end method

.method static synthetic access$602(Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;Lcom/qualcomm/qcrilmsgtunnel/IQcrilMsgTunnel;)Lcom/qualcomm/qcrilmsgtunnel/IQcrilMsgTunnel;
    .locals 0
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;
    .param p1, "x1"    # Lcom/qualcomm/qcrilmsgtunnel/IQcrilMsgTunnel;

    .line 101
    iput-object p1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mQcrilMsgService:Lcom/qualcomm/qcrilmsgtunnel/IQcrilMsgTunnel;

    return-object p1
.end method

.method static synthetic access$700()I
    .locals 1

    .line 101
    sget v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->sPhoneCount:I

    return v0
.end method

.method static synthetic access$800(Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;)Landroid/os/IBinder$DeathRecipient;
    .locals 1
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    .line 101
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mQcrilMsgServiceDeathRecipient:Landroid/os/IBinder$DeathRecipient;

    return-object v0
.end method

.method static synthetic access$900(Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;)[Lcom/motorola/android/internal/telephony/IMotoOemHookIndication;
    .locals 1
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    .line 101
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mOemHookIndication:[Lcom/motorola/android/internal/telephony/IMotoOemHookIndication;

    return-object v0
.end method

.method private bindToQcrilMsgTunnelService()V
    .locals 4

    .line 3228
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 3229
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "com.qualcomm.qcrilmsgtunnel"

    const-string v2, "com.qualcomm.qcrilmsgtunnel.QcrilMsgTunnelService"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 3230
    sget-boolean v1, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v1, :cond_0

    .line 3231
    const-string v1, "Starting QcrilMsgTunnel Service"

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 3233
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mQcrilMsgTunnelConnection:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$QcrilMsgTunnelConnection;

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v1

    .line 3235
    .local v1, "status":Z
    return-void
.end method

.method private getAllCAConfigList(I)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;
    .locals 3
    .param p1, "phoneId"    # I

    .line 848
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v0, p1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getCaBwCombo(I)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;

    move-result-object v0

    .line 849
    .local v0, "caBwCombo":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;
    sget-boolean v1, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v1, :cond_0

    .line 850
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "CaBwCombo : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 852
    :cond_0
    return-object v0
.end method

.method private getIExtTelephony()Lorg/codeaurora/internal/IExtTelephony;
    .locals 1

    .line 3207
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mExtTelephony:Lorg/codeaurora/internal/IExtTelephony;

    if-nez v0, :cond_0

    .line 3208
    const-string v0, "extphone"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Lorg/codeaurora/internal/IExtTelephony$Stub;->asInterface(Landroid/os/IBinder;)Lorg/codeaurora/internal/IExtTelephony;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mExtTelephony:Lorg/codeaurora/internal/IExtTelephony;

    .line 3210
    :cond_0
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mExtTelephony:Lorg/codeaurora/internal/IExtTelephony;

    return-object v0
.end method

.method public static getInstance()Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;
    .locals 2

    .line 198
    sget-object v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->sInstance:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    if-nez v0, :cond_0

    .line 199
    const-string v0, "MotoExtTM: QcomMotoExtTelephonyService"

    const-string v1, "getInstance null"

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    :cond_0
    sget-object v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->sInstance:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    return-object v0
.end method

.method public static init(Landroid/content/Context;)Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .line 156
    const-class v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    monitor-enter v0

    .line 157
    :try_start_0
    sget-object v1, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->sInstance:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    if-nez v1, :cond_0

    .line 158
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-direct {v1, p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->sInstance:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    goto :goto_0

    .line 160
    :cond_0
    const-string v1, "MotoExtTM: QcomMotoExtTelephonyService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "init() called multiple times!  sInstance = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->sInstance:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    :goto_0
    sget-object v1, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->sInstance:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    monitor-exit v0

    return-object v1

    .line 163
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private static isEVDOOnFemto(Ljava/lang/String;)Z
    .locals 8
    .param p0, "str"    # Ljava/lang/String;

    .line 1217
    const/16 v0, 0xc

    .line 1218
    .local v0, "FEMTO_SUBNET_INDEX":I
    const/16 v1, 0xc

    .line 1220
    .local v1, "FEMTO_SUBNET_MASK":I
    const/4 v2, 0x0

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_2

    const/16 v3, 0x2f

    .line 1221
    invoke-virtual {p0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    move v4, v3

    .local v4, "index":I
    const/4 v5, -0x1

    if-eq v3, v5, :cond_2

    add-int/lit8 v3, v4, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ne v3, v5, :cond_0

    goto :goto_0

    .line 1224
    :cond_0
    add-int/lit8 v3, v4, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {p0, v3, v5}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 1225
    .local v3, "length":I
    const/4 v5, 0x0

    .line 1226
    .local v5, "subnet_value":I
    const/16 v6, 0x31

    if-le v3, v6, :cond_1

    mul-int/lit8 v6, v4, 0x4

    if-gt v3, v6, :cond_1

    .line 1227
    const/16 v6, 0xc

    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-static {v7}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v5

    .line 1228
    and-int/lit8 v7, v5, 0xc

    if-ne v7, v6, :cond_1

    .line 1229
    const/4 v2, 0x1

    return v2

    .line 1232
    :cond_1
    return v2

    .line 1222
    .end local v3    # "length":I
    .end local v4    # "index":I
    .end local v5    # "subnet_value":I
    :cond_2
    :goto_0
    return v2
.end method

.method private notifyCAEnableStatusChanged()V
    .locals 1

    .line 1097
    const-string v0, "CA"

    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->notifyNVChanges(Ljava/lang/String;)V

    .line 1098
    return-void
.end method

.method private registerForAllEvents()V
    .locals 0

    .line 195
    return-void
.end method

.method private sendErrorResponse(Landroid/os/Message;Ljava/lang/String;)V
    .locals 2
    .param p1, "response"    # Landroid/os/Message;
    .param p2, "errString"    # Ljava/lang/String;

    .line 3267
    if-eqz p1, :cond_0

    .line 3268
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 3269
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {p1}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;)Landroid/os/AsyncResult;

    move-result-object v1

    iput-object v0, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    .line 3270
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 3272
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    return-void
.end method

.method private sendRequest(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "command"    # I
    .param p2, "argument"    # Ljava/lang/Object;

    .line 349
    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->sendRequest(ILjava/lang/Object;Ljava/lang/Integer;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private sendRequest(ILjava/lang/Object;Ljava/lang/Integer;)Ljava/lang/Object;
    .locals 3
    .param p1, "command"    # I
    .param p2, "argument"    # Ljava/lang/Object;
    .param p3, "subId"    # Ljava/lang/Integer;

    .line 358
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mHandler:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$MessageHandler;

    invoke-virtual {v1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$MessageHandler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_1

    .line 362
    new-instance v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$MessageRequest;

    invoke-direct {v0, p2, p3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$MessageRequest;-><init>(Ljava/lang/Object;Ljava/lang/Integer;)V

    .line 363
    .local v0, "request":Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$MessageRequest;
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mHandler:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$MessageHandler;

    invoke-virtual {v1, p1, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$MessageHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    .line 364
    .local v1, "msg":Landroid/os/Message;
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    .line 367
    monitor-enter v0

    .line 368
    :goto_0
    :try_start_0
    iget-object v2, v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$MessageRequest;->result:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 370
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 373
    :goto_1
    goto :goto_0

    .line 371
    :catch_0
    move-exception v2

    goto :goto_1

    .line 375
    :cond_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 376
    iget-object v2, v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$MessageRequest;->result:Ljava/lang/Object;

    return-object v2

    .line 375
    :catchall_0
    move-exception v2

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v2

    .line 359
    .end local v0    # "request":Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$MessageRequest;
    .end local v1    # "msg":Landroid/os/Message;
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "This method will deadlock if called from the work thread."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public CSGPerformNWScan(ILjava/lang/String;Lcom/motorola/android/internal/telephony/IMotoCSGNWScanCB;)V
    .locals 4
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;
    .param p3, "scanCB"    # Lcom/motorola/android/internal/telephony/IMotoCSGNWScanCB;

    .line 2111
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "CSGPerformNWScan"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const-string v1, "onSearchFailed exception"

    if-nez v0, :cond_0

    .line 2114
    :try_start_0
    invoke-interface {p3}, Lcom/motorola/android/internal/telephony/IMotoCSGNWScanCB;->onSearchFailed()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2117
    goto :goto_0

    .line 2115
    :catch_0
    move-exception v0

    .line 2116
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .line 2118
    .end local v0    # "e":Landroid/os/RemoteException;
    :goto_0
    return-void

    .line 2121
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2122
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2124
    :try_start_1
    invoke-interface {p3}, Lcom/motorola/android/internal/telephony/IMotoCSGNWScanCB;->onSearchFailed()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 2127
    goto :goto_1

    .line 2125
    :catch_1
    move-exception v2

    .line 2126
    .local v2, "e":Landroid/os/RemoteException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .line 2128
    .end local v2    # "e":Landroid/os/RemoteException;
    :goto_1
    return-void

    .line 2131
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->CSGPerformNWScan(ILcom/motorola/android/internal/telephony/IMotoCSGNWScanCB;)V

    .line 2132
    return-void
.end method

.method public CSGSetSysSelectPref(ILcom/motorola/android/telephony/MotoExtTelephonyInfo$CsgSelectionInfo;Lcom/motorola/android/internal/telephony/IMotoCSGSelectionCB;)V
    .locals 4
    .param p1, "subId"    # I
    .param p2, "info"    # Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CsgSelectionInfo;
    .param p3, "selectionCB"    # Lcom/motorola/android/internal/telephony/IMotoCSGSelectionCB;

    .line 2137
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 2139
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2140
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 2142
    const/4 v1, -0x1

    :try_start_0
    invoke-interface {p3, v1}, Lcom/motorola/android/internal/telephony/IMotoCSGSelectionCB;->onSelectionDone(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2145
    goto :goto_0

    .line 2143
    :catch_0
    move-exception v1

    .line 2144
    .local v1, "e":Landroid/os/RemoteException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onSelectionDone exception"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .line 2146
    .end local v1    # "e":Landroid/os/RemoteException;
    :goto_0
    return-void

    .line 2149
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2, p3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->CSGSetSysSelectPref(ILcom/motorola/android/telephony/MotoExtTelephonyInfo$CsgSelectionInfo;Lcom/motorola/android/internal/telephony/IMotoCSGSelectionCB;)V

    .line 2150
    return-void
.end method

.method public activateUiccCard(I)I
    .locals 6
    .param p1, "subId"    # I

    .line 667
    sget-boolean v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    const-string v1, "activateUiccCard subId="

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 668
    :cond_0
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 670
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mSubCtrl:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/SubscriptionController;->getSlotIndex(I)I

    move-result v0

    .line 671
    .local v0, "slotId":I
    invoke-static {v0}, Landroid/telephony/SubscriptionManager;->isValidSlotIndex(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 672
    const/4 v1, -0x1

    return v1

    .line 675
    :cond_1
    const/4 v2, -0x1

    .line 676
    .local v2, "activateRet":I
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mSubCtrl:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v3}, Lcom/android/internal/telephony/SubscriptionController;->canDisablePhysicalSubscription()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 677
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mSubCtrl:Lcom/android/internal/telephony/SubscriptionController;

    const/4 v4, 0x1

    invoke-virtual {v3, v4, p1}, Lcom/android/internal/telephony/SubscriptionController;->setSubscriptionEnabled(ZI)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 678
    const/4 v2, 0x0

    goto :goto_1

    .line 682
    :cond_2
    :try_start_0
    invoke-direct {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getIExtTelephony()Lorg/codeaurora/internal/IExtTelephony;

    move-result-object v3

    invoke-interface {v3, v0}, Lorg/codeaurora/internal/IExtTelephony;->activateUiccCard(I)I

    move-result v3
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    move v2, v3

    .line 687
    :goto_0
    goto :goto_1

    .line 685
    :catch_0
    move-exception v3

    .line 686
    .local v3, "ex":Ljava/lang/NullPointerException;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "NullPointerException @activateUiccCard"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    goto :goto_1

    .line 683
    .end local v3    # "ex":Ljava/lang/NullPointerException;
    :catch_1
    move-exception v3

    .line 684
    .local v3, "ex":Landroid/os/RemoteException;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "RemoteException @activateUiccCard"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .end local v3    # "ex":Landroid/os/RemoteException;
    goto :goto_0

    .line 690
    :cond_3
    :goto_1
    sget-boolean v3, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v3, :cond_4

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " Ret="

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 691
    :cond_4
    return v2
.end method

.method public clearLteAvailableFile(I)Z
    .locals 2
    .param p1, "subId"    # I

    .line 1901
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 1903
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1904
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1905
    const/4 v1, 0x0

    return v1

    .line 1908
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->clearLteAvailableFile(I)Z

    move-result v1

    return v1
.end method

.method public deactivateUiccCard(I)I
    .locals 6
    .param p1, "subId"    # I

    .line 705
    sget-boolean v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    const-string v1, "deactivateUiccCard subId="

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 706
    :cond_0
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 708
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mSubCtrl:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/SubscriptionController;->getSlotIndex(I)I

    move-result v0

    .line 709
    .local v0, "slotId":I
    invoke-static {v0}, Landroid/telephony/SubscriptionManager;->isValidSlotIndex(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 710
    const/4 v1, -0x1

    return v1

    .line 713
    :cond_1
    const/4 v2, -0x1

    .line 714
    .local v2, "deactivateRet":I
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mSubCtrl:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v3}, Lcom/android/internal/telephony/SubscriptionController;->canDisablePhysicalSubscription()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 715
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mSubCtrl:Lcom/android/internal/telephony/SubscriptionController;

    const/4 v4, 0x0

    invoke-virtual {v3, v4, p1}, Lcom/android/internal/telephony/SubscriptionController;->setSubscriptionEnabled(ZI)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 716
    const/4 v2, 0x0

    goto :goto_1

    .line 720
    :cond_2
    :try_start_0
    invoke-direct {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getIExtTelephony()Lorg/codeaurora/internal/IExtTelephony;

    move-result-object v3

    invoke-interface {v3, v0}, Lorg/codeaurora/internal/IExtTelephony;->deactivateUiccCard(I)I

    move-result v3
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    move v2, v3

    .line 725
    :goto_0
    goto :goto_1

    .line 723
    :catch_0
    move-exception v3

    .line 724
    .local v3, "ex":Ljava/lang/NullPointerException;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "NullPointerException @deactivateUiccCard"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    goto :goto_1

    .line 721
    .end local v3    # "ex":Ljava/lang/NullPointerException;
    :catch_1
    move-exception v3

    .line 722
    .local v3, "ex":Landroid/os/RemoteException;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "RemoteException @deactivateUiccCard"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .end local v3    # "ex":Landroid/os/RemoteException;
    goto :goto_0

    .line 728
    :cond_3
    :goto_1
    sget-boolean v3, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v3, :cond_4

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " Ret="

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 729
    :cond_4
    return v2
.end method

.method public disableAllCAMultiDL(I)Z
    .locals 2
    .param p1, "subId"    # I

    .line 1086
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 1088
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1089
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1090
    const/4 v1, 0x0

    return v1

    .line 1093
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->disableAllCAMultiDL(I)Z

    move-result v1

    return v1
.end method

.method public enableCAPlusBandWidthFilter(IZ)Z
    .locals 4
    .param p1, "subId"    # I
    .param p2, "enable"    # Z

    .line 825
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 827
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 828
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 829
    const/4 v1, 0x0

    return v1

    .line 832
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->enableCAPlusBandWidthFilter(IZ)Z

    move-result v1

    .line 833
    .local v1, "ret":Z
    sget-boolean v2, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v2, :cond_1

    .line 834
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "enableCAPlusBandWidthFilter: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, "  result:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 837
    :cond_1
    return v1
.end method

.method public get1xAdvancedEnabled(ILjava/lang/String;)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 426
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "get1xAdvancedEnabled"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 428
    return v1

    .line 431
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 432
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 433
    return v1

    .line 436
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->get1xAdvancedEnabled(I)Z

    move-result v1

    return v1
.end method

.method public get4x4MimoEnabled(ILjava/lang/String;)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 1514
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "get4x4MimoEnabled"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1516
    return v1

    .line 1519
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1520
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1521
    return v1

    .line 1524
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->get4x4MimoEnabled(I)Z

    move-result v1

    return v1
.end method

.method public getActiveSingleSimSlot(ILjava/lang/String;)I
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 3464
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getActiveSingleSimSlot"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 3466
    const/4 v0, -0x1

    return v0

    .line 3469
    :cond_0
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mDefaultPhone:Lcom/android/internal/telephony/Phone;

    invoke-virtual {v0}, Lcom/android/internal/telephony/Phone;->getPhoneId()I

    move-result v0

    .line 3471
    .local v0, "phoneId":I
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getActiveSingleSimSlot(I)I

    move-result v1

    return v1
.end method

.method public getBC10Enabled(ILjava/lang/String;)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 387
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getBC10Enabled"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 389
    return v1

    .line 392
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 393
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 394
    return v1

    .line 397
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getBC10Enabled(I)Z

    move-result v1

    return v1
.end method

.method public getBandConfigBitMap(ILjava/lang/String;)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$BandConfigInfo;
    .locals 6
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 1996
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getBandConfigBitMap"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1998
    return-object v1

    .line 2001
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2002
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2003
    return-object v1

    .line 2006
    :cond_1
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v2, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getBandClassSupport(I)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;

    move-result-object v2

    .line 2007
    .local v2, "bc":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;
    if-nez v2, :cond_2

    .line 2008
    return-object v1

    .line 2011
    :cond_2
    new-instance v1, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$BandConfigInfo;

    invoke-virtual {v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->getLteConfigBytes()[B

    move-result-object v3

    invoke-virtual {v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->getSAConfigBytes()[B

    move-result-object v4

    .line 2012
    invoke-virtual {v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->getNSAConfigBytes()[B

    move-result-object v5

    invoke-direct {v1, v3, v4, v5}, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$BandConfigInfo;-><init>([B[B[B)V

    .line 2014
    .local v1, "info":Lcom/motorola/android/telephony/MotoExtTelephonyInfo$BandConfigInfo;
    sget-boolean v3, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v3, :cond_3

    .line 2015
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getBandConfig:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 2016
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "LteBandConfigBitmap:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$BandConfigInfo;->getLteBandConfigBitmap()[B

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$BandConfigInfo;->getConfigString([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 2017
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "SABandConfigBitmap:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$BandConfigInfo;->getSABandConfigBitmap()[B

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$BandConfigInfo;->getConfigString([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 2018
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "NSABandConfigBitmap:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$BandConfigInfo;->getNSABandConfigBitmap()[B

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$BandConfigInfo;->getConfigString([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 2021
    :cond_3
    return-object v1
.end method

.method public getBandPriorityList(ILjava/lang/String;)[I
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 1418
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getBandPriorityList"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1420
    return-object v1

    .line 1423
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1424
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1425
    return-object v1

    .line 1428
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getBandPriorityList(I)[I

    move-result-object v1

    return-object v1
.end method

.method public getCABitmapForBand(IILjava/lang/String;)[B
    .locals 3
    .param p1, "primaryBandId"    # I
    .param p2, "subId"    # I
    .param p3, "callingPackage"    # Ljava/lang/String;

    .line 1935
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getCABitmapForBand"

    invoke-static {v0, p2, p3, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1937
    return-object v1

    .line 1940
    :cond_0
    invoke-virtual {p0, p2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1941
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1942
    return-object v1

    .line 1945
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getCABitmapForBand(II)[B

    move-result-object v1

    return-object v1
.end method

.method public getCAEnable(IIILjava/lang/String;)Z
    .locals 6
    .param p1, "priBand"    # I
    .param p2, "secBand"    # I
    .param p3, "subId"    # I
    .param p4, "callingPackage"    # Ljava/lang/String;

    .line 2037
    const/4 v0, 0x0

    .line 2038
    .local v0, "result":Z
    invoke-static {p1}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->isValidBand(I)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    invoke-static {p2}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->isValidBand(I)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 2043
    :cond_0
    invoke-virtual {p0, p1, p3, p4}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getCABitmapForBand(IILjava/lang/String;)[B

    move-result-object v1

    .line 2045
    .local v1, "enabledSecBands":[B
    if-eqz v1, :cond_2

    .line 2046
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getCAEnable() Band"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " CA="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2047
    invoke-static {v1}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->byteArrToStringLog([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2046
    invoke-virtual {p0, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 2055
    add-int/lit8 v3, p2, -0x1

    div-int/lit8 v3, v3, 0x8

    aget-byte v3, v1, v3

    add-int/lit8 v4, p2, -0x1

    rem-int/lit8 v4, v4, 0x8

    const/4 v5, 0x1

    shl-int v4, v5, v4

    and-int/2addr v3, v4

    if-eqz v3, :cond_1

    move v2, v5

    :cond_1
    move v0, v2

    .line 2058
    :cond_2
    return v0

    .line 2039
    .end local v1    # "enabledSecBands":[B
    :cond_3
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getCAEnable() invalid input band priBand:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " secBand:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .line 2040
    return v2
.end method

.method public getCAMultiDL(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;
    .param p3, "bandsCombo"    # Ljava/lang/String;

    .line 921
    sget-boolean v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getCAMultiDL : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 922
    :cond_0
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getCAMultiDL"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 924
    return v1

    .line 927
    :cond_1
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 928
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_2

    .line 929
    return v1

    .line 933
    :cond_2
    invoke-direct {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getAllCAConfigList(I)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;

    move-result-object v2

    .line 934
    .local v2, "caBwCombo":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;
    if-eqz v2, :cond_3

    .line 935
    invoke-virtual {p3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;->containsDLCombo(Ljava/lang/String;Z)Z

    move-result v1

    return v1

    .line 937
    :cond_3
    return v1
.end method

.method public getCAMultiDLList(ILjava/lang/String;)[Ljava/lang/String;
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 863
    sget-boolean v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    const-string v1, "getCAMultiDLList"

    if-eqz v0, :cond_0

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 864
    :cond_0
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-static {v0, p1, p2, v2, v1}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 866
    return-object v2

    .line 869
    :cond_1
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 870
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_2

    .line 871
    return-object v2

    .line 875
    :cond_2
    invoke-direct {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getAllCAConfigList(I)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;

    move-result-object v1

    .line 876
    .local v1, "caBwCombo":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;
    if-eqz v1, :cond_3

    .line 877
    invoke-virtual {v1}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;->getDLList()[Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 879
    :cond_3
    return-object v2
.end method

.method public getCAMultiDLULList(ILjava/lang/String;)[Ljava/lang/String;
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 890
    sget-boolean v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    const-string v1, "getCAMultiDLULList"

    if-eqz v0, :cond_0

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 891
    :cond_0
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-static {v0, p1, p2, v2, v1}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 893
    return-object v2

    .line 896
    :cond_1
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 897
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_2

    .line 898
    return-object v2

    .line 902
    :cond_2
    invoke-direct {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getAllCAConfigList(I)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;

    move-result-object v1

    .line 903
    .local v1, "caBwCombo":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;
    if-eqz v1, :cond_3

    .line 904
    invoke-virtual {v1}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;->getDLULList()[Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 906
    :cond_3
    return-object v2
.end method

.method public getCAMultiUL(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;
    .param p3, "bandsCombo"    # Ljava/lang/String;

    .line 1007
    sget-boolean v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getCAMultiUL : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 1008
    :cond_0
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getCAMultiUL"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 1010
    return v1

    .line 1013
    :cond_1
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1014
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_2

    .line 1015
    return v1

    .line 1019
    :cond_2
    invoke-direct {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getAllCAConfigList(I)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;

    move-result-object v2

    .line 1020
    .local v2, "caBwCombo":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;
    if-eqz v2, :cond_3

    .line 1021
    invoke-virtual {p3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;->containsULCombo(Ljava/lang/String;Z)Z

    move-result v1

    return v1

    .line 1023
    :cond_3
    return v1
.end method

.method public getCDMADataRate(ILjava/lang/String;)I
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2442
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getCDMADataRate"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 2444
    return v1

    .line 2447
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2448
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2449
    return v1

    .line 2452
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getCDMADataRate(I)I

    move-result v1

    return v1
.end method

.method public getCDMAServiceOption(ILjava/lang/String;)I
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2349
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getCDMAServiceOption"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 2351
    return v1

    .line 2354
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2355
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2356
    return v1

    .line 2359
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getCDMAServiceOption(I)I

    move-result v1

    return v1
.end method

.method public getCampCABandCombo(ILjava/lang/String;)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CABandCombo;
    .locals 6
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 3509
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getCampCABandCombo"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 3511
    return-object v1

    .line 3514
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 3515
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 3516
    return-object v1

    .line 3519
    :cond_1
    invoke-static {}, Lcom/android/internal/telephony/SubscriptionController;->getInstance()Lcom/android/internal/telephony/SubscriptionController;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/android/internal/telephony/SubscriptionController;->getSubscriptionInfo(I)Landroid/telephony/SubscriptionInfo;

    move-result-object v2

    .line 3520
    .local v2, "subInfo":Landroid/telephony/SubscriptionInfo;
    if-nez v2, :cond_2

    .line 3521
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "no SubscriptionInfo sub subID:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .line 3522
    return-object v1

    .line 3525
    :cond_2
    invoke-virtual {v2}, Landroid/telephony/SubscriptionInfo;->getMncString()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {v2}, Landroid/telephony/SubscriptionInfo;->getMncString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    goto :goto_0

    :cond_3
    const/4 v1, 0x0

    .line 3526
    .local v1, "mncLength":I
    :goto_0
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v2}, Landroid/telephony/SubscriptionInfo;->getMcc()I

    move-result v4

    invoke-virtual {v2}, Landroid/telephony/SubscriptionInfo;->getMnc()I

    move-result v5

    invoke-virtual {v3, v0, v4, v5, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getCampCABandCombo(IIII)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CABandCombo;

    move-result-object v3

    return-object v3
.end method

.method public getCampedCsgInfo(ILjava/lang/String;)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CsgInfo;
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2159
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getCampedCsgInfo"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2161
    return-object v1

    .line 2164
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2165
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2166
    return-object v1

    .line 2169
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getCampedCsgInfo(I)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CsgInfo;

    move-result-object v1

    return-object v1
.end method

.method public getCdmaCallProcessingData(ILjava/lang/String;)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CallProcessingData;
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2602
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getCdmaCallProcessingData"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2604
    return-object v1

    .line 2607
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2608
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2609
    return-object v1

    .line 2612
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getCdmaCallProcessingData(I)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CallProcessingData;

    move-result-object v1

    return-object v1
.end method

.method public getCdmaHybridMode(ILjava/lang/String;)I
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2542
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getCdmaHybridMode"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 2544
    return v1

    .line 2547
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2548
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2549
    return v1

    .line 2552
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getCdmaHybridMode(I)I

    move-result v1

    return v1
.end method

.method public getCdmaRxDiversity(ILjava/lang/String;)I
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2621
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getCdmaRxDiversity"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 2623
    return v1

    .line 2626
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2627
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2628
    return v1

    .line 2631
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getCdmaRxDiversity(I)I

    move-result v1

    return v1
.end method

.method public getCdmaSidNidPairs(ILjava/lang/String;)[Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaSidNidPair;
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2501
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getCdmaSidNidPairs"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2503
    return-object v1

    .line 2506
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2507
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2508
    return-object v1

    .line 2511
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getCdmaSidNidPairs(I)[Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaSidNidPair;

    move-result-object v1

    return-object v1
.end method

.method public getCdmaSysInfo(ILjava/lang/String;Lcom/motorola/android/internal/telephony/IMotoCdmaSysInfoCB;)V
    .locals 6
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;
    .param p3, "infoCB"    # Lcom/motorola/android/internal/telephony/IMotoCdmaSysInfoCB;

    .line 1150
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getCdmaSysInfo"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const-string v2, "onCdmaSysInfoResult exception"

    if-nez v0, :cond_0

    .line 1153
    :try_start_0
    invoke-interface {p3, v1}, Lcom/motorola/android/internal/telephony/IMotoCdmaSysInfoCB;->onCdmaSysInfoResult(Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaSysInfo;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1156
    goto :goto_0

    .line 1154
    :catch_0
    move-exception v0

    .line 1155
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .line 1157
    .end local v0    # "e":Landroid/os/RemoteException;
    :goto_0
    return-void

    .line 1160
    :cond_0
    const v0, 0x20000cc

    invoke-static {v0}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->writeOemHookReqHeader(I)[B

    move-result-object v0

    .line 1162
    .local v0, "oemReq":[B
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v3

    .line 1163
    .local v3, "phoneId":I
    invoke-virtual {p0, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v4

    if-nez v4, :cond_1

    .line 1164
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid phoneId:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .line 1166
    :try_start_1
    invoke-interface {p3, v1}, Lcom/motorola/android/internal/telephony/IMotoCdmaSysInfoCB;->onCdmaSysInfoResult(Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaSysInfo;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1169
    goto :goto_1

    .line 1167
    :catch_1
    move-exception v1

    .line 1168
    .local v1, "e":Landroid/os/RemoteException;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .line 1170
    .end local v1    # "e":Landroid/os/RemoteException;
    :goto_1
    return-void

    .line 1173
    :cond_1
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$2;

    invoke-direct {v1, p0, p3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$2;-><init>(Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;Lcom/motorola/android/internal/telephony/IMotoCdmaSysInfoCB;)V

    invoke-virtual {p0, v3, v0, v1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawAsync(I[BLcom/motorola/android/internal/telephony/IMotoOemCB;)I

    .line 1213
    return-void
.end method

.method public getCurrentUiccCardProvisioningStatus(ILjava/lang/String;)I
    .locals 5
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 741
    sget-boolean v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getCurrentUiccCardProvisioningStatus subId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 743
    :cond_0
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getCurrentUiccCardProvisioningStatus"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 745
    const/4 v0, 0x0

    return v0

    .line 748
    :cond_1
    const/4 v0, 0x0

    .line 749
    .local v0, "subState":I
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mSubCtrl:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v1, p1}, Lcom/android/internal/telephony/SubscriptionController;->getSlotIndex(I)I

    move-result v1

    .line 750
    .local v1, "slotId":I
    invoke-static {v1}, Landroid/telephony/SubscriptionManager;->isValidSlotIndex(I)Z

    move-result v2

    if-nez v2, :cond_2

    .line 751
    return v0

    .line 755
    :cond_2
    :try_start_0
    invoke-direct {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getIExtTelephony()Lorg/codeaurora/internal/IExtTelephony;

    move-result-object v2

    invoke-interface {v2, v1}, Lorg/codeaurora/internal/IExtTelephony;->getCurrentUiccCardProvisioningStatus(I)I

    move-result v2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v2

    .line 760
    :goto_0
    goto :goto_1

    .line 758
    :catch_0
    move-exception v2

    .line 759
    .local v2, "ex":Ljava/lang/NullPointerException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "NullPointerException @getCurrentUiccCardProvisioningStatus"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    goto :goto_1

    .line 756
    .end local v2    # "ex":Ljava/lang/NullPointerException;
    :catch_1
    move-exception v2

    .line 757
    .local v2, "ex":Landroid/os/RemoteException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "RemoteException @getCurrentUiccCardProvisioningStatus"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .end local v2    # "ex":Landroid/os/RemoteException;
    goto :goto_0

    .line 762
    :goto_1
    sget-boolean v2, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v2, :cond_3

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getCurrentUiccStatus subId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " status="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 763
    :cond_3
    return v0
.end method

.method public getDDTMDefaultPreference(ILjava/lang/String;)I
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2242
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getDDTMDefaultPreference"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2244
    return v1

    .line 2247
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2248
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2249
    return v1

    .line 2252
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getDDTMDefaultPreference(I)I

    move-result v1

    return v1
.end method

.method public getDSSEnabled(ILjava/lang/String;)Z
    .locals 4
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2991
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getDSSEnabled"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2993
    return v1

    .line 2996
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2997
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2998
    return v1

    .line 3001
    :cond_1
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v2, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getDSSEnabled(I)B

    move-result v2

    .line 3002
    .local v2, "res":B
    const/4 v3, 0x1

    if-ne v2, v3, :cond_2

    move v1, v3

    :cond_2
    return v1
.end method

.method public getEhrpdEnabled(ILjava/lang/String;)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 1843
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getEhrpdEnabled"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1845
    return v1

    .line 1848
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1849
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1850
    return v1

    .line 1853
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getEhrpdEnabled(I)Z

    move-result v1

    return v1
.end method

.method public getEmergencyNumber(IILjava/lang/String;)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$EmergencyNumber;
    .locals 3
    .param p1, "emergencyAddress"    # I
    .param p2, "subId"    # I
    .param p3, "callingPackage"    # Ljava/lang/String;

    .line 2736
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getMobilePRev"

    invoke-static {v0, p2, p3, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2738
    return-object v1

    .line 2741
    :cond_0
    invoke-virtual {p0, p2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2742
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2743
    return-object v1

    .line 2746
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getEmergencyNumber(II)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$EmergencyNumber;

    move-result-object v1

    return-object v1
.end method

.method public getEndcEnabled(ILjava/lang/String;)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 3399
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getEndcEnabled"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3401
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mSubCtrl:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/SubscriptionController;->getPhoneId(I)I

    move-result v0

    .line 3402
    .local v0, "phoneId":I
    if-ltz v0, :cond_0

    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNrDataIconTypes:[I

    array-length v1, v1

    if-gt v0, v1, :cond_0

    .line 3403
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mEndcStatus:[Z

    aget-boolean v1, v1, v0

    return v1

    .line 3406
    .end local v0    # "phoneId":I
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getEvdoData(ILjava/lang/String;)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$EvdoData;
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2582
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getEvdoData"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2584
    return-object v1

    .line 2587
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2588
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2589
    return-object v1

    .line 2592
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getEvdoData(I)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$EvdoData;

    move-result-object v1

    return-object v1
.end method

.method public getEvdoRevisionOption(ILjava/lang/String;)I
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2393
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getEvdoRevisionOption"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 2395
    return v1

    .line 2398
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2399
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2400
    return v1

    .line 2403
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getEvdoRevisionOption(I)I

    move-result v1

    return v1
.end method

.method public getFDDTM9Enabled(ILjava/lang/String;)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 1628
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getFDDTM9Enabled"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1630
    return v1

    .line 1633
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1634
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1635
    return v1

    .line 1638
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getFDDTM9Enabled(I)Z

    move-result v1

    return v1
.end method

.method public getForNIDReg(ILjava/lang/String;)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2321
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getForNIDReg"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2323
    return v1

    .line 2326
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2327
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2328
    return v1

    .line 2331
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getForNIDReg(I)Z

    move-result v1

    return v1
.end method

.method public getForSIDReg(ILjava/lang/String;)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2301
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getForSIDReg"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2303
    return v1

    .line 2306
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2307
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2308
    return v1

    .line 2311
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getForSIDReg(I)Z

    move-result v1

    return v1
.end method

.method public getHdrRxDiversity(ILjava/lang/String;)I
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2658
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getCdmaHybridMode"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 2660
    return v1

    .line 2663
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2664
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2665
    return v1

    .line 2668
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getHdrRxDiversity(I)I

    move-result v1

    return v1
.end method

.method public getHomeSIDReg(ILjava/lang/String;)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2281
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getHomeSIDReg"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2283
    return v1

    .line 2286
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2287
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2288
    return v1

    .line 2291
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getHomeSIDReg(I)Z

    move-result v1

    return v1
.end method

.method public getLTEBandConfigBitmap(ILjava/lang/String;)[B
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 1970
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getLTEBandConfigBitmap"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1972
    return-object v1

    .line 1975
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1976
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1977
    return-object v1

    .line 1980
    :cond_1
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v2, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getBandClassSupport(I)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;

    move-result-object v2

    .line 1981
    .local v2, "bc":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;
    if-nez v2, :cond_2

    .line 1982
    return-object v1

    .line 1985
    :cond_2
    invoke-virtual {v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->getLteConfigBytes()[B

    move-result-object v1

    return-object v1
.end method

.method public getLTEBandEnable(IILjava/lang/String;)Z
    .locals 3
    .param p1, "bandId"    # I
    .param p2, "subId"    # I
    .param p3, "callingPackage"    # Ljava/lang/String;

    .line 1328
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getLTEBandEnable"

    invoke-static {v0, p2, p3, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1330
    return v1

    .line 1333
    :cond_0
    invoke-virtual {p0, p2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1334
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1335
    return v1

    .line 1338
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getLTEBandEnable(II)Z

    move-result v1

    return v1
.end method

.method public getLTERRCState(ILjava/lang/String;)I
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 1285
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getLTERRCState"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/16 v1, 0xff

    if-nez v0, :cond_0

    .line 1287
    return v1

    .line 1290
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1291
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1292
    return v1

    .line 1295
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getLTERRCState(I)I

    move-result v1

    return v1
.end method

.method public getLteAvailableFileRecords(ILjava/lang/String;)Ljava/util/List;
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteAvailableFileRecord;",
            ">;"
        }
    .end annotation

    .line 1881
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getLteAvailableFile"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1883
    return-object v1

    .line 1886
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1887
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1888
    return-object v1

    .line 1891
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getLteAvailableFileRecords(I)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public getLteBsrTimer(ILjava/lang/String;)I
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 1805
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getLteBsrTimer"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 1807
    return v1

    .line 1810
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1811
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1812
    return v1

    .line 1815
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getLteBsrTimer(I)I

    move-result v1

    return v1
.end method

.method public getLteData(ILjava/lang/String;)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteData;
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 1307
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getLteData"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1309
    return-object v1

    .line 1312
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1313
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1314
    return-object v1

    .line 1317
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getLteData(I)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteData;

    move-result-object v1

    return-object v1
.end method

.method public getLteErrors(ILjava/lang/String;)Ljava/util/List;
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteError;",
            ">;"
        }
    .end annotation

    .line 2877
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getLteErrors"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2879
    return-object v1

    .line 2882
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2883
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2884
    return-object v1

    .line 2887
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mLteErrorList:[Ljava/util/List;

    aget-object v1, v1, v0

    monitor-enter v1

    .line 2888
    :try_start_0
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mLteErrorList:[Ljava/util/List;

    aget-object v2, v2, v0

    monitor-exit v1

    return-object v2

    .line 2889
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public getMaxBsrTimer(ILjava/lang/String;)I
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 1745
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getMaxBsrTimer"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 1747
    return v1

    .line 1750
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1751
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1752
    return v1

    .line 1755
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getMaxBsrTimer(I)I

    move-result v1

    return v1
.end method

.method public getMaxBsrTimerStages(ILjava/lang/String;)I
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 1766
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getMaxBsrTimerStages"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 1768
    return v1

    .line 1771
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1772
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1773
    return v1

    .line 1776
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getMaxBsrTimerStages(I)I

    move-result v1

    return v1
.end method

.method public getMipErrorCode(ILjava/lang/String;)I
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2179
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getMipErrorCode"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2181
    return v1

    .line 2184
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2185
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2186
    return v1

    .line 2189
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getMipErrorCode(I)I

    move-result v1

    return v1
.end method

.method public getMobilePRev(ILjava/lang/String;)I
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2695
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getMobilePRev"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const v1, 0xffff

    if-nez v0, :cond_0

    .line 2697
    return v1

    .line 2700
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2701
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2702
    return v1

    .line 2705
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getMobilePRev(I)I

    move-result v1

    return v1
.end method

.method public getNRDeviceType(ILjava/lang/String;)I
    .locals 5
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 3044
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getNRDeviceType"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 3046
    return v1

    .line 3049
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 3050
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 3051
    return v1

    .line 3054
    :cond_1
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v2, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getBandClassSupport(I)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;

    move-result-object v2

    .line 3055
    .local v2, "bc":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;
    if-nez v2, :cond_2

    .line 3056
    return v1

    .line 3058
    :cond_2
    invoke-virtual {v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->getNRDeviceType()I

    move-result v1

    .line 3059
    .local v1, "type":I
    sget-boolean v3, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v3, :cond_3

    .line 3060
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getNRDeviceType:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ",  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 3062
    :cond_3
    return v1
.end method

.method public getNRModeBitMask(ILjava/lang/String;)I
    .locals 5
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 3076
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getNRModeBitMask"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 3078
    return v1

    .line 3081
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 3082
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 3083
    return v1

    .line 3086
    :cond_1
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v2, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getBandClassSupport(I)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;

    move-result-object v2

    .line 3087
    .local v2, "bc":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;
    if-nez v2, :cond_2

    .line 3088
    return v1

    .line 3091
    :cond_2
    invoke-virtual {v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvBandConfigDataType;->getNRModeBitMask()I

    move-result v1

    .line 3092
    .local v1, "bitMask":I
    sget-boolean v3, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v3, :cond_3

    .line 3093
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getNRModeBitMask:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ",  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 3095
    :cond_3
    return v1
.end method

.method public getNamInfo(ILjava/lang/String;)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2776
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getNamInfo"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2778
    return-object v1

    .line 2781
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2782
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2783
    return-object v1

    .line 2786
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getNamInfo(I)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;

    move-result-object v1

    return-object v1
.end method

.method public getNextLteScan(ILjava/lang/String;)I
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 1705
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getNextLteScan"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 1707
    return v1

    .line 1710
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1711
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1712
    return v1

    .line 1715
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getNextLteScan(I)I

    move-result v1

    return v1
.end method

.method public getNrDataIconType(ILjava/lang/String;)I
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 3343
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getNrDataIconType"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3345
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mSubCtrl:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/SubscriptionController;->getPhoneId(I)I

    move-result v0

    .line 3346
    .local v0, "phoneId":I
    if-ltz v0, :cond_0

    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNrDataIconTypes:[I

    array-length v2, v1

    if-gt v0, v2, :cond_0

    .line 3347
    aget v1, v1, v0

    return v1

    .line 3350
    .end local v0    # "phoneId":I
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getNrModeDisabled(ILjava/lang/String;)I
    .locals 7
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 3435
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getNrModeDisabled"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_1

    .line 3437
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 3438
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 3439
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid phoneId:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .line 3440
    return v1

    .line 3443
    :cond_0
    const v2, 0x50048

    .line 3444
    .local v2, "reqId":I
    const/16 v3, 0x8

    new-array v3, v3, [B

    .line 3445
    .local v3, "data":[B
    const/4 v4, 0x1

    new-array v4, v4, [B

    .line 3446
    .local v4, "respData":[B
    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 3447
    .local v5, "buf":Ljava/nio/ByteBuffer;
    invoke-static {v2}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 3448
    invoke-virtual {v5, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 3449
    invoke-virtual {p0, v0, v3, v4}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v6

    if-ltz v6, :cond_1

    .line 3450
    const/4 v1, 0x0

    aget-byte v1, v4, v1

    return v1

    .line 3453
    .end local v0    # "phoneId":I
    .end local v2    # "reqId":I
    .end local v3    # "data":[B
    .end local v4    # "respData":[B
    .end local v5    # "buf":Ljava/nio/ByteBuffer;
    :cond_1
    return v1
.end method

.method public getPlmnNameFromSE13Table(IIILjava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "mcc"    # I
    .param p2, "mnc"    # I
    .param p3, "subId"    # I
    .param p4, "callingPackage"    # Ljava/lang/String;

    .line 774
    sget-boolean v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v0, :cond_0

    .line 775
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getPlmnNameFromSE13Table - mcc "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " mnc "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 778
    :cond_0
    const-string v0, ""

    .line 779
    .local v0, "plmnName":Ljava/lang/String;
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v2, 0x0

    const-string v3, "getPlmnNameFromSE13Table"

    invoke-static {v1, p3, p4, v2, v3}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 781
    return-object v0

    .line 784
    :cond_1
    invoke-virtual {p0, p3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v1

    .line 785
    .local v1, "phoneId":I
    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_2

    .line 786
    return-object v0

    .line 789
    :cond_2
    if-lez p1, :cond_3

    if-lez p2, :cond_3

    .line 790
    const/4 v2, 0x4

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 791
    .local v2, "mccmncBuf":Ljava/nio/ByteBuffer;
    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 792
    int-to-short v3, p1

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 793
    int-to-short v3, p2

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 794
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    const v4, 0xa0006

    const/16 v5, 0x32

    invoke-virtual {v3, v1, v4, v2, v5}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getResponseWithSimpleHeader(IILjava/nio/ByteBuffer;I)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    move-result-object v3

    .line 797
    .local v3, "resp":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    if-eqz v3, :cond_3

    .line 798
    invoke-static {v3}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->toLiteralString(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)Ljava/lang/String;

    move-result-object v0

    .line 802
    .end local v2    # "mccmncBuf":Ljava/nio/ByteBuffer;
    .end local v3    # "resp":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
    :cond_3
    return-object v0
.end method

.method public getProvisionUpdateRequest(ILjava/lang/String;)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 579
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getProvisionUpdateRequest"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 581
    return v1

    .line 584
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 585
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 586
    return v1

    .line 589
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getProvisionUpdateRequest(I)Z

    move-result v1

    return v1
.end method

.method public getQAMDLEnabled(ILjava/lang/String;)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 1552
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getQAMDLEnabled"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1554
    return v1

    .line 1557
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1558
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1559
    return v1

    .line 1562
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->get256QAMDLEnabled(I)Z

    move-result v1

    return v1
.end method

.method public getQAMULEnabled(ILjava/lang/String;)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 1590
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getQAMDULEnabled"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1592
    return v1

    .line 1595
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1596
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1597
    return v1

    .line 1600
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->get64QAMULEnabled(I)Z

    move-result v1

    return v1
.end method

.method public getSO68Enabled(ILjava/lang/String;)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 464
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getSO68Enabled"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 466
    return v1

    .line 469
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 470
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 471
    return v1

    .line 474
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getSO68Enabled(I)Z

    move-result v1

    return v1
.end method

.method public getSO73COP0Enabled(ILjava/lang/String;)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 502
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getSO73COP0Enabled"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 504
    return v1

    .line 507
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 508
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 509
    return v1

    .line 512
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getSO73COP0Enabled(I)Z

    move-result v1

    return v1
.end method

.method public getSO73COP1To7Enabled(ILjava/lang/String;)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 540
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getSO73COP1To7Enabled"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 542
    return v1

    .line 545
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 546
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 547
    return v1

    .line 550
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getSO73COP1To7Enabled(I)Z

    move-result v1

    return v1
.end method

.method public getSecuritySimLockData(ILjava/lang/String;)[B
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2971
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getSecuritySimLockData"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2973
    return-object v1

    .line 2976
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2977
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2978
    return-object v1

    .line 2981
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getSecuritySimLockData(I)[B

    move-result-object v1

    return-object v1
.end method

.method public getSimLock(ILjava/lang/String;)I
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 1456
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getSimLock"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 1458
    return v1

    .line 1461
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1462
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1463
    return v1

    .line 1466
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getSimLock(I)I

    move-result v1

    return v1
.end method

.method public getSimNonce(ILjava/lang/String;)[B
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 1494
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getSimNonce"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1496
    return-object v1

    .line 1499
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1500
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1501
    return-object v1

    .line 1504
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getSimNonce(I)[B

    move-result-object v1

    return-object v1
.end method

.method public getSlotCycleIndex(ILjava/lang/String;)I
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2219
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getSlotCycleIndex"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2221
    return v1

    .line 2224
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2225
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2226
    return v1

    .line 2229
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getSlotCycleIndex(I)I

    move-result v1

    return v1
.end method

.method public getSlotCycleMode(ILjava/lang/String;)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2199
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getSlotCycleMode"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2201
    return v1

    .line 2204
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2205
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2206
    return v1

    .line 2209
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getSlotCycleMode(I)Z

    move-result v1

    return v1
.end method

.method public getSprintVoiceServiceOption(ILjava/lang/String;)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2819
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getSprintVoiceServiceOption"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2821
    return-object v1

    .line 2824
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2825
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2826
    return-object v1

    .line 2829
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getSprintVoiceServiceOption(I)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;

    move-result-object v1

    return-object v1
.end method

.method public getSubsidyLockDetail(Ljava/lang/String;)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SubsidyLockDetail;
    .locals 5
    .param p1, "callingPackage"    # Ljava/lang/String;

    .line 1242
    const v0, 0x7fffffff

    .line 1243
    .local v0, "subId":I
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v2, 0x0

    const-string v3, "getSubsidyLockDetail"

    invoke-static {v1, v0, p1, v2, v3}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    .line 1245
    const-string v4, "android.permission.MODIFY_PHONE_STATE"

    invoke-virtual {v1, v4}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_0

    .line 1247
    return-object v2

    .line 1250
    :cond_0
    sget-boolean v1, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v1, :cond_1

    .line 1251
    invoke-virtual {p0, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 1254
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mDefaultPhone:Lcom/android/internal/telephony/Phone;

    invoke-virtual {v2}, Lcom/android/internal/telephony/Phone;->getPhoneId()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getSubsidyLockDetail(I)Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SubsidyLockDetail;

    move-result-object v1

    return-object v1
.end method

.method public getTDDTM9Enabled(ILjava/lang/String;)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 1666
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getTDDTM9Enabled"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1668
    return v1

    .line 1671
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1672
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1673
    return v1

    .line 1676
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getTDDTM9Enabled(I)Z

    move-result v1

    return v1
.end method

.method public getVoNRSetting(ILjava/lang/String;)Z
    .locals 8
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 3106
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getVoNRSetting"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 3108
    return v1

    .line 3111
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 3112
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 3113
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid phoneId:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .line 3114
    return v1

    .line 3117
    :cond_1
    const v2, 0x5004e

    .line 3118
    .local v2, "reqId":I
    const/16 v3, 0x8

    new-array v3, v3, [B

    .line 3119
    .local v3, "data":[B
    const/4 v4, 0x1

    new-array v5, v4, [B

    .line 3120
    .local v5, "respData":[B
    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 3121
    .local v6, "buf":Ljava/nio/ByteBuffer;
    invoke-static {v2}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 3122
    invoke-virtual {v6, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 3123
    invoke-virtual {p0, v0, v3, v5}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v7

    if-ltz v7, :cond_3

    .line 3124
    aget-byte v7, v5, v1

    if-ne v7, v4, :cond_2

    move v1, v4

    :cond_2
    return v1

    .line 3127
    :cond_3
    return v1
.end method

.method public getVoiceDomainSetting(ILjava/lang/String;)I
    .locals 3
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;

    .line 2925
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "getVoiceDomainSetting"

    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 2927
    return v1

    .line 2930
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2931
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2932
    return v1

    .line 2935
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getVoiceDomainSetting(I)I

    move-result v1

    return v1
.end method

.method public handleOemHookIndication(I[B)V
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "response"    # [B

    .line 3214
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mOemHookIndicationProcess:Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;

    invoke-virtual {v0, p1, p2}, Lcom/motorola/android/internal/telephony/QcomOemHookIndicationProcess;->processUnsolOemhookIndication(I[B)V

    .line 3215
    return-void
.end method

.method invokeOemRilRequestRawAsync(I[BLcom/motorola/android/internal/telephony/IMotoOemCB;)I
    .locals 3
    .param p1, "phoneId"    # I
    .param p2, "oemReq"    # [B
    .param p3, "motoOemCB"    # Lcom/motorola/android/internal/telephony/IMotoOemCB;

    .line 3309
    const/4 v0, 0x0

    .line 3311
    .local v0, "returnValue":I
    :try_start_0
    iget-boolean v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mServiceReady:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mQcrilMsgService:Lcom/qualcomm/qcrilmsgtunnel/IQcrilMsgTunnel;

    if-eqz v1, :cond_1

    .line 3312
    sget-boolean v1, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v1, :cond_0

    .line 3313
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invokeOemRilRequestRaw:phoneId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " oemReq = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3314
    invoke-static {p2}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 3313
    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 3317
    :cond_0
    new-instance v1, Lcom/motorola/android/internal/telephony/MotoOemHookCallback;

    invoke-direct {v1, p3}, Lcom/motorola/android/internal/telephony/MotoOemHookCallback;-><init>(Lcom/motorola/android/internal/telephony/IMotoOemCB;)V

    .line 3318
    .local v1, "OemHookcb":Lcom/motorola/android/internal/telephony/MotoOemHookCallback;
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mQcrilMsgService:Lcom/qualcomm/qcrilmsgtunnel/IQcrilMsgTunnel;

    invoke-interface {v2, p2, v1, p1}, Lcom/qualcomm/qcrilmsgtunnel/IQcrilMsgTunnel;->sendOemRilRequestRawAsync([BLcom/qualcomm/qcrilhook/IOemHookCallback;I)V

    .line 3319
    .end local v1    # "OemHookcb":Lcom/motorola/android/internal/telephony/MotoOemHookCallback;
    goto :goto_0

    .line 3320
    :cond_1
    sget-object v1, Lcom/android/internal/telephony/CommandException$Error;->GENERIC_FAILURE:Lcom/android/internal/telephony/CommandException$Error;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CommandException$Error;->ordinal()I

    move-result v1
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    .line 3321
    if-lez v0, :cond_2

    mul-int/lit8 v0, v0, -0x1

    .line 3327
    :cond_2
    :goto_0
    goto :goto_1

    .line 3323
    :catch_0
    move-exception v1

    .line 3324
    .local v1, "e":Landroid/os/RemoteException;
    const-string v2, "sendOemRilRequestRaw: Runtime Exception"

    invoke-virtual {p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .line 3325
    sget-object v2, Lcom/android/internal/telephony/CommandException$Error;->GENERIC_FAILURE:Lcom/android/internal/telephony/CommandException$Error;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CommandException$Error;->ordinal()I

    move-result v0

    .line 3326
    if-lez v0, :cond_3

    mul-int/lit8 v0, v0, -0x1

    .line 3330
    .end local v1    # "e":Landroid/os/RemoteException;
    :cond_3
    :goto_1
    if-gez v0, :cond_4

    .line 3332
    :try_start_1
    invoke-interface {p3}, Lcom/motorola/android/internal/telephony/IMotoOemCB;->onOemHookException()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 3335
    goto :goto_2

    .line 3333
    :catch_1
    move-exception v1

    .line 3334
    .restart local v1    # "e":Landroid/os/RemoteException;
    const-string v2, "RemoteException caught for motoOemCB!"

    invoke-virtual {p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .line 3338
    .end local v1    # "e":Landroid/os/RemoteException;
    :cond_4
    :goto_2
    return v0
.end method

.method invokeOemRilRequestRawForPhone(I[B[B)I
    .locals 4
    .param p1, "phoneId"    # I
    .param p2, "oemReq"    # [B
    .param p3, "oemResp"    # [B

    .line 3280
    const/4 v0, 0x0

    .line 3283
    .local v0, "returnValue":I
    :try_start_0
    iget-boolean v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mServiceReady:Z

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mQcrilMsgService:Lcom/qualcomm/qcrilmsgtunnel/IQcrilMsgTunnel;

    if-eqz v1, :cond_3

    .line 3284
    sget-boolean v1, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v2, "invokeOemRilRequestRawForSubscriber:phoneId = "

    if-eqz v1, :cond_0

    .line 3285
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " oemReq = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3286
    invoke-static {p2}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 3285
    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 3289
    :cond_0
    if-nez p3, :cond_1

    const/4 v1, 0x1

    new-array v1, v1, [B

    goto :goto_0

    :cond_1
    move-object v1, p3

    .line 3290
    .local v1, "rspData":[B
    :goto_0
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mQcrilMsgService:Lcom/qualcomm/qcrilmsgtunnel/IQcrilMsgTunnel;

    invoke-interface {v3, p2, v1, p1}, Lcom/qualcomm/qcrilmsgtunnel/IQcrilMsgTunnel;->sendOemRilRequestRaw([B[BI)I

    move-result v3

    move v0, v3

    .line 3291
    sget-boolean v3, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v3, :cond_2

    .line 3292
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " oemResp = "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3293
    invoke-static {v1}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 3292
    invoke-virtual {p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 3295
    .end local v1    # "rspData":[B
    :cond_2
    goto :goto_1

    .line 3296
    :cond_3
    sget-object v1, Lcom/android/internal/telephony/CommandException$Error;->GENERIC_FAILURE:Lcom/android/internal/telephony/CommandException$Error;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CommandException$Error;->ordinal()I

    move-result v1
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    move v0, v1

    .line 3297
    if-lez v0, :cond_4

    mul-int/lit8 v0, v0, -0x1

    .line 3303
    :cond_4
    :goto_1
    goto :goto_2

    .line 3299
    :catch_0
    move-exception v1

    .line 3300
    .local v1, "e":Landroid/os/RemoteException;
    const-string v2, "sendOemRilRequestRaw: Runtime Exception"

    invoke-virtual {p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .line 3301
    sget-object v2, Lcom/android/internal/telephony/CommandException$Error;->GENERIC_FAILURE:Lcom/android/internal/telephony/CommandException$Error;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CommandException$Error;->ordinal()I

    move-result v0

    .line 3302
    if-lez v0, :cond_5

    mul-int/lit8 v0, v0, -0x1

    .line 3305
    .end local v1    # "e":Landroid/os/RemoteException;
    :cond_5
    :goto_2
    return v0
.end method

.method public notifyEndcStatusChanged(IZ)V
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "isEnabled"    # Z

    .line 3410
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mEndcStatus:[Z

    aput-boolean p2, v0, p1

    .line 3411
    invoke-super {p0, p1, p2}, Lcom/motorola/android/internal/telephony/MotoExtTelephonyServiceBase;->notifyEndcStatusChanged(IZ)V

    .line 3412
    return-void
.end method

.method public notifyNrBearerAllocationChanged(II)V
    .locals 9
    .param p1, "phoneId"    # I
    .param p2, "bearer"    # I

    .line 3361
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNrBearers:[I

    aget v0, v0, p1

    if-eqz v0, :cond_0

    if-nez p2, :cond_4

    .line 3363
    :cond_0
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-lez p2, :cond_1

    move v2, v0

    goto :goto_0

    :cond_1
    move v2, v1

    .line 3364
    .local v2, "isVzwActive":Z
    :goto_0
    const/4 v3, 0x2

    if-ne p2, v3, :cond_2

    goto :goto_1

    :cond_2
    move v0, v1

    .line 3365
    .local v0, "isVzwUWB":Z
    :goto_1
    new-instance v1, Landroid/content/Intent;

    const-string v3, "com.verizon.provider.DATA_ACTIVITY_CHANGE"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 3366
    .local v1, "intent":Landroid/content/Intent;
    const/high16 v3, 0x1000000

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 3367
    const-string v3, "com.verizon.provider.NETWORK_TYPE"

    const-string v4, "5GNSA"

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 3369
    const-string v5, "com.verizon.provider.IS_ACTIVE"

    invoke-virtual {v1, v5, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 3371
    const-string v6, "com.verizon.provider.IS_UWB"

    invoke-virtual {v1, v6, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 3373
    sget-boolean v7, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v7, :cond_3

    .line 3374
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "to broadcast "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v8, " extras: {"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "="

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, "}"

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 3382
    :cond_3
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const-string v4, "android.permission.READ_PHONE_STATE"

    invoke-virtual {v3, v1, v4}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 3384
    .end local v0    # "isVzwUWB":Z
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "isVzwActive":Z
    :cond_4
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNrBearers:[I

    aput p2, v0, p1

    .line 3385
    invoke-super {p0, p1, p2}, Lcom/motorola/android/internal/telephony/MotoExtTelephonyServiceBase;->notifyNrBearerAllocationChanged(II)V

    .line 3386
    return-void
.end method

.method public notifyNrDataIconTypeChanged(II)V
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "iconType"    # I

    .line 3355
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNrDataIconTypes:[I

    aput p2, v0, p1

    .line 3356
    invoke-super {p0, p1, p2}, Lcom/motorola/android/internal/telephony/MotoExtTelephonyServiceBase;->notifyNrDataIconTypeChanged(II)V

    .line 3357
    return-void
.end method

.method public radioConfigReset(II)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "resetType"    # I

    .line 626
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 628
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 629
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 630
    const/4 v1, 0x0

    return v1

    .line 633
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->radioConfigReset(II)Z

    move-result v1

    return v1
.end method

.method public set1xAdvancedEnabled(IZ)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "enabled"    # Z

    .line 447
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 449
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 450
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 451
    const/4 v1, 0x0

    return v1

    .line 454
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->set1xAdvancedEnabled(IZ)Z

    move-result v1

    return v1
.end method

.method public set4x4MimoEnabled(IZ)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "enabled"    # Z

    .line 1535
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 1537
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1538
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1539
    const/4 v1, 0x0

    return v1

    .line 1542
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->set4x4MimoEnabled(IZ)Z

    move-result v1

    return v1
.end method

.method public setActiveSingleSimSlot(II)Z
    .locals 7
    .param p1, "subId"    # I
    .param p2, "slotType"    # I

    .line 3481
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 3483
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mDefaultPhone:Lcom/android/internal/telephony/Phone;

    invoke-virtual {v0}, Lcom/android/internal/telephony/Phone;->getPhoneId()I

    move-result v0

    .line 3485
    .local v0, "phoneId":I
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setActiveSingleSimSlot(II)Z

    move-result v1

    .line 3486
    .local v1, "success":Z
    if-eqz v1, :cond_0

    .line 3487
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v2

    .line 3491
    .local v2, "identity":J
    :try_start_0
    invoke-static {v0}, Lcom/android/internal/telephony/PhoneFactory;->getPhone(I)Lcom/android/internal/telephony/Phone;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Lcom/android/internal/telephony/Phone;->setSimPowerState(ILandroid/os/WorkSource;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3494
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 3495
    goto :goto_0

    .line 3494
    :catchall_0
    move-exception v4

    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 3495
    throw v4

    .line 3497
    .end local v2    # "identity":J
    :cond_0
    :goto_0
    return v1
.end method

.method public setAkeyInfo(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .param p1, "subId"    # I
    .param p2, "akey"    # Ljava/lang/String;
    .param p3, "spcLockCode"    # Ljava/lang/String;

    .line 2483
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 2485
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2486
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 2487
    return v2

    .line 2490
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v3, 0x1a

    if-le v1, v3, :cond_1

    return v2

    .line 2491
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2, p3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setAkeyInfo(ILjava/lang/String;Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public setBC10Enabled(IZ)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "enabled"    # Z

    .line 409
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 411
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 412
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 413
    const/4 v1, 0x0

    return v1

    .line 416
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setBC10Enabled(IZ)Z

    move-result v1

    return v1
.end method

.method public setBandPriorityList(I[I)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "priList"    # [I

    .line 1439
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 1441
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1442
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1443
    const/4 v1, 0x0

    return v1

    .line 1446
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setBandPriorityList(I[I)Z

    move-result v1

    return v1
.end method

.method public setCAEnable(IIIZ)Z
    .locals 7
    .param p1, "subId"    # I
    .param p2, "priBand"    # I
    .param p3, "secBand"    # I
    .param p4, "enable"    # Z

    .line 2072
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 2074
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2075
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 2076
    return v2

    .line 2079
    :cond_0
    invoke-static {p2}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->isValidBand(I)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-static {p3}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->isValidBand(I)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_2

    .line 2084
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getCABitmapForBand(II)[B

    move-result-object v1

    .line 2086
    .local v1, "enabledSecBands":[B
    if-eqz v1, :cond_4

    array-length v3, v1

    const/16 v4, 0x8

    if-ge v3, v4, :cond_2

    goto :goto_1

    .line 2090
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setCAEnable() "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " old CA="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2091
    invoke-static {v1}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->byteArrToStringLog([B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2090
    invoke-virtual {p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 2099
    const/4 v2, 0x1

    if-eqz p4, :cond_3

    .line 2100
    add-int/lit8 v3, p3, -0x1

    div-int/2addr v3, v4

    aget-byte v5, v1, v3

    add-int/lit8 v6, p3, -0x1

    rem-int/2addr v6, v4

    shl-int/2addr v2, v6

    or-int/2addr v2, v5

    int-to-byte v2, v2

    aput-byte v2, v1, v3

    goto :goto_0

    .line 2102
    :cond_3
    add-int/lit8 v3, p3, -0x1

    div-int/2addr v3, v4

    aget-byte v5, v1, v3

    add-int/lit8 v6, p3, -0x1

    rem-int/2addr v6, v4

    shl-int/2addr v2, v6

    not-int v2, v2

    and-int/2addr v2, v5

    int-to-byte v2, v2

    aput-byte v2, v1, v3

    .line 2105
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "new CA="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->byteArrToStringLog([B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 2106
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v2, v0, p2, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setCABitmapForBand(II[B)Z

    move-result v2

    return v2

    .line 2087
    :cond_4
    :goto_1
    return v2

    .line 2080
    .end local v1    # "enabledSecBands":[B
    :cond_5
    :goto_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setCAEnable() invalid input band priBand:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " secBand:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .line 2081
    return v2
.end method

.method public setCAMultiDL(ILjava/lang/String;ZLjava/lang/String;)Z
    .locals 5
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;
    .param p3, "status"    # Z
    .param p4, "bandsCombo"    # Ljava/lang/String;

    .line 953
    sget-boolean v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setCAMultiDL : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 954
    :cond_0
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 956
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 957
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 958
    return v2

    .line 962
    :cond_1
    invoke-direct {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getAllCAConfigList(I)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;

    move-result-object v1

    .line 963
    .local v1, "caBwCombo":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;
    if-nez v1, :cond_2

    .line 964
    return v2

    .line 966
    :cond_2
    invoke-virtual {p4}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p4

    .line 967
    invoke-virtual {v1, p4, v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;->containsDLCombo(Ljava/lang/String;Z)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_4

    .line 968
    if-eqz p3, :cond_3

    .line 970
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Enabling an existing combo : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 971
    return v4

    .line 974
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Disabling an existing combo : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 975
    invoke-virtual {v1, p4}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;->removeDLCombo(Ljava/lang/String;)V

    goto :goto_0

    .line 978
    :cond_4
    if-eqz p3, :cond_6

    .line 980
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Enabling a non-existing combo : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 981
    invoke-virtual {v1, p4}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;->appendDLCombo(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 982
    return v2

    .line 990
    :cond_5
    :goto_0
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v2, v0, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->writeCaBwCombo(ILcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;)Z

    move-result v2

    .line 991
    .local v2, "result":Z
    invoke-direct {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->notifyCAEnableStatusChanged()V

    .line 992
    return v2

    .line 986
    .end local v2    # "result":Z
    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Disabling a non-existing combo : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 987
    return v4
.end method

.method public setCAMultiUL(ILjava/lang/String;ZLjava/lang/String;)Z
    .locals 5
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;
    .param p3, "status"    # Z
    .param p4, "bandsCombo"    # Ljava/lang/String;

    .line 1039
    sget-boolean v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setCAMultiUL : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 1040
    :cond_0
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 1042
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1043
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 1044
    return v2

    .line 1048
    :cond_1
    invoke-direct {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getAllCAConfigList(I)Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;

    move-result-object v1

    .line 1049
    .local v1, "caBwCombo":Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;
    if-nez v1, :cond_2

    .line 1050
    return v2

    .line 1052
    :cond_2
    invoke-virtual {p4}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p4

    .line 1053
    const/4 v2, 0x1

    invoke-virtual {v1, p4, v2}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;->containsULCombo(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1054
    if-eqz p3, :cond_3

    .line 1056
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Enabling an existing combo : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 1057
    return v2

    .line 1060
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Disabling an existing combo : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 1061
    invoke-virtual {v1, p4}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;->removeULCombo(Ljava/lang/String;)V

    goto :goto_0

    .line 1064
    :cond_4
    if-eqz p3, :cond_5

    .line 1066
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Enabling a non-existing combo : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 1067
    invoke-virtual {v1, p4}, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;->appendULCombo(Ljava/lang/String;)V

    .line 1074
    :goto_0
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v2, v0, v1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->writeCaBwCombo(ILcom/motorola/android/internal/telephony/QcomNvInfo$NvLTECABWClassComboL;)Z

    move-result v2

    .line 1075
    .local v2, "result":Z
    invoke-direct {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->notifyCAEnableStatusChanged()V

    .line 1076
    return v2

    .line 1070
    .end local v2    # "result":Z
    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Disabling a non-existing combo : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 1071
    return v2
.end method

.method public setCDMADataRate(IILjava/lang/String;)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "rate"    # I
    .param p3, "spcLockCode"    # Ljava/lang/String;

    .line 2462
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 2464
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2465
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 2466
    return v2

    .line 2469
    :cond_0
    if-ltz p2, :cond_2

    const/4 v1, 0x6

    if-le p2, v1, :cond_1

    goto :goto_0

    .line 2473
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2, p3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setCDMADataRate(IILjava/lang/String;)Z

    move-result v1

    return v1

    .line 2471
    :cond_2
    :goto_0
    return v2
.end method

.method public setCDMAServiceOption(IILjava/lang/String;)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "serviceOption"    # I
    .param p3, "spcLockCode"    # Ljava/lang/String;

    .line 2369
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 2371
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2372
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 2373
    return v2

    .line 2376
    :cond_0
    if-ltz p2, :cond_2

    const/4 v1, 0x6

    if-le p2, v1, :cond_1

    goto :goto_0

    .line 2380
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2, p3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setCDMAServiceOption(IILjava/lang/String;)Z

    move-result v1

    return v1

    .line 2378
    :cond_2
    :goto_0
    return v2
.end method

.method public setCdmaHybridMode(IILjava/lang/String;)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "mode"    # I
    .param p3, "spcLockCode"    # Ljava/lang/String;

    .line 2561
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 2563
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2564
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 2565
    return v2

    .line 2568
    :cond_0
    if-ltz p2, :cond_2

    const/4 v1, 0x1

    if-le p2, v1, :cond_1

    goto :goto_0

    .line 2572
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2, p3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setCdmaHybridMode(IILjava/lang/String;)Z

    move-result v1

    return v1

    .line 2570
    :cond_2
    :goto_0
    return v2
.end method

.method public setCdmaRxDiversity(II)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "value"    # I

    .line 2642
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 2644
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2645
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 2646
    const/4 v1, 0x0

    return v1

    .line 2649
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setCdmaRxDiversity(II)Z

    move-result v1

    return v1
.end method

.method public setCdmaSidNidPairs(I[Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaSidNidPair;Ljava/lang/String;)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "pairs"    # [Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaSidNidPair;
    .param p3, "spcLockCode"    # Ljava/lang/String;

    .line 2521
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 2523
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2524
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 2525
    return v2

    .line 2528
    :cond_0
    if-nez p2, :cond_1

    return v2

    .line 2529
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2, p3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setCdmaSidNidPairs(I[Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaSidNidPair;Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public setDDTMDefaultPreference(IILjava/lang/String;)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "setting"    # I
    .param p3, "spcLockCode"    # Ljava/lang/String;

    .line 2264
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 2266
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2267
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 2268
    const/4 v1, 0x0

    return v1

    .line 2271
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2, p3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setDDTMDefaultPreference(IILjava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public setDSSEnabled(IZ)Z
    .locals 5
    .param p1, "subId"    # I
    .param p2, "enabled"    # Z

    .line 3013
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 3015
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 3016
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 3017
    return v2

    .line 3021
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "moto_dss"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 3022
    nop

    .line 3021
    invoke-static {v1, v3, p2}, Lcom/motorola/android/provider/MotorolaSettings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 3024
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0}, Lcom/motorola/android/internal/telephony/QcomNvManager;->getDSSEnabled(I)B

    move-result v1

    .line 3025
    .local v1, "currentDss":B
    const/4 v3, 0x1

    if-ne v1, v3, :cond_1

    move v2, v3

    :cond_1
    if-ne p2, v2, :cond_2

    .line 3026
    return v3

    .line 3028
    :cond_2
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v2, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setDSSEnabled(IB)Z

    move-result v2

    return v2
.end method

.method public setEhrpdEnabled(IZ)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "enabled"    # Z

    .line 1864
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 1866
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1867
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1868
    const/4 v1, 0x0

    return v1

    .line 1871
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setEhrpdEnabled(IZ)Z

    move-result v1

    return v1
.end method

.method public setEmergencyNumber(ILjava/lang/String;ILjava/lang/String;)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "number"    # Ljava/lang/String;
    .param p3, "emergencyAddress"    # I
    .param p4, "spcLockCode"    # Ljava/lang/String;

    .line 2759
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 2761
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2762
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 2763
    const/4 v1, 0x0

    return v1

    .line 2766
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2, p3, p4}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setEmergencyNumber(ILjava/lang/String;ILjava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public setEndcEnabled(IZ)V
    .locals 2
    .param p1, "subId"    # I
    .param p2, "enabled"    # Z

    .line 3390
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 3391
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNrStateManager:Lcom/motorola/android/internal/telephony/NrStateManager;

    if-eqz v0, :cond_0

    .line 3392
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mSubCtrl:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/SubscriptionController;->getPhoneId(I)I

    move-result v0

    .line 3393
    .local v0, "phoneId":I
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNrStateManager:Lcom/motorola/android/internal/telephony/NrStateManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/NrStateManager;->setEndcEnabled(IZ)V

    .line 3395
    .end local v0    # "phoneId":I
    :cond_0
    return-void
.end method

.method public setEvdoRevisionOption(IILjava/lang/String;)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "revOption"    # I
    .param p3, "spcLockCode"    # Ljava/lang/String;

    .line 2413
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 2415
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2416
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 2417
    return v2

    .line 2420
    :cond_0
    if-ltz p2, :cond_2

    const/4 v1, 0x1

    if-le p2, v1, :cond_1

    goto :goto_0

    .line 2424
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2, p3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setEvdoRevisionOption(IILjava/lang/String;)Z

    move-result v1

    return v1

    .line 2422
    :cond_2
    :goto_0
    return v2
.end method

.method public setFDDTM9Enabled(IZ)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "enabled"    # Z

    .line 1649
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 1651
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1652
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1653
    const/4 v1, 0x0

    return v1

    .line 1656
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setFDDTM9Enabled(IZ)Z

    move-result v1

    return v1
.end method

.method public setHdrRxDiversity(II)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "value"    # I

    .line 2679
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 2681
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2682
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 2683
    const/4 v1, 0x0

    return v1

    .line 2686
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setHdrRxDiversity(II)Z

    move-result v1

    return v1
.end method

.method public setLTEBandEnable(IIZ)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "bandId"    # I
    .param p3, "enable"    # Z

    .line 1350
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 1352
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1353
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1354
    const/4 v1, 0x0

    return v1

    .line 1357
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2, p3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setLTEBandEnable(IIZ)Z

    move-result v1

    .line 1358
    .local v1, "ret":Z
    if-eqz v1, :cond_1

    .line 1359
    const-string v2, "LTE"

    invoke-virtual {p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->notifyNVChanges(Ljava/lang/String;)V

    .line 1361
    :cond_1
    return v1
.end method

.method public setLTEBandsEnableDisable(I[I[I)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "enableBands"    # [I
    .param p3, "disableBands"    # [I

    .line 1373
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 1375
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1376
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1377
    const/4 v1, 0x0

    return v1

    .line 1380
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2, p3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setLTEBandsEnableDisable(I[I[I)Z

    move-result v1

    .line 1381
    .local v1, "ret":Z
    if-eqz v1, :cond_1

    .line 1382
    const-string v2, "LTE"

    invoke-virtual {p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->notifyNVChanges(Ljava/lang/String;)V

    .line 1384
    :cond_1
    return v1
.end method

.method public setLine1NumberToSim(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 6
    .param p1, "subId"    # I
    .param p2, "callingPackage"    # Ljava/lang/String;
    .param p3, "number"    # Ljava/lang/String;

    .line 3546
    const-string v0, "com.motorola.msimsettings"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 3547
    sget-boolean v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v0, :cond_0

    const-string v0, "setLine1NumberToSim : false because not from msimsettings"

    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 3548
    :cond_0
    return v1

    .line 3550
    :cond_1
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 3552
    sget-boolean v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[setLine1NumberToSim]+ subId:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "; number = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 3553
    :cond_2
    if-eqz p3, :cond_3

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0x14

    if-le v0, v2, :cond_3

    .line 3554
    const-string v0, "[setLine1NumberToSim]- number fail"

    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .line 3555
    return v1

    .line 3559
    :cond_3
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .line 3561
    .local v0, "identity":J
    :try_start_0
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/telephony/TelephonyManager;->getLine1AlphaTag(I)Ljava/lang/String;

    move-result-object v2

    .line 3562
    .local v2, "alphaTag":Ljava/lang/String;
    const/16 v3, 0x7d5

    new-instance v4, Landroid/util/Pair;

    invoke-direct {v4, v2, p3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-direct {p0, v3, v4, v5}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->sendRequest(ILjava/lang/Object;Ljava/lang/Integer;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3565
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 3562
    return v3

    .line 3565
    .end local v2    # "alphaTag":Ljava/lang/String;
    :catchall_0
    move-exception v2

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 3566
    throw v2
.end method

.method public setLteBsrTimer(IILjava/lang/String;)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "timer"    # I
    .param p3, "spcLockCode"    # Ljava/lang/String;

    .line 1826
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 1828
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1829
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1830
    const/4 v1, 0x0

    return v1

    .line 1833
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2, p3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setLteBsrTimer(IILjava/lang/String;)Z

    move-result v1

    return v1
.end method

.method protected setLteError(ILcom/motorola/android/telephony/MotoExtTelephonyInfo$LteError;)V
    .locals 6
    .param p1, "phoneId"    # I
    .param p2, "lteError"    # Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteError;

    .line 2893
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mLteErrorList:[Ljava/util/List;

    aget-object v0, v0, p1

    monitor-enter v0

    .line 2894
    :try_start_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mLteErrorList:[Ljava/util/List;

    aget-object v1, v1, p1

    invoke-interface {v1}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .line 2895
    .local v1, "iterator":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteError;>;"
    const/4 v2, 0x0

    .line 2896
    .local v2, "match":Z
    :goto_0
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2897
    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteError;

    .line 2898
    .local v3, "e":Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteError;
    iget-object v4, v3, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteError;->apnName:Ljava/lang/String;

    iget-object v5, p2, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteError;->apnName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2900
    invoke-interface {v1, p2}, Ljava/util/ListIterator;->set(Ljava/lang/Object;)V

    .line 2901
    const/4 v2, 0x1

    .line 2902
    goto :goto_1

    .line 2904
    .end local v3    # "e":Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteError;
    :cond_0
    goto :goto_0

    .line 2905
    :cond_1
    :goto_1
    if-nez v2, :cond_2

    .line 2906
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mLteErrorList:[Ljava/util/List;

    aget-object v3, v3, p1

    invoke-interface {v3, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2908
    .end local v1    # "iterator":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lcom/motorola/android/telephony/MotoExtTelephonyInfo$LteError;>;"
    .end local v2    # "match":Z
    :cond_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2910
    invoke-virtual {p0, p1, p2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->notifyLteErrorForPhone(ILcom/motorola/android/telephony/MotoExtTelephonyInfo$LteError;)V

    .line 2911
    return-void

    .line 2908
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public setMaxBsrTimerStages(II)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "stages"    # I

    .line 1787
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 1789
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1790
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1791
    const/4 v1, 0x0

    return v1

    .line 1794
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setMaxBsrTimerStages(II)Z

    move-result v1

    return v1
.end method

.method public setMobilePRev(IILjava/lang/String;)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "PRevValue"    # I
    .param p3, "spcLockCode"    # Ljava/lang/String;

    .line 2717
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 2719
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2720
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 2721
    const/4 v1, 0x0

    return v1

    .line 2724
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2, p3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setMobilePRev(IILjava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public setNRBandsEnableDisable(I[I[I[I[I)Z
    .locals 7
    .param p1, "subId"    # I
    .param p2, "enableSABands"    # [I
    .param p3, "disableSABands"    # [I
    .param p4, "enableNSABands"    # [I
    .param p5, "disableNSABands"    # [I

    .line 1400
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 1402
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v6

    .line 1403
    .local v6, "phoneId":I
    invoke-virtual {p0, v6}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1404
    const/4 v0, 0x0

    return v0

    .line 1407
    :cond_0
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    move v1, v6

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setNRBandsEnableDisable(I[I[I[I[I)Z

    move-result v0

    return v0
.end method

.method public setNamInfo(ILcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;Ljava/lang/String;)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "namInfo"    # Lcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;
    .param p3, "spcLockCode"    # Ljava/lang/String;

    .line 2796
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 2798
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2799
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 2800
    const/4 v1, 0x0

    return v1

    .line 2803
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2, p3}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setNamInfo(ILcom/motorola/android/telephony/MotoExtTelephonyInfo$CdmaNAMInfo;Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public setNextLteScan(II)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "timer"    # I

    .line 1728
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 1730
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1731
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1732
    const/4 v1, 0x0

    return v1

    .line 1735
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setNextLteScan(II)Z

    move-result v1

    return v1
.end method

.method public setNrModeDisabled(II)V
    .locals 6
    .param p1, "subId"    # I
    .param p2, "mode"    # I

    .line 3416
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 3417
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 3418
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 3419
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid phoneId:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .line 3420
    return-void

    .line 3423
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "moto_nr_mode_disabled"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, p2}, Lcom/motorola/android/provider/MotorolaSettings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 3425
    const v1, 0x50049

    .line 3426
    .local v1, "reqId":I
    const/16 v2, 0x9

    new-array v2, v2, [B

    .line 3427
    .local v2, "data":[B
    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 3428
    .local v3, "buf":Ljava/nio/ByteBuffer;
    invoke-static {v1}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 3429
    invoke-virtual {v3, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    int-to-byte v5, p2

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 3430
    const/4 v4, 0x0

    invoke-virtual {p0, v0, v2, v4}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    .line 3431
    return-void
.end method

.method public setProvisionUpdateDoneRequest(IB)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "carrierId"    # B

    .line 604
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 606
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 607
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 608
    const/4 v1, 0x0

    return v1

    .line 611
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setProvisionUpdateRequest(IB)Z

    move-result v1

    return v1
.end method

.method public setQAMDLEnabled(IZ)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "enabled"    # Z

    .line 1573
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 1575
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1576
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1577
    const/4 v1, 0x0

    return v1

    .line 1580
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->set256QAMDLEnabled(IZ)Z

    move-result v1

    return v1
.end method

.method public setQAMULEnabled(IZ)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "enabled"    # Z

    .line 1611
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 1613
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1614
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1615
    const/4 v1, 0x0

    return v1

    .line 1618
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->set64QAMULEnabled(IZ)Z

    move-result v1

    return v1
.end method

.method public setSO68Enabled(IZ)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "enabled"    # Z

    .line 485
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 487
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 488
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 489
    const/4 v1, 0x0

    return v1

    .line 492
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setSO68Enabled(IZ)Z

    move-result v1

    return v1
.end method

.method public setSO73COP0Enabled(IZ)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "enabled"    # Z

    .line 523
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 525
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 526
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 527
    const/4 v1, 0x0

    return v1

    .line 530
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setSO73COP0Enabled(IZ)Z

    move-result v1

    return v1
.end method

.method public setSO73COP1To7Enabled(IZ)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "enabled"    # Z

    .line 561
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 563
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 564
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 565
    const/4 v1, 0x0

    return v1

    .line 568
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setSO73COP1To7Enabled(IZ)Z

    move-result v1

    return v1
.end method

.method public setSimLock(I[B)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "lock"    # [B

    .line 1477
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 1479
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1480
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1481
    const/4 v1, 0x0

    return v1

    .line 1484
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setSimLock(I[B)Z

    move-result v1

    return v1
.end method

.method public setSprintVoiceServiceOption(ILcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;Ljava/lang/String;)Z
    .locals 4
    .param p1, "subId"    # I
    .param p2, "serviceOption"    # Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;
    .param p3, "spcLockCode"    # Ljava/lang/String;

    .line 2849
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 2851
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2852
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 2853
    return v2

    .line 2856
    :cond_0
    iget v1, p2, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;->homePageVoice:I

    if-ltz v1, :cond_2

    iget v1, p2, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;->homePageVoice:I

    const/16 v3, 0x8

    if-gt v1, v3, :cond_2

    iget v1, p2, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;->homeOrigVoice:I

    if-ltz v1, :cond_2

    iget v1, p2, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;->homeOrigVoice:I

    if-gt v1, v3, :cond_2

    iget v1, p2, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;->roamOrigVoice:I

    if-ltz v1, :cond_2

    iget v1, p2, Lcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;->roamOrigVoice:I

    if-le v1, v3, :cond_1

    goto :goto_0

    .line 2865
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setSprintVoiceServiceOption(ILcom/motorola/android/telephony/MotoExtTelephonyInfo$SprintCDMAVoiceServiceOption;)Z

    move-result v1

    return v1

    .line 2862
    :cond_2
    :goto_0
    return v2
.end method

.method public setTDDTM9Enabled(IZ)Z
    .locals 2
    .param p1, "subId"    # I
    .param p2, "enabled"    # Z

    .line 1687
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 1689
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 1690
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1691
    const/4 v1, 0x0

    return v1

    .line 1694
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setTDDTM9Enabled(IZ)Z

    move-result v1

    return v1
.end method

.method public setVoNRSetting(IZ)Z
    .locals 7
    .param p1, "subId"    # I
    .param p2, "enabled"    # Z

    .line 3139
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 3141
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 3142
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 3143
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid phoneId:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .line 3144
    return v2

    .line 3147
    :cond_0
    const v1, 0x5004d

    .line 3148
    .local v1, "reqId":I
    const/16 v3, 0x9

    new-array v3, v3, [B

    .line 3149
    .local v3, "data":[B
    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 3150
    .local v4, "buf":Ljava/nio/ByteBuffer;
    invoke-static {v1}, Lcom/motorola/android/internal/telephony/QcomOemConstants;->getByteOrderByRequestId(I)Ljava/nio/ByteOrder;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 3151
    invoke-virtual {v4, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 3152
    const/4 v5, 0x0

    invoke-virtual {p0, v0, v3, v5}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v5

    if-ltz v5, :cond_1

    .line 3153
    return v6

    .line 3155
    :cond_1
    return v2
.end method

.method public setVoiceDomainSetting(II)Z
    .locals 3
    .param p1, "subId"    # I
    .param p2, "setting"    # I

    .line 2950
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 2952
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 2953
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 2954
    return v2

    .line 2957
    :cond_0
    if-ltz p2, :cond_2

    const/4 v1, 0x3

    if-le p2, v1, :cond_1

    goto :goto_0

    .line 2962
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p2}, Lcom/motorola/android/internal/telephony/QcomNvManager;->setVoiceDomainSetting(II)Z

    move-result v1

    return v1

    .line 2959
    :cond_2
    :goto_0
    return v2
.end method

.method public supplyIccDepersonalization(ILjava/lang/String;ILcom/motorola/android/internal/telephony/IMotoDepersoCB;)V
    .locals 4
    .param p1, "lockType"    # I
    .param p2, "pin"    # Ljava/lang/String;
    .param p3, "phoneId"    # I
    .param p4, "callback"    # Lcom/motorola/android/internal/telephony/IMotoDepersoCB;

    .line 1116
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 1119
    const/4 v0, 0x1

    :try_start_0
    new-instance v1, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$1;

    invoke-direct {v1, p0, p4}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService$1;-><init>(Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;Lcom/motorola/android/internal/telephony/IMotoDepersoCB;)V

    .line 1130
    .local v1, "qcCallback":Lorg/codeaurora/internal/IDepersoResCallback;
    invoke-virtual {p0, p3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1131
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid phoenId:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .line 1132
    invoke-interface {p4, v0, p3}, Lcom/motorola/android/internal/telephony/IMotoDepersoCB;->onDepersoResult(II)V

    .line 1133
    return-void

    .line 1136
    :cond_0
    invoke-direct {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getIExtTelephony()Lorg/codeaurora/internal/IExtTelephony;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, p2, v3, v1, p3}, Lorg/codeaurora/internal/IExtTelephony;->supplyIccDepersonalization(Ljava/lang/String;Ljava/lang/String;Lorg/codeaurora/internal/IDepersoResCallback;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1145
    .end local v1    # "qcCallback":Lorg/codeaurora/internal/IDepersoResCallback;
    goto :goto_0

    .line 1138
    :catch_0
    move-exception v1

    .line 1139
    .local v1, "ex":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exception @supplyIccDepersonalization"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .line 1141
    :try_start_1
    invoke-interface {p4, v0, p3}, Lcom/motorola/android/internal/telephony/IMotoDepersoCB;->onDepersoResult(II)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1144
    goto :goto_0

    .line 1142
    :catch_1
    move-exception v0

    .line 1143
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "RemoteException @IDepersoResCallback"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .line 1146
    .end local v0    # "e":Landroid/os/RemoteException;
    .end local v1    # "ex":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public unlockDevice(Lcom/motorola/android/telephony/MotoExtTelephonyInfo$UnlockInfo;)I
    .locals 1
    .param p1, "unlockInfo"    # Lcom/motorola/android/telephony/MotoExtTelephonyInfo$UnlockInfo;

    .line 1269
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 1270
    const/16 v0, 0x7d4

    invoke-direct {p0, v0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->sendRequest(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public vendorInvokeOemRilRequestRawAsync(I[BLcom/motorola/android/internal/telephony/IMotoOemCB;)I
    .locals 3
    .param p1, "subId"    # I
    .param p2, "oemReq"    # [B
    .param p3, "motoOemCB"    # Lcom/motorola/android/internal/telephony/IMotoOemCB;

    .line 3193
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 3195
    sget-boolean v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "vendorInvokeOemRilRequestRawAsync: subId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 3197
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 3198
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 3199
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid phoneId:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .line 3200
    const/4 v1, -0x1

    return v1

    .line 3203
    :cond_1
    invoke-virtual {p0, v0, p2, p3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawAsync(I[BLcom/motorola/android/internal/telephony/IMotoOemCB;)I

    move-result v1

    return v1
.end method

.method public vendorInvokeOemRilRequestRawSync(I[B[B)I
    .locals 3
    .param p1, "subId"    # I
    .param p2, "oemReq"    # [B
    .param p3, "oemResp"    # [B

    .line 3170
    invoke-virtual {p0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->enforceModifyPermission()V

    .line 3172
    sget-boolean v0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->DBG:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "vendorInvokeOemRilRequestRawSync: subId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->logd(Ljava/lang/String;)V

    .line 3174
    :cond_0
    invoke-virtual {p0, p1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 3175
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 3176
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid phoneId:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->loge(Ljava/lang/String;)V

    .line 3177
    const/4 v1, -0x1

    return v1

    .line 3180
    :cond_1
    invoke-virtual {p0, v0, p2, p3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->invokeOemRilRequestRawForPhone(I[B[B)I

    move-result v1

    return v1
.end method

.method public verifyMsl(Ljava/lang/String;ILjava/lang/String;)Z
    .locals 3
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "subId"    # I
    .param p3, "callingPackage"    # Ljava/lang/String;

    .line 643
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const-string v2, "verifyMsl"

    invoke-static {v0, p2, p3, v1, v2}, Lcom/android/internal/telephony/TelephonyPermissions;->checkCallingOrSelfReadPhoneState(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 645
    return v1

    .line 648
    :cond_0
    invoke-virtual {p0, p2}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->getPhoneId(I)I

    move-result v0

    .line 649
    .local v0, "phoneId":I
    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->validatePhoneId(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 650
    return v1

    .line 653
    :cond_1
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->mNvManager:Lcom/motorola/android/internal/telephony/QcomNvManager;

    invoke-virtual {v1, v0, p1}, Lcom/motorola/android/internal/telephony/QcomNvManager;->verifyMsl(ILjava/lang/String;)Z

    move-result v1

    return v1
.end method
