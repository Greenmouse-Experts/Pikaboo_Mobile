import 'dart:convert';

class DriverSpecialSchema {
  int? id;
  String? altAddress;
  String? scheduleDate;
  dynamic completedDate;
  String? status;
  DateTime? createdAt;
  HomeResidense? homeResidence;
  dynamic rating;

  DriverSpecialSchema({
    this.id,
    this.altAddress,
    this.scheduleDate,
    this.completedDate,
    this.status,
    this.createdAt,
    this.homeResidence,
    this.rating,
  });

  factory DriverSpecialSchema.fromRawJson(String str) =>
      DriverSpecialSchema.fromJson(json.decode(str));

  factory DriverSpecialSchema.fromRawRouterJson(String str) =>
      DriverSpecialSchema.fromRouterJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static List<DriverSpecialSchema> getList(List<dynamic> val) {
    return val.map((e) => DriverSpecialSchema.fromJson(e)).toList();
  }

  factory DriverSpecialSchema.fromJson(Map<String, dynamic> json) =>
      DriverSpecialSchema(
        id: json["id"],
        altAddress: json["alt_address"],
        scheduleDate: json["schedule_date"],
        completedDate: json["completed_date"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        homeResidence: json["home_residence"] == null
            ? null
            : HomeResidense.fromJson(json["home_residence"]),
        rating: json["rating"],
      );

  factory DriverSpecialSchema.fromRouterJson(Map<String, dynamic> json) =>
      DriverSpecialSchema(
        id: json["id"],
        altAddress: json["alt_address"],
        scheduleDate: json["schedule_date"],
        completedDate: json["completed_date"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        homeResidence: json["home_residence"] == null
            ? null
            : HomeResidense.fromRouterJson(json["home_residence"]),
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "alt_address": altAddress,
        "schedule_date": scheduleDate,
        "completed_date": completedDate,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "home_residence": homeResidence?.toJson(),
        "rating": rating,
      };
}

class HomeResidense {
  int? id;
  String? pikabooId;
  String? accountType;
  dynamic title;
  String? firstName;
  dynamic middleName;
  dynamic lastName;
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
  String? zoneId;
  dynamic truckId;
  String? status;
  String? isVerified;
  DateTime? createdAt;
  int? createdByWho;
  BuildingInformation? buildingInformation;

  HomeResidense({
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
    this.buildingInformation,
  });

  factory HomeResidense.fromRawJson(String str) =>
      HomeResidense.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeResidense.fromJson(Map<String, dynamic> json) => HomeResidense(
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
        wallet: json["wallet"]?.toString(),
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
        buildingInformation: json["building_information"] == null
            ? null
            : BuildingInformation.fromJson(json["building_information"]),
      );

  factory HomeResidense.fromRouterJson(Map<String, dynamic> json) =>
      HomeResidense(
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
        wallet: json["wallet"]?.toString(),
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
        buildingInformation: json["building_information"] == null
            ? null
            : BuildingInformation.fromJson(json["building_information"]),
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
        "building_information": buildingInformation?.toJson(),
      };
}

class BuildingInformation {
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
        "created_at": createdAt?.toIso8601String(),
      };
}
