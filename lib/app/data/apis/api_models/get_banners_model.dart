class GetBannersModel {
  String? status;
  String? message;
  List<GetBannersResult>? result;
  String? token;

  GetBannersModel({this.status, this.message, this.result, this.token});

  GetBannersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <GetBannersResult>[];
      json['result'].forEach((v) {
        result!.add(GetBannersResult.fromJson(v));
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

class GetBannersResult {
  String? bannersId;
  String? bannersName;
  String? bannersImage;
  String? bannersType;
  String? bannersStatus;
  String? bannersCreatedAt;
  String? bannersUpdatedAt;
  String? bannersDeletedAt;

  GetBannersResult(
      {this.bannersId,
      this.bannersName,
      this.bannersImage,
      this.bannersType,
      this.bannersStatus,
      this.bannersCreatedAt,
      this.bannersUpdatedAt,
      this.bannersDeletedAt});

  GetBannersResult.fromJson(Map<String, dynamic> json) {
    bannersId = json['banners_id'];
    bannersName = json['banners_name'];
    bannersImage = json['banners_image'];
    bannersType = json['banners_type'];
    bannersStatus = json['banners_status'];
    bannersCreatedAt = json['banners_created_at'];
    bannersUpdatedAt = json['banners_updated_at'];
    bannersDeletedAt = json['banners_deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banners_id'] = bannersId;
    data['banners_name'] = bannersName;
    data['banners_image'] = bannersImage;
    data['banners_type'] = bannersType;
    data['banners_status'] = bannersStatus;
    data['banners_created_at'] = bannersCreatedAt;
    data['banners_updated_at'] = bannersUpdatedAt;
    data['banners_deleted_at'] = bannersDeletedAt;
    return data;
  }
}
