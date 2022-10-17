// import 'package:flutter/material.dart';
// import 'package:active_ecommerce_flutter/my_theme.dart';
// import 'dart:io';
// import 'dart:convert';
//
// import 'package:active_ecommerce_flutter/screens/doctorScreens/doctor_login_details.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter/cupertino.dart';
//
// class DoctorNotification extends StatefulWidget {
//   @override
//   DoctorNotificationState createState() => DoctorNotificationState();
// }
//
// class DoctorNotificationState extends State<DoctorNotification> {
//   ScrollController _mainScrollController = ScrollController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: buildAppBar(context),
//       body: buildBody(context),
//     );
//   }
//
//   AppBar buildAppBar(BuildContext context) {
//     return AppBar(
//       centerTitle: true,
//       leading: Builder(
//         builder: (context) => IconButton(
//           icon: Icon(Icons.arrow_back, color: MyTheme.dark_grey),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       title: Text(
//         "Notification",
//         style: TextStyle(fontSize: 22, color: Colors.black),
//       ),
//       elevation: 0.0,
//       titleSpacing: 0,
//     );
//   }
//
//   buildBody(context) {
//     // if (is_logged_in.value == false) {
//     //   return Container(
//     //       height: 100,
//     //       child: Center(
//     //           child: Text(
//     //             "Please log in to see the profile",
//     //             style: TextStyle(color: MyTheme.font_grey),
//     //           )));
//     // } else {
//     return CustomScrollView(
//       controller: _mainScrollController,
//       physics:
//           const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
//       slivers: [
//         SliverList(
//           delegate: SliverChildListDelegate([
//             Padding(
//               padding: const EdgeInsets.only(top: 10.0, left: 20, bottom: 15),
//               child: Text(
//                 "New",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//             ),
//             buildNotificationList(),
//           ]),
//         )
//       ],
//     );
//     //}
//   }
//
//   buildNotificationList() {
//     return Column(
//       children: [
//         ListTile(
//           leading: GestureDetector(
//             onTap: () {
//               // Navigator.push(context, MaterialPageRoute(builder: (context) {
//               //   return DoctorProfile();
//               // }));
//             },
//             child: Padding(
//               padding: EdgeInsets.all(0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(50)),
//                 child: Container(
//                   height: 50,
//                   width: 50,
//                   child: Image.asset(
//                     'assets/placeholder.png',
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           title: Text(
//             "200 credited into your account",
//             style: TextStyle(
//                 fontSize: 16, fontWeight: FontWeight.w300, color: Colors.grey),
//           ),
//           trailing: Text(
//             "See all",
//             style: TextStyle(
//                 fontSize: 16, fontWeight: FontWeight.bold, color: Colors.cyan[800]),
//           )
//         )
//       ],
//     );
//   }
// }
