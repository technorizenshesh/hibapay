class AboutUsModel {
  String? status;
  String? message;
  List<AboutUsResult>? result;
  String? token;

  AboutUsModel({this.status, this.message, this.result, this.token});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <AboutUsResult>[];
      json['result'].forEach((v) {
        result!.add(AboutUsResult.fromJson(v));
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

class AboutUsResult {
  String? id;
  String? name;
  String? description;
  String? nameSp;
  String? descriptionSp;

  AboutUsResult(
      {this.id, this.name, this.description, this.nameSp, this.descriptionSp});

  AboutUsResult.fromJson(Map<String, dynamic> json) {
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
