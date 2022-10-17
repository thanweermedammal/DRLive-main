// To parse this JSON data, do
//
//     final banner = bannerFromJson(jsonString);

import 'dart:convert';

Banners bannerFromJson(String str) => Banners.fromJson(json.decode(str));

String bannerToJson(Banners data) => json.encode(data.toJson());

class Banners {
  Banners({
    this.result,
    this.bannerImmagePath,
    this.banners,
  });

  String result;
  String bannerImmagePath;
  List<BannerElement> banners;

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
    result: json["result"],
    bannerImmagePath: json["banner immage path"],
    banners: List<BannerElement>.from(json["banners"].map((x) => BannerElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "banner immage path": bannerImmagePath,
    "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
  };
}

class BannerElement {
  BannerElement({
    this.id,
    this.name,
    this.image,
    this.link,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String image;
  String link;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory BannerElement.fromJson(Map<String, dynamic> json) => BannerElement(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    link: json["link"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "link": link,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
