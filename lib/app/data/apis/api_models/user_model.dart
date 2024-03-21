class UserModel {
  String? status;
  String? message;
  Result? result;
  String? token;

  UserModel({
    this.status,
    this.message,
    this.result,
    this.token,
  });

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

  Result(
      {this.id,
      this.email,
      this.deviceToken,
      this.deviceType,
      this.otp,
      this.countryCode,
      this.mobile,
      this.firstName,
      this.lastName});

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
    return data;
  }
}
