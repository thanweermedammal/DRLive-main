import 'package:active_ecommerce_flutter/screens/doctorScreens/doctor_notification.dart';
import 'package:active_ecommerce_flutter/screens/doctorScreens/doctor_wallet.dart';
import 'package:active_ecommerce_flutter/screens/new_doctor_screens/all_chat_list.dart';
import 'package:active_ecommerce_flutter/screens/new_doctor_screens/doctorprscriptionscreen.dart';
import 'package:active_ecommerce_flutter/screens/new_doctor_screens/wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:active_ecommerce_flutter/screens/new_doctor_screens/Profile1.dart';
import 'package:active_ecommerce_flutter/screens/new_doctor_screens/doctor_appointments.dart';
import 'package:active_ecommerce_flutter/screens/new_doctor_screens/Home1.dart';
import 'package:active_ecommerce_flutter/screens/patientScreens/ChatRoom.dart';
import 'package:active_ecommerce_flutter/screens/patientScreens/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
// import 'package:custom_horizontal_calendar/custom_horizontal_calendar.dart';
// import 'package:custom_horizontal_calendar/date_row.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:active_ecommerce_flutter/Message.dart';
import 'package:active_ecommerce_flutter/models/doctor_list.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:active_ecommerce_flutter/data_handler/doctors_data_fetch.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:active_ecommerce_flutter/app_config.dart';

class BottomBar2 extends StatefulWidget {
  @override
  BottomBar2State createState() => BottomBar2State();
}

class BottomBar2State extends State<BottomBar2> {
  int pageIndex = 0;
  final pages = [
    Home1(),
    PatientsList(
      is_base_category: true,
    ),
    DoctorPrescriptionScreen(
      is_base_category: true,
    ),
    wallet(
      is_base_category: true,
    )
    // DoctorProfileEdit(
    //   is_base_category: true,
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                pageIndex = 0;
              });
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 25,
                      width: 25,
                      child: ImageIcon(
                        AssetImage('assets/images/Home.png'),
                        color:
                            pageIndex == 0 ? HexColor('33BEA3') : Colors.grey,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      'Home',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 10,
                        color:
                            pageIndex == 0 ? HexColor('33BEA3') : Colors.grey,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ),
          ),
          // Adobe XD layer: 'surface1' (group)
          GestureDetector(
            onTap: () {
              setState(() {
                pageIndex = 1;
              });
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    child: ImageIcon(
                      AssetImage('assets/images/Calendar.png'),
                      color: pageIndex == 1 ? HexColor('33BEA3') : Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      'Appointment',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 10,
                        color:
                            pageIndex == 1 ? HexColor('33BEA3') : Colors.grey,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                pageIndex = 2;
              });
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    child: Pinned.fromPins(
                      Pin(start: 0.0, end: 0.0),
                      Pin(start: 0.0, end: 0.0),
                      child: ImageIcon(
                        AssetImage('assets/images/Edit-Square.png'),
                        color:
                            pageIndex == 2 ? HexColor('33BEA3') : Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      'Prescription',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 10,
                        color:
                            pageIndex == 2 ? HexColor('33BEA3') : Colors.grey,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                pageIndex = 3;
              });
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    child: ImageIcon(
                      AssetImage('assets/images/Wallet.png'),
                      color: pageIndex == 3 ? HexColor('33BEA3') : Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      'Wallet',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 10,
                        color:
                            pageIndex == 3 ? HexColor('33BEA3') : Colors.grey,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
