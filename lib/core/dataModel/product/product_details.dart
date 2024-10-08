// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? typeId;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.img,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.typeId,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    stars: json["stars"],
    img: json["img"],
    location: json["location"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    typeId: json["type_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "stars": stars,
    "img": img,
    "location": location,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "type_id": typeId,
  };
}
