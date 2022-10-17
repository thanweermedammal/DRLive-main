import 'package:active_ecommerce_flutter/ui_sections/bottom_navigation_doctor.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:active_ecommerce_flutter/ui_sections/bottom_navigation.dart';
import 'package:active_ecommerce_flutter/screens/signuppage.dart';
import 'package:active_ecommerce_flutter/data_handler/user_data.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:flutter_flexible_toast/flutter_flexible_toast.dart';

class Loginpage extends StatefulWidget {
  @override
  LoginpageState createState() => LoginpageState();
}

class LoginpageState extends State<Loginpage> {
  var passw = TextEditingController();
  var phone = TextEditingController();

  login() {
    UserData().authenticateUser(phone.text, passw.text).then((value) => {
          if (value)
            {
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
                  timeInSeconds: 3),
              if (role.$ == "patient")
                {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => BottomBar())),
                }
              else
                {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => BottomBar2())),
                }
            }
          else
            {
              FlutterFlexibleToast.showToast(
                  message: " No user found",
                  toastLength: Toast.LENGTH_LONG,
                  toastGravity: ToastGravity.BOTTOM,
                  icon: ICON.ERROR,
                  radius: 15,
                  elevation: 5,
                  imageSize: 20,
                  textColor: Colors.white,
                  backgroundColor: HexColor('33BEA3'),
                  timeInSeconds: 3)
            }
        });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),

              ),
          child: Center(
            child: Container(
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              //color: const Color(0xffffffff),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff707070)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Pinned.fromPins(Pin(size: 200.0, middle: 0.4996),
                        Pin(size: 400.0, middle: 0),
                        child: Image.asset(
                          'assets/images/Rectangle 1.png',
                        )),
                    Pinned.fromPins(
                      Pin(size: 125.0, middle: 0.4213),
                      Pin(size: 37.0, middle: 0.4989),
                      child: PageLink(
                        links: [
                          // PageLinkInfo(
                          //   ease: Curves.easeOut,
                          //   duration: 1.0,
                          //   pageBuilder: () => BottomBar(),
                          // ),
                        ],
                        child: GestureDetector(
                          onTap: () {
                            if (phone.text.isEmpty) {
                              FlutterFlexibleToast.showToast(
                                  message: " Please enter Phone number",
                                  toastLength: Toast.LENGTH_LONG,
                                  toastGravity: ToastGravity.BOTTOM,
                                  icon: ICON.ERROR,
                                  radius: 15,
                                  elevation: 5,
                                  imageSize: 20,
                                  textColor: Colors.white,
                                  backgroundColor: Color(0x29000000),
                                  timeInSeconds: 3);
                            }
                            login();
                            // if (passw.text.isEmpty) {
                            //   FlutterFlexibleToast.showToast(
                            //       message: " Please enter password",
                            //       toastLength: Toast.LENGTH_LONG,
                            //       toastGravity: ToastGravity.BOTTOM,
                            //       icon: ICON.ERROR,
                            //       radius: 15,
                            //       elevation: 5,
                            //       imageSize: 20,
                            //       textColor: Colors.white,
                            //       backgroundColor: Color(0x29000000),
                            //       timeInSeconds: 3);
                            // }
                            // if (passw.text.isNotEmpty &&
                            //     phone.text.isNotEmpty) {
                            //   login();
                            // } else {
                            //   FlutterFlexibleToast.showToast(
                            //       message: " Please enter values",
                            //       toastLength: Toast.LENGTH_LONG,
                            //       toastGravity: ToastGravity.BOTTOM,
                            //       icon: ICON.ERROR,
                            //       radius: 15,
                            //       elevation: 5,
                            //       imageSize: 20,
                            //       textColor: Colors.white,
                            //       backgroundColor: Color(0x29000000),
                            //       timeInSeconds: 3);
                            //   print("Enter values");
                            //   print(username.$);
                            // }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: HexColor('33BEA3'),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(6, 3),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 268.0, start: 60.0),
                      Pin(size: 37.0, middle: 0.3200),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: const Color(0xffffffff),
                          border: Border.all(
                              width: 1.0, color: const Color(0x29000000)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(6, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: TextFormField(
                            obscureText: false,
                            controller: phone,
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 15,
                                color: const Color(0xff858585),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 15, top: 15, right: 15),
                              filled: false,
                              isDense: false,
                            )),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 268.0, start: 60.0),
                      Pin(size: 37.0, middle: 0.39),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                          border: Border.all(
                              width: 1.0, color: const Color(0x29000000)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(6, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: TextFormField(
                            obscureText: true,
                            controller: passw,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 15,
                                color: const Color(0xff858585),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 15, top: 15, right: 15),
                              filled: false,
                              isDense: false,
                            )),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 39.0, middle: 0.4444),
                      Pin(size: 17.0, middle: 0.4997),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 54.0, middle: 0.4641),
                      Pin(size: 17.0, middle: 0.5814),
                      child: PageLink(
                        links: [
                          PageLinkInfo(
                            ease: Curves.easeOut,
                            duration: 1.0,
                            pageBuilder: () => Signuppage(),
                          ),
                        ],
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 15,
                            color: const Color(0xff6b0772),
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 158.0, middle: 0.4455),
                      Pin(size: 17.0, middle: 0.5532),
                      child: Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 15,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 122.0, middle: 0.7521),
                      Pin(size: 17.0, middle: 0.45),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 15,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 158.0, middle: 0.9455),
                      Pin(size: 17.0, middle: 0.6532),
                      child: PageLink(
                        links: [
                          PageLinkInfo(
                            ease: Curves.easeOut,
                            duration: 1.0,
                            pageBuilder: () => BottomBar(),
                          ),
                        ],
                        child: Text(
                          'Skip Login',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 15,
                            color: Color(0xff6b0772),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const String _svg_tlyarf =
    '<svg viewBox="-289.8 -154.5 953.7 915.9" ><defs><filter id="shadow"><feDropShadow dx="5" dy="3" stdDeviation="6"/></filter></defs><path transform="matrix(-0.642788, -0.766044, 0.766044, -0.642788, 115.06, 853.05)" d="M 333.5 0 C 517.6869506835938 0 629.7987670898438 157.9783477783203 629.7987670898438 336.3663940429688 C 629.7987670898438 514.7542724609375 453.0309753417969 816.9459228515625 268.8439025878906 816.9459228515625 C 84.65691375732422 816.9459228515625 123.0023498535156 597.0936889648438 123.0023498535156 418.7051696777344 C 123.0023498535156 240.3173980712891 149.3130493164062 0 333.5 0 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>';
