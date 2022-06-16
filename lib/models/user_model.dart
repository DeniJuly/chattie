class UserModel {
  String? uid;
  String? email;
  String? name;
  String? photo;
  String? created_at;
  String? last_sign_in;
  String? updated_at;

  UserModel({
    this.created_at,
    this.email,
    this.last_sign_in,
    this.name,
    this.photo,
    this.uid,
    this.updated_at,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    name = json['name'];
    photo = json['photo'];
    created_at = json['created_at'];
    last_sign_in = json['last_sign_in'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "email": email,
      "name": name,
      "photo": photo,
      "created_at": created_at,
      "last_sign_in": last_sign_in,
      "updated_at": updated_at,
    };
  }
}
