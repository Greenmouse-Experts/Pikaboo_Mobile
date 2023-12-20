// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final driverScheduleSchema = driverScheduleSchemaFromJson(jsonString);

import 'dart:convert';

class DriverScheduleSchema {
  int? id;
  String? status;
  CleanupRequest? cleanupRequest;
  DateTime? createdAt;
  DateTime? scheduledAt;
  //Zone? zone;

  DriverScheduleSchema({
    this.id,
    this.status,
    this.cleanupRequest,
    this.createdAt,
    this.scheduledAt,
  });

  factory DriverScheduleSchema.fromRawJson(String str) =>
      DriverScheduleSchema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static List<DriverScheduleSchema> getList(List<dynamic> val) {
    return val.map((e) => DriverScheduleSchema.fromJson(e)).toList();
  }

  factory DriverScheduleSchema.fromJson(Map<String, dynamic> json) =>
      DriverScheduleSchema(
        id: json["id"],
        status: json["status"],
        cleanupRequest: CleanupRequest.fromJson(json),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
            scheduledAt: json["schedule_date"] == null
            ? null
            : DateTime.parse(json["schedule_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "cleanup_request": cleanupRequest?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "schedule_date": scheduledAt?.toIso8601String(),
      };
}

class CleanupRequest {
  int? id;
  DateTime? scheduleDate;
  String? status;
  DateTime? createdAt;
  Zone? zone;

  CleanupRequest({
    this.id,
    this.scheduleDate,
    this.status,
    this.createdAt,
    this.zone,
  });

  factory CleanupRequest.fromRawJson(String str) =>
      CleanupRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CleanupRequest.fromJson(Map<String, dynamic> json) => CleanupRequest(
        id: json["id"],
        scheduleDate: json["schedule_date"] == null
            ? null
            : DateTime.parse(json["schedule_date"]),
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        zone: json["zone"] == null ? null : Zone.fromJson(json["zone"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "schedule_date":
            "${scheduleDate!.year.toString().padLeft(4, '0')}-${scheduleDate!.month.toString().padLeft(2, '0')}-${scheduleDate!.day.toString().padLeft(2, '0')}",
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "zone": zone?.toJson(),
      };
}

class Zone {
  String? name;
  int? noOfResidence;

  Zone({
    this.name,
    this.noOfResidence,
  });

  factory Zone.fromRawJson(String str) => Zone.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
        name: json["name"],
        noOfResidence: json["no_of_residence"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "no_of_residence": noOfResidence,
      };

  @override
  String toString() => 'Zone(name: $name, noOfResidence: $noOfResidence)';
}
