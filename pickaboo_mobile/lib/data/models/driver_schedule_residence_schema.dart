// To parse this JSON data, do
//
//     final driverScheduleResidenceSchema = driverScheduleResidenceSchemaFromJson(jsonString);

import 'dart:convert';

class DriverScheduleResidenceSchema {
  int? id;
  Residence? residence;
  String? zone;
  String? status;
  DateTime? createdAt;

  DriverScheduleResidenceSchema({
    this.id,
    this.residence,
    this.zone,
    this.status,
    this.createdAt,
  });

  factory DriverScheduleResidenceSchema.fromRawJson(String str) =>
      DriverScheduleResidenceSchema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static List<DriverScheduleResidenceSchema> getList(List<dynamic> val) {
    return val.map((e) => DriverScheduleResidenceSchema.fromJson(e)).toList();
  }

  factory DriverScheduleResidenceSchema.fromJson(Map<String, dynamic> json) =>
      DriverScheduleResidenceSchema(
        id: json["id"],
        residence: json["residence"] == null
            ? null
            : Residence.fromJson(json["residence"]),
        zone: json["zone"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "residence": residence?.toJson(),
        "zone": zone,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
      };
}

class Residence {
  int? id;
  String? userId;
  String? plotNo;
  String? houseNumber;
  String? streetName;
  String? area1;
  String? area2;
  String? quarter;
  String? town;
  String? state;
  String? buildingType;
  String? facilityType;
  String? flats;
  String? shopStoreIn;
  String? purposeBuiltFacility;
  String? buildingImage;
  DateTime? createdAt;
  HomeResidence? homeResidence;

  Residence({
    this.id,
    this.userId,
    this.plotNo,
    this.houseNumber,
    this.streetName,
    this.area1,
    this.area2,
    this.quarter,
    this.town,
    this.state,
    this.buildingType,
    this.facilityType,
    this.flats,
    this.shopStoreIn,
    this.purposeBuiltFacility,
    this.buildingImage,
    this.createdAt,
    this.homeResidence,
  });

  factory Residence.fromRawJson(String str) =>
      Residence.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Residence.fromJson(Map<String, dynamic> json) => Residence(
        id: json["id"],
        userId: json["user_id"],
        plotNo: json["plot_no"],
        houseNumber: json["house_number"],
        streetName: json["street_name"],
        area1: json["area1"],
        area2: json["area2"],
        quarter: json["quarter"],
        town: json["town"],
        state: json["state"],
        buildingType: json["building_type"],
        facilityType: json["facility_type"],
        flats: json["flats"],
        shopStoreIn: json["shop_store_in"],
        purposeBuiltFacility: json["purpose_built_facility"],
        buildingImage: json["building_image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        homeResidence: json["home_residence"] == null
            ? null
            : HomeResidence.fromJson(json["home_residence"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "plot_no": plotNo,
        "house_number": houseNumber,
        "street_name": streetName,
        "area1": area1,
        "area2": area2,
        "quarter": quarter,
        "town": town,
        "state": state,
        "building_type": buildingType,
        "facility_type": facilityType,
        "flats": flats,
        "shop_store_in": shopStoreIn,
        "purpose_built_facility": purposeBuiltFacility,
        "building_image": buildingImage,
        "created_at": createdAt?.toIso8601String(),
        "home_residence": homeResidence?.toJson(),
      };
}

class HomeResidence {
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
  String? avatar;
  DateTime? emailVerifiedAt;
  String? currentPassword;
  String? wallet;
  String? fcmToken;
  dynamic meansOfIdentification;
  String? address;
  dynamic zoneId;
  dynamic truckId;
  String? status;
  String? isVerified;
  DateTime? createdAt;
  String? createdByWho;

  HomeResidence({
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
    this.zoneId,
    this.truckId,
    this.status,
    this.isVerified,
    this.createdAt,
    this.createdByWho,
  });

  factory HomeResidence.fromRawJson(String str) =>
      HomeResidence.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeResidence.fromJson(Map<String, dynamic> json) => HomeResidence(
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
        zoneId: json["zone_id"],
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
        "wallet": wallet,
        "fcm_token": fcmToken,
        "means_of_identification": meansOfIdentification,
        "address": address,
        "zone_id": zoneId,
        "truck_id": truckId,
        "status": status,
        "isVerified": isVerified,
        "created_at": createdAt?.toIso8601String(),
        "created_by_who": createdByWho,
      };
}
