class GetLiveTransactionDetailsModel {
  String? status;
  String? message;
  GetLiveTransactionDetailsResult? result;

  GetLiveTransactionDetailsModel({this.status, this.message, this.result});

  GetLiveTransactionDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'] != null
        ? GetLiveTransactionDetailsResult.fromJson(json['result'])
        : null;
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

class GetLiveTransactionDetailsResult {
  String? resource;
  String? status;
  GetLiveTransactionDetailsResultData? data;

  GetLiveTransactionDetailsResult({this.resource, this.status, this.data});

  GetLiveTransactionDetailsResult.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    status = json['status'];
    data = json['data'] != null
        ? GetLiveTransactionDetailsResultData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resource'] = resource;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class GetLiveTransactionDetailsResultData {
  String? reference;
  String? status;
  String? transactionDate;
  String? sessionId;
  String? token;
  String? serial;

  GetLiveTransactionDetailsResultData(
      {this.reference,
      this.status,
      this.transactionDate,
      this.sessionId,
      this.token,
      this.serial});

  GetLiveTransactionDetailsResultData.fromJson(Map<String, dynamic> json) {
    reference = json['reference'];
    status = json['status'];
    transactionDate = json['transaction_date'];
    sessionId = json['session_id'];
    token = json['token'];
    serial = json['serial'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reference'] = reference;
    data['status'] = status;
    data['transaction_date'] = transactionDate;
    data['session_id'] = sessionId;
    data['token'] = token;
    data['serial'] = serial;
    return data;
  }
}
