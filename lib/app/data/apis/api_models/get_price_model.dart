class GetPriceModel {
  String? status;
  String? message;
  GetPriceResult? result;
  String? token;

  GetPriceModel({this.status, this.message, this.result, this.token});

  GetPriceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result =
        json['result'] != null ? GetPriceResult.fromJson(json['result']) : null;
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

class GetPriceResult {
  String? resource;
  String? status;
  GetPriceResultData? data;
  String? message;

  GetPriceResult({this.resource, this.status, this.data});

  GetPriceResult.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    status = json['status'];
    data =
        json['data'] != null ? GetPriceResultData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resource'] = resource;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class GetPriceResultData {
  String? price;
  String? fee;
  String? total;

  GetPriceResultData({this.price, this.fee, this.total});

  GetPriceResultData.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    fee = json['fee'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['fee'] = fee;
    data['total'] = total;
    return data;
  }
}
