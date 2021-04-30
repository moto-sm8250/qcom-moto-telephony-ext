.class public Lcom/motorola/android/internal/telephony/NrStateManager;
.super Ljava/lang/Object;
.source "NrStateManager.java"


# static fields
.field private static final DELAY_INCREMENT:I = 0x7d0

.field private static final DELAY_MILLISECOND:I = 0xbb8

.field private static final MAX_RETRY:I = 0x4

.field private static final MESSAGE_BEARER_ALLOCATION:I = 0x404

.field private static final MESSAGE_DATA_ICON_CHANGED:I = 0x402

.field private static final MESSAGE_ENABLE_ENDC_STATUS:I = 0x406

.field private static final MESSAGE_ENDC_STATUS_CHANGE:I = 0x405

.field private static final MESSAGE_REBIND:I = 0x400

.field private static final MESSAGE_REINIT:I = 0x401

.field private static final PHONE_ID_MESSAGE_MASK:I = 0xffff

.field private static final PHONE_ID_MESSAGE_SHIFT:I = 0x10

.field private static final TAG:Ljava/lang/String; = "NrStateManager"


# instance fields
.field private mBindRetryTimes:I

.field private mCallback:Lorg/codeaurora/internal/INetworkCallback;

.field private mClient:Lorg/codeaurora/internal/Client;

.field private mContext:Landroid/content/Context;

.field private final mCurrentServiceStates:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/motorola/android/internal/telephony/NrServiceState;",
            ">;"
        }
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;

.field private mInitRetryTimes:I

.field private mMotoExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

.field private mNetworkService:Lorg/codeaurora/internal/IExtTelephony;

.field private mNrEnabledRetryTimes:I

.field private mPackageName:Ljava/lang/String;

.field private mPhoneCount:I

.field private mPm:Landroid/os/PowerManager;

.field private mServiceConnected:Z

.field private mServiceConnection:Landroid/content/ServiceConnection;

