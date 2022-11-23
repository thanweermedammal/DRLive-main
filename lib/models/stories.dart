// To parse this JSON data, do
//
//     final stories = storiesFromJson(jsonString);

import 'dart:convert';

Stories storiesFromJson(String str) => Stories.fromJson(json.decode(str));

String storiesToJson(Stories data) => json.encode(data.toJson());

class Stories {
  Stories({
    this.result,
    this.imagePath,
    this.stories,
  });

  bool result;
  String imagePath;
  List<StoriesStory> stories;

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        result: json["result"],
        imagePath: json["image path"],
        stories: List<StoriesStory>.from(
            json["stories"].map((x) => StoriesStory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "image path": imagePath,
        "stories": List<dynamic>.from(stories.map((x) => x.toJson())),
      };
}

class StoriesStory {
  StoriesStory({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.dob,
    this.address,
    this.pin,
    this.place,
    this.city,
    this.state,
    this.country,
    this.bloodGroup,
    this.gender,
    this.image,
    this.status,
    this.emailVerifiedAt,
    this.activeStatus,
    this.avatar,
    this.darkMode,
    this.messengerColor,
    this.createdAt,
    this.updatedAt,
    this.stories,
  });

  int id;
  String firstName;
  String lastName;
  String email;
  String phone;
  DateTime dob;
  String address;
  String pin;
  String place;
  dynamic city;
  dynamic state;
  dynamic country;
  dynamic bloodGroup;
  String gender;
  String image;
  String status;
  dynamic emailVerifiedAt;
  int activeStatus;
  String avatar;
  int darkMode;
  String messengerColor;
  DateTime createdAt;
  DateTime updatedAt;
  List<StoryStory> stories;

  factory StoriesStory.fromJson(Map<String, dynamic> json) => StoriesStory(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        dob: DateTime.parse(json["dob"]),
        address: json["address"],
        pin: json["pin"],
        place: json["place"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        bloodGroup: json["blood_group"],
        gender: json["gender"],
        image: json["image"],
        status: json["status"],
        emailVerifiedAt: json["email_verified_at"],
        activeStatus: json["active_status"],
        avatar: json["avatar"],
        darkMode: json["dark_mode"],
        messengerColor: json["messenger_color"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        stories: List<StoryStory>.from(
            json["stories"].map((x) => StoryStory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "address": address,
        "pin": pin,
        "place": place,
        "city": city,
        "state": state,
        "country": country,
        "blood_group": bloodGroup,
        "gender": gender,
        "image": image,
        "status": status,
        "email_verified_at": emailVerifiedAt,
        "active_status": activeStatus,
        "avatar": avatar,
        "dark_mode": darkMode,
        "messenger_color": messengerColor,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "stories": List<dynamic>.from(stories.map((x) => x.toJson())),
      };
}

class StoryStory {
  StoryStory({
    this.id,
    this.userId,
    this.name,
    this.image,
    this.link,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int userId;
  String name;
  String image;
  String link;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory StoryStory.fromJson(Map<String, dynamic> json) => StoryStory(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        image: json["image"],
        link: json["link"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "image": image,
        "link": link,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
