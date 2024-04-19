class CreateVirtualCardModel {
  String? status;
  String? message;
  CreateVirtualCardResult? result;
  String? token;

  CreateVirtualCardModel({this.status, this.message, this.result, this.token});

  CreateVirtualCardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'].toString();
    message = json['message'];
    result = json['result'] != null
        ? CreateVirtualCardResult.fromJson(json['result'])
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

class CreateVirtualCardResult {
  String? resource;
  String? status;
  CreateVirtualCardResultData? data;

  CreateVirtualCardResult({this.resource, this.status, this.data});

  CreateVirtualCardResult.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    status = json['status'];
    data = json['data'] != null
        ? CreateVirtualCardResultData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resource'] = resource;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CreateVirtualCardResultData {
  String? id;
  String? currency;
  String? cardHolderId;
  String? brand;
  String? type;
  String? pan;
  String? nameOnCard;
  String? cardNumber;
  String? expiryMonth;
  String? expiryYear;
  String? cvv;
  String? pin;
  String? addressStreet;
  String? addressCity;
  String? addressCountry;
  String? postalCode;
  String? status;

  CreateVirtualCardResultData(
      {this.id,
      this.currency,
      this.cardHolderId,
      this.brand,
      this.type,
      this.pan,
      this.nameOnCard,
      this.cardNumber,
      this.expiryMonth,
      this.expiryYear,
      this.cvv,
      this.pin,
      this.addressStreet,
      this.addressCity,
      this.addressCountry,
      this.postalCode,
      this.status});

  CreateVirtualCardResultData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    currency = json['currency'];
    cardHolderId = json['card_holder_id'];
    brand = json['brand'];
    type = json['type'];
    pan = json['pan'];
    nameOnCard = json['name_on_card'];
    cardNumber = json['card_number'];
    expiryMonth = json['expiry_month'];
    expiryYear = json['expiry_year'];
    cvv = json['cvv'];
    pin = json['pin'];
    addressStreet = json['address_street'];
    addressCity = json['address_city'];
    addressCountry = json['address_country'];
    postalCode = json['postal_code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['currency'] = currency;
    data['card_holder_id'] = cardHolderId;
    data['brand'] = brand;
    data['type'] = type;
    data['pan'] = pan;
    data['name_on_card'] = nameOnCard;
    data['card_number'] = cardNumber;
    data['expiry_month'] = expiryMonth;
    data['expiry_year'] = expiryYear;
    data['cvv'] = cvv;
    data['pin'] = pin;
    data['address_street'] = addressStreet;
    data['address_city'] = addressCity;
    data['address_country'] = addressCountry;
    data['postal_code'] = postalCode;
    data['status'] = status;
    return data;
  }
}
