// To parse this JSON data, do
//
//     final pastPatientHistory = pastPatientHistoryFromJson(jsonString);

import 'dart:convert';

PastPatientHistory pastPatientHistoryFromJson(String str) =>
    PastPatientHistory.fromJson(json.decode(str));

String pastPatientHistoryToJson(PastPatientHistory data) =>
    json.encode(data.toJson());

class PastPatientHistory {
  PastPatientHistory({
    this.result,
    this.appointments,
    this.time,
  });

  bool result;
  List<Appointment> appointments;
  List<Time> time;

  factory PastPatientHistory.fromJson(Map<String, dynamic> json) =>
      PastPatientHistory(
        result: json["result"],
        appointments: List<Appointment>.from(
            json["appointments"].map((x) => Appointment.fromJson(x))),
        time: List<Time>.from(json["time"].map((x) => timeValues.map[x])),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "appointments": List<dynamic>.from(appointments.map((x) => x.toJson())),
        "time": List<dynamic>.from(time.map((x) => timeValues.reverse[x])),
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
    this.paymentId,
    this.status,
    this.weight,
    this.bloodPressure,
    this.pulse,
    this.temperature,
    this.problem,
    this.createdAt,
    this.updatedAt,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.category,
  });

  int id;
  int userId;
  int categoryId;
  int doctorId;
  int tokenNo;
  DateTime date;
  Method method;
  PaymentStatus paymentStatus;
  String paymentId;
  Status status;
  dynamic weight;
  dynamic bloodPressure;
  dynamic pulse;
  dynamic temperature;
  dynamic problem;
  DateTime createdAt;
  DateTime updatedAt;
  FirstName firstName;
  LastName lastName;
  String phone;
  Email email;
  Category category;

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        id: json["id"],
        userId: json["user_id"],
        categoryId: json["category_id"],
        doctorId: json["doctor_id"],
        tokenNo: json["token_no"],
        date: DateTime.parse(json["date"]),
        method: methodValues.map[json["method"]],
        paymentStatus: paymentStatusValues.map[json["payment_status"]],
        paymentId: json["payment_id"] == null ? null : json["payment_id"],
        status: statusValues.map[json["status"]],
        weight: json["weight"],
        bloodPressure: json["blood_pressure"],
        pulse: json["pulse"],
        temperature: json["temperature"],
        problem: json["problem"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        firstName: firstNameValues.map[json["first_name"]],
        lastName: lastNameValues.map[json["last_name"]],
        phone: json["phone"],
        email: emailValues.map[json["email"]],
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "category_id": categoryId,
        "doctor_id": doctorId,
        "token_no": tokenNo,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "method": methodValues.reverse[method],
        "payment_status": paymentStatusValues.reverse[paymentStatus],
        "payment_id": paymentId == null ? null : paymentId,
        "status": statusValues.reverse[status],
        "weight": weight,
        "blood_pressure": bloodPressure,
        "pulse": pulse,
        "temperature": temperature,
        "problem": problem,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "first_name": firstNameValues.reverse[firstName],
        "last_name": lastNameValues.reverse[lastName],
        "phone": phone,
        "email": emailValues.reverse[email],
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
  Name name;
  DateTime createdAt;
  DateTime updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: nameValues.map[json["name"]],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum Name { OPHTHALMOLOGISTS }

final nameValues = EnumValues({"Ophthalmologists": Name.OPHTHALMOLOGISTS});

enum Email { ALTHAF_GMAIL_COM }

final emailValues = EnumValues({"althaf@gmail.com": Email.ALTHAF_GMAIL_COM});

enum FirstName { ALTHAF }

final firstNameValues = EnumValues({"althaf": FirstName.ALTHAF});

enum LastName { AK }

final lastNameValues = EnumValues({"ak": LastName.AK});

enum Method { CALL, VIDEO, CHAT }

final methodValues = EnumValues(
    {"call": Method.CALL, "chat": Method.CHAT, "video": Method.VIDEO});

enum PaymentStatus { UNPAID, PAID }

final paymentStatusValues =
    EnumValues({"paid": PaymentStatus.PAID, "unpaid": PaymentStatus.UNPAID});

enum Status { NEW, COMPLETED }

final statusValues =
    EnumValues({"completed": Status.COMPLETED, "new": Status.NEW});

enum Time {
  THE_0900_AM_TO_0910_AM,
  THE_1000_AM_TO_1010_AM,
  THE_0924_AM_TO_0934_AM,
  THE_0948_AM_TO_0958_AM,
  THE_1012_AM_TO_1022_AM,
  THE_1036_AM_TO_1046_AM
}

final timeValues = EnumValues({
  "09:00 AM to 09:10 AM": Time.THE_0900_AM_TO_0910_AM,
  "09:24 AM to 09:34 AM": Time.THE_0924_AM_TO_0934_AM,
  "09:48 AM to 09:58 AM": Time.THE_0948_AM_TO_0958_AM,
  "10:00 AM to 10:10 AM": Time.THE_1000_AM_TO_1010_AM,
  "10:12 AM to 10:22 AM": Time.THE_1012_AM_TO_1022_AM,
  "10:36 AM to 10:46 AM": Time.THE_1036_AM_TO_1046_AM
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
