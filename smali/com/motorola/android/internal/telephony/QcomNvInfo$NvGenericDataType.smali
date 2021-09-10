.class public Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;
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
    name = "NvGenericDataType"
.end annotation


# instance fields
.field public data:[B


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 134
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    .line 135
    return-void
.end method

.method public constructor <init>(B)V
    .locals 2
    .param p1, "b"    # B

    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 143
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvInfo;->access$000()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "byte to byteArray = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MotoExtTM: QcomNvInfo"

    invoke-static {v1, v0}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [B

    const/4 v1, 0x0

    aput-byte p1, v0, v1

    iput-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    .line 145
    return-void
.end method

.method public constructor <init>(ILjava/nio/ByteOrder;)V
    .locals 3
    .param p1, "i"    # I
    .param p2, "byteOrder"    # Ljava/nio/ByteOrder;

    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 160
    const/4 v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 161
    .local v0, "buf":Ljava/nio/ByteBuffer;
    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 162
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 163
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvInfo;->access$000()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Integer to byteArray = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "MotoExtTM: QcomNvInfo"

    invoke-static {v2, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    :cond_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    iput-object v1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    .line 165
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 5
    .param p1, "s"    # Ljava/lang/String;

    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 176
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvInfo;->access$000()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "String to byteArray = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MotoExtTM: QcomNvInfo"

    invoke-static {v1, v0}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 178
    .local v0, "tempData":[B
    const/16 v1, 0x7f

    new-array v2, v1, [B

    iput-object v2, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    .line 179
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x0

    invoke-static {v0, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 180
    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-static {v2, v3, v1, v4}, Ljava/util/Arrays;->fill([BIIB)V

    .line 181
    return-void
.end method

.method public constructor <init>(SLjava/nio/ByteOrder;)V
    .locals 3
    .param p1, "i"    # S
    .param p2, "byteOrder"    # Ljava/nio/ByteOrder;

    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 168
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 169
    .local v0, "buf":Ljava/nio/ByteBuffer;
    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 170
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 171
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvInfo;->access$000()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "short to byteArray = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "MotoExtTM: QcomNvInfo"

    invoke-static {v2, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    :cond_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    iput-object v1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    .line 173
    return-void
.end method

.method public constructor <init>(ZLjava/nio/ByteOrder;)V
    .locals 3
    .param p1, "b"    # Z
    .param p2, "byteOrder"    # Ljava/nio/ByteOrder;

    .line 147
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 148
    const/4 v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 149
    .local v0, "buf":Ljava/nio/ByteBuffer;
    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 150
    if-eqz p1, :cond_0

    .line 151
    new-instance v1, Ljava/lang/Integer;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    goto :goto_0

    .line 153
    :cond_0
    new-instance v1, Ljava/lang/Integer;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 155
    :goto_0
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvInfo;->access$000()Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "boolean to byteArray = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "MotoExtTM: QcomNvInfo"

    invoke-static {v2, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    :cond_1
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    iput-object v1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    .line 157
    return-void
.end method

.method public constructor <init>([B)V
    .locals 2
    .param p1, "value"    # [B

    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 138
    invoke-static {}, Lcom/motorola/android/internal/telephony/QcomNvInfo;->access$000()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "MotoExtTM: QcomNvInfo"

    const-string v1, "byteArray to byteArray"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    :cond_0
    iput-object p1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    .line 140
    return-void
.end method

.method public static toBool(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)Z
    .locals 2
    .param p0, "nv_data"    # Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 216
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    const/4 v1, 0x0

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    if-eqz v0, :cond_0

    .line 217
    const/4 v0, 0x1

    return v0

    .line 219
    :cond_0
    return v1
.end method

.method public static toInteger(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)I
    .locals 4
    .param p0, "nv_data"    # Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 192
    const/4 v0, 0x0

    .line 193
    .local v0, "result":I
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    array-length v1, v1

    const/4 v2, 0x4

    if-ge v1, v2, :cond_0

    .line 194
    const/4 v1, -0x1

    return v1

    .line 197
    :cond_0
    const/4 v1, 0x3

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_1

    .line 198
    shl-int/lit8 v2, v0, 0x8

    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    aget-byte v3, v3, v1

    and-int/lit16 v3, v3, 0xff

    add-int v0, v2, v3

    .line 197
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 200
    .end local v1    # "i":I
    :cond_1
    return v0
.end method

.method public static toLiteralString(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)Ljava/lang/String;
    .locals 3
    .param p0, "nv_data"    # Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 223
    const/4 v0, 0x0

    .line 224
    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 225
    aget-byte v1, v1, v0

    if-nez v1, :cond_0

    .line 226
    goto :goto_1

    .line 224
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 229
    :cond_1
    :goto_1
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    invoke-static {v2, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    .line 230
    .local v1, "str":Ljava/lang/String;
    return-object v1
.end method

.method public static toShort(Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;)S
    .locals 4
    .param p0, "nv_data"    # Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;

    .line 204
    const/4 v0, 0x0

    .line 205
    .local v0, "result":I
    iget-object v1, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    array-length v1, v1

    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    .line 206
    const/4 v1, -0x1

    return v1

    .line 209
    :cond_0
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_1

    .line 210
    shl-int/lit8 v2, v0, 0x8

    iget-object v3, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    aget-byte v3, v3, v1

    and-int/lit16 v3, v3, 0xff

    add-int v0, v2, v3

    .line 209
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 212
    .end local v1    # "i":I
    :cond_1
    int-to-short v1, v0

    return v1
.end method


# virtual methods
.method public serialize(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "buf"    # Ljava/nio/ByteBuffer;

    .line 184
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 185
    return-void
.end method

.method public size()I
    .locals 1

    .line 188
    iget-object v0, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    array-length v0, v0

    :goto_0
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 234
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 235
    .local v0, "sb":Ljava/lang/StringBuffer;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "data=0x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/motorola/android/internal/telephony/QcomNvInfo$NvGenericDataType;->data:[B

    invoke-static {v2}, Lcom/motorola/android/internal/telephony/QcomNvUtils;->byteArrToStringLog([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 236
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
