class GetReferralDescriptionModel {
  String? status;
  String? message;
  List<GetReferralDescriptionResult>? result;

  GetReferralDescriptionModel({this.status, this.message, this.result});

  GetReferralDescriptionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <GetReferralDescriptionResult>[];
      json['result'].forEach((v) {
        result!.add(GetReferralDescriptionResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetReferralDescriptionResult {
  String? refDesId;
  String? refDesDescription;
  String? refDesLinkMessage;

  GetReferralDescriptionResult({this.refDesId, this.refDesDescription, this.refDesLinkMessage});

  GetReferralDescriptionResult.fromJson(Map<String, dynamic> json) {
    refDesId = json['ref_des_id'];
    refDesDescription = json['ref_des_description'];
    refDesLinkMessage = json['ref_des_link_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ref_des_id'] = refDesId;
    data['ref_des_description'] = refDesDescription;
    data['ref_des_link_message'] = refDesLinkMessage;
    return data;
  }
}
