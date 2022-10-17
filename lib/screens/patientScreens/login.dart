// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:active_ecommerce_flutter/ui_sections/bottom_navigation.dart';
//
// enum MobileVerificationState { SHOW_MOBILE_FORM_STATE, SHOW_OTP_FORM_STATE }
//
// class Login extends StatefulWidget {
//   Login({Key key}) : super(key: key);
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   TextEditingController countrycode = TextEditingController();
//   TextEditingController otpController = TextEditingController();
//   final currentState = MobileVerificationState.SHOW_MOBILE_FORM_STATE;
//
//   var phone = '';
//   @override
//   void initState() {
//     // TODO: implement initState
//     countrycode.text = "+91";
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
//           ? SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Image.asset(
//                     'assets/images/Rectangle 1.png',
//                     // height: 200,
//                     // width: 200,
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     height: 55,
//                     decoration: BoxDecoration(
//                         border: Border.all(width: 1, color: Colors.grey),
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 10,
//                         ),
//                         SizedBox(
//                           width: 40,
//                           child: TextField(
//                             controller: countrycode,
//                             decoration:
//                                 InputDecoration(border: InputBorder.none),
//                           ),
//                         ),
//                         Text(
//                           "|",
//                           style: TextStyle(fontSize: 33, color: Colors.grey),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Expanded(
//                           child: TextField(
//                             onChanged: (value) {
//                               phone = value;
//                             },
//                             decoration: InputDecoration(
//                                 border: InputBorder.none, hintText: "Phone"),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                     height: 45,
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         await FirebaseAuth.instance.verifyPhoneNumber(
//                           phoneNumber: phone,
//                           verificationCompleted: (phoneAuthCredential) async {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => BottomBar()));
//                           },
//                           verificationFailed: (verificationFailed) async {},
//                           // codeSent: (verificationId, resendingToken) async {},
//                           codeAutoRetrievalTimeout: (String verificationId) {},
//                         );
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             )
//           : Column(
//               children: [
//                 Container(
//                   height: 55,
//                   decoration: BoxDecoration(
//                       border: Border.all(width: 1, color: Colors.grey),
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(
//                         child: TextField(
//                           controller: otpController,
//                           decoration: InputDecoration(
//                               border: InputBorder.none, hintText: "Otp"),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                   height: 45,
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () async {},
//                   ),
//                 )
//               ],
//             ),
//     );
//   }
// }
