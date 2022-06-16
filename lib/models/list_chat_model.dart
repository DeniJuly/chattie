class ListChat {
  String? connection;
  String? chatId;
  String? lastTime;
  ListChat({this.connection, this.chatId, this.lastTime});

  ListChat.fromJson(Map<String, dynamic> json) {
    connection = json['connection'];
    chatId = json['chat_id'];
    lastTime = json['lastTime'];
  }

  Map<String, dynamic> toJson() {
    return {
      "connection": connection,
      "chat_id": chatId,
      "lastTime": lastTime,
    };
  }
}
