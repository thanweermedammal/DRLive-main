import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:active_ecommerce_flutter/screens/new_doctor_screens/appointmentview.dart';
import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/ui_sections/main_drawer.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adobe_xd/pinned.dart';
import 'dart:async';
import 'package:active_ecommerce_flutter/ui_sections/doctor_drawer.dart';
import 'package:active_ecommerce_flutter/app_config.dart';
import 'package:active_ecommerce_flutter/models/active_doctor_history.dart';
import 'package:active_ecommerce_flutter/data_handler/fetch_history.dart';
import 'package:intl/intl.dart';
import 'package:active_ecommerce_flutter/models/pastDoctorHistory.dart';

class PatientsList extends StatefulWidget {
  PatientsList({
    Key key,
    this.is_base_category,
  }) : super(key: key);

  final bool is_base_category;

  @override
  DoctorsListState createState() => DoctorsListState();
}

class DoctorsListState extends State<PatientsList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<ActiveDoctorHistory> fetchAppointment;
  Future<PastDoctorHistory> pastHistory;
  bool select = true;
  String from = "2022-01-01";
  String to =
      "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
  String search = "";

  @override
  void initState() {
    super.initState();
    fetchAppointment = History().activeDoctorData(doctor_id.$.toString());
    pastHistory = History().pastDoctorData("1", from, to, search);
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
                            select = true;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              Text(
                                'Active History',
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
                                width: 100,
                                color: select ? Colors.yellow : Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            select = false;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                'Past History',
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
                                width: 100,
                                color: select ? Colors.white : Colors.yellow,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  select ? buildCategoryList() : pastHistoryList(),
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
          color: HexColor('33BEA3'),
        ),
      ),
      leading: GestureDetector(
        onTap: () {
          _scaffoldKey.currentState.openDrawer();
        },
        child: widget.is_base_category
            ? Icon(
                Icons.menu,
                color: Colors.black,
              )
            : Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
      ),
      title: Text(
        'Appointment History',
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

  buildCategoryList() {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                DateFormat.MMMM().format(DateTime.now()).toString(),
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 20,
                  color: HexColor('33BEA3'),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<ActiveDoctorHistory>(
              future: fetchAppointment,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: ListView.builder(
                      // itemCount: categoryResponse.categories.length,
                      itemCount: snapshot.data.appointments.length,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x29000000),
                                offset: Offset(6, 3),
                                blurRadius: 12,
                              ),
                            ],
                          ),
                          margin: EdgeInsets.all(5),
                          // height: 0,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 60.0,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/placeholder.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    //shape: BoxShape.circle,
                                  ),
                                  child: snapshot.data.appointments[index]
                                              .patient.image !=
                                          null
                                      ? Image.network('${AppConfig.IMAGE_URL}' +
                                          snapshot.data.appointments[index]
                                              .patient.image)
                                      : Container(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  // height: 200,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Tokon Number',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        "TKNO#${snapshot.data.appointments[index].tokenNo.toString()}",
                                        style: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 14,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Patient Name',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        snapshot.data.appointments[index]
                                            .patient.firstName
                                            .toUpperCase(),
                                        style: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 14,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Date',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Time',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "${snapshot.data.appointments[index].date.day.toString()}-${snapshot.data.appointments[index].date.month.toString()}-${snapshot.data.appointments[index].date.year.toString()}",
                                              style: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 14,
                                                color: const Color(0xff000000),
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              snapshot.data.time[index]
                                                  .toString(),
                                              style: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 14,
                                                color: const Color(0xff000000),
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AppointmentView(
                                                              snapshot:
                                                                  snapshot,
                                                              index: index)));
                                            },
                                            child: Container(
                                              height: 25,
                                              width: 65,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.black),
                                              child: Center(
                                                child: Text(
                                                  'View',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return SingleChildScrollView(
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 4.0, bottom: 4.0, left: 16.0, right: 16.0),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, bottom: 8.0),
                                    child: Shimmer.fromColors(
                                      baseColor: MyTheme.shimmer_base,
                                      highlightColor:
                                          MyTheme.shimmer_highlighted,
                                      child: Container(
                                        height: 20,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .7,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Shimmer.fromColors(
                                      baseColor: MyTheme.shimmer_base,
                                      highlightColor:
                                          MyTheme.shimmer_highlighted,
                                      child: Container(
                                        height: 20,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .5,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
              }),
        ),
      ],
    );
  }

  pastHistoryList() {
    return Column(
      children: [
        FutureBuilder<PastDoctorHistory>(
            future: pastHistory,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: ListView.builder(
                    itemCount: snapshot.data.appointments.length,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(6, 3),
                              blurRadius: 12,
                            ),
                          ],
                        ),
                        margin: EdgeInsets.all(5),
                        // height: 0,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 60.0,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  image: DecorationImage(
                                    image: AssetImage('assets/placeholder.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  //shape: BoxShape.circle,
                                ),
                                child: snapshot
                                            .data.appointments[index].image !=
                                        null
                                    ? Image.network('${AppConfig.IMAGE_URL}' +
                                        snapshot.data.appointments[index].image)
                                    : Container(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                // height: 200,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tokon Number',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      "TKNO#${snapshot.data.appointments[index].tokenNo.toString()}",
                                      style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 14,
                                        color: const Color(0xff000000),
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Patient Name',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      snapshot
                                          .data.appointments[index].firstName
                                          .toUpperCase(),
                                      style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 14,
                                        color: const Color(0xff000000),
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Date',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Time',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "${snapshot.data.appointments[index].date.day.toString()}-${snapshot.data.appointments[index].date.month.toString()}-${snapshot.data.appointments[index].date.year.toString()}",
                                            style: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 14,
                                              color: const Color(0xff000000),
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            snapshot.data.time[index]
                                                .toString(),
                                            style: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 14,
                                              color: const Color(0xff000000),
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.end,
                                    //   children: [
                                    //     InkWell(
                                    //       onTap: () {
                                    //         Navigator.push(
                                    //             context,
                                    //             MaterialPageRoute(
                                    //                 builder: (context) =>
                                    //                     AppointmentView(
                                    //                         snapshot: snapshot,
                                    //                         index: index)));
                                    //       },
                                    //       child: Container(
                                    //         height: 25,
                                    //         width: 65,
                                    //         decoration: BoxDecoration(
                                    //             borderRadius:
                                    //                 BorderRadius.circular(10),
                                    //             color: Colors.black),
                                    //         child: Center(
                                    //           child: Text(
                                    //             'View',
                                    //             style: TextStyle(
                                    //                 color: Colors.white),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     )
                                    //   ],
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else {
                return SingleChildScrollView(
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 4.0, bottom: 4.0, left: 16.0, right: 16.0),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, bottom: 8.0),
                                  child: Shimmer.fromColors(
                                    baseColor: MyTheme.shimmer_base,
                                    highlightColor: MyTheme.shimmer_highlighted,
                                    child: Container(
                                      height: 20,
                                      width: MediaQuery.of(context).size.width *
                                          .7,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Shimmer.fromColors(
                                    baseColor: MyTheme.shimmer_base,
                                    highlightColor: MyTheme.shimmer_highlighted,
                                    child: Container(
                                      height: 20,
                                      width: MediaQuery.of(context).size.width *
                                          .5,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            }),
      ],
    );
  }
}
