import 'package:active_ecommerce_flutter/models/doctor_list.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:active_ecommerce_flutter/app_config.dart';
import 'package:active_ecommerce_flutter/helpers/auth_helper.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_flexible_toast/flutter_flexible_toast.dart';
import 'dart:convert';

class UserData {
  Future<bool> authenticateUser(String number, String password) async {
    try {
      final response =
          await http.post(Uri.parse('${AppConfig.BASE_URL}login'), body: {
        'type': "mobile",
        'password': password,
        'email_or_phone': number,
      });
      switch (response.statusCode) {
        case 200:
          final values = json.decode(response.body);
          AuthHelper().setUserData(values, number, password);
          return true;
          break;
        case 404:
          print("Something went wrong");
          return false;
          break;
        default:
          print("Something ");
          return false;
          break;
      }
    } on Exception {
      return false;
    }
  }

  Future<bool> authenticateDoc(String number, String password) async {
    try {
      final response =
          await http.post(Uri.parse('${AppConfig.BASE_URL}login'), body: {
        'type': "email",
        'password': password,
        'email_or_phone': number,
      });
      switch (response.statusCode) {
        case 200:
          final values = json.decode(response.body);
          AuthHelper().setUserData(values, number, password);
          return true;
          break;
        case 404:
          print("Something went wrong");
          return false;
          break;
        default:
          print("Something ");
          return false;
          break;
      }
    } on Exception {
      return false;
    }
  }

  Future<bool> register(String username, String number, String password,
      String dob, String gender) async {
    try {
      final response =
          await http.post(Uri.parse('${AppConfig.BASE_URL}register'), body: {
        'name': username,
        'type': "mobile",
        'password': password,
        'email_or_phone': number,
        'gender': gender,
        'dob': dob
      });

      switch (response.statusCode) {
        case 200:
          print(response.body);
          FlutterFlexibleToast.showToast(
              message: " Registration Success",
              toastLength: Toast.LENGTH_LONG,
              toastGravity: ToastGravity.BOTTOM,
              icon: ICON.SUCCESS,
              radius: 15,
              elevation: 5,
              imageSize: 20,
              textColor: Colors.white,
              backgroundColor: HexColor('33BEA3'),
              timeInSeconds: 3);
          final values = json.decode(response.body);
          AuthHelper().setUserData(values, username, password);
          return true;
          break;
        case 404:
          FlutterFlexibleToast.showToast(
              message: " Registration Error",
              toastLength: Toast.LENGTH_LONG,
              toastGravity: ToastGravity.BOTTOM,
              icon: ICON.ERROR,
              radius: 15,
              elevation: 5,
              imageSize: 20,
              textColor: Colors.white,
              backgroundColor: HexColor('33BEA3'),
              timeInSeconds: 3);
          print("Something went wrong");
          return false;
          // _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
          break;
        default:
          FlutterFlexibleToast.showToast(
              message: " Registration Error",
              toastLength: Toast.LENGTH_LONG,
              toastGravity: ToastGravity.BOTTOM,
              icon: ICON.ERROR,
              radius: 15,
              elevation: 5,
              imageSize: 20,
              textColor: Colors.white,
              backgroundColor: HexColor('33BEA3'),
              timeInSeconds: 3);
          print("Something ");
          return false;
          //_apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
          break;
      }
    } on Exception {
      print("Error");
    }
  }

  Future<bool> updateProfile(String name, String blood, String email) async {
    try {
      final response = await http
          .post(Uri.parse('${AppConfig.BASE_URL}user/profile'), body: {
        'type': "patient",
        'id': user_id.$.toString(),
        'name': name,
        'email': email,
        'blood_group': blood,
        'gender': "male",
        'dob': ""
      });

      print(response.statusCode);
      switch (response.statusCode) {
        case 200:
          return true;
          break;
        case 404:
          print("Something went wrong");
          return false;
          break;
        default:
          print("Something ");
          return false;
          break;
      }
    } on Exception {
      return false;
    }
  }
}
