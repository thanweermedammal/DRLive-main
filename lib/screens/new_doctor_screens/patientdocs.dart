// To parse this JSON data, do
//
//     final patientDocuments = patientDocumentsFromJson(jsonString);

import 'dart:convert';

PatientDocuments patientDocumentsFromJson(String str) =>
    PatientDocuments.fromJson(json.decode(str));

String patientDocumentsToJson(PatientDocuments data) =>
    json.encode(data.toJson());

class PatientDocuments {
  PatientDocuments({
    this.result,
    this.path,
    this.documents,
  });

  bool result;
  String path;
  List<Document> documents;

  factory PatientDocuments.fromJson(Map<String, dynamic> json) =>
      PatientDocuments(
        result: json["result"],
        path: json["path"],
        documents: List<Document>.from(
            json["documents"].map((x) => Document.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "path": path,
        "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
      };
}

class Document {
  Document({
    this.id,
    this.appointmentId,
    this.name,
    this.document,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int appointmentId;
  String name;
  String document;
  DateTime createdAt;
  DateTime updatedAt;

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        id: json["id"],
        appointmentId: json["appointment_id"],
        name: json["name"],
        document: json["document"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "appointment_id": appointmentId,
        "name": name,
        "document": document,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
