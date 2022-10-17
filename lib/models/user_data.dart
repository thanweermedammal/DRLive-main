// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.result,
    this.message,
    this.user,
    this.role,
    this.token,
  });

  bool result;
  String message;
  UserClass user;
  List<Role> role;
  String token;

  factory User.fromJson(Map<String, dynamic> json) => User(
    result: json["result"],
    message: json["message"],
    user: UserClass.fromJson(json["user"]),
    role: List<Role>.from(json["role"].map((x) => Role.fromJson(x))),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "user": user.toJson(),
    "role": List<dynamic>.from(role.map((x) => x.toJson())),
    "token": token,
  };
}

class Role {
  Role({
    this.id,
    this.name,
    this.guardName,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  int id;
  String name;
  String guardName;
  dynamic createdAt;
  dynamic updatedAt;
  Pivot pivot;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
    guardName: json["guard_name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "guard_name": guardName,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "pivot": pivot.toJson(),
  };
}

class Pivot {
  Pivot({
    this.modelId,
    this.roleId,
    this.modelType,
  });

  int modelId;
  int roleId;
  String modelType;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    modelId: json["model_id"],
    roleId: json["role_id"],
    modelType: json["model_type"],
  );

  Map<String, dynamic> toJson() => {
    "model_id": modelId,
    "role_id": roleId,
    "model_type": modelType,
  };
}

class UserClass {
  UserClass({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.dob,
    this.address,
    this.pin,
    this.place,
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
    this.roles,
  });

  int id;
  String firstName;
  dynamic lastName;
  dynamic email;
  String phone;
  DateTime dob;
  dynamic address;
  dynamic pin;
  dynamic place;
  String gender;
  dynamic image;
  String status;
  dynamic emailVerifiedAt;
  int activeStatus;
  String avatar;
  int darkMode;
  String messengerColor;
  DateTime createdAt;
  DateTime updatedAt;
  List<Role> roles;

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phone: json["phone"],
    dob: DateTime.parse(json["dob"]),
    address: json["address"],
    pin: json["pin"],
    place: json["place"],
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
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "address": address,
    "pin": pin,
    "place": place,
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
    "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
  };
}
