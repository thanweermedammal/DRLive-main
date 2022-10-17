import 'package:flutter/material.dart';
import 'package:flutter_flexible_toast/flutter_flexible_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:http/http.dart' as http;
import 'package:active_ecommerce_flutter/app_config.dart';
import 'dart:convert';

class Leave3 extends StatefulWidget {
  Leave3({
    Key key,
    this.is_base_category,
  }) : super(key: key);

  final bool is_base_category;

  @override
  DoctorsListState createState() => DoctorsListState();
}

class DoctorsListState extends State<Leave3> {
  String days = "0";
  List<String> _locations = ['']; // Option 2
  String _selectedLocation = "";
  TextEditingController reason = TextEditingController();

  String from = DateTime.now().year.toString() +
      "-" +
      DateTime.now().month.toString() +
      "-" +
      DateTime.now().day.toString();

  String to = DateTime.now().year.toString() +
      "-" +
      DateTime.now().month.toString() +
      "-" +
      DateTime.now().day.toString();
  DateTime chosen = DateTime.now();

  Future<void> _selectDate() async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: chosen,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != chosen)
      setState(() {
        chosen = picked;
        from = chosen.year.toString() +
            "-" +
            chosen.month.toString() +
            "-" +
            chosen.day.toString();
      });
  }

  Future<void> _selectToDate() async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: chosen,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != chosen)
      setState(() {
        chosen = picked;
        to = chosen.year.toString() +
            "-" +
            chosen.month.toString() +
            "-" +
            chosen.day.toString();
      });
  }

  fetchTypes() async {
    String token = access_token.$;
    final response =
        await http.get(Uri.parse('${AppConfig.BASE_URL}leave/type'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      for (int i = 0; i < data['leave_types'].length; i++) {
        setState(() {
          _locations.add(
              data['leave_types'][i]['Leavetype'].toString().toUpperCase());
        });
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  applyLeave(String type, String rea, String from, String to) async {
    String token = access_token.$;
    Map data = {
      'type': type,
      'user_id': user_id.$,
      'from_date': from,
      'to_date': to,
      'reason': rea
    };
    var body = json.encode(data);
    final response = await http.post(
        Uri.parse('${AppConfig.BASE_URL}leave/register'),
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      print(response.body);
      FlutterFlexibleToast.showToast(
          message: "Leave Applied",
          toastLength: Toast.LENGTH_LONG,
          toastGravity: ToastGravity.BOTTOM,
          icon: ICON.SUCCESS,
          radius: 15,
          elevation: 5,
          imageSize: 20,
          textColor: Colors.white,
          backgroundColor: Color(0xff6b0772),
          timeInSeconds: 3);
      Navigator.pop(context);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    fetchTypes();
    super.initState();
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16.0),
            bottomLeft: Radius.circular(16.0),
          ),
          gradient: LinearGradient(
            begin: Alignment(0.0, -0.37),
            end: Alignment(0.0, 1.0),
            colors: [const Color(0xff6b0772), const Color(0xfff6b2e1)],
            stops: [0.0, 1.0],
          ),
        ),
      ),
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      title: Text(
        'Leave Register',
        style: TextStyle(
          fontFamily: 'Arial',
          fontSize: 24,
          color: const Color(0xffffffff),
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.left,
      ),
      elevation: 0.0,
      titleSpacing: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  'Type of Leave',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12,
                    color: const Color(0xff6b0772),
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: const Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xffc2c2c2),
                        offset: Offset(6, 3),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  height: 50,
                  padding: EdgeInsets.only(left: 15.0, right: 15, top: 10),
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButton<String>(
                    hint: Text(_selectedLocation),
                    value: _selectedLocation,
                    isDense: true,
                    isExpanded: true,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedLocation = newValue;
                      });
                      print(_selectedLocation);
                    },
                    items: _locations.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  'Cause',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12,
                    color: const Color(0xff6b0772),
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xffc2c2c2),
                    offset: Offset(6, 3),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: TextFormField(
                  obscureText: false,
                  controller: reason,
                  decoration: InputDecoration(
                    hintText: '',
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Spacer(),
                Text(
                  'From',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12,
                    color: const Color(0xff6b0772),
                  ),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Spacer(),
                Spacer(),
                Text(
                  'To',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12,
                    color: const Color(0xff6b0772),
                  ),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Spacer(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              GestureDetector(
                onTap: _selectDate,
                child: Container(
                  width: 140,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xffc2c2c2),
                        offset: Offset(6, 3),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        from,
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 12,
                          color: const Color(0xff6b0772),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Spacer(),
                      SvgPicture.string(
                        _svg_bop1i,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Spacer(),
              GestureDetector(
                onTap: _selectToDate,
                child: Container(
                  width: 140,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xffc2c2c2),
                        offset: Offset(6, 3),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        to,
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 12,
                          color: const Color(0xff6b0772),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Spacer(),
                      SvgPicture.string(
                        _svg_bop1i,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Spacer(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  'Total Days',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12,
                    color: const Color(0xff6b0772),
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25, top: 0),
            child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffc2c2c2),
                      offset: Offset(6, 3),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 10),
                  child: Text(
                    days,
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                Spacer(),
                GestureDetector(
                  onTap: () {
                    applyLeave("1", reason.text, from, to);
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: const Color(0xff6b0772),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xfff6b2e1),
                          offset: Offset(6, 3),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: Center(
                        child: Text(
                      'Apply',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 20,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    )),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: const Color(0xff6b0772),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xfff6b2e1),
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
                    )),
                  ),
                ),
                Spacer()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_u3zszc =
    '<svg viewBox="4.7 3.0 16.2 19.7" ><path  d="M 20.6835994720459 14.47659969329834 C 17.92189979553223 18.61330032348633 13.58979988098145 22.35549926757812 13.39449977874756 22.45700073242188 C 13.29689979553223 22.55080032348633 13 22.65229988098145 12.80469989776611 22.65229988098145 C 12.60550022125244 22.65229988098145 12.3125 22.55080032348633 12.11330032348633 22.45700073242188 C 11.91800022125244 22.35549926757812 7.582029819488525 18.51560020446777 4.824220180511475 14.47659969329834 C 4.628910064697266 14.17969989776611 4.628910064697266 13.78909969329834 4.726560115814209 13.39449977874756 C 5.023439884185791 13 5.316410064697266 12.80469989776611 5.710939884185791 12.80469989776611 L 9.355469703674316 12.80469989776611 C 9.355469703674316 12.80469989776611 9.847660064697266 4.234379768371582 10.14449977874756 3.839839935302734 C 10.53909969329834 3.347660064697266 11.71879959106445 2.953130006790161 12.80469989776611 2.953130006790161 C 13.88669967651367 2.953130006790161 14.96879959106445 3.347660064697266 15.36330032348633 3.839839935302734 C 15.65629959106445 4.234379768371582 16.25 12.80469989776611 16.25 12.80469989776611 L 19.89450073242188 12.80469989776611 C 20.28910064697266 12.80469989776611 20.58200073242188 13 20.78129959106445 13.39449977874756 C 20.97660064697266 13.6875 20.8789005279541 14.08590030670166 20.6835994720459 14.47659969329834 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_f0ox06 =
    '<svg viewBox="7.0 10.0 10.0 5.0" ><path  d="M 7 10 L 12 15 L 17 10 L 7 10 Z" fill="#6b0772" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bop1i =
    '<svg viewBox="0.0 0.0 19.0 19.0" ><path  d="M 3.958333492279053 0 L 3.958333492279053 3.166666746139526 L 5.541666984558105 3.166666746139526 L 5.541666984558105 0 L 3.958333492279053 0 Z M 13.45833396911621 0 L 13.45833396911621 3.166666746139526 L 15.04166698455811 3.166666746139526 L 15.04166698455811 0 L 13.45833396911621 0 Z M 0.7916666865348816 2.375 C 0.3556317090988159 2.375 0 2.730632543563843 0 3.166666746139526 L 0 5.541666984558105 C 0 5.977700710296631 0.3556317090988159 6.333333492279053 0.7916666865348816 6.333333492279053 L 0.7916666865348816 19 L 18.20833396911621 19 L 18.20833396911621 6.333333492279053 C 18.64438438415527 6.333333492279053 19 5.977700710296631 19 5.541666984558105 L 19 3.166666746139526 C 19 2.730632543563843 18.64438438415527 2.375 18.20833396911621 2.375 L 15.83333396911621 2.375 L 15.83333396911621 3.958333492279053 L 12.66666698455811 3.958333492279053 L 12.66666698455811 2.375 L 6.333333492279053 2.375 L 6.333333492279053 3.958333492279053 L 3.166666746139526 3.958333492279053 L 3.166666746139526 2.375 L 0.7916666865348816 2.375 Z M 2.375 6.333333492279053 L 16.625 6.333333492279053 L 16.625 17.41666793823242 L 2.375 17.41666793823242 L 2.375 6.333333492279053 Z M 3.958333492279053 7.916666984558105 L 3.958333492279053 9.5 L 5.541666984558105 9.5 L 5.541666984558105 7.916666984558105 L 3.958333492279053 7.916666984558105 Z M 7.125 7.916666984558105 L 7.125 9.5 L 8.708333969116211 9.5 L 8.708333969116211 7.916666984558105 L 7.125 7.916666984558105 Z M 10.29166698455811 7.916666984558105 L 10.29166698455811 9.5 L 11.875 9.5 L 11.875 7.916666984558105 L 10.29166698455811 7.916666984558105 Z M 13.45833396911621 7.916666984558105 L 13.45833396911621 9.5 L 15.04166698455811 9.5 L 15.04166698455811 7.916666984558105 L 13.45833396911621 7.916666984558105 Z M 3.958333492279053 11.08333396911621 L 3.958333492279053 12.66666698455811 L 5.541666984558105 12.66666698455811 L 5.541666984558105 11.08333396911621 L 3.958333492279053 11.08333396911621 Z M 7.125 11.08333396911621 L 7.125 12.66666698455811 L 8.708333969116211 12.66666698455811 L 8.708333969116211 11.08333396911621 L 7.125 11.08333396911621 Z M 10.29166698455811 11.08333396911621 L 10.29166698455811 12.66666698455811 L 11.875 12.66666698455811 L 11.875 11.08333396911621 L 10.29166698455811 11.08333396911621 Z M 13.45833396911621 11.08333396911621 L 13.45833396911621 12.66666698455811 L 15.04166698455811 12.66666698455811 L 15.04166698455811 11.08333396911621 L 13.45833396911621 11.08333396911621 Z M 3.958333492279053 14.25 L 3.958333492279053 15.83333396911621 L 5.541666984558105 15.83333396911621 L 5.541666984558105 14.25 L 3.958333492279053 14.25 Z M 7.125 14.25 L 7.125 15.83333396911621 L 8.708333969116211 15.83333396911621 L 8.708333969116211 14.25 L 7.125 14.25 Z M 10.29166698455811 14.25 L 10.29166698455811 15.83333396911621 L 11.875 15.83333396911621 L 11.875 14.25 L 10.29166698455811 14.25 Z M 13.45833396911621 14.25 L 13.45833396911621 15.83333396911621 L 15.04166698455811 15.83333396911621 L 15.04166698455811 14.25 L 13.45833396911621 14.25 Z" fill="#6b0772" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
