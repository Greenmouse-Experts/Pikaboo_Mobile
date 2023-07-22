// To parse this JSON data, do
//
//     final transactionSchema = transactionSchemaFromJson(jsonString);

import 'dart:convert';

class TransactionSchema {
  int? id;
  String? userId;
  String? type;
  String? amount;
  String? transactionId;
  String? refId;
  DateTime? paidAt;
  String? channel;
  String? ipAddress;
  String? status;
  DateTime? createdAt;

  TransactionSchema({
    this.id,
    this.userId,
    this.type,
    this.amount,
    this.transactionId,
    this.refId,
    this.paidAt,
    this.channel,
    this.ipAddress,
    this.status,
    this.createdAt,
  });

  factory TransactionSchema.fromRawJson(String str) =>
      TransactionSchema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static List<TransactionSchema> getList(List<dynamic> val) {
    return val.map((e) => TransactionSchema.fromJson(e)).toList();
  }

  factory TransactionSchema.fromJson(Map<String, dynamic> json) =>
      TransactionSchema(
        id: json["id"],
        userId: json["user_id"],
        type: json["type"],
        amount: json["amount"],
        transactionId: json["transaction_id"],
        refId: json["ref_id"],
        paidAt:
            json["paid_at"] == null ? null : DateTime.parse(json["paid_at"]),
        channel: json["channel"],
        ipAddress: json["ip_address"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "type": type,
        "amount": amount,
        "transaction_id": transactionId,
        "ref_id": refId,
        "paid_at": paidAt?.toIso8601String(),
        "channel": channel,
        "ip_address": ipAddress,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
      };
}
