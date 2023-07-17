// To parse this JSON data, do
//
//     final cleanUpSchema = cleanUpSchemaFromJson(jsonString);

import 'dart:convert';

class CleanUpSchema {
  int? id;
  String? status;
  CleanupRequest? cleanupRequest;
  DateTime? createdAt;

  CleanUpSchema({
    this.id,
    this.status,
    this.cleanupRequest,
    this.createdAt,
  });

  factory CleanUpSchema.fromRawJson(String str) =>
      CleanUpSchema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static List<CleanUpSchema> getList(List<dynamic> val) {
    return val.map((e) => CleanUpSchema.fromJson(e)).toList();
  }

  factory CleanUpSchema.fromJson(Map<String, dynamic> json) => CleanUpSchema(
        id: json["id"],
        status: json["status"],
        cleanupRequest: json["cleanup_request"] == null
            ? null
            : CleanupRequest.fromJson(json["cleanup_request"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "cleanup_request": cleanupRequest?.toJson(),
        "created_at": createdAt?.toIso8601String(),
      };
}

class CleanupRequest {
  int? id;
  String? scheduleDate;
  String? status;
  DateTime? createdAt;
  Area? zone;

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
        scheduleDate: json["schedule_date"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        zone: json["zone"] == null ? null : Area.fromJson(json["zone"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "schedule_date": scheduleDate,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "zone": zone?.toJson(),
      };
}

class Area {
  String? name;
  int? noOfResidence;

  Area({
    this.name,
    this.noOfResidence,
  });

  factory Area.fromRawJson(String str) => Area.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        name: json["name"],
        noOfResidence: json["no_of_residence"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "no_of_residence": noOfResidence,
      };
}
