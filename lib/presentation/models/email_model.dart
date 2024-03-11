class EmailModel {
  String? serviceId;
  String? templateId;
  String? userId;
  String? accessToken;
  TemplateParams? templateParams;

  EmailModel(
      {this.serviceId,
      this.templateId,
      this.userId,
      this.accessToken,
      this.templateParams});

  EmailModel.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    templateId = json['template_id'];
    userId = json['user_id'];
    accessToken = json['accessToken'];
    templateParams = json['template_params'] != null
        ? TemplateParams.fromJson(json['template_params'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_id'] = serviceId;
    data['template_id'] = templateId;
    data['user_id'] = userId;
    data['accessToken'] = accessToken;
    if (templateParams != null) {
      data['template_params'] = templateParams!.toJson();
    }
    return data;
  }
}

class TemplateParams {
  String? firstName;
  String? lastName;
  String? message;
  String? toEmail;
  String? phone;

  TemplateParams(
      {this.firstName, this.lastName, this.message, this.toEmail, this.phone});

  TemplateParams.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    message = json['message'];
    toEmail = json['to_email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['message'] = message;
    data['to_email'] = toEmail;
    data['phone'] = phone;
    return data;
  }
}
