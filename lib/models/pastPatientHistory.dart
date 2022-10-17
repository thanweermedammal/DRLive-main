// To parse this JSON data, do
//
//     final pastPatientHistory = pastPatientHistoryFromJson(jsonString);

import 'dart:convert';

PastPatientHistory pastPatientHistoryFromJson(String str) => PastPatientHistory.fromJson(json.decode(str));

String pastPatientHistoryToJson(PastPatientHistory data) => json.encode(data.toJson());

class PastPatientHistory {
  PastPatientHistory({
    this.result,
    this.appointments,
    this.time,
  });

  bool result;
  List<Appointment> appointments;
  List<String> time;

  factory PastPatientHistory.fromJson(Map<String, dynamic> json) => PastPatientHistory(
    result: json["result"],
    appointments: List<Appointment>.from(json["appointments"].map((x) => Appointment.fromJson(x))),
    time: List<String>.from(json["time"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "appointments": List<dynamic>.from(appointments.map((x) => x.toJson())),
    "time": List<dynamic>.from(time.map((x) => x)),
  };
}

class Appointment {
  Appointment({
    this.id,
    this.userId,
    this.categoryId,
    this.doctorId,
    this.tokenNo,
    this.date,
    this.method,
    this.paymentStatus,
    this.status,
    this.weight,
    this.bloodPressure,
    this.pulse,
    this.temperature,
    this.problem,
    this.createdAt,
    this.updatedAt,
    this.fees,
    this.startDate,
    this.designation,
    this.education,
    this.experiance,
    this.qualification,
    this.details,
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
    this.emailVerifiedAt,
    this.password,
    this.activeStatus,
    this.avatar,
    this.darkMode,
    this.messengerColor,
    this.rememberToken,
    this.category,
  });

  int id;
  int userId;
  int categoryId;
  int doctorId;
  int tokenNo;
  DateTime date;
  String method;
  String paymentStatus;
  String status;
  int weight;
  int bloodPressure;
  int pulse;
  int temperature;
  String problem;
  DateTime createdAt;
  DateTime updatedAt;
  int fees;
  DateTime startDate;
  String designation;
  String education;
  String experiance;
  String qualification;
  String details;
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
  dynamic emailVerifiedAt;
  String password;
  int activeStatus;
  String avatar;
  int darkMode;
  String messengerColor;
  dynamic rememberToken;
  Category category;

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
    id: json["id"],
    userId: json["user_id"],
    categoryId: json["category_id"],
    doctorId: json["doctor_id"],
    tokenNo: json["token_no"],
    date: DateTime.parse(json["date"]),
    method: json["method"] == null ? null : json["method"],
    paymentStatus: json["payment_status"],
    status: json["status"],
    weight: json["weight"] == null ? null : json["weight"],
    bloodPressure: json["blood_pressure"] == null ? null : json["blood_pressure"],
    pulse: json["pulse"] == null ? null : json["pulse"],
    temperature: json["temperature"] == null ? null : json["temperature"],
    problem: json["problem"] == null ? null : json["problem"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    fees: json["fees"],
    startDate: DateTime.parse(json["start_date"]),
    designation: json["designation"],
    education: json["education"],
    experiance: json["experiance"],
    qualification: json["qualification"],
    details: json["details"],
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
    emailVerifiedAt: json["email_verified_at"],
    password: json["password"],
    activeStatus: json["active_status"],
    avatar: json["avatar"],
    darkMode: json["dark_mode"],
    messengerColor: json["messenger_color"],
    rememberToken: json["remember_token"],
    category: Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "category_id": categoryId,
    "doctor_id": doctorId,
    "token_no": tokenNo,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "method": method == null ? null : method,
    "payment_status": paymentStatus,
    "status": status,
    "weight": weight == null ? null : weight,
    "blood_pressure": bloodPressure == null ? null : bloodPressure,
    "pulse": pulse == null ? null : pulse,
    "temperature": temperature == null ? null : temperature,
    "problem": problem == null ? null : problem,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "fees": fees,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "designation": designation,
    "education": education,
    "experiance": experiance,
    "qualification": qualification,
    "details": details,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "address": address,
    "pin": pin,
    "place": place,
    "city": city,
    "state": state,
    "country": country,
    "blood_group": bloodGroup,
    "gender": gender,
    "image": image,
    "email_verified_at": emailVerifiedAt,
    "password": password,
    "active_status": activeStatus,
    "avatar": avatar,
    "dark_mode": darkMode,
    "messenger_color": messengerColor,
    "remember_token": rememberToken,
    "category": category.toJson(),
  };
}

class Category {
  Category({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
