// To parse this JSON data, do
//
//     final doctorSearch = doctorSearchFromJson(jsonString);

import 'dart:convert';

DoctorSearch doctorSearchFromJson(String str) =>
    DoctorSearch.fromJson(json.decode(str));

String doctorSearchToJson(DoctorSearch data) => json.encode(data.toJson());

class DoctorSearch {
  DoctorSearch({
    this.result,
    this.doctors,
  });

  bool result;
  List<Doctor> doctors;

  factory DoctorSearch.fromJson(Map<String, dynamic> json) => DoctorSearch(
        result: json["result"],
        doctors:
            List<Doctor>.from(json["doctors"].map((x) => Doctor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "doctors": List<dynamic>.from(doctors.map((x) => x.toJson())),
      };
}

class Doctor {
  Doctor({
    this.id,
    this.userId,
    this.fees,
    this.startDate,
    this.designation,
    this.education,
    this.experiance,
    this.qualification,
    this.details,
    this.createdAt,
    this.updatedAt,
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
    this.password,
    this.activeStatus,
    this.avatar,
    this.darkMode,
    this.messengerColor,
    this.rememberToken,
  });

  int id;
  int userId;
  int fees;
  DateTime startDate;
  String designation;
  String education;
  String experiance;
  String qualification;
  String details;
  DateTime createdAt;
  DateTime updatedAt;
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
  String password;
  int activeStatus;
  String avatar;
  int darkMode;
  String messengerColor;
  dynamic rememberToken;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        userId: json["user_id"],
        fees: json["fees"],
        startDate: DateTime.parse(json["start_date"]),
        designation: json["designation"],
        education: json["education"],
        experiance: json["experiance"],
        qualification: json["qualification"],
        details: json["details"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        password: json["password"],
        activeStatus: json["active_status"],
        avatar: json["avatar"],
        darkMode: json["dark_mode"],
        messengerColor: json["messenger_color"],
        rememberToken: json["remember_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "fees": fees,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "designation": designation,
        "education": education,
        "experiance": experiance,
        "qualification": qualification,
        "details": details,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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
        "password": password,
        "active_status": activeStatus,
        "avatar": avatar,
        "dark_mode": darkMode,
        "messenger_color": messengerColor,
        "remember_token": rememberToken,
      };
}
