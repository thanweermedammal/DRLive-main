import 'package:active_ecommerce_flutter/models/active_patient_history.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:active_ecommerce_flutter/models/all_leaves.dart';
import 'package:active_ecommerce_flutter/app_config.dart';
import 'dart:convert';

class LeaveData {
  Future<AllLeaves> all(String id) async {
    String token = access_token.$;
    Map data = {
      'user_id': id,
    };
    //encode Map to JSON
    var body = json.encode(data);
    final response = await http.post(
        Uri.parse('${AppConfig.BASE_URL}leave/all'),
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return allLeavesFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<AllLeaves> awaiting(String id) async {
    String token = access_token.$;
    Map data = {
      'user_id': id,
    };
    //encode Map to JSON
    var body = json.encode(data);
    final response = await http.post(
        Uri.parse('${AppConfig.BASE_URL}leave/awaiting'),
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return allLeavesFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<AllLeaves> approved(String id) async {
    String token = access_token.$;
    Map data = {
      'user_id': id,
    };
    //encode Map to JSON
    var body = json.encode(data);
    final response = await http.post(
        Uri.parse('${AppConfig.BASE_URL}leave/approved'),
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return allLeavesFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
