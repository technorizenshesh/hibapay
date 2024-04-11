class ListVirtualCardsModel {
  String? status;
  String? message;
  List<ListVirtualCardsResult>? result;
  String? token;

  ListVirtualCardsModel({this.status, this.message, this.result, this.token});

  ListVirtualCardsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <ListVirtualCardsResult>[];
      json['result'].forEach((v) {
        result!.add(ListVirtualCardsResult.fromJson(v));
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

class ListVirtualCardsResult {
  String? vcardId;
  String? vcardCardId;
  String? vcardCurrency;
  String? vcardCardHolderId;
  String? vcardBrand;
  String? vcardType;
  String? vcardPan;
  String? vcardNameOnCard;
  String? vcardCardNumber;
  String? vcardExpiryMonth;
  String? vcardExpiryYear;
  String? vcardCvv;
  String? vcardPin;
  String? vcardAddressStreet;
  String? vcardAddressCity;
  String? vcardAddressCountry;
  String? vcardPostalCode;
  String? vcardUfitpayStatus;
  String? vcardCreatedAt;
  String? vcardUpdatedAt;
  String? vcardDeletedAt;
  String? vcardUserId;
  String? vcardAdminStatus;
  String? vcardApiMode;
  String? vcardColor;
  String? vcardName;

  ListVirtualCardsResult(
      {this.vcardId,
      this.vcardCardId,
      this.vcardCurrency,
      this.vcardCardHolderId,
      this.vcardBrand,
      this.vcardType,
      this.vcardPan,
      this.vcardNameOnCard,
      this.vcardCardNumber,
      this.vcardExpiryMonth,
      this.vcardExpiryYear,
      this.vcardCvv,
      this.vcardPin,
      this.vcardAddressStreet,
      this.vcardAddressCity,
      this.vcardAddressCountry,
      this.vcardPostalCode,
      this.vcardUfitpayStatus,
      this.vcardCreatedAt,
      this.vcardUpdatedAt,
      this.vcardDeletedAt,
      this.vcardUserId,
      this.vcardAdminStatus,
      this.vcardApiMode,
      this.vcardColor,
      this.vcardName});

  ListVirtualCardsResult.fromJson(Map<String, dynamic> json) {
    vcardId = json['vcard_id'];
    vcardCardId = json['vcard_card_id'];
    vcardCurrency = json['vcard_currency'];
    vcardCardHolderId = json['vcard_card_holder_id'];
    vcardBrand = json['vcard_brand'];
    vcardType = json['vcard_type'];
    vcardPan = json['vcard_pan'];
    vcardNameOnCard = json['vcard_name_on_card'];
    vcardCardNumber = json['vcard_card_number'];
    vcardExpiryMonth = json['vcard_expiry_month'];
    vcardExpiryYear = json['vcard_expiry_year'];
    vcardCvv = json['vcard_cvv'];
    vcardPin = json['vcard_pin'];
    vcardAddressStreet = json['vcard_address_street'];
    vcardAddressCity = json['vcard_address_city'];
    vcardAddressCountry = json['vcard_address_country'];
    vcardPostalCode = json['vcard_postal_code'];
    vcardUfitpayStatus = json['vcard_ufitpay_status'];
    vcardCreatedAt = json['vcard_created_at'];
    vcardUpdatedAt = json['vcard_updated_at'];
    vcardDeletedAt = json['vcard_deleted_at'];
    vcardUserId = json['vcard_user_id'];
    vcardAdminStatus = json['vcard_admin_status'];
    vcardApiMode = json['vcard_api_mode'];
    vcardColor = json['vcard_color'];
    vcardName = json['vcard_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vcard_id'] = vcardId;
    data['vcard_card_id'] = vcardCardId;
    data['vcard_currency'] = vcardCurrency;
    data['vcard_card_holder_id'] = vcardCardHolderId;
    data['vcard_brand'] = vcardBrand;
    data['vcard_type'] = vcardType;
    data['vcard_pan'] = vcardPan;
    data['vcard_name_on_card'] = vcardNameOnCard;
    data['vcard_card_number'] = vcardCardNumber;
    data['vcard_expiry_month'] = vcardExpiryMonth;
    data['vcard_expiry_year'] = vcardExpiryYear;
    data['vcard_cvv'] = vcardCvv;
    data['vcard_pin'] = vcardPin;
    data['vcard_address_street'] = vcardAddressStreet;
    data['vcard_address_city'] = vcardAddressCity;
    data['vcard_address_country'] = vcardAddressCountry;
    data['vcard_postal_code'] = vcardPostalCode;
    data['vcard_ufitpay_status'] = vcardUfitpayStatus;
    data['vcard_created_at'] = vcardCreatedAt;
    data['vcard_updated_at'] = vcardUpdatedAt;
    data['vcard_deleted_at'] = vcardDeletedAt;
    data['vcard_user_id'] = vcardUserId;
    data['vcard_admin_status'] = vcardAdminStatus;
    data['vcard_api_mode'] = vcardApiMode;
    data['vcard_color'] = vcardColor;
    data['vcard_name'] = vcardName;
    return data;
  }
}
