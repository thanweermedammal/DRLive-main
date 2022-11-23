import 'package:active_ecommerce_flutter/models/active_patient_history.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:active_ecommerce_flutter/screens/new_doctor_screens/patientdocs.dart';
import 'package:active_ecommerce_flutter/screens/patientScreens/model/doctorwallet.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:active_ecommerce_flutter/models/active_doctor_history.dart';
import 'package:active_ecommerce_flutter/app_config.dart';
import 'dart:convert';
import 'package:active_ecommerce_flutter/models/pastPatientHistory.dart';
import 'package:active_ecommerce_flutter/models/pastDoctorHistory.dart';

class History {
  Future<ActiveDoctorHistory> activeDoctorData(String doctor_id) async {
    String token = access_token.$;
    Map data = {
      'doctor_id': doctor_id,
    };
    //encode Map to JSON
    var body = json.encode(data);
    final response = await http.post(
        Uri.parse('${AppConfig.BASE_URL}doctor/active/history'),
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return activeDoctorHistoryFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Docwallet> doctorWalletApi(String doctor_id) async {
    String token = access_token.$;
    Map data = {
      'doctor_id': doctor_id,
    };
    //encode Map to JSON
    var body = json.encode(data);
    final response = await http.post(
        Uri.parse('${AppConfig.BASE_URL}doctor/wallet'),
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return docwalletFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<ActivePatientHistory> activePatientData(String patient_id) async {
    String token = access_token.$;
    Map data = {
      'patient_id': patient_id,
    };
    //encode Map to JSON
    var body = json.encode(data);
    final response = await http.post(
        Uri.parse('${AppConfig.BASE_URL}patient/active/history'),
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return activePatientHistoryFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  ///past History//
  Future<PastDoctorHistory> pastDoctorData(
      String doctor_id, String from, String to, String search) async {
    String token = access_token.$;
    Map data = {
      'doctor_id': doctor_id,
      'from_date': from,
      'to_date': to,
      'search': search
    };
    //encode Map to JSON
    var body = json.encode(data);
    final response = await http.post(
        Uri.parse('${AppConfig.BASE_URL}doctor/past/history'),
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return pastDoctorHistoryFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<PastPatientHistory> pastPatientData(
      String patient_id, String from, String to, String search) async {
    String token = access_token.$;
    Map data = {
      'patient_id': patient_id,
      'from_date': from,
      'to_date': to,
      'search': search
    };
    //encode Map to JSON
    var body = json.encode(data);
    final response = await http.post(
        Uri.parse('${AppConfig.BASE_URL}patient/past/history'),
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return pastPatientHistoryFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<PatientDocuments> patientDocument(String appointment_id) async {
    String token = access_token.$;
    Map data = {
      'appointment_id': appointment_id,
    };
    //encode Map to JSON
    var body = json.encode(data);
    final response = await http.post(
        Uri.parse('${AppConfig.BASE_URL}documents/view'),
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return patientDocumentsFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
