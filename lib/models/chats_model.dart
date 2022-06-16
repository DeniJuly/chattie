import 'package:chattie/models/chat_model.dart';

class Chats {
  List<String>? connections;
  int? totalChats;
  int? totalRead;
  int? totalUnread;
  List<Chat>? chat;
  String? lastTime;

  Chats({
    this.connections,
    this.totalChats,
    this.totalRead,
    this.totalUnread,
    this.chat,
    this.lastTime,
  });

  Chats.fromJson(Map<String, dynamic> json) {
    connections = List<String>.from(json['connections'].map((value) => value));
    totalChats = json['total_chats'];
    totalRead = json['total_read'];
    totalUnread = json['total_unread'];
    chat = List<Chat>.from(
        json['connections'].map((value) => Chat.fromJson(value)));
    lastTime = json['last_time'];
  }

  Map<String, dynamic> toJson() {
    return {
      "connections": List<dynamic>.from(connections!.map((e) => e)),
      "total_chats": totalChats,
      "total_read": totalRead,
      "total_unread": totalUnread,
      "chat": List<dynamic>.from(chat!.map((e) => e.toJson())),
      "last_time": lastTime,
    };
  }
}
