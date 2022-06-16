class Chat {
  String? pengirim;
  String? penerima;
  String? pesan;
  String? time;
  bool? isRead;
  Chat({
    this.pengirim,
    this.penerima,
    this.pesan,
    this.time,
    this.isRead,
  });

  Chat.fromJson(Map<String, dynamic> json) {
    pengirim = json['pengirim'];
    penerima = json['penerima'];
    pesan = json['pesan'];
    time = json['time'];
    isRead = json['is_read'];
  }

  Map<String, dynamic> toJson() {
    return {
      "pengirim": pengirim,
      "penerima": penerima,
      "pesan": pesan,
      "time": time,
      "isRead": isRead,
    };
  }
}
