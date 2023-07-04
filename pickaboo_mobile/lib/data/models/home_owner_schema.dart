// To parse this JSON data, do
//
//     final homeOwnerSchema = homeOwnerSchemaFromJson(jsonString);

import 'dart:convert';

class HomeOwnerSchema {
  int? id;
  String? pikabooId;
  String? accountType;
  String? title;
  String? firstName;
  String? middleName;
  String? lastName;
  String? email;
  String? phone;
  dynamic phone2;
  dynamic gender;
  dynamic dob;
  dynamic avatar;
  DateTime? emailVerifiedAt;
  String? currentPassword;
  dynamic role;
  String? wallet;
  dynamic fcmToken;
  dynamic meansOfIdentification;
  String? address;
  dynamic unitOfOperation;
  dynamic truckId;
  String? status;
  String? isVerified;
  DateTime? createdAt;
  String? createdByWho;

  HomeOwnerSchema({
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
    this.role,
    this.wallet,
    this.fcmToken,
    this.meansOfIdentification,
    this.address,
    this.unitOfOperation,
    this.truckId,
    this.status,
    this.isVerified,
    this.createdAt,
    this.createdByWho,
  });

  factory HomeOwnerSchema.fromRawJson(String str) =>
      HomeOwnerSchema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeOwnerSchema.fromJson(Map<String, dynamic> json) =>
      HomeOwnerSchema(
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
        role: json["role"],
        wallet: json["wallet"],
        fcmToken: json["fcm_token"],
        meansOfIdentification: json["means_of_identification"],
        address: json["address"],
        unitOfOperation: json["unit_of_operation"],
        truckId: json["truck_id"],
        status: json["status"],
        isVerified: json["isVerified"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        createdByWho: json["created_by_who"],
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
        "role": role,
        "wallet": wallet,
        "fcm_token": fcmToken,
        "means_of_identification": meansOfIdentification,
        "address": address,
        "unit_of_operation": unitOfOperation,
        "truck_id": truckId,
        "status": status,
        "isVerified": isVerified,
        "created_at": createdAt?.toIso8601String(),
        "created_by_who": createdByWho,
      };
}
