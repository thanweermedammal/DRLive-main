// To parse this JSON data, do
//
//     final chats = chatsFromJson(jsonString);

import 'dart:convert';

Chats chatsFromJson(String str) => Chats.fromJson(json.decode(str));

String chatsToJson(Chats data) => json.encode(data.toJson());

class Chats {
  Chats({
    this.result,
    this.chats,
  });

  bool result;
  List<Chat> chats;

  factory Chats.fromJson(Map<String, dynamic> json) => Chats(
    result: json["result"],
    chats: List<Chat>.from(json["chats"].map((x) => Chat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "chats": List<dynamic>.from(chats.map((x) => x.toJson())),
  };
}

class Chat {
  Chat({
    this.id,
    this.fromId,
    this.toId,
    this.body,
    this.createdAt,
    this.from,
    this.to,
  });

  int id;
  int fromId;
  int toId;
  String body;
  DateTime createdAt;
  From from;
  From to;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    id: json["id"],
    fromId: json["from_id"],
    toId: json["to_id"],
    body: json["body"],
    createdAt: DateTime.parse(json["created_at"]),
    from: From.fromJson(json["from"]),
    to: From.fromJson(json["to"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "from_id": fromId,
    "to_id": toId,
    "body": body,
    "created_at": createdAt.toIso8601String(),
    "from": from.toJson(),
    "to": to.toJson(),
  };
}

class From {
  From({
    this.id,
    this.firstName,
  });

  int id;
  String firstName;

  factory From.fromJson(Map<String, dynamic> json) => From(
    id: json["id"],
    firstName: json["first_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
  };
}
