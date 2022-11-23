// To parse this JSON data, do
//
//     final prescriptionData = prescriptionDataFromJson(jsonString);

import 'dart:convert';

PrescriptionData prescriptionDataFromJson(String str) =>
    PrescriptionData.fromJson(json.decode(str));

String prescriptionDataToJson(PrescriptionData data) =>
    json.encode(data.toJson());

class PrescriptionData {
  PrescriptionData({
    this.result,
    this.prescription,
    this.appointment,
  });

  bool result;
  List<Prescription> prescription;
  Appointment appointment;

  factory PrescriptionData.fromJson(Map<String, dynamic> json) =>
      PrescriptionData(
        result: json["result"],
        prescription: List<Prescription>.from(
            json["prescription"].map((x) => Prescription.fromJson(x))),
        appointment: Appointment.fromJson(json["appointment"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "prescription": List<dynamic>.from(prescription.map((x) => x.toJson())),
        "appointment": appointment.toJson(),
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
  });

  int id;
  int userId;
  int categoryId;
  int doctorId;
  int tokenNo;
  DateTime date;
  dynamic method;
  String paymentStatus;
  dynamic paymentId;
  String status;
  int weight;
  String bloodPressure;
  int pulse;
  int temperature;
  String problem;
  DateTime createdAt;
  DateTime updatedAt;

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        id: json["id"],
        userId: json["user_id"],
        categoryId: json["category_id"],
        doctorId: json["doctor_id"],
        tokenNo: json["token_no"],
        date: DateTime.parse(json["date"]),
        method: json["method"],
        paymentStatus: json["payment_status"],
        paymentId: json["payment_id"],
        status: json["status"],
        weight: json["weight"],
        bloodPressure: json["blood_pressure"],
        pulse: json["pulse"],
        temperature: json["temperature"],
        problem: json["problem"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "category_id": categoryId,
        "doctor_id": doctorId,
        "token_no": tokenNo,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "method": method,
        "payment_status": paymentStatus,
        "payment_id": paymentId,
        "status": status,
        "weight": weight,
        "blood_pressure": bloodPressure,
        "pulse": pulse,
        "temperature": temperature,
        "problem": problem,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Prescription {
  Prescription({
    this.id,
    this.appointmentId,
    this.medicine,
    this.dosage,
    this.days,
    this.time,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int appointmentId;
  String medicine;
  String dosage;
  int days;
  String time;
  DateTime createdAt;
  DateTime updatedAt;

  factory Prescription.fromJson(Map<String, dynamic> json) => Prescription(
        id: json["id"],
        appointmentId: json["appointment_id"],
        medicine: json["medicine"],
        dosage: json["dosage"],
        days: json["days"],
        time: json["time"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "appointment_id": appointmentId,
        "medicine": medicine,
        "dosage": dosage,
        "days": days,
        "time": time,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
