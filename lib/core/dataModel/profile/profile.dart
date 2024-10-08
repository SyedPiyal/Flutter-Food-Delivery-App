// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  int? id;
  String? fName;
  String? phone;
  String? email;
  dynamic image;
  int? status;
  dynamic cmFirebaseToken;
  dynamic emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? orderCount;
  int? memberSinceDays;

  Profile({
    this.id,
    this.fName,
    this.phone,
    this.email,
    this.image,
    this.status,
    this.cmFirebaseToken,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.orderCount,
    this.memberSinceDays,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    fName: json["f_name"],
    phone: json["phone"],
    email: json["email"],
    image: json["image"],
    status: json["status"],
    cmFirebaseToken: json["cm_firebase_token"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    orderCount: json["order_count"],
    memberSinceDays: json["member_since_days"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "f_name": fName,
    "phone": phone,
    "email": email,
    "image": image,
    "status": status,
    "cm_firebase_token": cmFirebaseToken,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "order_count": orderCount,
    "member_since_days": memberSinceDays,
  };
}
