// To parse this JSON data, do
//
//     final allLeaves = allLeavesFromJson(jsonString);

import 'dart:convert';

AllLeaves allLeavesFromJson(String str) => AllLeaves.fromJson(json.decode(str));

String allLeavesToJson(AllLeaves data) => json.encode(data.toJson());

class AllLeaves {
  AllLeaves({
    this.result,
    this.leaves,
  });

  bool result;
  List<Leaf> leaves;

  factory AllLeaves.fromJson(Map<String, dynamic> json) => AllLeaves(
    result: json["result"],
    leaves: List<Leaf>.from(json["leaves"].map((x) => Leaf.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "leaves": List<dynamic>.from(leaves.map((x) => x.toJson())),
  };
}

class Leaf {
  Leaf({
    this.id,
    this.userId,
    this.leavetype,
    this.fromdate,
    this.todate,
    this.reason,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.type,
  });

  int id;
  int userId;
  String leavetype;
  String fromdate;
  String todate;
  String reason;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  Type type;

  factory Leaf.fromJson(Map<String, dynamic> json) => Leaf(
    id: json["id"],
    userId: json["user_id"],
    leavetype: json["Leavetype"],
    fromdate: json["Fromdate"],
    todate: json["Todate"],
    reason: json["Reason"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    type: Type.fromJson(json["type"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "Leavetype": leavetype,
    "Fromdate": fromdate,
    "Todate": todate,
    "Reason": reason,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "type": type.toJson(),
  };
}

class Type {
  Type({
    this.id,
    this.leavetype,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String leavetype;
  DateTime createdAt;
  DateTime updatedAt;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    id: json["id"],
    leavetype: json["Leavetype"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Leavetype": leavetype,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
