class SearchCardHolderModel {
  String? status;
  String? message;
  SearchCardHolderResult? result;
  String? token;

  SearchCardHolderModel({
    this.status,
    this.message,
    this.result,
    this.token,
  });

  SearchCardHolderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'] != null
        ? SearchCardHolderResult.fromJson(json['result'])
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

class SearchCardHolderResult {
  String? resource;
  String? status;
  SearchCardHolderResultData? data;

  SearchCardHolderResult({this.resource, this.status, this.data});

  SearchCardHolderResult.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    status = json['status'];
    data = json['data'] != null
        ? SearchCardHolderResultData.fromJson(json['data'])
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

class SearchCardHolderResultData {
  String? cardHolderId;
  String? firstName;
  String? lastName;
  String? kycMethod;
  String? status;

  SearchCardHolderResultData(
      {this.cardHolderId,
      this.firstName,
      this.lastName,
      this.kycMethod,
      this.status});

  SearchCardHolderResultData.fromJson(Map<String, dynamic> json) {
    cardHolderId = json['card_holder_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    kycMethod = json['kyc_method'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['card_holder_id'] = cardHolderId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['kyc_method'] = kycMethod;
    data['status'] = status;
    return data;
  }
}
