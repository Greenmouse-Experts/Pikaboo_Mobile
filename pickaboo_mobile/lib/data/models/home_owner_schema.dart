// To parse this JSON data, do
//
//     final userSchema = userSchemaFromJson(jsonString);

import 'dart:convert';

class UserSchema {
  int? id;
  String? pikabooId;
  String? accountType;
  String? title;
  String? firstName;
  dynamic middleName;
  String? lastName;
  String? email;
  String? phone;
  dynamic phone2;
  String? gender;
  dynamic dob;
  String? avatar;
  DateTime? emailVerifiedAt;
  String? currentPassword;
  dynamic wallet;
  String? fcmToken;
  dynamic meansOfIdentification;
  String? address;
  dynamic truckId;
  String? status;
  String? isVerified;
  DateTime? createdAt;
  String? createdByWho;
  Zone? zone;
  int? notificationsCount;

  UserSchema({
    this.id,
    this.pikabooId,
    this.accountType,
    this.title,
    this.firstName,
    this.middleName,
    this.lastName,
    this.email,
    this.phone,
    this.phone2,
    this.gender,
    this.dob,
    this.avatar,
    this.emailVerifiedAt,
    this.currentPassword,
    this.wallet,
    this.fcmToken,
    this.meansOfIdentification,
    this.address,
    this.truckId,
    this.status,
    this.isVerified,
    this.createdAt,
    this.createdByWho,
    this.zone,
    this.notificationsCount,
  });

  factory UserSchema.fromRawJson(String str) =>
      UserSchema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserSchema.fromJson(Map<String, dynamic> json) => UserSchema(
        id: json["id"],
        pikabooId: json["pikaboo_id"],
        accountType: json["account_type"],
        title: json["title"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        phone2: json["phone2"],
        gender: json["gender"],
        dob: json["dob"],
        avatar: json["avatar"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        currentPassword: json["current_password"],
        wallet: json["wallet"],
        fcmToken: json["fcm_token"],
        meansOfIdentification: json["means_of_identification"],
        address: json["address"],
        truckId: json["truck_id"],
        status: json["status"],
        isVerified: json["isVerified"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        createdByWho: json["created_by_who"],
        zone: json["zone"] == null ? null : Zone.fromJson(json["zone"]),
        notificationsCount: json["notifications_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pikaboo_id": pikabooId,
        "account_type": accountType,
        "title": title,
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "phone2": phone2,
        "gender": gender,
        "dob": dob,
        "avatar": avatar,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "current_password": currentPassword,
        "wallet": wallet,
        "fcm_token": fcmToken,
        "means_of_identification": meansOfIdentification,
        "address": address,
        "truck_id": truckId,
        "status": status,
        "isVerified": isVerified,
        "created_at": createdAt?.toIso8601String(),
        "created_by_who": createdByWho,
        "zone": zone?.toJson(),
        "notifications_count": notificationsCount,
      };
}

class Zone {
  String? zoneId;
  String? name;

  Zone({
    this.zoneId,
    this.name,
  });

  factory Zone.fromRawJson(String str) => Zone.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
        zoneId: json["zone_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "zone_id": zoneId,
        "name": name,
      };
}
