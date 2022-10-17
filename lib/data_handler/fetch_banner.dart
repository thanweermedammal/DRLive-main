import 'package:active_ecommerce_flutter/models/doctor_list.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:active_ecommerce_flutter/models/banners.dart';
import 'package:active_ecommerce_flutter/app_config.dart';

class BannerData {
  Future<Banners> fetchBanners() async {
    String token = access_token.$;
    final response = await http
        .get(Uri.parse('${AppConfig.BASE_URL}banners/list'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return bannerFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
