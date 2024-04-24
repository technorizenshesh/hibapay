class UserModel {
  String? status;
  String? message;
  Result? result;
  String? token;

  UserModel({this.status, this.message, this.result, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? email;
  String? userName;
  String? firstName;
  String? lastName;
  String? companyName;
  String? mobile;
  String? gender;
  String? dob;
  String? image;
  String? otp;
  String? password;
  String? createdAt;
  String? updatedAt;
  String? countryCode;
  String? residence;
  String? deviceToken;
  String? deviceType;
  String? deletedAt;
  String? streetAddress;
  String? country;
  String? city;
  String? isAdmin;
  String? wallet;
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
      this.userName,
      this.firstName,
      this.lastName,
      this.companyName,
      this.mobile,
      this.gender,
      this.dob,
      this.image,
      this.otp,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.countryCode,
      this.residence,
      this.deviceToken,
      this.deviceType,
      this.deletedAt,
      this.streetAddress,
      this.country,
      this.city,
      this.isAdmin,
      this.wallet,
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
    id = json['id'].toString();
    email = json['email'];
    userName = json['user_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    companyName = json['company_name'];
    mobile = json['mobile'];
    gender = json['gender'];
    dob = json['dob'];
    image = json['image'];
    otp = json['otp'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    countryCode = json['country_code'];
    residence = json['residence'];
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
    deletedAt = json['deleted_at'];
    streetAddress = json['street_address'];
    country = json['country'];
    city = json['city'];
    isAdmin = json['is_admin'];
    wallet = json['wallet'];
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
    data['user_name'] = userName;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['company_name'] = companyName;
    data['mobile'] = mobile;
    data['gender'] = gender;
    data['dob'] = dob;
    data['image'] = image;
    data['otp'] = otp;
    data['password'] = password;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['country_code'] = countryCode;
    data['residence'] = residence;
    data['device_token'] = deviceToken;
    data['device_type'] = deviceType;
    data['deleted_at'] = deletedAt;
    data['street_address'] = streetAddress;
    data['country'] = country;
    data['city'] = city;
    data['is_admin'] = isAdmin;
    data['wallet'] = wallet;
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
