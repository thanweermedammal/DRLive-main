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
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DocLoginpage extends StatefulWidget {
  @override
  DocLoginpageState createState() => DocLoginpageState();
}

class DocLoginpageState extends State<DocLoginpage> {
  var passw = TextEditingController();
  var phone = TextEditingController();
  bool _passwordVisible = false;

  // late CustomTheme customTheme;
  // late ThemeData theme;

//   @override
//   void initState() {
//     super.initState();
//     // customTheme = AppTheme.customTheme;
//     // theme = AppTheme.theme;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ListView(
//       padding: EdgeInsets.all(0),
//       children: <Widget>[
//         Container(
//           height: MediaQuery.of(context).size.height * 3 / 10,
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 decoration: BoxDecoration(
//                     color: Colors.grey,
//                     borderRadius:
//                         BorderRadius.only(bottomLeft: Radius.circular(96))),
//               ),
//               Positioned(
//                 top: 30,
//                 left: 10,
//                 child: BackButton(
//                   color: Colors.grey,
//                   onPressed: () => Navigator.of(context).pop(),
//                 ),
//               ),
//               Positioned(
//                 bottom: 20,
//                 right: 40,
//                 child: Text("LOGIN",style: TextStyle(fontWeight: FontWeight.w600), ),
//               )
//             ],
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//           child: Container(
//             padding: EdgeInsets.only(top: 12, left: 20, right: 20, bottom: 12),
//             child: Column(
//               children: <Widget>[
//                 TextFormField(
//                   style: TextStyle(
//                       letterSpacing: 0.1,
//                       color: Colors.grey,
//                       fontWeight: FontWeight.w500),
//                   decoration: InputDecoration(
//                     hintText: "Email",
//                     hintStyle: TextStyle(
//                         letterSpacing: 0.1,
//                         color: Colors.grey,
//                         fontWeight: FontWeight.w500),
//                     prefixIcon: Icon(Icons.email_outlined),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 20),
//                   child: TextFormField(
//                     style: TextStyle(
//                         letterSpacing: 0.1,
//                         color: Colors.grey,
//                         fontWeight: FontWeight.w500),
//                     decoration: InputDecoration(
//                       hintText: "Password",
//                       hintStyle: TextStyle(
//                           letterSpacing: 0.1,
//                           color: Colors.grey,
//                           fontWeight: FontWeight.w500),
//                       prefixIcon: Icon(Icons.lock_outline),
//                       suffixIcon: IconButton(
//                         icon: Icon(_passwordVisible
//                             ? Icons.remove_red_eye_outlined
//                             : Icons.remove_red_eye_sharp),
//                         onPressed: () {
//                           setState(() {
//                             _passwordVisible = _passwordVisible;
//                           });
//                         },
//                       ),
//                     ),
//                     obscureText: _passwordVisible,
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 20),
//                   alignment: Alignment.centerRight,
//                   child: FxText.caption("Forgot Password ?", fontWeight: 500),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 20),
//                   child: Button(
//                       elevation: 0,
//                       borderRadiusAll: 4,
//                       onPressed: () {},
//                       child: FxText.button("LOGIN",
//                           fontWeight: 600,
//                           color: theme.colorScheme.onPrimary,
//                           letterSpacing: 0.5)),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     ));
//   }
// }

  login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    UserData().authenticateDoc(phone.text, passw.text).then((value) => {
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
              prefs.setString('email', phone.text),
              prefs.setString('pass', passw.text),
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => BottomBar2())),
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
                    Pinned.fromPins(Pin(size: 400.0, middle: 0.4996),
                        Pin(size: 390.0, middle: 0),
                        child: Image.asset(
                          'assets/images/Rectangle 1.png',
                        )),
                    Pinned.fromPins(
                      Pin(size: 139.0, middle: 0.5),
                      Pin(size: 30.0, middle: 0.374),
                      child: Text(
                        'Doctor Login',
                        style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 157.0, middle: 0.5),
                      Pin(size: 43.0, middle: 0.6489),
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
                            if (passw.text.isEmpty) {
                              FlutterFlexibleToast.showToast(
                                  message: " Please enter password",
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
                            if (passw.text.isNotEmpty &&
                                phone.text.isNotEmpty) {
                              login();
                            } else {
                              FlutterFlexibleToast.showToast(
                                  message: " Please enter values",
                                  toastLength: Toast.LENGTH_LONG,
                                  toastGravity: ToastGravity.BOTTOM,
                                  icon: ICON.ERROR,
                                  radius: 15,
                                  elevation: 5,
                                  imageSize: 20,
                                  textColor: Colors.white,
                                  backgroundColor: Color(0x29000000),
                                  timeInSeconds: 3);
                              print("Enter values");
                              print(username.$);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: HexColor('33BEA3'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 268.0, start: 63.0),
                      Pin(size: 43.0, middle: 0.4600),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0xffffffff),
                          border: Border.all(
                              width: 1.0, color: const Color(0x29000000)),
                        ),
                        child: TextFormField(
                            obscureText: false,
                            controller: phone,
                            decoration: InputDecoration(
                              hintText: 'Email',
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
                      Pin(size: 268.0, start: 63.0),
                      Pin(size: 43.0, middle: 0.53),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          border: Border.all(
                              width: 1.0, color: const Color(0x29000000)),
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
                      Pin(size: 50.0, middle: 0.4944),
                      Pin(size: 17.0, middle: 0.644),
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
