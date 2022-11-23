// To parse this JSON data, do
//
//     final activePatientHistory = activePatientHistoryFromJson(jsonString);

import 'dart:convert';

ActivePatientHistory activePatientHistoryFromJson(String str) =>
    ActivePatientHistory.fromJson(json.decode(str));

String activePatientHistoryToJson(ActivePatientHistory data) =>
    json.encode(data.toJson());

class ActivePatientHistory {
  ActivePatientHistory({
    this.result,
    this.appointments,
    this.time,
  });

  bool result;
  List<Appointment> appointments;
  List<String> time;

  factory ActivePatientHistory.fromJson(Map<String, dynamic> json) =>
      ActivePatientHistory(
        result: json["result"],
        appointments: List<Appointment>.from(
            json["appointments"].map((x) => Appointment.fromJson(x))),
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
    this.paymentId,
    this.status,
    this.weight,
    this.bloodPressure,
    this.pulse,
    this.temperature,
    this.problem,
    this.createdAt,
    this.updatedAt,
    this.patient,
    this.category,
    this.doctor,
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
  Patient patient;
  Category category;
  Doctor doctor;

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
        patient: Patient.fromJson(json["patient"]),
        category: Category.fromJson(json["category"]),
        doctor: Doctor.fromJson(json["doctor"]),
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
        "patient": patient.toJson(),
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
  });

  int id;
  int userId;
  int fees;
  DateTime startDate;
  Designation designation;
  Education education;
  Experiance experiance;
  Qualification qualification;
  Details details;
  DateTime createdAt;
  DateTime updatedAt;
  Patient doctordetails;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        userId: json["user_id"],
        fees: json["fees"],
        startDate: DateTime.parse(json["start_date"]),
        designation: designationValues.map[json["designation"]],
        education: educationValues.map[json["education"]],
        experiance: experianceValues.map[json["experiance"]],
        qualification: qualificationValues.map[json["qualification"]],
        details: detailsValues.map[json["details"]],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        doctordetails: Patient.fromJson(json["doctordetails"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "fees": fees,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "designation": designationValues.reverse[designation],
        "education": educationValues.reverse[education],
        "experiance": experianceValues.reverse[experiance],
        "qualification": qualificationValues.reverse[qualification],
        "details": detailsValues.reverse[details],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "doctordetails": doctordetails.toJson(),
      };
}

enum Designation { MBBS_MD }

final designationValues = EnumValues({"MBBS, MD": Designation.MBBS_MD});

enum Details { P_ABOUT_P }

final detailsValues = EnumValues({"<p>about</p>": Details.P_ABOUT_P});

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
  FirstName firstName;
  LastName lastName;
  Email email;
  String phone;
  DateTime dob;
  Address address;
  String pin;
  Place place;
  dynamic city;
  dynamic state;
  dynamic country;
  dynamic bloodGroup;
  Gender gender;
  Image image;
  String status;
  dynamic emailVerifiedAt;
  int activeStatus;
  Avatar avatar;
  int darkMode;
  MessengerColor messengerColor;
  DateTime createdAt;
  DateTime updatedAt;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        firstName: firstNameValues.map[json["first_name"]],
        lastName: json["last_name"] == null
            ? null
            : lastNameValues.map[json["last_name"]],
        email: emailValues.map[json["email"]],
        phone: json["phone"],
        dob: DateTime.parse(json["dob"]),
        address:
            json["address"] == null ? null : addressValues.map[json["address"]],
        pin: json["pin"] == null ? null : json["pin"],
        place: json["place"] == null ? null : placeValues.map[json["place"]],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        bloodGroup: json["blood_group"],
        gender: genderValues.map[json["gender"]],
        image: json["image"] == null ? null : imageValues.map[json["image"]],
        status: json["status"],
        emailVerifiedAt: json["email_verified_at"],
        activeStatus: json["active_status"],
        avatar: avatarValues.map[json["avatar"]],
        darkMode: json["dark_mode"],
        messengerColor: messengerColorValues.map[json["messenger_color"]],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstNameValues.reverse[firstName],
        "last_name": lastName == null ? null : lastNameValues.reverse[lastName],
        "email": emailValues.reverse[email],
        "phone": phone,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "address": address == null ? null : addressValues.reverse[address],
        "pin": pin == null ? null : pin,
        "place": place == null ? null : placeValues.reverse[place],
        "city": city,
        "state": state,
        "country": country,
        "blood_group": bloodGroup,
        "gender": genderValues.reverse[gender],
        "image": image == null ? null : imageValues.reverse[image],
        "status": status,
        "email_verified_at": emailVerifiedAt,
        "active_status": activeStatus,
        "avatar": avatarValues.reverse[avatar],
        "dark_mode": darkMode,
        "messenger_color": messengerColorValues.reverse[messengerColor],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum Address { P_ADDRESS_P }

final addressValues = EnumValues({"<p>address</p>": Address.P_ADDRESS_P});

enum Avatar { AVATAR_PNG }

final avatarValues = EnumValues({"avatar.png": Avatar.AVATAR_PNG});

enum Email { ALTHAF_GMAIL_COM, NEWPATIENT_GMAIL_COM }

final emailValues = EnumValues({
  "althaf@gmail.com": Email.ALTHAF_GMAIL_COM,
  "newpatient@gmail.com": Email.NEWPATIENT_GMAIL_COM
});

enum FirstName { ALTHAF, NEW_PATIENT }

final firstNameValues = EnumValues(
    {"althaf": FirstName.ALTHAF, "new patient": FirstName.NEW_PATIENT});

enum Gender { MALE }

final genderValues = EnumValues({"male": Gender.MALE});

enum Image { THE_1644935440_AVATAR_7_JPG }

final imageValues =
    EnumValues({"1644935440.avatar-7.jpg": Image.THE_1644935440_AVATAR_7_JPG});

enum LastName { AK }

final lastNameValues = EnumValues({"ak": LastName.AK});

enum MessengerColor { THE_2180_F3 }

final messengerColorValues =
    EnumValues({"#2180f3": MessengerColor.THE_2180_F3});

enum Place { VALANCHERY }

final placeValues = EnumValues({"valanchery": Place.VALANCHERY});

enum Education { P_EDUCATION_P }

final educationValues =
    EnumValues({"<p>education</p>": Education.P_EDUCATION_P});

enum Experiance { P_EXPERIANCE_P }

final experianceValues =
    EnumValues({"<p>experiance</p>": Experiance.P_EXPERIANCE_P});

enum Qualification { P_QUALIFICATION_P }

final qualificationValues =
    EnumValues({"<p>qualification</p>": Qualification.P_QUALIFICATION_P});

enum Method { CALL, VIDEO, CHAT }

final methodValues = EnumValues(
    {"call": Method.CALL, "chat": Method.CHAT, "video": Method.VIDEO});

enum PaymentStatus { UNPAID, PAID }

final paymentStatusValues =
    EnumValues({"paid": PaymentStatus.PAID, "unpaid": PaymentStatus.UNPAID});

enum Status { NEW }

final statusValues = EnumValues({"new": Status.NEW});

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
