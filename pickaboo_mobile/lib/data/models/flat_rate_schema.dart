// To parse this JSON data, do
//
//     final flatRateSchema = flatRateSchemaFromJson(jsonString);

import 'dart:convert';

class FlatRateSchema {
  int? id;
  String? charges;
  DateTime? createdAt;

  FlatRateSchema({
    this.id,
    this.charges,
    this.createdAt,
  });

  factory FlatRateSchema.fromRawJson(String str) =>
      FlatRateSchema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FlatRateSchema.fromJson(Map<String, dynamic> json) => FlatRateSchema(
        id: json["id"],
        charges: json["charges"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "charges": charges,
        "created_at": createdAt?.toIso8601String(),
      };
}
