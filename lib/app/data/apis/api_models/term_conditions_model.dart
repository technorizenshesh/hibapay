class TermConditionsModel {
  String? status;
  String? message;
  List<TermConditionsResult>? result;
  String? token;

  TermConditionsModel({this.status, this.message, this.result, this.token});

  TermConditionsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <TermConditionsResult>[];
      json['result'].forEach((v) {
        result!.add(TermConditionsResult.fromJson(v));
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

class TermConditionsResult {
  String? id;
  String? name;
  String? description;
  String? nameSp;
  String? descriptionSp;

  TermConditionsResult(
      {this.id, this.name, this.description, this.nameSp, this.descriptionSp});

  TermConditionsResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    nameSp = json['name_sp'];
    descriptionSp = json['description_sp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['name_sp'] = nameSp;
    data['description_sp'] = descriptionSp;
    return data;
  }
}
