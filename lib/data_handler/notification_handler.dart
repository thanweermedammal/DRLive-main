import 'package:active_ecommerce_flutter/models/notification.dart';
import 'package:active_ecommerce_flutter/models/chats.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:active_ecommerce_flutter/app_config.dart';
import 'dart:convert';
import 'package:active_ecommerce_flutter/models/stories.dart';

class NotificationHandler {
  Future<AllNotification> allNotifications(String id) async {
    String token = access_token.$;
    Map data = {
      'user_id': id,
    };
    //encode Map to JSON
    var body = json.encode(data);
    final response = await http.post(
        Uri.parse('${AppConfig.BASE_URL}notification'),
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return notificationFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Chats> allChats(String id, String toid) async {
    String token = access_token.$;
    Map data = {'from_id': id, 'to_id': toid};
    //encode Map to JSON
    var body = json.encode(data);
    final response = await http.post(
        Uri.parse('${AppConfig.BASE_URL}chat/user'),
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return chatsFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Stories> allStories() async {
    String token = access_token.$;
    // Map data = {
    //   'from_id': id,
    //   'to_id':toid
    // };
    //encode Map to JSON
    //var body = json.encode(data);
    final response =
        await http.get(Uri.parse('${AppConfig.BASE_URL}stories/active'),
            //body: body,
            headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return storiesFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
