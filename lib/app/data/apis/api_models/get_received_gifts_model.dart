class GetReceivedGiftsModel {
  String? status;
  String? message;
  List<GetReceivedGiftsResult>? result;
  String? token;

  GetReceivedGiftsModel({this.status, this.message, this.result, this.token});

  GetReceivedGiftsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <GetReceivedGiftsResult>[];
      json['result'].forEach((v) {
        result!.add(GetReceivedGiftsResult.fromJson(v));
      });
    }
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['token'] = token;
    return data;
  }
}

class GetReceivedGiftsResult {
  String? giftsId;
  String? giftsSenderId;
  String? giftsReceiverId;
  String? giftsDescription;
  String? giftsCreatedAt;
  String? giftsUpdatedAt;
  String? giftsDeletedAt;
  String? giftsAdminStatus;
  String? giftsClaimStatus;
  String? giftsAmount;

  GetReceivedGiftsResult(
      {this.giftsId,
      this.giftsSenderId,
      this.giftsReceiverId,
      this.giftsDescription,
      this.giftsCreatedAt,
      this.giftsUpdatedAt,
      this.giftsDeletedAt,
      this.giftsAdminStatus,
      this.giftsClaimStatus,
      this.giftsAmount});

  GetReceivedGiftsResult.fromJson(Map<String, dynamic> json) {
    giftsId = json['gifts_id'];
    giftsSenderId = json['gifts_sender_id'];
    giftsReceiverId = json['gifts_receiver_id'];
    giftsDescription = json['gifts_description'];
    giftsCreatedAt = json['gifts_created_at'];
    giftsUpdatedAt = json['gifts_updated_at'];
    giftsDeletedAt = json['gifts_deleted_at'];
    giftsAdminStatus = json['gifts_admin_status'];
    giftsClaimStatus = json['gifts_claim_status'];
    giftsAmount = json['gifts_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gifts_id'] = giftsId;
    data['gifts_sender_id'] = giftsSenderId;
    data['gifts_receiver_id'] = giftsReceiverId;
    data['gifts_description'] = giftsDescription;
    data['gifts_created_at'] = giftsCreatedAt;
    data['gifts_updated_at'] = giftsUpdatedAt;
    data['gifts_deleted_at'] = giftsDeletedAt;
    data['gifts_admin_status'] = giftsAdminStatus;
    data['gifts_claim_status'] = giftsClaimStatus;
    data['gifts_amount'] = giftsAmount;
    return data;
  }
}
