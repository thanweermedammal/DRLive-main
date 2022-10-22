import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:active_ecommerce_flutter/screens/login_page.dart';
import 'package:active_ecommerce_flutter/screens/patientScreens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'doctorScreens/doctorlogin_screen.dart';

class ChoosePage extends StatelessWidget {
  const ChoosePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/Rectangle 1.png',
                // height: 200,
                // width: 200,
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('choose', 'doctor');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DocLoginpage()));
                },
                child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor('33BEA3'),
                    ),
                    child: Center(
                      child: Text(
                        "Doctor",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('choose', 'patient');

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor('33BEA3'),
                    ),
                    child: Center(
                        child: Text(
                      "Patient",
                      style: TextStyle(color: Colors.white),
                    ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
