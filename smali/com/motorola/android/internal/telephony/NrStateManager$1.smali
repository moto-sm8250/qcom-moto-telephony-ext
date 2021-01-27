.class Lcom/motorola/android/internal/telephony/NrStateManager$1;
.super Landroid/os/Handler;
.source "NrStateManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/motorola/android/internal/telephony/NrStateManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/android/internal/telephony/NrStateManager;


# direct methods
.method constructor <init>(Lcom/motorola/android/internal/telephony/NrStateManager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/motorola/android/internal/telephony/NrStateManager;

    .line 167
    iput-object p1, p0, Lcom/motorola/android/internal/telephony/NrStateManager$1;->this$0:Lcom/motorola/android/internal/telephony/NrStateManager;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7
    .param p1, "msg"    # Landroid/os/Message;

    .line 169
    iget v0, p1, Landroid/os/Message;->what:I

    .line 170
    .local v0, "what":I
    shr-int/lit8 v1, v0, 0x10

    .line 171
    .local v1, "slotId":I
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/NrStateManager$1;->this$0:Lcom/motorola/android/internal/telephony/NrStateManager;

    invoke-virtual {v2, v1}, Lcom/motorola/android/internal/telephony/NrStateManager;->getCurrentServiceState(I)Lcom/motorola/android/internal/telephony/NrServiceState;

    move-result-object v2

    .line 172
    .local v2, "state":Lcom/motorola/android/internal/telephony/NrServiceState;
    const v3, 0xffff

    and-int/2addr v3, v0

    packed-switch v3, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_0

    .line 211
    :pswitch_1
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/NrStateManager$1;->this$0:Lcom/motorola/android/internal/telephony/NrStateManager;

    const-string v4, "MESSAGE_ENABLE_ENDC_STATUS"

    invoke-virtual {v3, v4}, Lcom/motorola/android/internal/telephony/NrStateManager;->logd(Ljava/lang/String;)V

    .line 213
    :try_start_0
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/NrStateManager$1;->this$0:Lcom/motorola/android/internal/telephony/NrStateManager;

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/NrStateManager;->access$500(Lcom/motorola/android/internal/telephony/NrStateManager;)Lorg/codeaurora/internal/IExtTelephony;

    move-result-object v3

    iget-object v4, p0, Lcom/motorola/android/internal/telephony/NrStateManager$1;->this$0:Lcom/motorola/android/internal/telephony/NrStateManager;

    invoke-static {v4}, Lcom/motorola/android/internal/telephony/NrStateManager;->access$400(Lcom/motorola/android/internal/telephony/NrStateManager;)Lorg/codeaurora/internal/Client;

    move-result-object v4

    invoke-interface {v3, v1, v4}, Lorg/codeaurora/internal/IExtTelephony;->queryEndcStatus(ILorg/codeaurora/internal/Client;)Lorg/codeaurora/internal/Token;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 216
    goto/16 :goto_0

    .line 214
    :catch_0
    move-exception v3

    .line 215
    .local v3, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/motorola/android/internal/telephony/NrStateManager$1;->this$0:Lcom/motorola/android/internal/telephony/NrStateManager;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "queryEndcStatus: Exception = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/motorola/android/internal/telephony/NrStateManager;->logd(Ljava/lang/String;)V

    .line 217
    .end local v3    # "e":Ljava/lang/Exception;
    goto/16 :goto_0

    .line 202
    :pswitch_2
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/NrStateManager$1;->this$0:Lcom/motorola/android/internal/telephony/NrStateManager;

    const-string v4, "MESSAGE_ENDC_STATUS_CHANGE"

    invoke-virtual {v3, v4}, Lcom/motorola/android/internal/telephony/NrStateManager;->logd(Ljava/lang/String;)V

    .line 203
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Integer;

    .line 204
    .local v3, "enabled":Ljava/lang/Integer;
    invoke-virtual {v2}, Lcom/motorola/android/internal/telephony/NrServiceState;->getEndcEnabled()I

    move-result v4

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-eq v4, v5, :cond_2

    .line 205
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/motorola/android/internal/telephony/NrServiceState;->setEndcEnabled(I)V

    .line 206
    iget-object v4, p0, Lcom/motorola/android/internal/telephony/NrStateManager$1;->this$0:Lcom/motorola/android/internal/telephony/NrStateManager;

    invoke-static {v4}, Lcom/motorola/android/internal/telephony/NrStateManager;->access$300(Lcom/motorola/android/internal/telephony/NrStateManager;)Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    move-result-object v4

    invoke-virtual {v2}, Lcom/motorola/android/internal/telephony/NrServiceState;->isEndcEnabled()Z

    move-result v5

    invoke-virtual {v4, v1, v5}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->notifyEndcStatusChanged(IZ)V

    goto/16 :goto_0

    .line 194
    .end local v3    # "enabled":Ljava/lang/Integer;
    :pswitch_3
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/NrStateManager$1;->this$0:Lcom/motorola/android/internal/telephony/NrStateManager;

    const-string v4, "MESSAGE_BEARER_ALLOCATION"

    invoke-virtual {v3, v4}, Lcom/motorola/android/internal/telephony/NrStateManager;->logd(Ljava/lang/String;)V

    .line 195
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 196
    .local v3, "bearer":I
    invoke-virtual {v2}, Lcom/motorola/android/internal/telephony/NrServiceState;->getBearer()I

    move-result v4

    if-eq v4, v3, :cond_2

    .line 197
    invoke-virtual {v2, v3}, Lcom/motorola/android/internal/telephony/NrServiceState;->setBearer(I)V

    .line 198
    iget-object v4, p0, Lcom/motorola/android/internal/telephony/NrStateManager$1;->this$0:Lcom/motorola/android/internal/telephony/NrStateManager;

    invoke-static {v4}, Lcom/motorola/android/internal/telephony/NrStateManager;->access$300(Lcom/motorola/android/internal/telephony/NrStateManager;)Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    move-result-object v4

    invoke-virtual {v4, v1, v3}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->notifyNrBearerAllocationChanged(II)V

    goto :goto_0

    .line 186
    .end local v3    # "bearer":I
    :pswitch_4
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/NrStateManager$1;->this$0:Lcom/motorola/android/internal/telephony/NrStateManager;

    const-string v4, "MESSAGE_DATA_ICON_CHANGED"

    invoke-virtual {v3, v4}, Lcom/motorola/android/internal/telephony/NrStateManager;->logd(Ljava/lang/String;)V

    .line 187
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Integer;

    .line 188
    .local v3, "dataIconType":Ljava/lang/Integer;
    invoke-virtual {v2}, Lcom/motorola/android/internal/telephony/NrServiceState;->getDataIconType()I

    move-result v4

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-eq v4, v5, :cond_2

    .line 189
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/motorola/android/internal/telephony/NrServiceState;->setDataIconType(I)V

    .line 190
    iget-object v4, p0, Lcom/motorola/android/internal/telephony/NrStateManager$1;->this$0:Lcom/motorola/android/internal/telephony/NrStateManager;

    invoke-static {v4}, Lcom/motorola/android/internal/telephony/NrStateManager;->access$300(Lcom/motorola/android/internal/telephony/NrStateManager;)Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v4, v1, v5}, Lcom/motorola/android/internal/telephony/QcomMotoExtTelephonyService;->notifyNrDataIconTypeChanged(II)V

    goto :goto_0

    .line 180
    .end local v3    # "dataIconType":Ljava/lang/Integer;
    :pswitch_5
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/NrStateManager$1;->this$0:Lcom/motorola/android/internal/telephony/NrStateManager;

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/NrStateManager;->access$000(Lcom/motorola/android/internal/telephony/NrStateManager;)Landroid/os/PowerManager$WakeLock;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 181
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/NrStateManager$1;->this$0:Lcom/motorola/android/internal/telephony/NrStateManager;

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/NrStateManager;->access$000(Lcom/motorola/android/internal/telephony/NrStateManager;)Landroid/os/PowerManager$WakeLock;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 183
    :cond_0
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/NrStateManager$1;->this$0:Lcom/motorola/android/internal/telephony/NrStateManager;

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/NrStateManager;->access$200(Lcom/motorola/android/internal/telephony/NrStateManager;)V

    .line 184
    goto :goto_0

    .line 174
    :pswitch_6
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/NrStateManager$1;->this$0:Lcom/motorola/android/internal/telephony/NrStateManager;

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/NrStateManager;->access$000(Lcom/motorola/android/internal/telephony/NrStateManager;)Landroid/os/PowerManager$WakeLock;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 175
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/NrStateManager$1;->this$0:Lcom/motorola/android/internal/telephony/NrStateManager;

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/NrStateManager;->access$000(Lcom/motorola/android/internal/telephony/NrStateManager;)Landroid/os/PowerManager$WakeLock;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 177
    :cond_1
    iget-object v3, p0, Lcom/motorola/android/internal/telephony/NrStateManager$1;->this$0:Lcom/motorola/android/internal/telephony/NrStateManager;

    invoke-static {v3}, Lcom/motorola/android/internal/telephony/NrStateManager;->access$100(Lcom/motorola/android/internal/telephony/NrStateManager;)V

    .line 178
    nop

    .line 223
    :cond_2
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x400
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
