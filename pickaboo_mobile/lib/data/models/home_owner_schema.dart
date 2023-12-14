// ignore_for_file: public_member_api_docs, sort_constructors_first
// // To parse this JSON data, do
// //
// //     final userSchema = userSchemaFromJson(jsonString);

// import 'dart:convert';

// class UserSchema {
//   int? id;
//   String? pikabooId;
//   String? accountType;
//   String? title;
//   String? firstName;
//   dynamic middleName;
//   String? lastName;
//   String? email;
//   String? phone;
//   dynamic phone2;
//   String? gender;
//   dynamic dob;
//   String? avatar;
//   DateTime? emailVerifiedAt;
//   String? currentPassword;
//   dynamic wallet;
//   String? fcmToken;
//   dynamic meansOfIdentification;
//   String? address;
//   dynamic truckId;
//   String? status;
//   String? isVerified;
//   DateTime? createdAt;
//   String? createdByWho;
//   Zone? zone;
//   int? notificationsCount;

//   UserSchema({
//     this.id,
//     this.pikabooId,
//     this.accountType,
//     this.title,
//     this.firstName,
//     this.middleName,
//     this.lastName,
//     this.email,
//     this.phone,
//     this.phone2,
//     this.gender,
//     this.dob,
//     this.avatar,
//     this.emailVerifiedAt,
//     this.currentPassword,
//     this.wallet,
//     this.fcmToken,
//     this.meansOfIdentification,
//     this.address,
//     this.truckId,
//     this.status,
//     this.isVerified,
//     this.createdAt,
//     this.createdByWho,
//     this.zone,
//     this.notificationsCount,
//   });

//   factory UserSchema.fromRawJson(String str) =>
//       UserSchema.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory UserSchema.fromJson(Map<String, dynamic> json) => UserSchema(
//         id: json["id"],
//         pikabooId: json["pikaboo_id"],
//         accountType: json["account_type"],
//         title: json["title"],
//         firstName: json["first_name"],
//         middleName: json["middle_name"],
//         lastName: json["last_name"],
//         email: json["email"],
//         phone: json["phone"],
//         phone2: json["phone2"],
//         gender: json["gender"],
//         dob: json["dob"],
//         avatar: json["avatar"],
//         emailVerifiedAt: json["email_verified_at"] == null
//             ? null
//             : DateTime.parse(json["email_verified_at"]),
//         currentPassword: json["current_password"],
//         wallet: json["wallet"],
//         fcmToken: json["fcm_token"],
//         meansOfIdentification: json["means_of_identification"],
//         address: json["address"],
//         truckId: json["truck_id"],
//         status: json["status"],
//         isVerified: json["isVerified"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         createdByWho: json["created_by_who"],
//         zone: json["zone"] == null ? null : Zone.fromJson(json["zone"]),
//         notificationsCount: json["notifications_count"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "pikaboo_id": pikabooId,
//         "account_type": accountType,
//         "title": title,
//         "first_name": firstName,
//         "middle_name": middleName,
//         "last_name": lastName,
//         "email": email,
//         "phone": phone,
//         "phone2": phone2,
//         "gender": gender,
//         "dob": dob,
//         "avatar": avatar,
//         "email_verified_at": emailVerifiedAt?.toIso8601String(),
//         "current_password": currentPassword,
//         "wallet": wallet,
//         "fcm_token": fcmToken,
//         "means_of_identification": meansOfIdentification,
//         "address": address,
//         "truck_id": truckId,
//         "status": status,
//         "isVerified": isVerified,
//         "created_at": createdAt?.toIso8601String(),
//         "created_by_who": createdByWho,
//         "zone": zone?.toJson(),
//         "notifications_count": notificationsCount,
//       };
// }

// class Zone {
//   String? zoneId;
//   String? name;

//   Zone({
//     this.zoneId,
//     this.name,
//   });

//   factory Zone.fromRawJson(String str) => Zone.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Zone.fromJson(Map<String, dynamic> json) => Zone(
//         zoneId: json["zone_id"],
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "zone_id": zoneId,
//         "name": name,
//       };
// }
import 'dart:convert';

