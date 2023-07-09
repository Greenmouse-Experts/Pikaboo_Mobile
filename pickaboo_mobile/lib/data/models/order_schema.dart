// To parse this JSON data, do
//
//     final OrderHistorySchema = OrderHistorySchemaFromJson(jsonString);

import 'dart:convert';

class OrderHistorySchema {
  List<OrderSchema>? data;
  Links? links;
  Meta? meta;

  OrderHistorySchema({
    this.data,
    this.links,
    this.meta,
  });

  factory OrderHistorySchema.fromRawJson(String str) =>
      OrderHistorySchema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderHistorySchema.fromJson(Map<String, dynamic> json) =>
      OrderHistorySchema(
        data: json["data"] == null
            ? []
            : List<OrderSchema>.from(
                json["data"]!.map((x) => OrderSchema.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
      };
}

class OrderSchema {
  int? id;
  String? address;
  String? quantity;
  String? invoiceNumber;
  String? totalPrice;
  dynamic coupons;
  String? status;
  DateTime? createdAt;

  OrderSchema({
    this.id,
    this.address,
    this.quantity,
    this.invoiceNumber,
    this.totalPrice,
    this.coupons,
    this.status,
    this.createdAt,
  });

  factory OrderSchema.fromRawJson(String str) =>
      OrderSchema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderSchema.fromJson(Map<String, dynamic> json) => OrderSchema(
        id: json["id"],
        address: json["address"],
        quantity: json["quantity"],
        invoiceNumber: json["invoice_number"],
        totalPrice: json["total_price"],
        coupons: json["coupons"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "quantity": quantity,
        "invoice_number": invoiceNumber,
        "total_price": totalPrice,
        "coupons": coupons,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
      };
}

class Links {
  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromRawJson(String str) => Link.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
