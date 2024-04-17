class BillPayModel {
  String? status;
  String? message;
  Result? result;
  String? token;

  BillPayModel({
    this.status,
    this.message,
    this.result,
    this.token,
  });

  BillPayModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
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

class Result {
  String? resource;
  String? message;
  String? status;
  Data? data;

  Result({this.resource, this.status, this.data});

  Result.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    resource = json['resource'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['resource'] = resource;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? paymentStatus;
  String? reference;
  String? cost;
  String? token;
  String? serial;

  Data(
      {this.paymentStatus, this.reference, this.cost, this.token, this.serial});

  Data.fromJson(Map<String, dynamic> json) {
    paymentStatus = json['payment_status'];
    reference = json['reference'];
    cost = json['cost'];
    token = json['token'];
    serial = json['serial'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['payment_status'] = paymentStatus;
    data['reference'] = reference;
    data['cost'] = cost;
    data['token'] = token;
    data['serial'] = serial;
    return data;
  }
}
