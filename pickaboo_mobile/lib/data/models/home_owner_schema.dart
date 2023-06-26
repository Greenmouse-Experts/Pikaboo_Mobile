// To parse this JSON data, do
//
//     final homeOwnerSchema = homeOwnerSchemaFromJson(jsonString);

import 'dart:convert';

class HomeOwnerSchema {
  int? id;
  String? accountType;
  String? title;
  String? firstName;
  String? middleName;
  String? surname;
  String? email;
  String? phone;
  dynamic phone2;
  dynamic gender;
  dynamic dob;
  String? avatar;
  DateTime? emailVerifiedAt;
  String? currentPassword;
  dynamic role;
  dynamic wallet;
  dynamic fcmToken;
  dynamic meansOfIdentification;
  String? address;
  dynamic unitOfOperation;
  String? typeOfBuilding;
  String? facilityType;
  String? ownersName;
  String? status;
  DateTime? createdAt;

  HomeOwnerSchema({
    this.id,
    this.accountType,
    this.title,
    this.firstName,
    this.middleName,
    this.surname,
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
    this.typeOfBuilding,
    this.facilityType,
    this.ownersName,
    this.status,
    this.createdAt,
  });

  factory HomeOwnerSchema.fromRawJson(String str) =>
      HomeOwnerSchema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeOwnerSchema.fromJson(Map<String, dynamic> json) =>
      HomeOwnerSchema(
        id: json["id"],
        accountType: json["account_type"],
        title: json["title"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        surname: json["surname"],
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
        typeOfBuilding: json["type_of_building"],
        facilityType: json["facility_type"],
        ownersName: json["owners_name"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "account_type": accountType,
        "title": title,
        "first_name": firstName,
        "middle_name": middleName,
        "surname": surname,
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
        "type_of_building": typeOfBuilding,
        "facility_type": facilityType,
        "owners_name": ownersName,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
      };
}
