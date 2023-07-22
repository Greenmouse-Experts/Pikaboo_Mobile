// To parse this JSON data, do
//
//     final specialRequestSchema = specialRequestSchemaFromJson(jsonString);

import 'dart:convert';

class SpecialRequestSchema {
  int? id;
  String? altAddress;
  String? scheduleDate;
  DateTime? completedDate;
  String? status;
  DateTime? createdAt;
  dynamic servicePersonnel;

  SpecialRequestSchema({
    this.id,
    this.altAddress,
    this.scheduleDate,
    this.completedDate,
    this.status,
    this.createdAt,
    this.servicePersonnel,
  });

  factory SpecialRequestSchema.fromRawJson(String str) =>
      SpecialRequestSchema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static List<SpecialRequestSchema> getList(List<dynamic> val) {
    return val.map((e) => SpecialRequestSchema.fromJson(e)).toList();
  }

  factory SpecialRequestSchema.fromJson(Map<String, dynamic> json) =>
      SpecialRequestSchema(
        id: json["id"],
        altAddress: json["alt_address"],
        scheduleDate: json["schedule_date"],
        completedDate: json["completed_date"] == null
            ? null
            : DateTime.parse(json["completed_date"]),
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        servicePersonnel: json["service_personnel"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "alt_address": altAddress,
        "schedule_date": scheduleDate,
        "completed_date": completedDate?.toIso8601String(),
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "service_personnel": servicePersonnel,
      };
}
