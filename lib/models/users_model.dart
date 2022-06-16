import 'package:chattie/models/list_chat_model.dart';

class UsersModel {
  String? uid;
  String? name;
  String? email;
  String? photo;
  String? created_at;
  String? last_sign_in;
  String? updated_at;
  List<ListChat>? chats;

  UsersModel({
    this.uid,
    this.name,
    this.email,
    this.created_at,
    this.updated_at,
    this.last_sign_in,
    this.photo,
    this.chats,
  });

  UsersModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    last_sign_in = json['last_sign_in'];
    photo = json['photo'];
    chats =
        List<ListChat>.from(json['chats'].map((val) => ListChat.fromJson(val)));
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "created_at": created_at,
      "updated_at": updated_at,
      "last_sign_in": last_sign_in,
      "photo": photo,
      "chats": List<dynamic>.from(
        chats!.map(
          (e) => e.toJson(),
        ),
      ),
    };
  }
}
