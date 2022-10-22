import 'package:active_ecommerce_flutter/data_handler/user_data.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/ui_sections/bottom_navigation.dart';
import 'package:flutter_flexible_toast/flutter_flexible_toast.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController otpController = TextEditingController();

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
  static String verify = '';
  static var phone = '';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController countrycode = TextEditingController();

  // final currentState = MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  // var phone = '';
  @override
  void initState() {
    // TODO: implement initState
    countrycode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/Rectangle 1.png',
              // height: 200,
              // width: 200,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 40,
                    child: TextField(
                      controller: countrycode,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  Text(
                    "|",
                    style: TextStyle(fontSize: 33, color: Colors.grey),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        Login.phone = value;
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Phone"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: HexColor('33BEA3')),
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: "${countrycode.text + Login.phone}",
                    verificationCompleted: (phoneAuthCredential) async {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => BottomBar()));
                    },
                    verificationFailed: (verificationFailed) async {},
                    codeSent: (verificationId, resendingToken) {
                      Login.verify = verificationId;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OtpSection()));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                },
                child: Text("Send Otp"),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class OtpSection extends StatefulWidget {
  const OtpSection({Key key}) : super(key: key);

  @override
  State<OtpSection> createState() => _OtpSectionState();
}

class _OtpSectionState extends State<OtpSection> {
  var code = '';
  String passw = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Rectangle 1.png',
                // height: 200,
                // width: 200,
              ),
              SizedBox(
                height: 20,
              ),
              Pinput(
                length: 6,
                showCursor: true,
                onChanged: (value) {
                  code = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: HexColor('33BEA3')),
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: Login.verify, smsCode: code);
                      await FirebaseAuth.instance
                          .signInWithCredential(credential);
                      UserData()
                          .authenticateUser(Login.phone, passw)
                          .then((value) => {
                                FlutterFlexibleToast.showToast(
                                    message: " Login Success",
                                    toastLength: Toast.LENGTH_LONG,
                                    toastGravity: ToastGravity.BOTTOM,
                                    icon: ICON.SUCCESS,
                                    radius: 15,
                                    elevation: 5,
                                    imageSize: 20,
                                    textColor: Colors.white,
                                    backgroundColor: HexColor('33BEA3'),
                                    timeInSeconds: 3)
                              });
                      prefs.setString('number', Login.phone);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => BottomBar()),
                          (route) => false);
                    } catch (e) {
                      print("wrong Otp");
                      FlutterFlexibleToast.showToast(
                          message: " Wrog Otp",
                          toastLength: Toast.LENGTH_LONG,
                          toastGravity: ToastGravity.BOTTOM,
                          icon: ICON.ERROR,
                          radius: 15,
                          elevation: 5,
                          imageSize: 20,
                          textColor: Colors.white,
                          backgroundColor: HexColor('33BEA3'),
                          timeInSeconds: 3);
                    }
                  },
                  child: Text('Verify'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
