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
  String? statusAdmin;
  String? virtualAccountResource;
  String? virtualAccountStatus;
  String? virtualAccountDataReference;
  String? virtualAccountDataAccountNumber;
  String? virtualAccountDataAccountName;
  String? virtualAccountDataBankName;
  String? virtualAccountDataBank;
  String? virtualAccountDataCurrency;
  String? refferalUserId;
  String? appPin;
  String? virtualAccountResource4;
  String? virtualAccountStatus4;
  String? virtualAccountDataReference4;
  String? virtualAccountDataAccountNumber4;
  String? virtualAccountDataAccountName4;
  String? virtualAccountDataBankName4;
  String? virtualAccountDataBank4;
  String? virtualAccountDataCurrency4;
  String? virtualAccountResource3;
  String? virtualAccountStatus3;
  String? virtualAccountDataReference3;
  String? virtualAccountDataAccountNumber3;
  String? virtualAccountDataAccountName3;
  String? virtualAccountDataBankName3;
  String? virtualAccountDataBank3;
  String? virtualAccountDataCurrency3;
  String? virtualAccountResource2;
  String? virtualAccountStatus2;
  String? virtualAccountDataReference2;
  String? virtualAccountDataAccountNumber2;
  String? virtualAccountDataAccountName2;
  String? virtualAccountDataBankName2;
  String? virtualAccountDataBank2;
  String? virtualAccountDataCurrency2;
  String? virtualAccountResource1;
  String? virtualAccountStatus1;
  String? virtualAccountDataReference1;
  String? virtualAccountDataAccountNumber1;
  String? virtualAccountDataAccountName1;
  String? virtualAccountDataBankName1;
  String? virtualAccountDataBank1;
  String? virtualAccountDataCurrency1;
  String? bvn;
  String? nin;
  String? udocId;
  String? udocSelfyPhoto;
  String? udocGovtPhoto;
  String? udocUserId;
  String? udocCreatedAt;
  String? udocUpdatedAt;
  String? udocDeletedAt;
  String? udocSelfyPhotoStatus;
  String? udocGovtPhotoStatus;
  String? coins;

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
      this.statusAdmin,
      this.virtualAccountResource,
      this.virtualAccountStatus,
      this.virtualAccountDataReference,
      this.virtualAccountDataAccountNumber,
      this.virtualAccountDataAccountName,
      this.virtualAccountDataBankName,
      this.virtualAccountDataBank,
      this.virtualAccountDataCurrency,
      this.refferalUserId,
      this.appPin,
      this.virtualAccountResource4,
      this.virtualAccountStatus4,
      this.virtualAccountDataReference4,
      this.virtualAccountDataAccountNumber4,
      this.virtualAccountDataAccountName4,
      this.virtualAccountDataBankName4,
      this.virtualAccountDataBank4,
      this.virtualAccountDataCurrency4,
      this.virtualAccountResource3,
      this.virtualAccountStatus3,
      this.virtualAccountDataReference3,
      this.virtualAccountDataAccountNumber3,
      this.virtualAccountDataAccountName3,
      this.virtualAccountDataBankName3,
      this.virtualAccountDataBank3,
      this.virtualAccountDataCurrency3,
      this.virtualAccountResource2,
      this.virtualAccountStatus2,
      this.virtualAccountDataReference2,
      this.virtualAccountDataAccountNumber2,
      this.virtualAccountDataAccountName2,
      this.virtualAccountDataBankName2,
      this.virtualAccountDataBank2,
      this.virtualAccountDataCurrency2,
      this.virtualAccountResource1,
      this.virtualAccountStatus1,
      this.virtualAccountDataReference1,
      this.virtualAccountDataAccountNumber1,
      this.virtualAccountDataAccountName1,
      this.virtualAccountDataBankName1,
      this.virtualAccountDataBank1,
      this.virtualAccountDataCurrency1,
      this.bvn,
      this.nin,
      this.udocId,
      this.udocSelfyPhoto,
      this.udocGovtPhoto,
      this.udocUserId,
      this.udocCreatedAt,
      this.udocUpdatedAt,
      this.udocDeletedAt,
      this.udocSelfyPhotoStatus,
      this.udocGovtPhotoStatus,
      this.coins});

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
    refferalUserId = json['refferal_user_id'];
    appPin = json['app_pin'].toString();
    virtualAccountResource4 = json['virtual_account_resource_4'];
    virtualAccountStatus4 = json['virtual_account_status_4'];
    virtualAccountDataReference4 = json['virtual_account_data_reference_4'];
    virtualAccountDataAccountNumber4 =
        json['virtual_account_data_account_number_4'];
    virtualAccountDataAccountName4 =
        json['virtual_account_data_account_name_4'];
    virtualAccountDataBankName4 = json['virtual_account_data_bank_name_4'];
    virtualAccountDataBank4 = json['virtual_account_data_bank_4'];
    virtualAccountDataCurrency4 = json['virtual_account_data_currency_4'];
    virtualAccountResource3 = json['virtual_account_resource_3'];
    virtualAccountStatus3 = json['virtual_account_status_3'];
    virtualAccountDataReference3 = json['virtual_account_data_reference_3'];
    virtualAccountDataAccountNumber3 =
        json['virtual_account_data_account_number_3'];
    virtualAccountDataAccountName3 =
        json['virtual_account_data_account_name_3'];
    virtualAccountDataBankName3 = json['virtual_account_data_bank_name_3'];
    virtualAccountDataBank3 = json['virtual_account_data_bank_3'];
    virtualAccountDataCurrency3 = json['virtual_account_data_currency_3'];
    virtualAccountResource2 = json['virtual_account_resource_2'];
    virtualAccountStatus2 = json['virtual_account_status_2'];
    virtualAccountDataReference2 = json['virtual_account_data_reference_2'];
    virtualAccountDataAccountNumber2 =
        json['virtual_account_data_account_number_2'];
    virtualAccountDataAccountName2 =
        json['virtual_account_data_account_name_2'];
    virtualAccountDataBankName2 = json['virtual_account_data_bank_name_2'];
    virtualAccountDataBank2 = json['virtual_account_data_bank_2'];
    virtualAccountDataCurrency2 = json['virtual_account_data_currency_2'];
    virtualAccountResource1 = json['virtual_account_resource_1'];
    virtualAccountStatus1 = json['virtual_account_status_1'];
    virtualAccountDataReference1 = json['virtual_account_data_reference_1'];
    virtualAccountDataAccountNumber1 =
        json['virtual_account_data_account_number_1'];
    virtualAccountDataAccountName1 =
        json['virtual_account_data_account_name_1'];
    virtualAccountDataBankName1 = json['virtual_account_data_bank_name_1'];
    virtualAccountDataBank1 = json['virtual_account_data_bank_1'];
    virtualAccountDataCurrency1 = json['virtual_account_data_currency_1'];
    bvn = json['bvn'];
    nin = json['nin'];
    udocId = json['udoc_id'];
    udocSelfyPhoto = json['udoc_selfy_photo'];
    udocGovtPhoto = json['udoc_govt_photo'];
    udocUserId = json['udoc_user_id'];
    udocCreatedAt = json['udoc_created_at'];
    udocUpdatedAt = json['udoc_updated_at'];
    udocDeletedAt = json['udoc_deleted_at'];
    udocSelfyPhotoStatus = json['udoc_selfy_photo_status'];
    udocGovtPhotoStatus = json['udoc_govt_photo_status'];
    coins = json['coins'].toString();
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
    data['refferal_user_id'] = refferalUserId;
    data['app_pin'] = appPin;
    data['virtual_account_resource_4'] = virtualAccountResource4;
    data['virtual_account_status_4'] = virtualAccountStatus4;
    data['virtual_account_data_reference_4'] = virtualAccountDataReference4;
    data['virtual_account_data_account_number_4'] =
        virtualAccountDataAccountNumber4;
    data['virtual_account_data_account_name_4'] =
        virtualAccountDataAccountName4;
    data['virtual_account_data_bank_name_4'] = virtualAccountDataBankName4;
    data['virtual_account_data_bank_4'] = virtualAccountDataBank4;
    data['virtual_account_data_currency_4'] = virtualAccountDataCurrency4;
    data['virtual_account_resource_3'] = virtualAccountResource3;
    data['virtual_account_status_3'] = virtualAccountStatus3;
    data['virtual_account_data_reference_3'] = virtualAccountDataReference3;
    data['virtual_account_data_account_number_3'] =
        virtualAccountDataAccountNumber3;
    data['virtual_account_data_account_name_3'] =
        virtualAccountDataAccountName3;
    data['virtual_account_data_bank_name_3'] = virtualAccountDataBankName3;
    data['virtual_account_data_bank_3'] = virtualAccountDataBank3;
    data['virtual_account_data_currency_3'] = virtualAccountDataCurrency3;
    data['virtual_account_resource_2'] = virtualAccountResource2;
    data['virtual_account_status_2'] = virtualAccountStatus2;
    data['virtual_account_data_reference_2'] = virtualAccountDataReference2;
    data['virtual_account_data_account_number_2'] =
        virtualAccountDataAccountNumber2;
    data['virtual_account_data_account_name_2'] =
        virtualAccountDataAccountName2;
    data['virtual_account_data_bank_name_2'] = virtualAccountDataBankName2;
    data['virtual_account_data_bank_2'] = virtualAccountDataBank2;
    data['virtual_account_data_currency_2'] = virtualAccountDataCurrency2;
    data['virtual_account_resource_1'] = virtualAccountResource1;
    data['virtual_account_status_1'] = virtualAccountStatus1;
    data['virtual_account_data_reference_1'] = virtualAccountDataReference1;
    data['virtual_account_data_account_number_1'] =
        virtualAccountDataAccountNumber1;
    data['virtual_account_data_account_name_1'] =
        virtualAccountDataAccountName1;
    data['virtual_account_data_bank_name_1'] = virtualAccountDataBankName1;
    data['virtual_account_data_bank_1'] = virtualAccountDataBank1;
    data['virtual_account_data_currency_1'] = virtualAccountDataCurrency1;
    data['bvn'] = bvn;
    data['nin'] = nin;
    data['udoc_id'] = udocId;
    data['udoc_selfy_photo'] = udocSelfyPhoto;
    data['udoc_govt_photo'] = udocGovtPhoto;
    data['udoc_user_id'] = udocUserId;
    data['udoc_created_at'] = udocCreatedAt;
    data['udoc_updated_at'] = udocUpdatedAt;
    data['udoc_deleted_at'] = udocDeletedAt;
    data['udoc_selfy_photo_status'] = udocSelfyPhotoStatus;
    data['udoc_govt_photo_status'] = udocGovtPhotoStatus;
    data['coins'] = coins;
    return data;
  }
}