.field private mWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method public constructor <init>(Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;ILandroid/content/Context;)V
    .locals 3
    .param p1, "service"    # Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;
    .param p2, "phoneCount"    # I
    .param p3, "context"    # Landroid/content/Context;

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mCurrentServiceStates:Landroid/util/SparseArray;

    .line 68
    const/4 v0, 0x0

    iput v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mBindRetryTimes:I

    .line 69
    iput v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mInitRetryTimes:I

    .line 70
    iput v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mNrEnabledRetryTimes:I

    .line 167
    new-instance v0, Lcom/motorola/android/internal/telephony/NrStateManager$1;

    invoke-direct {v0, p0}, Lcom/motorola/android/internal/telephony/NrStateManager$1;-><init>(Lcom/motorola/android/internal/telephony/NrStateManager;)V

    iput-object v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mHandler:Landroid/os/Handler;

    .line 226
    new-instance v0, Lcom/motorola/android/internal/telephony/NrStateManager$2;

    invoke-direct {v0, p0}, Lcom/motorola/android/internal/telephony/NrStateManager$2;-><init>(Lcom/motorola/android/internal/telephony/NrStateManager;)V

    iput-object v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mServiceConnection:Landroid/content/ServiceConnection;

    .line 270
    new-instance v0, Lcom/motorola/android/internal/telephony/NrStateManager$3;

    invoke-direct {v0, p0}, Lcom/motorola/android/internal/telephony/NrStateManager$3;-><init>(Lcom/motorola/android/internal/telephony/NrStateManager;)V

    iput-object v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mCallback:Lorg/codeaurora/internal/INetworkCallback;

    .line 76
    const-string v0, "new NrStateManager"

    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/NrStateManager;->logd(Ljava/lang/String;)V

    .line 77
    iput-object p1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mMotoExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    .line 78
    iput p2, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mPhoneCount:I

    .line 79
    iput-object p3, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mContext:Landroid/content/Context;

    .line 80
    invoke-virtual {p3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mPackageName:Ljava/lang/String;

    .line 81
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mContext:Landroid/content/Context;

    const-string v1, "power"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    iput-object v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mPm:Landroid/os/PowerManager;

    .line 82
    if-eqz v0, :cond_0

    .line 83
    const/4 v1, 0x1

    const-string v2, "NrStateManager"

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 85
    :cond_0
    invoke-direct {p0}, Lcom/motorola/android/internal/telephony/NrStateManager;->binderService()V

    .line 86
    return-void
.end method

.method static synthetic access$000(Lcom/motorola/android/internal/telephony/NrStateManager;)Landroid/os/PowerManager$WakeLock;
    .locals 1
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/NrStateManager;

    .line 42
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    return-object v0
.end method

.method static synthetic access$100(Lcom/motorola/android/internal/telephony/NrStateManager;)V
    .locals 0
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/NrStateManager;

    .line 42
    invoke-direct {p0}, Lcom/motorola/android/internal/telephony/NrStateManager;->binderService()V

    return-void
.end method

.method static synthetic access$1000(Lcom/motorola/android/internal/telephony/NrStateManager;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/NrStateManager;

    .line 42
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$200(Lcom/motorola/android/internal/telephony/NrStateManager;)V
    .locals 0
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/NrStateManager;

    .line 42
    invoke-direct {p0}, Lcom/motorola/android/internal/telephony/NrStateManager;->initNrServiceState()V

    return-void
.end method

.method static synthetic access$300(Lcom/motorola/android/internal/telephony/NrStateManager;)Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;
    .locals 1
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/NrStateManager;

    .line 42
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mMotoExtService:Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    return-object v0
.end method

.method static synthetic access$400(Lcom/motorola/android/internal/telephony/NrStateManager;)Lorg/codeaurora/internal/Client;
    .locals 1
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/NrStateManager;

    .line 42
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mClient:Lorg/codeaurora/internal/Client;

    return-object v0
.end method

.method static synthetic access$402(Lcom/motorola/android/internal/telephony/NrStateManager;Lorg/codeaurora/internal/Client;)Lorg/codeaurora/internal/Client;
    .locals 0
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/NrStateManager;
    .param p1, "x1"    # Lorg/codeaurora/internal/Client;

    .line 42
    iput-object p1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mClient:Lorg/codeaurora/internal/Client;

    return-object p1
.end method

.method static synthetic access$500(Lcom/motorola/android/internal/telephony/NrStateManager;)Lorg/codeaurora/internal/IExtTelephony;
    .locals 1
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/NrStateManager;

    .line 42
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mNetworkService:Lorg/codeaurora/internal/IExtTelephony;

    return-object v0
.end method

.method static synthetic access$502(Lcom/motorola/android/internal/telephony/NrStateManager;Lorg/codeaurora/internal/IExtTelephony;)Lorg/codeaurora/internal/IExtTelephony;
    .locals 0
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/NrStateManager;
    .param p1, "x1"    # Lorg/codeaurora/internal/IExtTelephony;

    .line 42
    iput-object p1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mNetworkService:Lorg/codeaurora/internal/IExtTelephony;

    return-object p1
.end method

.method static synthetic access$600(Lcom/motorola/android/internal/telephony/NrStateManager;)I
    .locals 1
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/NrStateManager;

    .line 42
    iget v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mBindRetryTimes:I

    return v0
.end method

.method static synthetic access$602(Lcom/motorola/android/internal/telephony/NrStateManager;I)I
    .locals 0
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/NrStateManager;
    .param p1, "x1"    # I

    .line 42
    iput p1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mBindRetryTimes:I

    return p1
.end method

.method static synthetic access$700(Lcom/motorola/android/internal/telephony/NrStateManager;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/NrStateManager;

    .line 42
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mPackageName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$800(Lcom/motorola/android/internal/telephony/NrStateManager;)Lorg/codeaurora/internal/INetworkCallback;
    .locals 1
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/NrStateManager;

    .line 42
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mCallback:Lorg/codeaurora/internal/INetworkCallback;

    return-object v0
.end method

.method static synthetic access$902(Lcom/motorola/android/internal/telephony/NrStateManager;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/motorola/android/internal/telephony/NrStateManager;
    .param p1, "x1"    # Z

    .line 42
    iput-boolean p1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mServiceConnected:Z

    return p1
.end method

.method private binderService()V
    .locals 5

    .line 89
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-static {v0, v1}, Lorg/codeaurora/internal/ServiceUtil;->bindService(Landroid/content/Context;Landroid/content/ServiceConnection;)Z

    move-result v0

    .line 90
    .local v0, "success":Z
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " bind service "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/NrStateManager;->logd(Ljava/lang/String;)V

    .line 91
    if-nez v0, :cond_1

    iget v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mBindRetryTimes:I

    const/4 v2, 0x4

    if-ge v1, v2, :cond_1

    iget-object v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mHandler:Landroid/os/Handler;

    const/16 v2, 0x400

    invoke-virtual {v1, v2}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 92
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v1, :cond_0

    .line 93
    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 95
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mHandler:Landroid/os/Handler;

    iget v3, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mBindRetryTimes:I

    mul-int/lit16 v3, v3, 0x7d0

    add-int/lit16 v3, v3, 0xbb8

    int-to-long v3, v3

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 97
    iget v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mBindRetryTimes:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mBindRetryTimes:I

    .line 99
    :cond_1
    return-void
.end method

.method private static getServiceState(ILandroid/util/SparseArray;)Lcom/motorola/android/internal/telephony/NrServiceState;
    .locals 2
    .param p0, "key"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/util/SparseArray<",
            "Lcom/motorola/android/internal/telephony/NrServiceState;",
            ">;)",
            "Lcom/motorola/android/internal/telephony/NrServiceState;"
        }
    .end annotation

    .line 119
    .local p1, "array":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/motorola/android/internal/telephony/NrServiceState;>;"
    invoke-virtual {p1, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/motorola/android/internal/telephony/NrServiceState;

    .line 120
    .local v0, "state":Lcom/motorola/android/internal/telephony/NrServiceState;
    if-nez v0, :cond_0

    .line 121
    new-instance v1, Lcom/motorola/android/internal/telephony/NrServiceState;

    invoke-direct {v1}, Lcom/motorola/android/internal/telephony/NrServiceState;-><init>()V

    move-object v0, v1

    .line 122
    invoke-virtual {p1, p0, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 124
    :cond_0
    return-object v0
.end method

.method private initNrServiceState()V
    .locals 2

    .line 128
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "initNrServiceState size="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mPhoneCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/NrStateManager;->logd(Ljava/lang/String;)V

    .line 129
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mPhoneCount:I

    if-ge v0, v1, :cond_0

    .line 130
    invoke-direct {p0, v0}, Lcom/motorola/android/internal/telephony/NrStateManager;->initNrServiceState(I)V

    .line 129
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 132
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method private initNrServiceState(I)V
    .locals 5
    .param p1, "phoneId"    # I

    .line 135
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mNetworkService="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mNetworkService:Lorg/codeaurora/internal/IExtTelephony;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " mClient="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mClient:Lorg/codeaurora/internal/Client;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/NrStateManager;->logd(Ljava/lang/String;)V

    .line 136
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mNetworkService:Lorg/codeaurora/internal/IExtTelephony;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mClient:Lorg/codeaurora/internal/Client;

    if-eqz v0, :cond_1

    .line 137
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "query 5G service state for phoneId "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/motorola/android/internal/telephony/NrStateManager;->logd(Ljava/lang/String;)V

    .line 139
    :try_start_0
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mNetworkService:Lorg/codeaurora/internal/IExtTelephony;

    iget-object v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mClient:Lorg/codeaurora/internal/Client;

    invoke-interface {v0, p1, v1}, Lorg/codeaurora/internal/IExtTelephony;->queryNrDcParam(ILorg/codeaurora/internal/Client;)Lorg/codeaurora/internal/Token;

    move-result-object v0

    .line 140
    .local v0, "token":Lorg/codeaurora/internal/Token;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "queryNrDcParam result:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/NrStateManager;->logd(Ljava/lang/String;)V

    .line 141
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mNetworkService:Lorg/codeaurora/internal/IExtTelephony;

    iget-object v2, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mClient:Lorg/codeaurora/internal/Client;

    invoke-interface {v1, p1, v2}, Lorg/codeaurora/internal/IExtTelephony;->queryNrBearerAllocation(ILorg/codeaurora/internal/Client;)Lorg/codeaurora/internal/Token;

    move-result-object v1

    move-object v0, v1

    .line 142
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "queryNrBearerAllocation result:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/NrStateManager;->logd(Ljava/lang/String;)V

    .line 143
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mNetworkService:Lorg/codeaurora/internal/IExtTelephony;

    iget-object v2, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mClient:Lorg/codeaurora/internal/Client;

    invoke-interface {v1, p1, v2}, Lorg/codeaurora/internal/IExtTelephony;->queryNrSignalStrength(ILorg/codeaurora/internal/Client;)Lorg/codeaurora/internal/Token;

    move-result-object v1

    move-object v0, v1

    .line 144
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "queryNrSignalStrength result:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/NrStateManager;->logd(Ljava/lang/String;)V

    .line 145
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mNetworkService:Lorg/codeaurora/internal/IExtTelephony;

    iget-object v2, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mClient:Lorg/codeaurora/internal/Client;

    invoke-interface {v1, p1, v2}, Lorg/codeaurora/internal/IExtTelephony;->query5gStatus(ILorg/codeaurora/internal/Client;)Lorg/codeaurora/internal/Token;

    move-result-object v1

    move-object v0, v1

    .line 146
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "query5gStatus result:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/NrStateManager;->logd(Ljava/lang/String;)V

    .line 147
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mNetworkService:Lorg/codeaurora/internal/IExtTelephony;

    iget-object v2, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mClient:Lorg/codeaurora/internal/Client;

    invoke-interface {v1, p1, v2}, Lorg/codeaurora/internal/IExtTelephony;->queryNrIconType(ILorg/codeaurora/internal/Client;)Lorg/codeaurora/internal/Token;

    move-result-object v1

    move-object v0, v1

    .line 148
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "queryNrIconType result:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/NrStateManager;->logd(Ljava/lang/String;)V

    .line 150
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mNetworkService:Lorg/codeaurora/internal/IExtTelephony;

    iget-object v2, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mClient:Lorg/codeaurora/internal/Client;

    invoke-interface {v1, p1, v2}, Lorg/codeaurora/internal/IExtTelephony;->queryEndcStatus(ILorg/codeaurora/internal/Client;)Lorg/codeaurora/internal/Token;

    move-result-object v1

    move-object v0, v1

    .line 151
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "queryEndcStatus result:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/NrStateManager;->logd(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 163
    .end local v0    # "token":Lorg/codeaurora/internal/Token;
    goto :goto_0

    .line 153
    :catch_0
    move-exception v0

    .line 154
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initNrServiceState: Exception = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/NrStateManager;->logd(Ljava/lang/String;)V

    .line 155
    iget v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mInitRetryTimes:I

    const/4 v2, 0x4

    if-ge v1, v2, :cond_1

    iget-object v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mHandler:Landroid/os/Handler;

    const/16 v2, 0x401

    invoke-virtual {v1, v2}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 156
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v1, :cond_0

    .line 157
    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 159
    :cond_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mHandler:Landroid/os/Handler;

    iget v3, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mInitRetryTimes:I

    mul-int/lit16 v3, v3, 0x7d0

    add-int/lit16 v3, v3, 0xbb8

    int-to-long v3, v3

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 161
    iget v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mInitRetryTimes:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mInitRetryTimes:I

    .line 165
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public getCurrentServiceState(I)Lcom/motorola/android/internal/telephony/NrServiceState;
    .locals 1
    .param p1, "phoneId"    # I

    .line 106
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mCurrentServiceStates:Landroid/util/SparseArray;

    invoke-static {p1, v0}, Lcom/motorola/android/internal/telephony/NrStateManager;->getServiceState(ILandroid/util/SparseArray;)Lcom/motorola/android/internal/telephony/NrServiceState;

    move-result-object v0

    return-object v0
.end method

.method public isServiceConnected()Z
    .locals 1

    .line 102
    iget-boolean v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mServiceConnected:Z

    return v0
.end method

.method logd(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .line 324
    sget-boolean v0, Landroid/os/Build;->IS_DEBUGGABLE:Z

    if-eqz v0, :cond_0

    .line 325
    const-string v0, "NrStateManager"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 327
    :cond_0
    return-void
.end method

.method loge(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .line 330
    const-string v0, "NrStateManager"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 331
    return-void
.end method

.method public setEndcEnabled(IZ)V
    .locals 3
    .param p1, "phoneId"    # I
    .param p2, "enabled"    # Z

    .line 111
    :try_start_0
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mNetworkService:Lorg/codeaurora/internal/IExtTelephony;

    iget-object v1, p0, Lcom/motorola/android/internal/telephony/NrStateManager;->mClient:Lorg/codeaurora/internal/Client;

    invoke-interface {v0, p1, p2, v1}, Lorg/codeaurora/internal/IExtTelephony;->enableEndc(IZLorg/codeaurora/internal/Client;)Lorg/codeaurora/internal/Token;

    move-result-object v0

    .line 112
    .local v0, "token":Lorg/codeaurora/internal/Token;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "set endc enabled:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", result:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/NrStateManager;->logd(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    .end local v0    # "token":Lorg/codeaurora/internal/Token;
    goto :goto_0

    .line 113
    :catch_0
    move-exception v0

    .line 114
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "failed to set endc enabled as "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " due to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/motorola/android/internal/telephony/NrStateManager;->loge(Ljava/lang/String;)V

    .line 116
    .end local v0    # "e":Landroid/os/RemoteException;
    :goto_0
    return-void
.end method
