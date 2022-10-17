// To parse this JSON data, do
//
//     final activePatientHistory = activePatientHistoryFromJson(jsonString);

import 'dart:convert';

ActivePatientHistory activePatientHistoryFromJson(String str) => ActivePatientHistory.fromJson(json.decode(str));

String activePatientHistoryToJson(ActivePatientHistory data) => json.encode(data.toJson());

class ActivePatientHistory {
  ActivePatientHistory({
    this.result,
    this.appointments,
    this.time,
  });

  bool result;
  List<Appointment> appointments;
  List<String> time;

  factory ActivePatientHistory.fromJson(Map<String, dynamic> json) => ActivePatientHistory(
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
    this.category,
    this.doctor,
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
  Category category;
  Doctor doctor;

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
    doctor: Doctor.fromJson(json["doctor"]),
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
    "doctor": doctor.toJson(),
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
  };
}
