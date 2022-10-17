import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:active_ecommerce_flutter/custom/input_decorations.dart';
import 'dart:io';
import 'package:active_ecommerce_flutter/ui_sections/doctor_drawer.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/cupertino.dart';
import 'package:active_ecommerce_flutter/data_handler/user_data.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class DoctorProfileEdit extends StatefulWidget {
  DoctorProfileEdit(
      {Key key, this.is_base_category = false, this.is_top_category = false})
      : super(key: key);

  final bool is_base_category;
  final bool is_top_category;

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<DoctorProfileEdit> {
  ScrollController _mainScrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _nameController =
      TextEditingController(text: "${user_name.$ ?? ""}");
  TextEditingController _phoneController =
      TextEditingController(text: "${user_phone.$ ?? ""}");
  TextEditingController _dobController =
      TextEditingController(text: "${user_dob.$ ?? ""}");
  TextEditingController _addressController =
      TextEditingController(text: "${user_address.$ ?? ""}");
  TextEditingController _bloodController =
      TextEditingController(text: "${user_blood.$ ?? ""}");
  TextEditingController _emailController =
      TextEditingController(text: "${user_email.$ ?? ""}");

  int _radioValue1 = 0;

  getGender() {
    if (user_gender.$ == "male") {
      setState(() {
        _radioValue1 = 0;
      });
    }
    if (user_gender.$ == "female") {
      setState(() {
        _radioValue1 = 1;
      });
    }
    if (user_gender.$ == "other") {
      setState(() {
        _radioValue1 = 2;
      });
    }
  }

  @override
  void initState() {
    getGender();
    super.initState();
  }

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  Future<void> _onPageRefresh() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DoctorDrawer(),
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 90,
      backgroundColor: Colors.white,
      flexibleSpace: Container(
        // height: 120,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
          ),
          color: HexColor('33BEA3'),
          boxShadow: [
            BoxShadow(
              color: const Color(0x29000000),
              offset: Offset(6, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                  child: widget.is_base_category
                      ? Builder(
                          builder: (context) => Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 25.0, horizontal: 25.0),
                            child: Container(
                                height: 30,
                                width: 30,
                                //color: Colors.white,
                                child: Stack(
                                  children: <Widget>[
                                    Pinned.fromPins(
                                      Pin(size: 12.0, start: 0.0),
                                      Pin(size: 12.0, start: 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(2.0),
                                            topRight: Radius.circular(2.0),
                                            bottomLeft: Radius.circular(2.0),
                                          ),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Pinned.fromPins(
                                      Pin(size: 12.0, end: 0.0),
                                      Pin(size: 12.0, start: 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(2.0),
                                            topRight: Radius.circular(2.0),
                                            bottomRight: Radius.circular(2.0),
                                          ),
                                          border: Border.all(
                                            width: 1.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Pinned.fromPins(
                                      Pin(size: 12.0, start: 0.0),
                                      Pin(size: 12.0, end: 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(2.0),
                                            bottomRight: Radius.circular(2.0),
                                            bottomLeft: Radius.circular(2.0),
                                          ),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Pinned.fromPins(
                                      Pin(size: 12.0, end: 0.0),
                                      Pin(size: 12.0, end: 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(2.0),
                                            bottomRight: Radius.circular(2.0),
                                            bottomLeft: Radius.circular(2.0),
                                          ),
                                          border: Border.all(
                                            width: 1.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        )
                      : Builder(
                          builder: (context) => IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                ),
                Text(
                  'Profile',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 24,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ],
        ),
      ),
      automaticallyImplyLeading: false,
      elevation: 0.0,
      titleSpacing: 0,
    );
  }

  buildBody(context) {
    ///changed
    if (is_logged_in.$ == false) {
      return Container(
          height: 100,
          child: Center(
              child: Text(
            "Please log in to see the profile",
            style: TextStyle(color: MyTheme.font_grey),
          )));
    } else {
      return RefreshIndicator(
        color: MyTheme.accent_color,
        backgroundColor: Colors.white,
        onRefresh: _onPageRefresh,
        displacement: 10,
        child: CustomScrollView(
          controller: _mainScrollController,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([buildProfileForm(context)]),
            )
          ],
        ),
      );
    }
  }

  buildProfileForm(context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 10.0, bottom: 8.0, left: 16.0, right: 16.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    color: const Color(0xfff3c306),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x29000000),
                        offset: Offset(6, 3),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Container(
                      height: 80,
                      width: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/images/lady2.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Doctor Name',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 15,
                  color: HexColor('33BEA3'),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                height: 40,
                child: TextField(
                  controller: _nameController,
                  autofocus: false,
                  decoration: InputDecorations.buildInputDecoration_1(
                      hint_text: "Name"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Address',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 15,
                  color: HexColor('33BEA3'),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                height: 40,
                child: TextField(
                  controller: _addressController,
                  autofocus: false,
                  decoration: InputDecorations.buildInputDecoration_1(
                      hint_text: "Addres"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Qualification',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 15,
                  color: HexColor('33BEA3'),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Card(
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: DropdownButton<String>(
                  isExpanded: true,
                  isDense: true,
                  items: <String>['MBBS', 'MD', 'BDS'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Gender",
                  style: TextStyle(fontSize: 15, color: HexColor('33BEA3'))),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Mobile",
                  style: TextStyle(fontSize: 15, color: HexColor('33BEA3'))),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                height: 40,
                child: TextField(
                  controller: _phoneController,
                  autofocus: false,
                  decoration: InputDecorations.buildInputDecoration_1(
                      hint_text: "Mobile Number"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("E mail",
                  style: TextStyle(fontSize: 15, color: HexColor('33BEA3'))),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                height: 40,
                child: TextField(
                  controller: _emailController,
                  autofocus: false,
                  decoration: InputDecorations.buildInputDecoration_1(
                      hint_text: "E mail Address"),
                ),
              ),
            ),
            Row(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("City",
                                style: TextStyle(
                                    fontSize: 15, color: HexColor('33BEA3'))),
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.5 - 28,
                        child: TextField(
                          //  controller: _nameController,
                          autofocus: false,
                          decoration: InputDecorations.buildInputDecoration_1(
                              hint_text: "City"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Pin",
                                style: TextStyle(
                                    fontSize: 15, color: HexColor('33BEA3'))),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5 - 28,
                        height: 40,
                        child: TextField(
                          // controller: _nameController,
                          autofocus: false,
                          decoration: InputDecorations.buildInputDecoration_1(
                            hint_text: "Pin",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Department",
                  style: TextStyle(fontSize: 15, color: HexColor('33BEA3'))),
            ),
            Card(
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: DropdownButton<String>(
                  isExpanded: true,
                  isDense: true,
                  items: <String>[
                    'Cardiothoracic Surgeon',
                    'Cardiothoracic Surgeon',
                    'Cardiothoracic Surgeon'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      UserData().updateProfile(
                          _nameController.text.toString(),
                          _bloodController.text.toString(),
                          _emailController.text.toString());
                    },
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: HexColor('33BEA3'),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(6, 3),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 20,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: HexColor('33BEA3'),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(6, 3),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 20,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
