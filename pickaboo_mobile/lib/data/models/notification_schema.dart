// To parse this JSON data, do
//
//     final notificationSchema = notificationSchemaFromJson(jsonString);

import 'dart:convert';

class NotificationSchema {
  int? id;
  String? title;
  String? body;
  String? image;
  String? type;
  dynamic link;
  String? status;
  DateTime? createdAt;
  dynamic admin;
  dynamic from;

  NotificationSchema({
    this.id,
    this.title,
    this.body,
    this.image,
    this.type,
    this.link,
    this.status,
    this.createdAt,
    this.admin,
    this.from,
  });

  factory NotificationSchema.fromRawJson(String str) =>
      NotificationSchema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static List<NotificationSchema> getList(List<dynamic> val) {
    return val.map((e) => NotificationSchema.fromJson(e)).toList();
  }

  factory NotificationSchema.fromJson(Map<String, dynamic> json) =>
      NotificationSchema(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        image: json["image"],
        type: json["type"],
        link: json["link"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        admin: json["admin"],
        from: json["from"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "image": image,
        "type": type,
        "link": link,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "admin": admin,
        "from": from,
      };
}
