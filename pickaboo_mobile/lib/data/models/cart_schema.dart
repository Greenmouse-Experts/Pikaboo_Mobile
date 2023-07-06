// To parse this JSON data, do
//
//     final cartSchema = cartSchemaFromJson(jsonString);

import 'dart:convert';

class CartSchema {
  int? id;
  String? quantity;
  String? price;
  DateTime? createdAt;
  Product? product;

  CartSchema({
    this.id,
    this.quantity,
    this.price,
    this.createdAt,
    this.product,
  });

  factory CartSchema.fromRawJson(String str) =>
      CartSchema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static List<CartSchema> getList(List<dynamic> val) {
    return val.map((e) => CartSchema.fromJson(e)).toList();
  }

  factory CartSchema.fromJson(Map<String, dynamic> json) => CartSchema(
        id: json["id"],
        quantity: json["quantity"],
        price: json["price"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "price": price,
        "created_at": createdAt?.toIso8601String(),
        "product": product?.toJson(),
      };
}

class Product {
  int? id;
  String? name;
  String? slug;
  String? description;
  String? price;
  String? weight;
  String? stock;
  int? sold;
  DateTime? createdAt;
  List<dynamic>? images;

  Product({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.price,
    this.weight,
    this.stock,
    this.sold,
    this.createdAt,
    this.images,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        price: json["price"],
        weight: json["weight"],
        stock: json["stock"],
        sold: json["sold"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        images: json["images"] == null
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "price": price,
        "weight": weight,
        "stock": stock,
        "sold": sold,
        "created_at": createdAt?.toIso8601String(),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
      };
}

class LocalCart {
  final String productId;

  LocalCart({required this.productId});
}
