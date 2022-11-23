import 'dart:io';
import 'dart:math';

import 'package:active_ecommerce_flutter/models/doctor_list.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:active_ecommerce_flutter/screens/patientScreens/storieslist.dart';
import 'package:active_ecommerce_flutter/ui_sections/bottom_navigation_doctor.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
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
import 'package:image_picker/image_picker.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class DoctorsData {
  var appointmentids = '';
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

  Future<bool> takeAppoinment(
    String d_id,
    String p_id,
    String category,
    String date,
    String method,
  ) async {
    String token = access_token.$;

    Map data = {
      'doctor_id': d_id,
      'patient_id': p_id,
      'category_id': category,
      'date': date,
      'method': method,
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
      appointmentid.$ = a["appointment"]["id"].toString();
      print(appointmentid.$);
      FlutterFlexibleToast.showToast(
          message: "Appointment is confirmed",
          toastLength: Toast.LENGTH_LONG,
          toastGravity: ToastGravity.BOTTOM,
          icon: ICON.SUCCESS,
          radius: 15,
          elevation: 5,
          imageSize: 20,
          textColor: Colors.white,
          backgroundColor: HexColor('33BEA3'),
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
          backgroundColor: HexColor('33BEA3'),
          timeInSeconds: 3);
      return false;
    }
  }

  Future<bool> payment(
    String p_id,
  ) async {
    String token = access_token.$;

    Map data = {
      'appointment_id': appointmentid.$,
      'payment_id': p_id,
    };
    //encode Map to JSON
    var body = json.encode(data);

    final response =
        await http.post(Uri.parse('${AppConfig.BASE_URL}payment/submit'),
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

      print(appointmentids);
      FlutterFlexibleToast.showToast(
          message: "Payment Successfull",
          toastLength: Toast.LENGTH_LONG,
          toastGravity: ToastGravity.BOTTOM,
          icon: ICON.SUCCESS,
          radius: 15,
          elevation: 5,
          imageSize: 20,
          textColor: Colors.white,
          backgroundColor: HexColor('33BEA3'),
          timeInSeconds: 3);

      return true;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      //throw Exception('Failed to load album');
      FlutterFlexibleToast.showToast(
          message: 'payment error',
          toastLength: Toast.LENGTH_LONG,
          toastGravity: ToastGravity.BOTTOM,
          icon: ICON.ERROR,
          radius: 15,
          elevation: 5,
          imageSize: 20,
          textColor: Colors.white,
          backgroundColor: HexColor('33BEA3'),
          timeInSeconds: 3);
      return false;
    }
  }

  // Future<bool> addStory(
  //     {@required String name,
  //     @required String image,
  //     @required String link}) async {
  //   String token = access_token.$;
  //
  //   Map data = {
  //     'doctor_id': user_id.$,
  //     'name': name,
  //     'image': image,
  //     "link": link
  //   };
  //   //encode Map to JSON
  //   var body = json.encode(data);
  //   File imageFile = new File(image);
  //   // String fileName = imageFile.path.split("/").last;
  //   String ext = imageFile.path.split(".").last;
  //   String fileName = getRandString(7) + "." + ext;
  //
  //   final response =
  //       await http.post(Uri.parse(AppConfig.BASE_URL + 'stories/create'),
  //           headers: {
  //             'Content-Type': 'application/json',
  //             'Accept': 'application/json',
  //             'Authorization': 'Bearer $token',
  //           },
  //           body: body);
  //
  //   Map a = json.decode(response.body);
  //
  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     print(response.body);
  //
  //     print(appointmentids);
  //     FlutterFlexibleToast.showToast(
  //         message: a['message'].toString(),
  //         toastLength: Toast.LENGTH_LONG,
  //         toastGravity: ToastGravity.BOTTOM,
  //         icon: ICON.SUCCESS,
  //         radius: 15,
  //         elevation: 5,
  //         imageSize: 20,
  //         textColor: Colors.white,
  //         backgroundColor: HexColor('33BEA3'),
  //         timeInSeconds: 3);
  //
  //     return true;
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     //throw Exception('Failed to load album');
  //     FlutterFlexibleToast.showToast(
  //         message: a['message'].toString(),
  //         toastLength: Toast.LENGTH_LONG,
  //         toastGravity: ToastGravity.BOTTOM,
  //         icon: ICON.ERROR,
  //         radius: 15,
  //         elevation: 5,
  //         imageSize: 20,
  //         textColor: Colors.white,
  //         backgroundColor: HexColor('33BEA3'),
  //         timeInSeconds: 3);
  //     return false;
  //   }
  // }

  Future addStory2(String name, String imagePath, String link, context) async {
    String token = access_token.$;

    // Map data = {
    //   'doctor_id': user_id.$,
    //   'name': name,
    //   'image': imagePat,
    //   "link": link
    // };
    // var body = json.encode(data);

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    String url = AppConfig.BASE_URL + 'stories/create';
    // var headers = Provider.of<AppProvider>(context, listen: false).getHeaders();
    http.Client client = new http.Client();
    File imageFile = new File(imagePath);
    // String fileName = imageFile.path.split("/").last;
    String ext = imageFile.path.split(".").last;
    String fileName = getRandString(7) + "." + ext;

    var stream = new http.ByteStream(imageFile.openRead());
    var length = await imageFile.length();

    var request = new http.MultipartRequest("POST", Uri.parse(url));
    var multipartFile =
        new http.MultipartFile("image", stream, length, filename: fileName);

    request.files.add(multipartFile);
    request.fields['image'] = fileName;
    request.fields['doctor_id'] = user_id.$.toString();
    request.fields['name'] = name;
    request.fields['link'] = "";
    request.headers.addAll(headers);

    // final respond = await request.send();
    var res = await client.send(request);

    if (res.statusCode == 200) {
      http.Response.fromStream(res).then((value) {
        String data = value.body.toString();
        final responsebody = json.decode(data);

        // setState(() {});
      });
      // setState(() {});

      print("Image Uploaded");
      FlutterFlexibleToast.showToast(
          message: "Uploaded Successfully",
          toastLength: Toast.LENGTH_LONG,
          toastGravity: ToastGravity.BOTTOM,
          icon: ICON.SUCCESS,
          radius: 15,
          elevation: 5,
          imageSize: 20,
          textColor: Colors.white,
          backgroundColor: HexColor('33BEA3'),
          timeInSeconds: 3);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => BottomBar2()));
    } else {
      FlutterFlexibleToast.showToast(
          message: 'upload failed',
          toastLength: Toast.LENGTH_LONG,
          toastGravity: ToastGravity.BOTTOM,
          icon: ICON.ERROR,
          radius: 15,
          elevation: 5,
          imageSize: 20,
          textColor: Colors.white,
          backgroundColor: HexColor('33BEA3'),
          timeInSeconds: 3);
      // Utils.showToast("Profile image upload failed", context);
    }
  }

  Future uploadDocument(
      String name, String imagePath, String link, context) async {
    String token = access_token.$;

    // Map data = {
    //   'doctor_id': user_id.$,
    //   'name': name,
    //   'image': imagePat,
    //   "link": link
    // };
    // var body = json.encode(data);

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    String url = AppConfig.BASE_URL + 'stories/create';
    // var headers = Provider.of<AppProvider>(context, listen: false).getHeaders();
    http.Client client = new http.Client();
    File imageFile = new File(imagePath);
    // String fileName = imageFile.path.split("/").last;
    String ext = imageFile.path.split(".").last;
    String fileName = getRandString(7) + "." + ext;

    var stream = new http.ByteStream(imageFile.openRead());
    var length = await imageFile.length();

    var request = new http.MultipartRequest("POST", Uri.parse(url));
    var multipartFile =
        new http.MultipartFile("image", stream, length, filename: fileName);

    request.files.add(multipartFile);
    request.fields['image'] = fileName;
    request.fields['doctor_id'] = user_id.$.toString();
    request.fields['name'] = name;
    request.fields['link'] = "";
    request.headers.addAll(headers);

    // final respond = await request.send();
    var res = await client.send(request);

    if (res.statusCode == 200) {
      http.Response.fromStream(res).then((value) {
        String data = value.body.toString();
        final responsebody = json.decode(data);

        // setState(() {});
      });
      // setState(() {});

      print("Image Uploaded");
      FlutterFlexibleToast.showToast(
          message: "Uploaded Successfully",
          toastLength: Toast.LENGTH_LONG,
          toastGravity: ToastGravity.BOTTOM,
          icon: ICON.SUCCESS,
          radius: 15,
          elevation: 5,
          imageSize: 20,
          textColor: Colors.white,
          backgroundColor: HexColor('33BEA3'),
          timeInSeconds: 3);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => BottomBar2()));
    } else {
      FlutterFlexibleToast.showToast(
          message: 'upload failed',
          toastLength: Toast.LENGTH_LONG,
          toastGravity: ToastGravity.BOTTOM,
          icon: ICON.ERROR,
          radius: 15,
          elevation: 5,
          imageSize: 20,
          textColor: Colors.white,
          backgroundColor: HexColor('33BEA3'),
          timeInSeconds: 3);
      // Utils.showToast("Profile image upload failed", context);
    }
  }

  static String getRandString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  Future<bool> addPrescription(
      {@required String appointment,
      @required String weight,
      @required String bloodpressure,
      @required String pulse,
      @required String temperature,
      @required String problem,
      @required List medicine,
      @required List dosage,
      @required List days,
      @required List time}) async {
    String token = access_token.$;

    Map data = {
      'appointment_id': appointment,
      'weight': weight,
      'blood_pressure': bloodpressure,
      'pulse': pulse,
      'temperature': temperature,
      'problem_description': problem,
      'medicine': medicine,
      'dosage': dosage,
      'days': days,
      'time': time,
    };
    //encode Map to JSON
    var body = json.encode(data);

    final response =
        await http.post(Uri.parse('${AppConfig.BASE_URL}prescription/create'),
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

      print(appointmentids);
      FlutterFlexibleToast.showToast(
          message: a['message'].toString(),
          toastLength: Toast.LENGTH_LONG,
          toastGravity: ToastGravity.BOTTOM,
          icon: ICON.SUCCESS,
          radius: 15,
          elevation: 5,
          imageSize: 20,
          textColor: Colors.white,
          backgroundColor: HexColor('33BEA3'),
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
          backgroundColor: HexColor('33BEA3'),
          timeInSeconds: 3);
      return false;
    }
  }

  Future<bool> addDocuments(
      {@required List document, @required List name}) async {
    String token = access_token.$;

    Map data = {
      'appointment_id': appointmentid.$,
      'document': document,
      'name': name,
    };
    //encode Map to JSON
    var body = json.encode(data);

    final response =
        await http.post(Uri.parse('${AppConfig.BASE_URL}documents/submit'),
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

      print(appointmentids);
      FlutterFlexibleToast.showToast(
          message: a['message'].toString(),
          toastLength: Toast.LENGTH_LONG,
          toastGravity: ToastGravity.BOTTOM,
          icon: ICON.SUCCESS,
          radius: 15,
          elevation: 5,
          imageSize: 20,
          textColor: Colors.white,
          backgroundColor: HexColor('33BEA3'),
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
          backgroundColor: HexColor('33BEA3'),
          timeInSeconds: 3);
      return false;
    }
  }

  Future addDocument2(List name, List document, context) async {
    String token = access_token.$;

    // Map data = {
    //   'doctor_id': user_id.$,
    //   'name': name,
    //   'image': imagePat,
    //   "link": link
    // };
    // var body = json.encode(data);

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    String url = AppConfig.BASE_URL + 'documents/submit';
    // var headers = Provider.of<AppProvider>(context, listen: false).getHeaders();
    http.Client client = new http.Client();
    List<http.MultipartFile> files = [];
    // for (var i = 0; i < document.length; i++) {
    //   File pickFile = new File(document[i]);
    //   // String fileName = imageFile.path.split("/").last;
    //   String ext = pickFile.path.split(".").last;
    //   String fileName = getRandString(7) + "." + ext;
    //   var stream = new http.ByteStream(document[i].openRead());
    //   var length = await document[i].length();
    //   var multipartFile = new http.MultipartFile("document", stream, length,
    //       filename: fileName);
    //   files.add(multipartFile);
    // }

    var request = new http.MultipartRequest("POST", Uri.parse(url));

    // request.files.addAll(files);
    for (var i = 0; i < document.length; i++) {
      File pickFile = new File(document[i]);
      // String fileName = imageFile.path.split("/").last;
      String ext = pickFile.path.split(".").last;
      // String ext1 = ext.split("'")[0];
      String fileName = getRandString(7) + "." + ext;
      print(fileName);
      var stream = new http.ByteStream(pickFile.openRead());
      var length = await pickFile.length();
      var multipartFile = new http.MultipartFile("document[]", stream, length,
          filename: fileName);
      files.add(multipartFile);
      request.files.addAll(files);
      request.fields['document[]'] = fileName;
    }

    for (var i = 0; i < name.length; i++) {
      request.fields['name[]'] = name[i];
    }
    // request.files.addAll(filenames);
    // request.fields['document'] = document;
    request.fields['appointment_id'] = appointmentid.$.toString();
    // request.fields['name'] = name;

    request.headers.addAll(headers);

    // final respond = await request.send();
    var res = await client.send(request);

    if (res.statusCode == 200) {
      http.Response.fromStream(res).then((value) {
        String data = value.body.toString();
        final responsebody = json.decode(data);

        // setState(() {});
      });
      // setState(() {});

      print("Image Uploaded");
      FlutterFlexibleToast.showToast(
          message: "Uploaded Successfully",
          toastLength: Toast.LENGTH_LONG,
          toastGravity: ToastGravity.BOTTOM,
          icon: ICON.SUCCESS,
          radius: 15,
          elevation: 5,
          imageSize: 20,
          textColor: Colors.white,
          backgroundColor: HexColor('33BEA3'),
          timeInSeconds: 3);
    } else {
      FlutterFlexibleToast.showToast(
          message: 'upload failed',
          toastLength: Toast.LENGTH_LONG,
          toastGravity: ToastGravity.BOTTOM,
          icon: ICON.ERROR,
          radius: 15,
          elevation: 5,
          imageSize: 20,
          textColor: Colors.white,
          backgroundColor: HexColor('33BEA3'),
          timeInSeconds: 3);
      // Utils.showToast("Profile image upload failed", context);
    }
  }

  Future<bool> profileEdit(
    int id,
    String name,
    String bloodgroup,
    String dob,
    String email,
    String address,
    String pin,
    String city,
    String state,
    String country,
    String gender,
  ) async {
    String token = access_token.$;

    Map data = {
      'id': id,
      'name': name,
      'blood_group': bloodgroup,
      'dob': dob,
      'email': email,
      'address': address,
      'pin': pin,
      'city': city,
      'state': state,
      'country': country,
      'gender': gender,
    };
    //encode Map to JSON
    var body = json.encode(data);

    final response =
        await http.post(Uri.parse('${AppConfig.BASE_URL}patient/update'),
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

      print(appointmentid.$);
      FlutterFlexibleToast.showToast(
          message: a['message'].toString(),
          toastLength: Toast.LENGTH_LONG,
          toastGravity: ToastGravity.BOTTOM,
          icon: ICON.SUCCESS,
          radius: 15,
          elevation: 5,
          imageSize: 20,
          textColor: Colors.white,
          backgroundColor: HexColor('33BEA3'),
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
          backgroundColor: HexColor('33BEA3'),
          timeInSeconds: 3);
      return false;
    }
  }
}
