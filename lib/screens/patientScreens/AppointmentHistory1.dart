import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/ui_sections/main_drawer.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adobe_xd/pinned.dart';
import 'dart:async';
import 'package:active_ecommerce_flutter/models/active_patient_history.dart';
import 'package:active_ecommerce_flutter/models/pastPatientHistory.dart';
import 'package:active_ecommerce_flutter/data_handler/fetch_history.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';

class AppointmentHistory1 extends StatefulWidget {
  AppointmentHistory1({
    Key key,
    this.is_base_category,
  }) : super(key: key);

  final bool is_base_category;

  @override
  DoctorsListState createState() => DoctorsListState();
}

class DoctorsListState extends State<AppointmentHistory1> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<ActivePatientHistory> fetchAppointment;
  Future<PastPatientHistory> pastPatientHistory;

  bool select = true;
  var name = TextEditingController();
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

    setState(() {
      pastPatientHistory =
          History().pastPatientData(user_id.$.toString(), from, to, name.text);
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

    setState(() {
      pastPatientHistory =
          History().pastPatientData(user_id.$.toString(), from, to, name.text);
    });
  }

  search() {
    setState(() {
      pastPatientHistory =
          History().pastPatientData(user_id.$.toString(), from, to, name.text);
    });
  }

  @override
  void initState() {
    super.initState();
    print(user_id.$);
    fetchAppointment = History().activePatientData(user_id.$.toString());
    pastPatientHistory =
        History().pastPatientData(user_id.$.toString(), from, to, name.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  select ? buildCategoryList() : pastHistory(),
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
      leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState.openDrawer();
          },
          child: Icon(
            Icons.menu,
            color: Colors.black,
          )
          // widget.is_base_category
          //     ? Builder(
          //         builder: (context) => Padding(
          //           padding:
          //               EdgeInsets.symmetric(vertical: 35.0, horizontal: 15.0),
          //           child: Container(
          //               height: 50,
          //               width: 50,
          //               child: Stack(
          //                 children: <Widget>[
          //                   Pinned.fromPins(
          //                     Pin(size: 12.0, start: 0.0),
          //                     Pin(size: 12.0, start: 0.0),
          //                     child: Container(
          //                       decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.only(
          //                           topLeft: Radius.circular(2.0),
          //                           topRight: Radius.circular(2.0),
          //                           bottomLeft: Radius.circular(2.0),
          //                         ),
          //                         color: Colors.white,
          //                       ),
          //                     ),
          //                   ),
          //                   Pinned.fromPins(
          //                     Pin(size: 12.0, end: 0.0),
          //                     Pin(size: 12.0, start: 0.0),
          //                     child: Container(
          //                       decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.only(
          //                           topLeft: Radius.circular(2.0),
          //                           topRight: Radius.circular(2.0),
          //                           bottomRight: Radius.circular(2.0),
          //                         ),
          //                         border: Border.all(
          //                           width: 1.0,
          //                           color: Colors.white,
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   Pinned.fromPins(
          //                     Pin(size: 12.0, start: 0.0),
          //                     Pin(size: 12.0, end: 0.0),
          //                     child: Container(
          //                       decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.only(
          //                           topLeft: Radius.circular(2.0),
          //                           bottomRight: Radius.circular(2.0),
          //                           bottomLeft: Radius.circular(2.0),
          //                         ),
          //                         color: Colors.white,
          //                       ),
          //                     ),
          //                   ),
          //                   Pinned.fromPins(
          //                     Pin(size: 12.0, end: 0.0),
          //                     Pin(size: 12.0, end: 0.0),
          //                     child: Container(
          //                       decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.only(
          //                           topRight: Radius.circular(2.0),
          //                           bottomRight: Radius.circular(2.0),
          //                           bottomLeft: Radius.circular(2.0),
          //                         ),
          //                         border: Border.all(
          //                           width: 1.0,
          //                           color: Colors.white,
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               )),
          //         ),
          //       )
          //     : Builder(
          //         builder: (context) => IconButton(
          //           icon: Icon(Icons.arrow_back, color: Colors.white),
          //           onPressed: () => Navigator.of(context).pop(),
          //         ),
          //       ),
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
        FutureBuilder<ActivePatientHistory>(
            future: fetchAppointment,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: ListView.builder(
                    itemCount: snapshot.data.appointments.length,
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
                                        color: const Color(0xff57c5c7),
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
                                          snapshot.data.appointments[index].date
                                                  .day
                                                  .toString() +
                                              "\n" +
                                              DateFormat.MMMM()
                                                  .format(snapshot.data
                                                      .appointments[index].date)
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
                                                      .data
                                                      .appointments[index]
                                                      .category
                                                      .name
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
                                                    "Token No :" +
                                                        snapshot
                                                            .data
                                                            .appointments[index]
                                                            .tokenNo
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
                                              snapshot.data.appointments[index]
                                                          .method ==
                                                      "call"
                                                  ? Container(
                                                      height: 50,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius
                                                                    .elliptical(
                                                                        9999.0,
                                                                        9999.0)),
                                                        color: const Color(
                                                            0xffffffff),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: const Color(
                                                                0x29000000),
                                                            offset:
                                                                Offset(6, 3),
                                                            blurRadius: 6,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Center(
                                                        child:
                                                            SvgPicture.string(
                                                          '<svg viewBox="3.0 3.0 18.1 18.1" ><path transform="translate(0.0, 0.0)" d="M 6.393776416778564 2.979279518127441 C 6.142941474914551 2.995460510253906 5.874317646026611 3.084460496902466 5.617019653320312 3.264084339141846 C 5.589512825012207 3.281881093978882 2.942120313644409 5.201080799102783 2.976102352142334 6.27879810333252 C 3.073196887969971 9.353405952453613 6.068498134613037 12.97334671020508 8.562145233154297 15.4702262878418 C 11.05745029449463 17.96391296386719 14.67577648162842 20.95757865905762 17.76492691040039 21.05952453613281 L 17.78435134887695 21.05952453613281 C 18.85236167907715 21.05952453613281 20.74727630615234 18.4428825378418 20.76508712768555 18.41860771179199 C 20.98029708862305 18.11114311218262 21.08225059509277 17.7600154876709 21.05312538146973 17.42666053771973 C 21.02400398254395 17.09814834594727 20.87188720703125 16.81496047973633 20.63886260986328 16.65153503417969 C 20.35890769958496 16.45571327209473 17.32638740539551 14.43941879272461 16.95744705200195 14.2129020690918 C 16.59658241271973 13.99118804931641 16.0657901763916 14.02677345275879 15.53988361358643 14.30511665344238 C 15.24211311340332 14.46207809448242 14.33430099487305 14.97990608215332 13.91034507751465 15.22104644775391 C 13.5365571975708 14.9605188369751 12.62385559082031 14.2662992477417 11.19498443603516 12.83742809295654 C 9.764498710632324 11.40851593017578 9.071894645690918 10.4958553314209 8.811365127563477 10.12368392944336 C 9.054080963134766 9.699686050415039 9.570293426513672 8.790257453918457 9.727255821228027 8.494143486022949 C 10.00883007049561 7.958502769470215 10.0428409576416 7.424479484558105 9.814665794372559 7.068504810333252 C 9.597800254821777 6.722182273864746 7.591241359710693 3.681581497192383 7.379263401031494 3.388686180114746 C 7.183441638946533 3.116827011108398 6.812885284423828 2.948533058166504 6.393776416778564 2.979279518127441 Z M 12.01704502105713 3.798092603683472 L 12.01704502105713 4.620140552520752 C 16.09652709960938 4.620140552520752 19.41550827026367 7.937459468841553 19.41550827026367 12.01698207855225 L 20.23752784729004 12.01698207855225 C 20.23752784729004 7.485997676849365 16.54964828491211 3.798092603683472 12.01704502105713 3.798092603683472 Z M 12.01704502105713 6.07651424407959 L 12.01704502105713 6.898575305938721 C 14.8408203125 6.898575305938721 17.13706970214844 9.194826126098633 17.13706970214844 12.01698207855225 L 17.95909118652344 12.01698207855225 C 17.95909118652344 8.740091323852539 15.29389762878418 6.07651424407959 12.01704502105713 6.07651424407959 Z M 12.01704502105713 8.317751884460449 L 12.01704502105713 9.139812469482422 C 13.60288143157959 9.139812469482422 14.89421653747559 10.43114757537842 14.89421653747559 12.01698207855225 L 15.71627712249756 12.01698207855225 C 15.71627712249756 9.976413726806641 14.05600070953369 8.317751884460449 12.01704502105713 8.317751884460449 Z" fill="#f3c306" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                                          allowDrawingOutsideViewBox:
                                                              true,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      height: 50,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius
                                                                    .elliptical(
                                                                        9999.0,
                                                                        9999.0)),
                                                        color: const Color(
                                                            0xffffffff),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: const Color(
                                                                0x29000000),
                                                            offset:
                                                                Offset(6, 3),
                                                            blurRadius: 6,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Center(
                                                          child:
                                                              SvgPicture.string(
                                                        '<svg viewBox="0.0 5.9 20.6 11.1" ><path  d="M 6.745894908905029 5.910160064697266 C 1.983163714408875 5.910160064697266 0 6.555473804473877 0 7.074872493743896 L 0 15.8291540145874 C 0 16.3390998840332 1.983163714408875 17.01900100708008 6.745894908905029 17.01900100708008 C 11.50867462158203 17.01900100708008 13.49180698394775 16.3768138885498 13.49180698394775 15.85429668426514 L 13.49180698394775 7.10005521774292 C 13.49180698394775 6.59010124206543 11.50867462158203 5.910160064697266 6.745894908905029 5.910160064697266 Z M 20.14012145996094 5.935343265533447 C 19.99845123291016 5.94163703918457 19.85678100585938 5.988852024078369 19.76547813415527 6.058107376098633 L 14.60928726196289 9.382304191589355 C 14.41096496582031 9.530179023742676 14.28509140014648 9.775723457336426 14.28509140014648 10.02755355834961 L 14.28509140014648 12.90470218658447 C 14.28509140014648 13.15024662017822 14.41096496582031 13.39893341064453 14.60928726196289 13.54688835144043 L 19.76547813415527 16.87104415893555 C 19.90714645385742 16.97806549072266 20.583984375 17.30862617492676 20.583984375 16.22571563720703 L 20.583984375 6.703420639038086 C 20.583984375 6.076996326446533 20.36986923217773 5.925898551940918 20.14012145996094 5.935343265533447 Z" fill="#c2c2c2" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                                        allowDrawingOutsideViewBox:
                                                            true,
                                                        fit: BoxFit.fill,
                                                      )),
                                                    ),
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
                  child: Text("No data"),
                );
              }
            }),
      ],
    );
  }

  pastHistory() {
    return Column(
      children: [
        searchRow(),
        Container(
          height: 30,
          decoration: BoxDecoration(
            color: HexColor('33BEA3'),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'SNo',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 10,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                'Date',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 10,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(),
              Text(
                'Dr Name',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 10,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(),
              Text(
                'Consultation\n Method',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 10,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                'Disease',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 10,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                'Amt',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 10,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
        FutureBuilder<PastPatientHistory>(
            future: pastPatientHistory,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: ListView.builder(
                    itemCount: snapshot.data.appointments.length,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      int i = index + 1;
                      return Container(
                        color: index.floor().isOdd
                            ? Colors.grey[100]
                            : Colors.yellow[100],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(i.toString()),
                              Text(snapshot.data.appointments[index].date.day
                                      .toString() +
                                  "-" +
                                  snapshot.data.appointments[index].date.month
                                      .toString() +
                                  "-" +
                                  snapshot.data.appointments[index].date.year
                                      .toString()),
                              SizedBox(),
                              Text(snapshot.data.appointments[index].firstName
                                  .toUpperCase()),
                              SizedBox(),
                              Text(snapshot.data.appointments[index].method),
                              Text(snapshot
                                  .data.appointments[index].category.name),
                              Text(snapshot.data.appointments[index].fees
                                  .toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Container(
                  child: Text("No data"),
                );
              }
            }),
      ],
    );
  }

  searchRow() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 95,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(6, 3),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: TextFormField(
                  controller: name,
                  onChanged: search(),
                  decoration: InputDecoration(
                    hintText: '',
                    //filled: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 5, top: 15, right: 15),
                    filled: false,
                    isDense: false,
                    prefixIcon: Icon(
                      Icons.search_sharp,
                      size: 25.0,
                      color: Colors.grey,
                    ),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  '   From  :',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 14,
                    color: Color(0xffb0b0b0),
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    _selectDate();
                  },
                  child: Text(
                    from,
                    style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 13,
                        color: Colors.black,
                        decoration: TextDecoration.underline),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'To',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 13,
                    color: Color(0xffb0b0b0),
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    _selectToDate();
                  },
                  child: Text(
                    to,
                    style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 13,
                        color: Colors.black,
                        decoration: TextDecoration.underline),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
