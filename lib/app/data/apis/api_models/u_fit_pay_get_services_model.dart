class UFitPayGetServicesModel {
  String? status;
  String? message;
  UFitPayGetServicesResult? result;
  String? token;

  UFitPayGetServicesModel({
    this.status,
    this.message,
    this.result,
    this.token,
  });

  UFitPayGetServicesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'] != null
        ? UFitPayGetServicesResult.fromJson(json['result'])
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

class UFitPayGetServicesResult {
  String? resource;
  String? status;
  List<UFitPayGetServicesResultData>? data;

  UFitPayGetServicesResult({this.resource, this.status, this.data});

  UFitPayGetServicesResult.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    status = json['status'];
    if (json['data'] != null) {
      data = <UFitPayGetServicesResultData>[];
      json['data'].forEach((v) {
        data!.add(UFitPayGetServicesResultData.fromJson(v));
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

class UFitPayGetServicesResultData {
  String? serviceId;
  String? serviceName;
  String? serviceType;

  UFitPayGetServicesResultData(
      {this.serviceId, this.serviceName, this.serviceType});

  UFitPayGetServicesResultData.fromJson(Map<String, dynamic> json) {
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
