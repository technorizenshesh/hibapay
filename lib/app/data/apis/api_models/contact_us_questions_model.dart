class ContactUsQuestionsModel {
  String? status;
  String? message;
  List<ContactUsQuestionsResult>? result;
  String? token;

  ContactUsQuestionsModel({this.status, this.message, this.result, this.token});

  ContactUsQuestionsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <ContactUsQuestionsResult>[];
      json['result'].forEach((v) {
        result!.add(ContactUsQuestionsResult.fromJson(v));
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

class ContactUsQuestionsResult {
  String? cuqId;
  String? cuqQuestion;
  String? cuqCreatedAt;
  String? cuqUpdatedAt;
  String? cuqDeletedAt;

  ContactUsQuestionsResult(
      {this.cuqId,
      this.cuqQuestion,
      this.cuqCreatedAt,
      this.cuqUpdatedAt,
      this.cuqDeletedAt});

  ContactUsQuestionsResult.fromJson(Map<String, dynamic> json) {
    cuqId = json['cuq_id'];
    cuqQuestion = json['cuq_question'];
    cuqCreatedAt = json['cuq_created_at'];
    cuqUpdatedAt = json['cuq_updated_at'];
    cuqDeletedAt = json['cuq_deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cuq_id'] = cuqId;
    data['cuq_question'] = cuqQuestion;
    data['cuq_created_at'] = cuqCreatedAt;
    data['cuq_updated_at'] = cuqUpdatedAt;
    data['cuq_deleted_at'] = cuqDeletedAt;
    return data;
  }
}
