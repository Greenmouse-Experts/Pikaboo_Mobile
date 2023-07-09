// To parse this JSON data, do
//
//     final PaystackSchema = PaystackSchemaFromJson(jsonString);

import 'dart:convert';

class PaystackSchema {
  String authorizationUrl;
  String accessCode;
  String reference;

  PaystackSchema({
    required this.authorizationUrl,
    required this.accessCode,
    required this.reference,
  });

  factory PaystackSchema.fromRawJson(String str) =>
      PaystackSchema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaystackSchema.fromJson(Map<String, dynamic> json) => PaystackSchema(
        authorizationUrl: json["authorization_url"],
        accessCode: json["access_code"],
        reference: json["reference"],
      );

  Map<String, dynamic> toJson() => {
        "authorization_url": authorizationUrl,
        "access_code": accessCode,
        "reference": reference,
      };
}
