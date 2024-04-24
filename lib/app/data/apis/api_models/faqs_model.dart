class FaqsModel {
  String? status;
  String? message;
  List<FaqsResult>? result;
  String? token;

  FaqsModel({this.status, this.message, this.result, this.token});

  FaqsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <FaqsResult>[];
      json['result'].forEach((v) {
        result!.add(FaqsResult.fromJson(v));
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

class FaqsResult {
  String? faqsId;
  String? faqsQuestions;
  String? faqsAnswer;
  String? faqsCreatedAt;
  String? faqsUpdatedAt;
  String? faqsDeletedAt;

  FaqsResult(
      {this.faqsId,
      this.faqsQuestions,
      this.faqsAnswer,
      this.faqsCreatedAt,
      this.faqsUpdatedAt,
      this.faqsDeletedAt});

  FaqsResult.fromJson(Map<String, dynamic> json) {
    faqsId = json['faqs_id'];
    faqsQuestions = json['faqs_questions'];
    faqsAnswer = json['faqs_answer'];
    faqsCreatedAt = json['faqs_created_at'];
    faqsUpdatedAt = json['faqs_updated_at'];
    faqsDeletedAt = json['faqs_deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['faqs_id'] = faqsId;
    data['faqs_questions'] = faqsQuestions;
    data['faqs_answer'] = faqsAnswer;
    data['faqs_created_at'] = faqsCreatedAt;
    data['faqs_updated_at'] = faqsUpdatedAt;
    data['faqs_deleted_at'] = faqsDeletedAt;
    return data;
  }
}
