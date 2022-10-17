import 'package:active_ecommerce_flutter/data_handler/notification_handler.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:active_ecommerce_flutter/models/notification.dart';
import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/ui_sections/doctor_drawer.dart';
import 'package:adobe_xd/pinned.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:active_ecommerce_flutter/data_handler/notification_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:active_ecommerce_flutter/models/chats.dart';

class DoctorChats extends StatefulWidget {
  DoctorChats({
    Key key,
    this.is_base_category,
  }) : super(key: key);

  final bool is_base_category;

  @override
  DoctorChatsState createState() => DoctorChatsState();
}

class DoctorChatsState extends State<DoctorChats> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<Chats> fetchAll;

  @override
  void initState() {
    fetchAll = NotificationHandler().allChats("1", "2");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: DoctorDrawer(),
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: WillPopScope(
          onWillPop: () async {
            // You can do some work here.
            // Returning true allows the pop to happen, returning false prevents it.
            return widget.is_base_category;
          },
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20, bottom: 15),
              child: Row(
                children: [
                  Text(
                    "All",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            FutureBuilder<Chats>(
                future: fetchAll,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      child: ListView.builder(
                        itemCount: snapshot.data.chats.length,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                              leading: GestureDetector(
                                onTap: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  //   return DoctorProfile();
                                  // }));
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(0),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      child: Image.asset(
                                        'assets/placeholder.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(
                                snapshot.data.chats[index].from.firstName,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              subtitle: Text(
                                "hi",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.grey),
                              ),
                              trailing: Text(
                                "1 min ago",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.cyan[800]),
                              ));
                        },
                      ),
                    );
                  } else {
                    return Container(
                      child: Text("No data"),
                    );
                  }
                }),
          ]),
        ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 100,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
            ),
            color: HexColor('33BEA3')),
      ),
      leading: GestureDetector(
        onTap: () {
          _scaffoldKey.currentState.openDrawer();
        },
        child: widget.is_base_category
            ? Builder(
                builder: (context) => Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 35.0, horizontal: 15.0),
                  child: Container(
                      height: 50,
                      width: 50,
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
      title: Text(
        'All Chats',
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
}
