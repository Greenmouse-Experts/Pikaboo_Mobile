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
  double totalPrice;
  dynamic coupons;
  String? status;
  DateTime? createdAt;
  Product? product;

  Data({
    this.id,
    this.address,
    this.quantity,
    this.invoiceNumber,
    this.totalPrice = 0.0,
    this.coupons,
    this.status,
    this.createdAt,
    this.product,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        address: json["address"] as String?,
        quantity: json["quantity"] as String?,
        invoiceNumber: json["invoice_number"] as String?,
        totalPrice: double.parse(
            (json["total_price"] as String? ?? "0.0").replaceAll(",", "")),
        coupons: json["coupons"],
        status: json["status"] as String?,
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
        "total_price": totalPrice.toString(),
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
  int? sold;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<ProductImage>? productImages;

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
        id: json["id"] as int?,
        categoryId: json["category_id"] as String?,
        name: json["name"] as String?,
        slug: json["slug"] as String?,
        description: json["description"] as String?,
        price: json["price"] as String?,
        weight: json["weight"] as String?,
        stock: json["stock"] as String?,
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
            : List<ProductImage>.from(
                (json["product_images"] as List<dynamic>? ?? [])
                    .map((x) => ProductImage.fromJson(x))),
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
        "product_images": productImages?.map((e) => e.toJson()).toList(),
           
      };
}

class ProductImage {
  final int? id;
  final String? name;
  final String? slug;
  final DateTime? createdAt;

  ProductImage({
    this.id,
    this.name,
    this.slug,
    this.createdAt,
  });

  factory ProductImage.fromJson(Map<String, dynamic> str) {
    return ProductImage(
      id: str['id'] as int?,
      name: str['name'] as String?,
      slug: str['slug'] as String?,
      createdAt: str['created_at'] == null
          ? null
          : DateTime.parse(
              str['created_at'] as String? ?? DateTime.now().toIso8601String(),
            ),
    );
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'slug': slug,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
