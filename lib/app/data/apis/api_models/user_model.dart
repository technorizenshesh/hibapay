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
  String? appPin;
  String? referralUserId;
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
  String? statusAdmin;
  String? virtualAccountResource;
  String? virtualAccountStatus;
  String? virtualAccountDataReference;
  String? virtualAccountDataAccountNumber;
  String? virtualAccountDataAccountName;
  String? virtualAccountDataBankName;
  String? virtualAccountDataBank;
  String? virtualAccountDataCurrency;
  String? udocId;
  String? udocSelfyPhoto;
  String? udocGovtPhoto;
  String? udocUserId;
  String? udocCreatedAt;
  String? udocUpdatedAt;
  String? udocDeletedAt;
  String? udocSelfyPhotoStatus;
  String? udocGovtPhotoStatus;
  String? message;
  String? coins;

  Result(
      {this.id,
      this.appPin,
      this.referralUserId,
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
      this.statusAdmin,
      this.virtualAccountResource,
      this.virtualAccountStatus,
      this.virtualAccountDataReference,
      this.virtualAccountDataAccountNumber,
      this.virtualAccountDataAccountName,
      this.virtualAccountDataBankName,
      this.virtualAccountDataBank,
      this.virtualAccountDataCurrency,
      this.udocId,
      this.udocSelfyPhoto,
      this.udocGovtPhoto,
      this.udocUserId,
      this.udocCreatedAt,
      this.udocUpdatedAt,
      this.udocDeletedAt,
      this.udocSelfyPhotoStatus,
      this.udocGovtPhotoStatus,
      this.message,
      this.coins});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    appPin = json['app_pin'].toString();
    referralUserId = json['refferal_user_id'].toString();
    email = json['email'];
    userName = json['user_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    companyName = json['company_name'];
    mobile = json['mobile'];
    gender = json['gender'];
    dob = json['dob'];
    image = json['image'];
    otp = json['otp'].toString();
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
    statusAdmin = json['status_admin'];
    virtualAccountResource = json['virtual_account_resource'];
    virtualAccountStatus = json['virtual_account_status'];
    virtualAccountDataReference = json['virtual_account_data_reference'];
    virtualAccountDataAccountNumber =
        json['virtual_account_data_account_number'];
    virtualAccountDataAccountName = json['virtual_account_data_account_name'];
    virtualAccountDataBankName = json['virtual_account_data_bank_name'];
    virtualAccountDataBank = json['virtual_account_data_bank'];
    virtualAccountDataCurrency = json['virtual_account_data_currency'];
    udocId = json['udoc_id'];
    udocSelfyPhoto = json['udoc_selfy_photo'];
    udocGovtPhoto = json['udoc_govt_photo'];
    udocUserId = json['udoc_user_id'];
    udocCreatedAt = json['udoc_created_at'];
    udocUpdatedAt = json['udoc_updated_at'];
    udocDeletedAt = json['udoc_deleted_at'];
    udocSelfyPhotoStatus = json['udoc_selfy_photo_status'];
    udocGovtPhotoStatus = json['udoc_govt_photo_status'];
    message = json['message'];
    coins = json['coins'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['refferal_user_id'] = referralUserId;
    data['app_pin'] = appPin;
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
    data['status_admin'] = statusAdmin;
    data['virtual_account_resource'] = virtualAccountResource;
    data['virtual_account_status'] = virtualAccountStatus;
    data['virtual_account_data_reference'] = virtualAccountDataReference;
    data['virtual_account_data_account_number'] =
        virtualAccountDataAccountNumber;
    data['virtual_account_data_account_name'] = virtualAccountDataAccountName;
    data['virtual_account_data_bank_name'] = virtualAccountDataBankName;
    data['virtual_account_data_bank'] = virtualAccountDataBank;
    data['virtual_account_data_currency'] = virtualAccountDataCurrency;
    data['udoc_id'] = udocId;
    data['udoc_selfy_photo'] = udocSelfyPhoto;
    data['udoc_govt_photo'] = udocGovtPhoto;
    data['udoc_user_id'] = udocUserId;
    data['udoc_created_at'] = udocCreatedAt;
    data['udoc_updated_at'] = udocUpdatedAt;
    data['udoc_deleted_at'] = udocDeletedAt;
    data['udoc_selfy_photo_status'] = udocSelfyPhotoStatus;
    data['udoc_govt_photo_status'] = udocGovtPhotoStatus;
    data['message'] = message;
    data['coins'] = coins;
    return data;
  }
}
