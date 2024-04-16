class GetPackagesModel {
  String? status;
  String? message;
  GetPackagesResult? result;
  String? token;

  GetPackagesModel({this.status, this.message, this.result, this.token});

  GetPackagesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'] != null
        ? GetPackagesResult.fromJson(json['result'])
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

class GetPackagesResult {
  String? resource;
  String? status;
  List<GetPackagesResultData>? data;

  GetPackagesResult({this.resource, this.status, this.data});

  GetPackagesResult.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    status = json['status'];
    if (json['data'] != null) {
      data = <GetPackagesResultData>[];
      json['data'].forEach((v) {
        data!.add(GetPackagesResultData.fromJson(v));
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

class GetPackagesResultData {
  String? packageId;
  String? packageName;

  GetPackagesResultData({this.packageId, this.packageName});

  GetPackagesResultData.fromJson(Map<String, dynamic> json) {
    packageId = json['package_id'];
    packageName = json['package_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['package_id'] = packageId;
    data['package_name'] = packageName;
    return data;
  }
}
