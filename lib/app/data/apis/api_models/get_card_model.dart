class GetCardModel {
  String? status;
  String? message;
  List<Result>? result;
  String? token;

  GetCardModel({this.status, this.message, this.result, this.token});

  GetCardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
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

class Result {
  String? cardId;
  String? cardNumber;
  String? cardExpMonth;
  String? cardExpYear;
  String? cardHolder;
  String? cardCountryCode;
  String? cardUserId;

  Result(
      {this.cardNumber,
      this.cardId,
      this.cardExpMonth,
      this.cardExpYear,
      this.cardHolder,
      this.cardCountryCode,
      this.cardUserId});

  Result.fromJson(Map<String, dynamic> json) {
    cardNumber = json['card_number'];
    cardId = json['card_id'];
    cardExpMonth = json['card_exp_month'];
    cardExpYear = json['card_exp_year'];
    cardHolder = json['card_holder'];
    cardCountryCode = json['card_country_code'];
    cardUserId = json['card_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['card_number'] = cardNumber;
    data['card_id'] = cardId;
    data['card_exp_month'] = cardExpMonth;
    data['card_exp_year'] = cardExpYear;
    data['card_holder'] = cardHolder;
    data['card_country_code'] = cardCountryCode;
    data['card_user_id'] = cardUserId;
    return data;
  }
}
