class FundVirtualCardModel {
  String? status;
  String? message;
  FundVirtualCardResult? result;
  String? token;

  FundVirtualCardModel({
    this.status,
    this.message,
    this.result,
    this.token,
  });

  FundVirtualCardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'] != null
        ? FundVirtualCardResult.fromJson(json['result'])
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

class FundVirtualCardResult {
  String? resource;
  String? status;
  FundVirtualCardResultData? data;

  FundVirtualCardResult({this.resource, this.status, this.data});

  FundVirtualCardResult.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    status = json['status'];
    data = json['data'] != null
        ? FundVirtualCardResultData.fromJson(json['data'])
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

class FundVirtualCardResultData {
  String? id;
  String? balance;

  FundVirtualCardResultData({this.id, this.balance});

  FundVirtualCardResultData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['balance'] = balance;
    return data;
  }
}
