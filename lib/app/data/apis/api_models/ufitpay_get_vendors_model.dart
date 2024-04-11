class UFitPayGetVendorsModel {
  String? status;
  String? message;
  UFitPayGetVendorsResult? result;
  String? token;

  UFitPayGetVendorsModel({this.status, this.message, this.result, this.token});

  UFitPayGetVendorsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'] != null
        ? UFitPayGetVendorsResult.fromJson(json['result'])
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

class UFitPayGetVendorsResult {
  String? resource;
  String? status;
  List<UFitPayGetVendorsResultData>? data;

  UFitPayGetVendorsResult({this.resource, this.status, this.data});

  UFitPayGetVendorsResult.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    status = json['status'];
    if (json['data'] != null) {
      data = <UFitPayGetVendorsResultData>[];
      json['data'].forEach((v) {
        data!.add(UFitPayGetVendorsResultData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resource'] = resource;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UFitPayGetVendorsResultData {
  String? vendorId;
  String? vendorName;

  UFitPayGetVendorsResultData({this.vendorId, this.vendorName});

  UFitPayGetVendorsResultData.fromJson(Map<String, dynamic> json) {
    vendorId = json['vendor_id'];
    vendorName = json['vendor_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vendor_id'] = vendorId;
    data['vendor_name'] = vendorName;
    return data;
  }
}
