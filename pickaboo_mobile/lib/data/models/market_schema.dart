// To parse this JSON data, do
//
//     final marketSchema = marketSchemaFromJson(jsonString);

import 'dart:convert';

class MarketSchema {
  List<ProductsSchema>? data;
  Links? links;
  Meta? meta;

  MarketSchema({
    this.data,
    this.links,
    this.meta,
  });

  factory MarketSchema.fromRawJson(String str) =>
      MarketSchema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MarketSchema.fromJson(Map<String, dynamic> json) => MarketSchema(
        data: json["data"] == null
            ? []
            : List<ProductsSchema>.from(
                json["data"]!.map((x) => ProductsSchema.fromJson(x))),
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

class ProductsSchema {
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

  ProductsSchema({
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

  factory ProductsSchema.fromRawJson(String str) =>
      ProductsSchema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductsSchema.fromJson(Map<String, dynamic> json) => ProductsSchema(
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
