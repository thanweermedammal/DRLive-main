import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/ui_sections/main_drawer.dart';
import 'package:active_ecommerce_flutter/screens/new_doctor_screens/doctor_screen.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:active_ecommerce_flutter/models/doctor_list.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:active_ecommerce_flutter/data_handler/doctors_data_fetch.dart';
import 'dart:convert';

import 'package:active_ecommerce_flutter/app_config.dart';

class DoctorsList extends StatefulWidget {
  DoctorsList(
      {Key key,
      this.parent_category_id = 0,
      this.parent_category_name = "",
      this.is_base_category = false,
      this.is_top_category = false})
      : super(key: key);

  final int parent_category_id;
  final String parent_category_name;
  final bool is_base_category;
  final bool is_top_category;

  @override
  DoctorsListState createState() => DoctorsListState();
}

class DoctorsListState extends State<DoctorsList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<Doctors> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = DoctorsData().fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: MainDrawer(),
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: Stack(children: [
          CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                SizedBox(
                  height: 20,
                ),
                buildCategoryList(),
              ]))
            ],
          ),
        ]));
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
        'Appointment',
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
    // var future = widget.is_top_category
    //     ? CategoryRepository().getTopCategories()
    //     : CategoryRepository()
    //         .getCategories(parent_id: widget.parent_category_id);

    return FutureBuilder<Doctors>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: ListView.builder(
                // itemCount: categoryResponse.categories.length,
                itemCount: snapshot.data.doctors.length,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(
                          top: 4.0, bottom: 4.0, left: 10.0, right: 10.0),
                      child: Card(
                        color: Colors.white,
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
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: const Color(0xff57c5c7),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0x29000000),
                                          offset: Offset(6, 3),
                                          blurRadius: 12,
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        child: FadeInImage.assetNetwork(
                                          placeholder:
                                              'assets/images/lady2.png',
                                          image: '${AppConfig.IMAGE_URL}' +
                                              snapshot.data.doctors[index]
                                                  .doctordetails.image,
                                          fit: BoxFit.scaleDown,
                                        ))),
                              ),
                              Container(
                                height: 100,
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
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
                                              snapshot.data.doctors[index]
                                                      .doctordetails.firstName
                                                      .toUpperCase() +
                                                  "." +
                                                  snapshot.data.doctors[index]
                                                      .doctordetails.lastName
                                                      .toUpperCase(),
                                              textAlign: TextAlign.left,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  height: 1.6,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 0, 0, 0),
                                              child: Text(
                                                snapshot.data.doctors[index]
                                                    .designation,
                                                style: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 12,
                                                  color:
                                                      const Color(0xff858585),
                                                ),
                                                textAlign: TextAlign.left,
                                              )),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                20, 0, 0, 0),
                                            child: Row(
                                              children: [
                                                SvgPicture.string(
                                                  '<svg viewBox="1.6 1.9 9.3 8.9" ><path transform="translate(0.0, 0.0)" d="M 6.473546981811523 2.048804759979248 L 7.469562530517578 4.998483657836914 L 10.58250045776367 5.035536766052246 C 10.850022315979 5.038276672363281 10.96114730834961 5.378499984741211 10.74715137481689 5.539006233215332 L 8.250211715698242 7.397995948791504 L 9.177633285522461 10.37100982666016 C 9.257219314575195 10.6261682510376 8.967746734619141 10.83609008789062 8.748236656188965 10.68243312835693 L 6.207395076751709 8.881077766418457 L 3.667926549911499 10.68243312835693 C 3.448415994644165 10.83609008789062 3.158936262130737 10.62479877471924 3.238511562347412 10.37100982666016 L 4.16594123840332 7.397995948791504 L 1.669012069702148 5.539006233215332 C 1.453617930412292 5.378499984741211 1.564742803573608 5.038276672363281 1.832271575927734 5.035536766052246 L 4.94656229019165 4.998483657836914 L 5.942612648010254 2.048804759979248 C 6.027677059173584 1.793624877929688 6.388482093811035 1.793624877929688 6.473546981811523 2.048804759979248 Z" fill="#f3c306" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                                  allowDrawingOutsideViewBox:
                                                      true,
                                                  fit: BoxFit.fill,
                                                ),
                                                Text(
                                                  '   5.0',
                                                  style: TextStyle(
                                                    fontFamily: 'Arial',
                                                    fontSize: 12,
                                                    color:
                                                        const Color(0xff858585),
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      //color: Colors.black,
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          // Adobe XD layer: 'surface1' (group)
                                          Container(
                                            height: 15,
                                            width: 18,
                                            child: Pinned.fromPins(
                                              Pin(start: 0.0, end: 0.0),
                                              Pin(start: 0.0, end: 0.0),
                                              child: SvgPicture.string(
                                                '<svg viewBox="2.0 4.0 13.0 11.2" ><path  d="M 11.72482204437256 4 C 9.909003257751465 4 8.48321533203125 5.815805912017822 8.48321533203125 5.815805912017822 C 8.48321533203125 5.815805912017822 7.057413578033447 4 5.241607189178467 4 C 3.425801753997803 4 2 5.425801753997803 2 7.241607666015625 C 2 11.65071201324463 8.48321533203125 15.21648025512695 8.48321533203125 15.21648025512695 C 8.48321533203125 15.21648025512695 14.96642971038818 11.65071201324463 14.96642971038818 7.241607666015625 C 14.96642971038818 5.425801753997803 13.54064178466797 4 11.72482204437256 4 Z" fill="none" stroke="#6b0772" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                                allowDrawingOutsideViewBox:
                                                    true,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          SizedBox(),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return DoctorScreen(
                                                  id: snapshot
                                                      .data.doctors[index].id,
                                                );
                                              }));
                                            },
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  5, 0, 5, 0),
                                              height: 35.0,
                                              width: 90.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                color: HexColor('33BEA3'),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 0, 0, 0),
                                                child: Center(
                                                  child: Text(
                                                    "Connect",
                                                    textAlign: TextAlign.left,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        //height: 1.6,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
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
                                  width: MediaQuery.of(context).size.width * .7,
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
                                  width: MediaQuery.of(context).size.width * .5,
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
        });
  }
}
