// import 'package:flutter/material.dart';
// import 'package:adobe_xd/pinned.dart';
// import 'package:adobe_xd/page_link.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:active_ecommerce_flutter/models/doctor_list.dart';
// import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'package:active_ecommerce_flutter/models/banners.dart';
// import 'package:active_ecommerce_flutter/app_config.dart';
// import 'dart:convert';
//
// class Leave3 extends StatefulWidget {
//   Leave3({
//     Key key,
//     this.is_base_category,
//   }) : super(key: key);
//
//   final bool is_base_category;
//
//   @override
//   DoctorsListState createState() => DoctorsListState();
// }
//
// class DoctorsListState extends State<Leave3> {
//   List<String> type = [];
//
//   fetchTypes() async {
//     String token = access_token.value;
//     final response =
//         await http.get('${AppC