extension StringExtension on String? {
bool get toBool {
    if (this == null) {
      return false;
    }
    if (this == 'true') {
      return true;
    }
    if (this == 'false') {
      return false;
    }
    if (this == '1') {
      return true;
    }
    if (this == '0') {
      return false;
    }
    return false;
  }
}

extension on int? {
  bool get toBool {
    if (this == null) {
      return false;
    }
    if (this == 1) {
      return true;
    }
    if (this == 0) {
      return false;
    }
    return false;
  }
}

class UserSchema {
  int? id;
  String? pikabooId;
  String? accountType;
  String? title;
  String? firstName;
  String? middleName;
  String? lastName;
  String? email;
  String? phone;
  String? phone2;
  String? gender;
  dynamic dob;
  dynamic avatar;
  DateTime? emailVerifiedAt;
  String? currentPassword;
  String? wallet;
  dynamic fcmToken;
  dynamic meansOfIdentification;
  dynamic address;
  dynamic truckId;
  String? status;
  bool? isVerified;
  DateTime? createdAt;
  CreatedByWho? createdByWho;
  BuildingInformation? buildingInformation;
  dynamic truck;
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
    this.buildingInformation,
    this.truck,
    this.zone,
    this.notificationsCount,
  });

  factory UserSchema.fromRawJson(String str) =>
      UserSchema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserSchema.fromJson(Map<String, dynamic> json) {
    if (json['isVerified'] != null) {
      if (json['isVerified'] is String?) {
        json['isVerified'] =
            (json['isVerified'] as String?).toBool;
      } else if (json['isVerified'] is int?) {
        json['isVerified'] = (json['isVerified'] as int?).toBool;
      }
    }

    return UserSchema(
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
      wallet: json['wallet']?.toString(),
      fcmToken: json["fcm_token"],
      meansOfIdentification: json["means_of_identification"],
      address: json["address"],
      truckId: json["truck_id"],
      status: json["status"],
      isVerified: json["isVerified"],
      createdAt: json["created_at"] == null
          ? null
          : DateTime.parse(json["created_at"]),
      createdByWho: json["created_by_who"] == null
          ? null
          : CreatedByWho.fromJson(json["created_by_who"]),
      buildingInformation: json["building_information"] == null
          ? null
          : BuildingInformation.fromJson(json["building_information"]),
      truck: json["truck"],
      zone: json["zone"] == null ? null : Zone.fromJson(json["zone"]),
      notificationsCount: json["notifications_count"],
    );
  }

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
        "created_by_who": createdByWho?.toJson(),
        "building_information": buildingInformation?.toJson(),
        "truck": truck,
        "zone": zone?.toJson(),
        "notifications_count": notificationsCount,
      };

  UserSchema copyWith({
    int? id,
    String? pikabooId,
    String? accountType,
    String? title,
    String? firstName,
    String? middleName,
    String? lastName,
    String? email,
    String? phone,
    String? phone2,
    String? gender,
    dynamic dob,
    dynamic avatar,
    DateTime? emailVerifiedAt,
    String? currentPassword,
    String? wallet,
    dynamic fcmToken,
    dynamic meansOfIdentification,
    dynamic address,
    dynamic truckId,
    String? status,
    bool? isVerified,
    DateTime? createdAt,
    CreatedByWho? createdByWho,
    BuildingInformation? buildingInformation,
    dynamic truck,
    Zone? zone,
    int? notificationsCount,
  }) {
    return UserSchema(
      id: id ?? this.id,
      pikabooId: pikabooId ?? this.pikabooId,
      accountType: accountType ?? this.accountType,
      title: title ?? this.title,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      phone2: phone2 ?? this.phone2,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      avatar: avatar ?? this.avatar,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      currentPassword: currentPassword ?? this.currentPassword,
      wallet: wallet ?? this.wallet,
      fcmToken: fcmToken ?? this.fcmToken,
      meansOfIdentification:
          meansOfIdentification ?? this.meansOfIdentification,
      address: address ?? this.address,
      truckId: truckId ?? this.truckId,
      status: status ?? this.status,
      isVerified: isVerified ?? this.isVerified,
      createdAt: createdAt ?? this.createdAt,
      createdByWho: createdByWho ?? this.createdByWho,
      buildingInformation: buildingInformation ?? this.buildingInformation,
      truck: truck ?? this.truck,
      zone: zone ?? this.zone,
      notificationsCount: notificationsCount ?? this.notificationsCount,
    );
  }

  @override
  String toString() {
    return 'UserSchema(id: $id, pikabooId: $pikabooId, accountType: $accountType, title: $title, firstName: $firstName, middleName: $middleName, lastName: $lastName, email: $email, phone: $phone, phone2: $phone2, gender: $gender, dob: $dob, avatar: $avatar, emailVerifiedAt: $emailVerifiedAt, currentPassword: $currentPassword, wallet: $wallet, fcmToken: $fcmToken, meansOfIdentification: $meansOfIdentification, address: $address, truckId: $truckId, status: $status, isVerified: $isVerified, createdAt: $createdAt, createdByWho: $createdByWho, buildingInformation: $buildingInformation, truck: $truck, zone: $zone, notificationsCount: $notificationsCount)';
  }
}

