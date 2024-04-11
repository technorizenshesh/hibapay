class CreateCardHolderModel {
  String? status;
  String? message;
  CreateCardHolderResult? result;
  String? token;

  CreateCardHolderModel({
    this.status,
    this.message,
    this.result,
    this.token,
  });

  CreateCardHolderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'] != null
        ? CreateCardHolderResult.fromJson(json['result'])
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

class CreateCardHolderResult {
  String? resource;
  String? status;
  CreateCardHolderResultData? data;

  CreateCardHolderResult({this.resource, this.status, this.data});

  CreateCardHolderResult.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    status = json['status'];
    data = json['data'] != null
        ? CreateCardHolderResultData.fromJson(json['data'])
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

class CreateCardHolderResultData {
  String? cardHolderId;
  String? firstName;
  String? lastName;
  String? status;

  CreateCardHolderResultData(
      {this.cardHolderId, this.firstName, this.lastName, this.status});

  CreateCardHolderResultData.fromJson(Map<String, dynamic> json) {
    cardHolderId = json['card_holder_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['card_holder_id'] = cardHolderId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['status'] = status;
    return data;
  }
}
