// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DriverScheduleResidenceSchema {
  int? id;
  Residence? residence;
  String? zone;
  String? price;
  String? status;
  DateTime? createdAt;
  DateTime? scheduledAt;

  DriverScheduleResidenceSchema({
    this.id,
    this.residence,
    this.zone,
    this.price,
    this.status,
    this.createdAt,
    this.scheduledAt,
  });

  factory DriverScheduleResidenceSchema.fromRawJson(String str) =>
      DriverScheduleResidenceSchema.fromJson(json.decode(str));
  factory DriverScheduleResidenceSchema.fromRawRouterJson(String str) =>
      DriverScheduleResidenceSchema.fromRouterJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static List<DriverScheduleResidenceSchema> getList(List<dynamic> val) {
    return val.map((e) => DriverScheduleResidenceSchema.fromJson(e)).toList();
  }

  factory DriverScheduleResidenceSchema.fromJson(Map<String, dynamic> json) {
    //print("=====gggg $json");
    return DriverScheduleResidenceSchema(
      id: json["id"],
      scheduledAt: json["schedule_date"] == null
          ? null
          : DateTime.parse(json["schedule_date"]),
      residence: json["residence"] == null
          ? null
          : Residence.fromJson(json["residence"]),
      zone: json["zone"],
      price: json["price"],
      status: json["status"],
      createdAt: json["created_at"] == null
          ? null
          : DateTime.parse(json["created_at"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "residence": residence?.toJson(),
        "zone": zone,
        "schedule_date": scheduledAt?.toIso8601String(),
        "price": price,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
      };

  factory DriverScheduleResidenceSchema.fromRouterJson(
          Map<String, dynamic> json) =>
      DriverScheduleResidenceSchema(
        id: json["id"],
        residence: json["residence"] == null
            ? null
            : Residence.fromRouterJson(json["residence"]),
        zone: json["zone"],
        scheduledAt: json["schedule_date"] == null
            ? null
            : DateTime.parse(json["schedule_date"]),
        price: json["price"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  @override
  String toString() {
    return 'DriverScheduleResidenceSchema(id: $id, residence: $residence, zone: $zone, price: $price, status: $status, createdAt: $createdAt, scheduledAt: $scheduledAt)';
  }
}

class Residence {
  int? id;
  String? userId;
  dynamic noOfResidents;
  dynamic houseNumber;
  dynamic streetName;
  dynamic area1;
  dynamic area2;
  dynamic quarter;
  String? townCity;
  String? lga;
  dynamic residential;
  dynamic shopStores;
  dynamic residentialFacility;
  dynamic commercialFacility;
  dynamic completionStatus;
  dynamic facilityInclude;
  dynamic waterSupply;
  dynamic classification;
  dynamic latitude;
  dynamic longtitude;
  dynamic buildingImage;
  DateTime? createdAt;
  HomeResidence? homeResidence;

  Residence({
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
    this.createdAt,
    this.homeResidence,
  });

  factory Residence.fromRawJson(String str) =>
      Residence.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Residence.fromJson(Map<String, dynamic> json) => Residence(
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
        "created_at": createdAt?.toIso8601String(),
        "home_residence": homeResidence?.toJson(),
      };

  factory Residence.fromRouterJson(Map<String, dynamic> json) => Residence(
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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        homeResidence: json["home_residence"] == null
            ? null
            : HomeResidence.fromRouterJson(json["home_residence"]),
      );

  @override
  String toString() {
    return 'Residence(id: $id, userId: $userId, noOfResidents: $noOfResidents, houseNumber: $houseNumber, streetName: $streetName, area1: $area1, area2: $area2, quarter: $quarter, townCity: $townCity, lga: $lga, residential: $residential, shopStores: $shopStores, residentialFacility: $residentialFacility, commercialFacility: $commercialFacility, completionStatus: $completionStatus, facilityInclude: $facilityInclude, waterSupply: $waterSupply, classification: $classification, latitude: $latitude, longtitude: $longtitude, buildingImage: $buildingImage, createdAt: $createdAt, homeResidence: $homeResidence)';
  }
}

class HomeResidence {
  int? id;
  String? pikabooId;
  String? accountType;
  dynamic title;
  dynamic firstName;
  dynamic middleName;
  dynamic lastName;
  String? email;
  String? phone;
  String? phone2;
  dynamic gender;
  dynamic dob;
  dynamic avatar;
  DateTime? emailVerifiedAt;
  String? currentPassword;
  String? wallet;
  String? fcmToken;
  dynamic meansOfIdentification;
  dynamic address;
  String? zoneId;
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

  factory HomeResidence.fromJson(Map<String, dynamic> json) {
    return HomeResidence(
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
      createdByWho: json["created_by_who"]['first_name'],
    );
  }

  factory HomeResidence.fromRouterJson(Map<String, dynamic> json) {
    return HomeResidence(
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
        "zone_id": zoneId,
        "truck_id": truckId,
        "status": status,
        "isVerified": isVerified,
        "created_at": createdAt?.toIso8601String(),
        "created_by_who": createdByWho,
      };
}