class BuildingInformation {
  int? id;
  String? userId;
  String? noOfResidents;
  String? houseNumber;
  String? streetName;
  String? area1;
  String? area2;
  dynamic quarter;
  String? townCity;
  String? lga;
  String? residential;
  String? shopStores;
  String? residentialFacility;
  String? commercialFacility;
  String? completionStatus;
  String? facilityInclude;
  String? waterSupply;
  String? classification;
  String? latitude;
  String? longtitude;
  dynamic buildingImage;
  String? wasteBin;
  DateTime? createdAt;

  BuildingInformation({
    this.id,
    this.userId,
    this.noOfResidents,
    this.houseNumber,
    this.streetName,
    this.area1,
    this.area2,
    this.quarter,
    this.townCity,
    this.lga,
    this.residential,
    this.shopStores,
    this.residentialFacility,
    this.commercialFacility,
    this.completionStatus,
    this.facilityInclude,
    this.waterSupply,
    this.classification,
    this.latitude,
    this.longtitude,
    this.buildingImage,
    this.wasteBin,
    this.createdAt,
  });

  factory BuildingInformation.fromRawJson(String str) =>
      BuildingInformation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BuildingInformation.fromJson(Map<String, dynamic> json) =>
      BuildingInformation(
        id: json["id"],
        userId: json["user_id"],
        noOfResidents: json["no_of_residents"],
        houseNumber: json["house_number"],
        streetName: json["street_name"],
        area1: json["area1"],
        area2: json["area2"],
        quarter: json["quarter"],
        townCity: json["town_city"],
        lga: json["lga"],
        residential: json["residential"],
        shopStores: json["shop_stores"],
        residentialFacility: json["residential_facility"],
        commercialFacility: json["commercial_facility"],
        completionStatus: json["completion_status"],
        facilityInclude: json["facility_include"],
        waterSupply: json["water_supply"],
        classification: json["classification"],
        latitude: json["latitude"],
        longtitude: json["longtitude"],
        buildingImage: json["building_image"],
        wasteBin: json["waste_bin"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "no_of_residents": noOfResidents,
        "house_number": houseNumber,
        "street_name": streetName,
        "area1": area1,
        "area2": area2,
        "quarter": quarter,
        "town_city": townCity,
        "lga": lga,
        "residential": residential,
        "shop_stores": shopStores,
        "residential_facility": residentialFacility,
        "commercial_facility": commercialFacility,
        "completion_status": completionStatus,
        "facility_include": facilityInclude,
        "water_supply": waterSupply,
        "classification": classification,
        "latitude": latitude,
        "longtitude": longtitude,
        "building_image": buildingImage,
        "waste_bin": wasteBin,
        "created_at": createdAt?.toIso8601String(),
      };
}

class CreatedByWho {
  int? id;
  String? pikabooId;
  dynamic firstName;
  dynamic middleName;
  dynamic lastName;
  String? email;

  CreatedByWho({
    this.id,
    this.pikabooId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.email,
  });

  factory CreatedByWho.fromRawJson(String str) =>
      CreatedByWho.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreatedByWho.fromJson(Map<String, dynamic> json) => CreatedByWho(
        id: json["id"],
        pikabooId: json["pikaboo_id"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pikaboo_id": pikabooId,
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "email": email,
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
