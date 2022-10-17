// To parse this JSON data, do
//
//     final notification = notificationFromJson(jsonString);

import 'dart:convert';

AllNotification notificationFromJson(String str) => AllNotification.fromJson(json.decode(str));

String notificationToJson(AllNotification data) => json.encode(data.toJson());

class AllNotification {
  AllNotification({
    this.result,
    this.notification,
  });

  bool result;
  List<NotificationElement> notification;

  factory AllNotification.fromJson(Map<String, dynamic> json) => AllNotification(
    result: json["result"],
    notification: List<NotificationElement>.from(json["notification"].map((x) => NotificationElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "notification": List<dynamic>.from(notification.map((x) => x.toJson())),
  };
}

class NotificationElement {
  NotificationElement({
    this.id,
    this.userId,
    this.message,
    this.url,
    this.read,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int userId;
  String message;
  dynamic url;
  String read;
  DateTime createdAt;
  DateTime updatedAt;

  factory NotificationElement.fromJson(Map<String, dynamic> json) => NotificationElement(
    id: json["id"],
    userId: json["user_id"],
    message: json["message"],
    url: json["url"],
    read: json["read"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "message": message,
    "url": url,
    "read": read,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
