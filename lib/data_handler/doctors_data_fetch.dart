import 'package:active_ecommerce_flutter/models/doctor_list.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:active_ecommerce_flutter/models/find_doctor.dart';
import 'package:active_ecommerce_flutter/app_config.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_flexible_toast/flutter_flexible_toast.dart';

class DoctorsData {
  Future<Doctors> fetchAlbum() async {
    String token = access_token.$;
    final response =
        await http.get(Uri.parse('${AppConfig.BASE_URL}doctors'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return doctorsFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<FindDoctor> fetchDoctor(int id) async {
    String token = access_token.$;

    Map data = {'id': id};
    //encode Map to JSON
    var body = json.encode(data);

    final response =
        await http.post(Uri.parse('${AppConfig.BASE_URL}finddoctors'),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: body);
    print(response.body);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return findDoctorFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<bool> takeAppoinment(String d_id, String p_id, String category,
      String date, String method) async {
    String token = access_token.$;

    Map data = {
      'doctor_id': d_id,
      'patient_id': p_id,
      'category_id': category,
      'date': date,
      'method': method
    };
    //encode Map to JSON
    var body = json.encode(data);

    final response =
        await http.post(Uri.parse('${AppConfig.BASE_URL}appointment/submit'),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: body);

    Map a = json.decode(response.body);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.body);

      FlutterFlexibleToast.showToast(
          message: "Appointment is confirmed",
          toastLength: Toast.LENGTH_LONG,
          toastGravity: ToastGravity.BOTTOM,
          icon: ICON.SUCCESS,
          radius: 15,
          elevation: 5,
          imageSize: 20,
          textColor: Colors.white,
          backgroundColor: Color(0xff6b0772),
          timeInSeconds: 3);

      return true;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      //throw Exception('Failed to load album');
      FlutterFlexibleToast.showToast(
          message: a['message'].toString(),
          toastLength: Toast.LENGTH_LONG,
          toastGravity: ToastGravity.BOTTOM,
          icon: ICON.ERROR,
          radius: 15,
          elevation: 5,
          imageSize: 20,
          textColor: Colors.white,
          backgroundColor: Color(0xff6b0772),
          timeInSeconds: 3);
      return false;
    }
  }
}
