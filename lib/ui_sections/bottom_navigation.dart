import 'package:active_ecommerce_flutter/screens/patientScreens/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:active_ecommerce_flutter/screens/patientScreens/profile_edit.dart';
import 'package:active_ecommerce_flutter/screens/patientScreens/home.dart';
import '../screens/patientScreens/AppointmentHistory1.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  BottomBarState createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  int pageIndex = 0;

  final pages = [
    Home(),
    AppointmentHistory1(
      is_base_category: false,
    ),
    PatientNotification(
      is_base_category: true,
    ),
    ProfileEdit(
      is_base_category: true,
    ),
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
        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(20),
        //   topRight: Radius.circular(20),
        // ),
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
                      color: pageIndex == 0 ? HexColor('33BEA3') : Colors.grey,
                    ),
                  ),
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
                    child: ImageIcon(
                      AssetImage('assets/images/Notification.png'),
                      color: pageIndex == 2 ? HexColor('33BEA3') : Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      'Notifications',
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
                      AssetImage('assets/images/Profile.png'),
                      color: pageIndex == 3 ? HexColor('33BEA3') : Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      'Profile',
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
