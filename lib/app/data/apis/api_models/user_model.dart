class UserModel {
  String? status;
  String? message;
  Result? result;
  String? token;

  UserModel({this.status, this.message, this.result, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'] != null
        ? json['result'].toString() != '[]'
            ? Result.fromJson(json['result'])
            : null
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

class Result {
  String? id;
  String? email;
  String? deviceToken;
  String? deviceType;
  String? otp;
  String? countryCode;
  String? mobile;
  String? firstName;
  String? lastName;
  String? udocId;
  String? udocSelfyPhoto;
  String? udocGovtPhoto;
  String? udocUserId;
  String? udocCreatedAt;
  String? udocUpdatedAt;
  String? udocDeletedAt;
  String? udocSelfyPhotoStatus;
  String? udocGovtPhotoStatus;

  Result(
      {this.id,
      this.email,
      this.deviceToken,
      this.deviceType,
      this.otp,
      this.countryCode,
      this.mobile,
      this.firstName,
      this.lastName,
      this.udocId,
      this.udocSelfyPhoto,
      this.udocGovtPhoto,
      this.udocUserId,
      this.udocCreatedAt,
      this.udocUpdatedAt,
      this.udocDeletedAt,
      this.udocSelfyPhotoStatus,
      this.udocGovtPhotoStatus});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
    otp = json['otp'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    udocId = json['udoc_id'];
    udocSelfyPhoto = json['udoc_selfy_photo'];
    udocGovtPhoto = json['udoc_govt_photo'];
    udocUserId = json['udoc_user_id'];
    udocCreatedAt = json['udoc_created_at'];
    udocUpdatedAt = json['udoc_updated_at'];
    udocDeletedAt = json['udoc_deleted_at'];
    udocSelfyPhotoStatus = json['udoc_selfy_photo_status'];
    udocGovtPhotoStatus = json['udoc_govt_photo_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['device_token'] = deviceToken;
    data['device_type'] = deviceType;
    data['otp'] = otp;
    data['country_code'] = countryCode;
    data['mobile'] = mobile;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['udoc_id'] = udocId;
    data['udoc_selfy_photo'] = udocSelfyPhoto;
    data['udoc_govt_photo'] = udocGovtPhoto;
    data['udoc_user_id'] = udocUserId;
    data['udoc_created_at'] = udocCreatedAt;
    data['udoc_updated_at'] = udocUpdatedAt;
    data['udoc_deleted_at'] = udocDeletedAt;
    data['udoc_selfy_photo_status'] = udocSelfyPhotoStatus;
    data['udoc_govt_photo_status'] = udocGovtPhotoStatus;
    return data;
  }
}
