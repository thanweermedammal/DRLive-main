import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:active_ecommerce_flutter/ui_sections/bottom_navigation.dart';
import 'package:active_ecommerce_flutter/screens/login_page.dart';
import 'package:http/http.dart' as http;
import 'package:active_ecommerce_flutter/data_handler/user_data.dart';

class Signuppage extends StatefulWidget {
  @override
  SignuppageState createState() => SignuppageState();
}

class SignuppageState extends State<Signuppage> {
  var uname = TextEditingController();
  var pass = TextEditingController();
  var cpass = TextEditingController();
  var phone = TextEditingController();
  int _radioValue1 = 0;
  DateTime chosen = DateTime.now();
  String date = "Date of Birth";
  String gender = "male";

  Future<void> _selectDate() async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: chosen,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != chosen)
      setState(() {
        chosen = picked;
        date = chosen.year.toString() +
            "-" +
            chosen.month.toString() +
            "-" +
            chosen.day.toString();
      });
  }

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
    });

    if (_radioValue1 == 0) {
      setState(() {
        gender = "male";
      });
    }
    if (_radioValue1 == 1) {
      setState(() {
        gender = "female";
      });
    }
    if (_radioValue1 == 3) {
      setState(() {
        gender = "other";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xffaf1281),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              color: Colors.white),
          child: Stack(
            children: [
              Pinned.fromPins(
                Pin(start: 0.0, end: 0.0),
                Pin(start: 0.0, end: -7.0),
                child: Stack(
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
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 30,
                        color: HexColor('33BEA3'),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xffffffff),
                        border: Border.all(width: 1.0, color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(6, 3),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: TextFormField(
                          obscureText: false,
                          controller: uname,
                          decoration: InputDecoration(
                            hintText: 'Name',
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xffffffff),
                        border: Border.all(width: 1.0, color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
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
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        _selectDate();
                      },
                      child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: const Color(0xffffffff),
                            border: Border.all(width: 1.0, color: Colors.grey),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(6, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 15, bottom: 15, top: 10, right: 15),
                            child: Row(
                              children: [
                                Text(
                                  date,
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 15,
                                    color: const Color(0xff858585),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          'Gender',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 15,
                            color: const Color(0xff858585),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: HexColor('33BEA3'),
                          value: 0,
                          groupValue: _radioValue1,
                          onChanged: _handleRadioValueChange1,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _radioValue1 = 0;
                            });
                          },
                          child: Text(
                            "Male",
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                //height: 1.6,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Radio(
                          activeColor: HexColor('33BEA3'),
                          value: 1,
                          groupValue: _radioValue1,
                          onChanged: _handleRadioValueChange1,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _radioValue1 = 1;
                            });
                          },
                          child: Text(
                            "Female",
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                //height: 1.6,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Radio(
                          activeColor: HexColor('33BEA3'),
                          value: 2,
                          groupValue: _radioValue1,
                          onChanged: _handleRadioValueChange1,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _radioValue1 = 2;
                            });
                          },
                          child: Text(
                            "Other",
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                //height: 1.6,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                        border: Border.all(width: 1.0, color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(6, 3),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: TextFormField(
                          obscureText: true,
                          controller: pass,
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                        border: Border.all(width: 1.0, color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(6, 3),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: TextFormField(
                          obscureText: false,
                          controller: cpass,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
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
                    SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (uname.text.isNotEmpty &&
                            pass.text.isNotEmpty &&
                            phone.text.isNotEmpty &&
                            cpass.text == pass.text) {
                          UserData()
                              .register(uname.text, phone.text, pass.text, date,
                                  gender)
                              .then((value) => {
                                    if (value)
                                      {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        BottomBar())),
                                      }
                                  });
                        } else {
                          print("Enter values");
                        }
                      },
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: HexColor('33BEA3'),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(6, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 15,
                        color: const Color(0xff000000),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    PageLink(
                      links: [
                        PageLinkInfo(
                          ease: Curves.easeOut,
                          duration: 1.0,
                          pageBuilder: () => Loginpage(),
                        ),
                      ],
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 15,
                          color: const Color(0xff6b0772),
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const String _svg_tlyarf =
    '<svg viewBox="-289.8 -154.5 953.7 915.9" ><defs><filter id="shadow"><feDropShadow dx="5" dy="3" stdDeviation="6"/></filter></defs><path transform="matrix(-0.642788, -0.766044, 0.766044, -0.642788, 115.06, 853.05)" d="M 333.5 0 C 517.6869506835938 0 629.7987670898438 157.9783477783203 629.7987670898438 336.3663940429688 C 629.7987670898438 514.7542724609375 453.0309753417969 816.9459228515625 268.8439025878906 816.9459228515625 C 84.65691375732422 816.9459228515625 123.0023498535156 597.0936889648438 123.0023498535156 418.7051696777344 C 123.0023498535156 240.3173980712891 149.3130493164062 0 333.5 0 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>';
