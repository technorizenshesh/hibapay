class GetPriceListModel {
  String? status;
  String? message;
  GetPriceListResult? result;
  String? token;

  GetPriceListModel({this.status, this.message, this.result, this.token});

  GetPriceListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'] != null
        ? GetPriceListResult.fromJson(json['result'])
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

class GetPriceListResult {
  String? resource;
  String? status;
  List<GetPriceListResultData>? data;

  GetPriceListResult({this.resource, this.status, this.data});

  GetPriceListResult.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    status = json['status'];
    if (json['data'] != null) {
      data = <GetPriceListResultData>[];
      json['data'].forEach((v) {
        data!.add(GetPriceListResultData.fromJson(v));
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

class GetPriceListResultData {
  String? vendorId;
  String? vendorName;
  List<Packages>? packages;

  GetPriceListResultData({this.vendorId, this.vendorName, this.packages});

  GetPriceListResultData.fromJson(Map<String, dynamic> json) {
    vendorId = json['vendor_id'];
    vendorName = json['vendor_name'];
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(Packages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vendor_id'] = vendorId;
    data['vendor_name'] = vendorName;
    if (packages != null) {
      data['packages'] = packages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Packages {
  String? package;
  String? packageName;
  String? price;
  String? fee;

  Packages({this.package, this.packageName, this.price, this.fee});

  Packages.fromJson(Map<String, dynamic> json) {
    package = json['package'];
    packageName = json['package_name'];
    price = json['price'];
    fee = json['Fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['package'] = package;
    data['package_name'] = packageName;
    data['price'] = price;
    data['Fee'] = fee;
    return data;
  }
}
