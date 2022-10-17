// To parse this JSON data, do
//
//     final doctors = doctorsFromJson(jsonString);

import 'dart:convert';

Doctors doctorsFromJson(String str) => Doctors.fromJson(json.decode(str));

String doctorsToJson(Doctors data) => json.encode(data.toJson());

class Doctors {
  Doctors({
    this.result,
    this.doctors,
  });

  bool result;
  List<Doctor> doctors;

  factory Doctors.fromJson(Map<String, dynamic> json) => Doctors(
    result: json["result"],
    doctors: List<Doctor>.from(json["doctors"].map((x) => Doctor.fromJson(x))),
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
    this.doctordetails,
    this.doctorcategory,
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
  Doctordetails doctordetails;
  List<Doctorcategory> doctorcategory;

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
    doctordetails: Doctordetails.fromJson(json["doctordetails"]),
    doctorcategory: List<Doctorcategory>.from(json["doctorcategory"].map((x) => Doctorcategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "fees": fees,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "designation": designation,
    "education": education,
    "experiance": experiance,
    "qualification": qualification,
    "details": details,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "doctordetails": doctordetails.toJson(),
    "doctorcategory": List<dynamic>.from(doctorcategory.map((x) => x.toJson())),
  };
}

class Doctorcategory {
  Doctorcategory({
    this.id,
    this.doctorId,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int doctorId;
  int categoryId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Doctorcategory.fromJson(Map<String, dynamic> json) => Doctorcategory(
    id: json["id"],
    doctorId: json["doctor_id"],
    categoryId: json["category_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_id": doctorId,
    "category_id": categoryId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Doctordetails {
  Doctordetails({
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
  });

  int id;
  String firstName;
  String lastName;
  String email;
  String phone;
  dynamic dob;
  String address;
  String pin;
  String place;
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

  factory Doctordetails.fromJson(Map<String, dynamic> json) => Doctordetails(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phone: json["phone"],
    dob: json["dob"],
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
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
    "dob": dob,
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
  };
}
