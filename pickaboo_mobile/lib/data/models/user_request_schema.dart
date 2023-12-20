import 'dart:convert';

class UserRequestSchema {
  int? id;
  Residence? residence;
  String? zone;
  dynamic servicePersonnel;
  String? price;
  String? status;
  DateTime? createdAt;

  UserRequestSchema({
    this.id,
    this.residence,
    this.zone,
    this.servicePersonnel,
    this.price,
    this.status,
    this.createdAt,
  });

  factory UserRequestSchema.fromRawJson(String str) =>
      UserRequestSchema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static List<UserRequestSchema> getList(List<dynamic> val) {
    return val.map((e) => UserRequestSchema.fromJson(e)).toList();
  }

  factory UserRequestSchema.fromJson(Map<String, dynamic> json) =>
      UserRequestSchema(
        id: json["id"],
        residence: json["residence"] == null
            ? null
            : Residence.fromJson(json["residence"]),
        zone: json["zone"],
        servicePersonnel: json["service_personnel"],
        price: json["amount"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "residence": residence?.toJson(),
        "zone": zone,
        "service_personnel": servicePersonnel,
        "price": price,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
      };
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
  dynamic completionStatus;
  dynamic facilityInclude;
  dynamic waterSupply;
  dynamic classification;
  dynamic latitude;
  dynamic longtitude;
  dynamic buildingImage;
  DateTime? createdAt;

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
    this.completionStatus,
    this.facilityInclude,
    this.waterSupply,
    this.classification,
    this.latitude,
    this.longtitude,
    this.buildingImage,
    this.createdAt,
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
