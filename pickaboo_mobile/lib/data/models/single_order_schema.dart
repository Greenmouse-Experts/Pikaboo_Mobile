// To parse this JSON data, do
//
//     final singleOrderSchema = singleOrderSchemaFromJson(jsonString);

import 'dart:convert';

class SingleOrderSchema {
  Data? data;

  SingleOrderSchema({
    this.data,
  });

  factory SingleOrderSchema.fromRawJson(String str) =>
      SingleOrderSchema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SingleOrderSchema.fromJson(Map<String, dynamic> json) =>
      SingleOrderSchema(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? address;
  String? quantity;
  String? invoiceNumber;
  String? totalPrice;
  dynamic coupons;
  String? status;
  DateTime? createdAt;
  Product? product;

  Data({
    this.id,
    this.address,
    this.quantity,
    this.invoiceNumber,
    this.totalPrice,
    this.coupons,
    this.status,
    this.createdAt,
    this.product,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
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
        "product": product?.toJson(),
      };
}

class Product {
  int? id;
  String? categoryId;
  String? name;
  String? slug;
  String? description;
  String? price;
  String? weight;
  String? stock;
  String? sold;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? productImages;

  Product({
    this.id,
    this.categoryId,
    this.name,
    this.slug,
    this.description,
    this.price,
    this.weight,
    this.stock,
    this.sold,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.productImages,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        categoryId: json["category_id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        price: json["price"],
        weight: json["weight"],
        stock: json["stock"],
        sold: json["sold"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        productImages: json["product_images"] == null
            ? []
            : List<dynamic>.from(json["product_images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "slug": slug,
        "description": description,
        "price": price,
        "weight": weight,
        "stock": stock,
        "sold": sold,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product_images": productImages == null
            ? []
            : List<dynamic>.from(productImages!.map((x) => x)),
      };
}
