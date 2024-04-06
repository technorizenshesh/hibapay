class GetServicesModel {
  String? status;
  String? message;
  Result? result;
  String? token;

  GetServicesModel({this.status, this.message, this.result, this.token});

  GetServicesModel.fromJson(Map<String, dynamic> json) {
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
  String? status;
  List<Data>? data;

  Result({this.resource, this.status, this.data});

  Result.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  String? serviceId;
  String? serviceName;
  String? serviceType;

  Data({this.serviceId, this.serviceName, this.serviceType});

  Data.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    serviceName = json['service_name'];
    serviceType = json['service_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_id'] = serviceId;
    data['service_name'] = serviceName;
    data['service_type'] = serviceType;
    return data;
  }
}