/*
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
  String? virtualAccountResource1;
  String? virtualAccountStatus1;
  String? virtualAccountDataReference1;
  String? virtualAccountDataAccountNumber1;
  String? virtualAccountDataAccountName1;
  String? virtualAccountDataBankName1;
  String? virtualAccountDataBank1;
  String? virtualAccountDataCurrency1;
  String? virtualAccountResource2;
  String? virtualAccountStatus2;
  String? virtualAccountDataReference2;
  String? virtualAccountDataAccountNumber2;
  String? virtualAccountDataAccountName2;
  String? virtualAccountDataBankName2;
  String? virtualAccountDataBank2;
  String? virtualAccountDataCurrency2;
  String? virtualAccountResource3;
  String? virtualAccountStatus3;
  String? virtualAccountDataReference3;
  String? virtualAccountDataAccountNumber3;
  String? virtualAccountDataAccountName3;
  String? virtualAccountDataBankName3;
  String? virtualAccountDataBank3;
  String? virtualAccountDataCurrency3;
  String? virtualAccountResource4;
  String? virtualAccountStatus4;
  String? virtualAccountDataReference4;
  String? virtualAccountDataAccountNumber4;
  String? virtualAccountDataAccountName4;
  String? virtualAccountDataBankName4;
  String? virtualAccountDataBank4;
  String? virtualAccountDataCurrency4;
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
      this.virtualAccountResource1,
      this.virtualAccountStatus1,
      this.virtualAccountDataReference1,
      this.virtualAccountDataAccountNumber1,
      this.virtualAccountDataAccountName1,
      this.virtualAccountDataBankName1,
      this.virtualAccountDataBank1,
      this.virtualAccountDataCurrency1,
      this.virtualAccountResource2,
      this.virtualAccountStatus2,
      this.virtualAccountDataReference2,
      this.virtualAccountDataAccountNumber2,
      this.virtualAccountDataAccountName2,
      this.virtualAccountDataBankName2,
      this.virtualAccountDataBank2,
      this.virtualAccountDataCurrency2,
      this.virtualAccountResource3,
      this.virtualAccountStatus3,
      this.virtualAccountDataReference3,
      this.virtualAccountDataAccountNumber3,
      this.virtualAccountDataAccountName3,
      this.virtualAccountDataBankName3,
      this.virtualAccountDataBank3,
      this.virtualAccountDataCurrency3,
      this.virtualAccountResource4,
      this.virtualAccountStatus4,
      this.virtualAccountDataReference4,
      this.virtualAccountDataAccountNumber4,
      this.virtualAccountDataAccountName4,
      this.virtualAccountDataBankName4,
      this.virtualAccountDataBank4,
      this.virtualAccountDataCurrency4,
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
    virtualAccountResource1 = json['virtual_account_resource_1'];
    virtualAccountStatus1 = json['virtual_account_status_1'];
    virtualAccountDataReference1 = json['virtual_account_data_reference_1'];
    virtualAccountDataAccountNumber1 =
        json['virtual_account_data_account_number_1'];
    virtualAccountDataAccountName1 =
        json['virtual_account_data_account_name_1'];
    virtualAccountDataBankName1 = json['virtual_account_data_bank_name_1'];
    virtualAccountDataBank1 = json['virtual_account_data_bank_1'];
    virtualAccountDataCurrency1 = json['virtual_account_data_currency_1'];
    virtualAccountResource2 = json['virtual_account_resource_2'];
    virtualAccountStatus2 = json['virtual_account_status_2'];
    virtualAccountDataReference2 = json['virtual_account_data_reference_2'];
    virtualAccountDataAccountNumber2 =
        json['virtual_account_data_account_number_2'];
    virtualAccountDataAccountName2 =
        json['virtual_account_data_account_name_2'];
    virtualAccountDataBankName2 = json['virtual_account_data_bank_name_2'];
    virtualAccountDataBank2 = json['virtual_account_data_bank_2'];
    virtualAccountDataCurrency2 = json['virtual_account_data_currency_2'];
    virtualAccountResource3 = json['virtual_account_resource_3'];
    virtualAccountStatus3 = json['virtual_account_status_3'];
    virtualAccountDataReference3 = json['virtual_account_data_reference_3'];
    virtualAccountDataAccountNumber3 =
        json['virtual_account_data_account_number_3'];
    virtualAccountDataAccountName3 =
        json['virtual_account_data_account_name_3'];
    virtualAccountDataBankName3 = json['virtual_account_data_bank_name_3'];
    virtualAccountDataBank3 = json['virtual_account_data_bank_3'];
    virtualAccountDataCurrency3 = json['virtual_account_data_currency_3'];
    virtualAccountResource4 = json['virtual_account_resource_4'];
    virtualAccountStatus4 = json['virtual_account_status_4'];
    virtualAccountDataReference4 = json['virtual_account_data_reference_4'];
    virtualAccountDataAccountNumber4 =
        json['virtual_account_data_account_number_4'];
    virtualAccountDataAccountName4 =
        json['virtual_account_data_account_name_4'];
    virtualAccountDataBankName4 = json['virtual_account_data_bank_name_4'];
    virtualAccountDataBank4 = json['virtual_account_data_bank_4'];
    virtualAccountDataCurrency4 = json['virtual_account_data_currency_4'];
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
    data['virtual_account_resource_1'] = virtualAccountResource1;
    data['virtual_account_status_1'] = virtualAccountStatus1;
    data['virtual_account_data_reference_1'] = virtualAccountDataReference1;
    data['virtual_account_data_account_number_1'] =
        virtualAccountDataAccountNumber1;
    data['virtual_account_data_account_name_1'] =
        virtualAccountDataAccountName1;
    data['virtual_account_data_bank_name_1'] = virtualAccountDataBankName1;
    data['virtual_account_data_bank_1'] = virtualAccountDataBank1;
    data['virtual_account_data_currency_1'] = virtualAccountDataCurrency1;
    data['virtual_account_resource_2'] = virtualAccountResource2;
    data['virtual_account_status_2'] = virtualAccountStatus2;
    data['virtual_account_data_reference_2'] = virtualAccountDataReference2;
    data['virtual_account_data_account_number_2'] =
        virtualAccountDataAccountNumber2;
    data['virtual_account_data_account_name_2'] =
        virtualAccountDataAccountName2;
    data['virtual_account_data_bank_name_2'] = virtualAccountDataBankName2;
    data['virtual_account_data_bank_2'] = virtualAccountDataBank2;
    data['virtual_account_data_currency_2'] = virtualAccountDataCurrency2;
    data['virtual_account_resource_3'] = virtualAccountResource3;
    data['virtual_account_status_3'] = virtualAccountStatus3;
    data['virtual_account_data_reference_3'] = virtualAccountDataReference3;
    data['virtual_account_data_account_number_3'] =
        virtualAccountDataAccountNumber3;
    data['virtual_account_data_account_name_3'] =
        virtualAccountDataAccountName3;
    data['virtual_account_data_bank_name_3'] = virtualAccountDataBankName3;
    data['virtual_account_data_bank_3'] = virtualAccountDataBank3;
    data['virtual_account_data_currency_3'] = virtualAccountDataCurrency3;
    data['virtual_account_resource_4'] = virtualAccountResource4;
    data['virtual_account_status_4'] = virtualAccountStatus4;
    data['virtual_account_data_reference_4'] = virtualAccountDataReference4;
    data['virtual_account_data_account_number_4'] =
        virtualAccountDataAccountNumber4;
    data['virtual_account_data_account_name_4'] =
        virtualAccountDataAccountName4;
    data['virtual_account_data_bank_name_4'] = virtualAccountDataBankName4;
    data['virtual_account_data_bank_4'] = virtualAccountDataBank4;
    data['virtual_account_data_currency_4'] = virtualAccountDataCurrency4;
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
*/
