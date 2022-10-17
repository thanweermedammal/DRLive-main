// To parse this JSON data, do
//
//     final appointments = appointmentsFromJson(jsonString);

import 'dart:convert';

Appointments appointmentsFromJson(String str) => Appointments.fromJson(json.decode(str));

String appointmentsToJson(Appointments data) => json.encode(data.toJson());

class Appointments {
  Appointments({
    this.result,
    this.appointments,
    this.time,
    this.patientImagePath,
  });

  bool result;
  List<Appointment> appointments;
  List<String> time;
  String patientImagePath;

  factory Appointments.fromJson(Map<String, dynamic> json) => Appointments(
    result: json["result"],
    appointments: List<Appointment>.from(json["appointments"].map((x) => Appointment.fromJson(x))),
    time: List<String>.from(json["time"].map((x) => x)),
    patientImagePath: json["patient image path"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "appointments": List<dynamic>.from(appointments.map((x) => x.toJson())),
    "time": List<dynamic>.from(time.map((x) => x)),
    "patient image path": patientImagePath,
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
    this.category,
    this.patient,
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
  dynamic weight;
  dynamic bloodPressure;
  dynamic pulse;
  dynamic temperature;
  dynamic problem;
  DateTime createdAt;
  DateTime updatedAt;
  Category category;
  Patient patient;

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
    id: json["id"],
    userId: json["user_id"],
    categoryId: json["category_id"],
    doctorId: json["doctor_id"],
    tokenNo: json["token_no"],
    date: DateTime.parse(json["date"]),
    method: json["method"],
    paymentStatus: json["payment_status"],
    status: json["status"],
    weight: json["weight"],
    bloodPressure: json["blood_pressure"],
    pulse: json["pulse"],
    temperature: json["temperature"],
    problem: json["problem"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    category: Category.fromJson(json["category"]),
    patient: Patient.fromJson(json["patient"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "category_id": categoryId,
    "doctor_id": doctorId,
    "token_no": tokenNo,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "method": method,
    "payment_status": paymentStatus,
    "status": status,
    "weight": weight,
    "blood_pressure": bloodPressure,
    "pulse": pulse,
    "temperature": temperature,
    "problem": problem,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "category": category.toJson(),
    "patient": patient.toJson(),
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

class Patient {
  Patient({
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
  dynamic city;
  dynamic state;
  dynamic country;
  dynamic bloodGroup;
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

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
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
  };
}
