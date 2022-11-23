// To parse this JSON data, do
//
//     final docwallet = docwalletFromJson(jsonString);

import 'dart:convert';

Docwallet docwalletFromJson(String str) => Docwallet.fromJson(json.decode(str));

String docwalletToJson(Docwallet data) => json.encode(data.toJson());

class Docwallet {
  Docwallet({
    this.result,
    this.total,
  });

  bool result;
  int total;

  factory Docwallet.fromJson(Map<String, dynamic> json) => Docwallet(
        result: json["result"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "total": total,
      };
}
