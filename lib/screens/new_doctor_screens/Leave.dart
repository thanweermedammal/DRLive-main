import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/ui_sections/main_drawer.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adobe_xd/pinned.dart';
import 'dart:async';
import 'package:active_ecommerce_flutter/data_handler/fetch_leave_data.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:active_ecommerce_flutter/screens/new_doctor_screens/Leave3.dart';

import 'package:active_ecommerce_flutter/models/all_leaves.dart';

class Leave extends StatefulWidget {
  Leave({
    Key key,
    this.is_base_category,
  }) : super(key: key);

  final bool is_base_category;

  @override
  DoctorsListState createState() => DoctorsListState();
}

class DoctorsListState extends State<Leave> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<AllLeaves> fetchAll;
  Future<AllLeaves> fetchAwaiting;
  Future<AllLeaves> fetchApproved;

  bool all = true;
  bool waiting = false;
  bool confirmed = false;

  @override
  void initState() {
    fetchAll = LeaveData().all("6");
    fetchAwaiting = LeaveData().awaiting("6");
    fetchApproved = LeaveData().approved("6");
    super.initState();
    print(user_id.$);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Leave3();
            }));
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: HexColor('33BEA3'),
            ),
            child: // Adobe XD layer: 'surface1' (group)
                Center(
              child: Container(
                height: 30,
                width: 30,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromPins(
                      Pin(start: 0.0, end: 0.0),
                      Pin(start: 0.0, end: 0.0),
                      child: SvgPicture.string(
                        '<svg viewBox="2.0 2.0 20.0 20.0" ><path  d="M 12 2 C 6.476560115814209 2 2 6.476560115814209 2 12 C 2 17.52339935302734 6.476560115814209 22 12 22 C 17.52339935302734 22 22 17.52339935302734 22 12 C 22 6.476560115814209 17.52339935302734 2 12 2 Z M 16 13 L 13 13 L 13 16 L 11 16 L 11 13 L 8 13 L 8 11 L 11 11 L 11 8 L 13 8 L 13 11 L 16 11 L 16 13 Z" fill="#f3c306" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        key: _scaffoldKey,
        drawer: MainDrawer(),
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: WillPopScope(
          onWillPop: () async {
            // You can do some work here.
            // Returning true allows the pop to happen, returning false prevents it.
            return widget.is_base_category;
          },
          child: Stack(children: [
            CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            all = true;
                            waiting = false;
                            confirmed = false;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              Text(
                                'All',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 20,
                                  color: HexColor('33BEA3'),
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 3,
                                width:
                                    MediaQuery.of(context).size.width / 3 - 20,
                                color: all ? Colors.yellow : Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            all = false;
                            waiting = true;
                            confirmed = false;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                'Awaiting',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 20,
                                  color: HexColor('33BEA3'),
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 3,
                                width:
                                    MediaQuery.of(context).size.width / 3 - 20,
                                color: waiting ? Colors.yellow : Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            all = false;
                            waiting = false;
                            confirmed = true;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              Text(
                                'Approved',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 20,
                                  color: HexColor('33BEA3'),
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 3,
                                width:
                                    MediaQuery.of(context).size.width / 3 - 20,
                                color: confirmed ? Colors.yellow : Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  all ? allLeaves() : Container(),
                  waiting ? awaitingLeaves() : Container(),
                  confirmed ? approvedLeaves() : Container(),
                ]))
              ],
            ),
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
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      title: Text(
        'Leave Details',
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

  allLeaves() {
    return Column(
      children: [
        FutureBuilder<AllLeaves>(
            future: fetchAll,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: ListView.builder(
                    itemCount: snapshot.data.leaves.length,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(
                              top: 4.0, bottom: 4.0, left: 10.0, right: 10.0),
                          child: Card(
                            color:
                                index.isEven ? Colors.white : Color(0xfff3c380),
                            shape: RoundedRectangleBorder(
                              // side: new BorderSide(color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            elevation: 5.0,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                                        child: Text(
                                          snapshot.data.leaves[index].createdAt
                                                  .day
                                                  .toString() +
                                              "\n" +
                                              DateFormat.MMMM()
                                                  .format(snapshot.data
                                                      .leaves[index].createdAt)
                                                  .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Arial',
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                    child: Row(
                                      // crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.8,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    20, 0, 0, 0),
                                                child: Text(
                                                  snapshot
                                                      .data.leaves[index].reason
                                                      .toUpperCase()
                                                      .toString(),
                                                  textAlign: TextAlign.left,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      height: 1.6,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      20, 0, 0, 0),
                                                  child: Text(
                                                    snapshot.data.leaves[index]
                                                        .type.leavetype
                                                        .toUpperCase()
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontFamily: 'Arial',
                                                      fontSize: 12,
                                                      color: const Color(
                                                          0xff858585),
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              snapshot.data.leaves[index]
                                                          .status ==
                                                      "0"
                                                  ? Container(
                                                      width: 80,
                                                      height: 40,
                                                      child: Stack(
                                                        children: <Widget>[
                                                          Pinned.fromPins(
                                                            Pin(
                                                                start: 0.0,
                                                                end: 0.0),
                                                            Pin(
                                                                start: 0.0,
                                                                end: 0.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                color: const Color(
                                                                    0xfff3c306),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: const Color(
                                                                        0x29000000),
                                                                    offset:
                                                                        Offset(
                                                                            6,
                                                                            3),
                                                                    blurRadius:
                                                                        6,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Pinned.fromPins(
                                                            Pin(
                                                                size: 38.0,
                                                                middle: 0.5),
                                                            Pin(
                                                                size: 11.0,
                                                                middle: 0.5),
                                                            child: Text(
                                                              'Awaiting',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize: 12,
                                                                color: HexColor(
                                                                    '33BEA3'),
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : Container()
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ));
                    },
                  ),
                );
              } else {
                return Container(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ],
    );
  }

  awaitingLeaves() {
    return Column(
      children: [
        FutureBuilder<AllLeaves>(
            future: fetchAwaiting,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: ListView.builder(
                    itemCount: snapshot.data.leaves.length,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(
                              top: 4.0, bottom: 4.0, left: 10.0, right: 10.0),
                          child: Card(
                            color:
                                index.isEven ? Colors.white : Color(0xfff3c380),
                            shape: RoundedRectangleBorder(
                              // side: new BorderSide(color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            elevation: 5.0,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                                        child: Text(
                                          snapshot.data.leaves[index].createdAt
                                                  .day
                                                  .toString() +
                                              "\n" +
                                              DateFormat.MMMM()
                                                  .format(snapshot.data
                                                      .leaves[index].createdAt)
                                                  .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Arial',
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                    child: Row(
                                      // crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.8,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    20, 0, 0, 0),
                                                child: Text(
                                                  snapshot
                                                      .data.leaves[index].reason
                                                      .toUpperCase()
                                                      .toString(),
                                                  textAlign: TextAlign.left,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      height: 1.6,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      20, 0, 0, 0),
                                                  child: Text(
                                                    snapshot.data.leaves[index]
                                                        .type.leavetype
                                                        .toUpperCase()
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontFamily: 'Arial',
                                                      fontSize: 12,
                                                      color: const Color(
                                                          0xff858585),
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              snapshot.data.leaves[index]
                                                          .status ==
                                                      "0"
                                                  ? Container(
                                                      width: 80,
                                                      height: 40,
                                                      child: Stack(
                                                        children: <Widget>[
                                                          Pinned.fromPins(
                                                            Pin(
                                                                start: 0.0,
                                                                end: 0.0),
                                                            Pin(
                                                                start: 0.0,
                                                                end: 0.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                color: const Color(
                                                                    0xfff3c306),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: const Color(
                                                                        0x29000000),
                                                                    offset:
                                                                        Offset(
                                                                            6,
                                                                            3),
                                                                    blurRadius:
                                                                        6,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Pinned.fromPins(
                                                            Pin(
                                                                size: 38.0,
                                                                middle: 0.5),
                                                            Pin(
                                                                size: 11.0,
                                                                middle: 0.5),
                                                            child: Text(
                                                              'Awaiting',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize: 12,
                                                                color: HexColor(
                                                                    '33BEA3'),
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : Container()
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ));
                    },
                  ),
                );
              } else {
                return Container(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ],
    );
  }

  approvedLeaves() {
    return Column(
      children: [
        FutureBuilder<AllLeaves>(
            future: fetchApproved,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: ListView.builder(
                    itemCount: snapshot.data.leaves.length,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(
                              top: 4.0, bottom: 4.0, left: 10.0, right: 10.0),
                          child: Card(
                            color:
                                index.isEven ? Colors.white : Color(0xfff3c380),
                            shape: RoundedRectangleBorder(
                              // side: new BorderSide(color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            elevation: 5.0,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                                        child: Text(
                                          snapshot.data.leaves[index].createdAt
                                                  .day
                                                  .toString() +
                                              "\n" +
                                              DateFormat.MMMM()
                                                  .format(snapshot.data
                                                      .leaves[index].createdAt)
                                                  .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Arial',
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                    child: Row(
                                      // crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.8,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    20, 0, 0, 0),
                                                child: Text(
                                                  snapshot
                                                      .data.leaves[index].reason
                                                      .toUpperCase()
                                                      .toString(),
                                                  textAlign: TextAlign.left,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      height: 1.6,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      20, 0, 0, 0),
                                                  child: Text(
                                                    snapshot.data.leaves[index]
                                                        .type.leavetype
                                                        .toUpperCase()
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontFamily: 'Arial',
                                                      fontSize: 12,
                                                      color: const Color(
                                                          0xff858585),
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              snapshot.data.leaves[index]
                                                          .status ==
                                                      "0"
                                                  ? Container(
                                                      width: 80,
                                                      height: 40,
                                                      child: Stack(
                                                        children: <Widget>[
                                                          Pinned.fromPins(
                                                            Pin(
                                                                start: 0.0,
                                                                end: 0.0),
                                                            Pin(
                                                                start: 0.0,
                                                                end: 0.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                color: const Color(
                                                                    0xfff3c306),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: const Color(
                                                                        0x29000000),
                                                                    offset:
                                                                        Offset(
                                                                            6,
                                                                            3),
                                                                    blurRadius:
                                                                        6,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Pinned.fromPins(
                                                            Pin(
                                                                size: 38.0,
                                                                middle: 0.5),
                                                            Pin(
                                                                size: 11.0,
                                                                middle: 0.5),
                                                            child: Text(
                                                              'Approved',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize: 12,
                                                                color: HexColor(
                                                                    '33BEA3'),
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : Container()
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ));
                    },
                  ),
                );
              } else {
                return Container(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ],
    );
  }
}
