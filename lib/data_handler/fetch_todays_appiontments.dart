import 'package:active_ecommerce_flutter/models/appointments.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:active_ecommerce_flutter/models/banners.dart';
import 'package:active_ecommerce_flutter/app_config.dart';
import 'dart:convert';

class AppointmentData {
  Future<Appointments> fetchAppointments(String doctor_id) async {
    String token = access_token.$;
    Map data = {
      'doctor_id': doctor_id,
    };
    //encode Map to JSON
    var body = json.encode(data);
    final response = await http.post(
        Uri.parse('${AppConfig.BASE_URL}appointments/today'),
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return appointmentsFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.statusCode);
      throw Exception('Failed to load album');
    }
  }
}
