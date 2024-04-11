class GetCardHolderModel {
  String? status;
  String? message;
  GetCardHolderResult? result;
  String? token;

  GetCardHolderModel({
    this.status,
    this.message,
    this.result,
    this.token,
  });

  GetCardHolderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'] != null
        ? GetCardHolderResult.fromJson(json['result'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class GetCardHolderResult {
  String? cchId;
  String? cchCardHolderId;
  String? cchFirstName;
  String? cchLastName;
  String? cchStatusUfitpay;
  String? cchCreatedAt;
  String? cchUpdatedAt;
  String? cchDeletedAt;
  String? cchPostFirstName;
  String? cchPostLastName;
  String? cchPostEmail;
  String? cchPostPhone;
  String? cchPostAddress;
  String? cchPostState;
  String? cchPostCountry;
  String? cchPostPostalCode;
  String? cchPostKycMethod;
  String? cchPostBvn;
  String? cchPostSelfieImage;
  String? cchPostAdminStatus;
  String? cchCardUserId;
  String? cchCardApiMode;

  GetCardHolderResult(
      {this.cchId,
      this.cchCardHolderId,
      this.cchFirstName,
      this.cchLastName,
      this.cchStatusUfitpay,
      this.cchCreatedAt,
      this.cchUpdatedAt,
      this.cchDeletedAt,
      this.cchPostFirstName,
      this.cchPostLastName,
      this.cchPostEmail,
      this.cchPostPhone,
      this.cchPostAddress,
      this.cchPostState,
      this.cchPostCountry,
      this.cchPostPostalCode,
      this.cchPostKycMethod,
      this.cchPostBvn,
      this.cchPostSelfieImage,
      this.cchPostAdminStatus,
      this.cchCardUserId,
      this.cchCardApiMode});

  GetCardHolderResult.fromJson(Map<String, dynamic> json) {
    cchId = json['cch_id'];
    cchCardHolderId = json['cch_card_holder_id'];
    cchFirstName = json['cch_first_name'];
    cchLastName = json['cch_last_name'];
    cchStatusUfitpay = json['cch_status_ufitpay'];
    cchCreatedAt = json['cch_created_at'];
    cchUpdatedAt = json['cch_updated_at'];
    cchDeletedAt = json['cch_deleted_at'];
    cchPostFirstName = json['cch_post_first_name'];
    cchPostLastName = json['cch_post_last_name'];
    cchPostEmail = json['cch_post_email'];
    cchPostPhone = json['cch_post_phone'];
    cchPostAddress = json['cch_post_address'];
    cchPostState = json['cch_post_state'];
    cchPostCountry = json['cch_post_country'];
    cchPostPostalCode = json['cch_post_postal_code'];
    cchPostKycMethod = json['cch_post_kyc_method'];
    cchPostBvn = json['cch_post_bvn'];
    cchPostSelfieImage = json['cch_post_selfie_image'];
    cchPostAdminStatus = json['cch_post_admin_status'];
    cchCardUserId = json['cch_card_user_id'];
    cchCardApiMode = json['cch_card_api_mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cch_id'] = cchId;
    data['cch_card_holder_id'] = cchCardHolderId;
    data['cch_first_name'] = cchFirstName;
    data['cch_last_name'] = cchLastName;
    data['cch_status_ufitpay'] = cchStatusUfitpay;
    data['cch_created_at'] = cchCreatedAt;
    data['cch_updated_at'] = cchUpdatedAt;
    data['cch_deleted_at'] = cchDeletedAt;
    data['cch_post_first_name'] = cchPostFirstName;
    data['cch_post_last_name'] = cchPostLastName;
    data['cch_post_email'] = cchPostEmail;
    data['cch_post_phone'] = cchPostPhone;
    data['cch_post_address'] = cchPostAddress;
    data['cch_post_state'] = cchPostState;
    data['cch_post_country'] = cchPostCountry;
    data['cch_post_postal_code'] = cchPostPostalCode;
    data['cch_post_kyc_method'] = cchPostKycMethod;
    data['cch_post_bvn'] = cchPostBvn;
    data['cch_post_selfie_image'] = cchPostSelfieImage;
    data['cch_post_admin_status'] = cchPostAdminStatus;
    data['cch_card_user_id'] = cchCardUserId;
    data['cch_card_api_mode'] = cchCardApiMode;
    return data;
  }
}
