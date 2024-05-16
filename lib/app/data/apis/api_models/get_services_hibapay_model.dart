class GetServicesModel {
  String? status;
  String? message;
  List<GetServicesResult>? result;
  String? token;

  GetServicesModel({
    this.status,
    this.message,
    this.result,
    this.token,
  });

  GetServicesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <GetServicesResult>[];
      json['result'].forEach((v) {
        result!.add(GetServicesResult.fromJson(v));
      });
    }
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['token'] = token;
    return data;
  }
}

class GetServicesResult {
  String? id;
  String? serviceId;
  String? serviceName;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? icon;
  String? type;
  String? serviceNameCustom;
  String? commission;
  String? commissionType;

  GetServicesResult({
    this.id,
    this.serviceId,
    this.serviceName,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.icon,
    this.type,
    this.serviceNameCustom,
    this.commission,
    this.commissionType,
  });

  GetServicesResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceId = json['service_id'];
    serviceName = json['service_name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    icon = json['icon'];
    type = json['type'];
    serviceNameCustom = json['service_name_custom'];
    commission = json['commission'].toString();
    commissionType = json['commission_type'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['service_id'] = serviceId;
    data['service_name'] = serviceName;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['icon'] = icon;
    data['type'] = type;
    data['commission'] = commission;
    data['commission_type'] = commissionType;
    return data;
  }
}
