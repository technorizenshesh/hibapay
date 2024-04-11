class GetCardTransactionsModel {
  String? status;
  String? message;
  GetCardTransactionsResult? result;
  String? token;

  GetCardTransactionsModel({
    this.status,
    this.message,
    this.result,
    this.token,
  });

  GetCardTransactionsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'] != null
        ? GetCardTransactionsResult.fromJson(json['result'])
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

class GetCardTransactionsResult {
  String? resource;
  String? status;
  String? records;
  List<GetCardTransactionsResultData>? data;

  GetCardTransactionsResult(
      {this.resource, this.status, this.records, this.data});

  GetCardTransactionsResult.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    status = json['status'];
    records = json['records'];
    if (json['data'] != null) {
      data = <GetCardTransactionsResultData>[];
      json['data'].forEach((v) {
        data!.add(GetCardTransactionsResultData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resource'] = resource;
    data['status'] = status;
    data['records'] = records;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetCardTransactionsResultData {
  String? amount;
  String? type;
  String? currency;
  String? narration;
  String? datetime;

  GetCardTransactionsResultData(
      {this.amount, this.type, this.currency, this.narration, this.datetime});

  GetCardTransactionsResultData.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    type = json['type'];
    currency = json['currency'];
    narration = json['narration'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['type'] = type;
    data['currency'] = currency;
    data['narration'] = narration;
    data['datetime'] = datetime;
    return data;
  }
}
