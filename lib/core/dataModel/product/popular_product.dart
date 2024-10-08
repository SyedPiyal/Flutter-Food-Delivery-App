// To parse this JSON data, do
//
//     final popularProduct = popularProductFromJson(jsonString);

import 'dart:convert';
import 'package:food_app/core/dataModel/product/product_details.dart';

PopularProduct popularProductFromJson(String str) => PopularProduct.fromJson(json.decode(str));

String popularProductToJson(PopularProduct data) => json.encode(data.toJson());

class PopularProduct {
  int? totalSize;
  int? typeId;
  int? offset;
  List<Product>? products;

  PopularProduct({
    this.totalSize,
    this.typeId,
    this.offset,
    this.products,
  });

  factory PopularProduct.fromJson(Map<String, dynamic> json) => PopularProduct(
    totalSize: json["total_size"],
    typeId: json["type_id"],
    offset: json["offset"],
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_size": totalSize,
    "type_id": typeId,
    "offset": offset,
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}


