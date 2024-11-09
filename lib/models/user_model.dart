class User {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  User? user;

  User({this.accessToken, this.tokenType, this.expiresIn, this.user});

  User.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class DataUser {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  int? roleId;
  String? createdAt;
  String? updatedAt;

  DataUser(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.roleId,
      this.createdAt,
      this.updatedAt});

  DataUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    roleId = json['role_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['role_id'] = roleId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
