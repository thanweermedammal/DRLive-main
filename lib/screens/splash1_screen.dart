import 'dart:async';

import 'package:active_ecommerce_flutter/data_handler/user_data.dart';
import 'package:active_ecommerce_flutter/screens/choose_page.dart';
import 'package:active_ecommerce_flutter/ui_sections/bottom_navigation.dart';
import 'package:active_ecommerce_flutter/ui_sections/bottom_navigation_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash1Screen extends StatefulWidget {
  const Splash1Screen({Key key}) : super(key: key);

  @override
  State<Splash1Screen> createState() => _Splash1ScreenState();
}

class _Splash1ScreenState extends State<Splash1Screen> {
  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(
      duration,
      checkFirstSeen,
    );
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('email') != null && prefs.getString('email') != '') {
      print(prefs.getString('email'));
      print(prefs.getString('pass'));
      UserData()
          .authenticateDoc(prefs.getString('email'), prefs.getString('pass'))
          .then((value) => {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => BottomBar2()),
                    (route) => false)
              });
    } else if (prefs.getString('number') != null &&
        prefs.getString('number') != '') {
      UserData()
          .authenticateUser(prefs.getString('number'), '')
          .then((value) => {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => BottomBar()),
                    (route) => false)
              });
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ChoosePage()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("001F2C"),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: HexColor("001F2C"),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/Rectangle 1.png',
            height: 500,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
