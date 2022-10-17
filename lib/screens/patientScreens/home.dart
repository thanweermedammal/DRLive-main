import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/screens/new_doctor_screens/doctor_screen.dart';
import 'package:active_ecommerce_flutter/screens/patientScreens/meeting1_scree.dart';
import 'package:active_ecommerce_flutter/screens/patientScreens/storypage.dart';
import 'package:active_ecommerce_flutter/screens/patientScreens/doctors_list.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:active_ecommerce_flutter/screens/patientScreens/medicine_data.dart';
import 'package:active_ecommerce_flutter/ui_sections/main_drawer.dart';
import 'package:active_ecommerce_flutter/models/doctor_list.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'dart:async';
import 'package:active_ecommerce_flutter/data_handler/doctors_data_fetch.dart';
import 'package:active_ecommerce_flutter/screens/patientScreens/meeting_screen.dart';
import 'package:active_ecommerce_flutter/app_config.dart';
import 'package:active_ecommerce_flutter/ui_sections/bottom_navigation_doctor.dart';
import 'package:active_ecommerce_flutter/screens/patientScreens/meeting_screen.dart';
import 'package:active_ecommerce_flutter/app_config.dart';
import 'package:active_ecommerce_flutter/models/banners.dart';
import 'package:active_ecommerce_flutter/data_handler/fetch_banner.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title, this.show_back_button = false}) : super(key: key);

  final String title;
  bool show_back_button;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<Doctors> futureAlbum;
  Future<Banners> fetchBanner;

  @override
  void initState() {
    super.initState();
    futureAlbum = DoctorsData().fetchAlbum();
    fetchBanner = BannerData().fetchBanners();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    //print(MediaQuery.of(context).viewPadding.top);

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: buildAppBar(statusBarHeight, context),
        drawer: MainDrawer(),
        body: WillPopScope(
          onWillPop: () async {
            // You can do some work here.
            // Returning true allows the pop to happen, returning false prevents it.
            return false;
          },
          child: CustomScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      8.0,
                      16.0,
                      8.0,
                      0.0,
                    ),
                    child: buildHomeStoryRow(context),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.all(8.0),
                  //   child: Text.rich(
                  //     TextSpan(
                  //       style: TextStyle(
                  //         fontFamily: 'Arial',
                  //         fontSize: 26,
                  //         color: const Color(0xff858585),
                  //       ),
                  //       children: [
                  //         TextSpan(
                  //           text: '\n   Hello,\n',
                  //         ),
                  //         TextSpan(
                  //           text: '      ' + user_name.$.toUpperCase(),
                  //           style: TextStyle(
                  //             fontFamily: 'Arial',
                  //             fontSize: 26,
                  //             color: const Color(0xff858585),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     textHeightBehavior:
                  //         TextHeightBehavior(applyHeightToFirstAscent: false),
                  //     textAlign: TextAlign.left,
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(
                  //     8.0,
                  //     16.0,
                  //     8.0,
                  //     0.0,
                  //   ),
                  //   child: buildHomeSearchBox(context),
                  // ),
                  SizedBox(
                    height: 30,
                  )
                ]),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: FutureBuilder<Banners>(
                          future: fetchBanner,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Container(
                                height: 110,
                                child: CarouselSlider.builder(
                                  options: CarouselOptions(
                                    height: 180.0,
                                    enlargeCenterPage: true,
                                    autoPlay: true,
                                    aspectRatio: 16 / 9,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enableInfiniteScroll: true,
                                    autoPlayAnimationDuration:
                                        Duration(milliseconds: 800),
                                    viewportFraction: 0.8,
                                  ),
                                  itemCount: snapshot.data.banners.length,
                                  itemBuilder: (BuildContext context,
                                          int itemIndex, int) =>
                                      Container(
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            '${AppConfig.BANNER_URL}' +
                                                snapshot.data.banners[itemIndex]
                                                    .image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Center(
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      child: CircularProgressIndicator()));
                            }
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      8.0,
                      16.0,
                      8.0,
                      0.0,
                    ),
                    child: buildHomeMenuRow(context),
                  ),
                ]),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      16.0,
                      16.0,
                      8.0,
                      0.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Top Doctors',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 22,
                                color: const Color(0xff000000),
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DoctorsList();
                                }));
                              },
                              child: Text(
                                'See All',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 14,
                                  color: const Color(0xff000000),
                                ),
                                textAlign: TextAlign.left,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              //height: 300,
                              //color: Colors.pink,
                              child: buildDoctorOnlineRow()),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      16.0,
                      16.0,
                      8.0,
                      0.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Experience Us',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 22,
                                color: const Color(0xff000000),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            height: 150,
                            // width: 300,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: const Color(0xff6b0772),
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(6, 3),
                                  blurRadius: 16,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Text(
                                          'Doctors who care',
                                          style: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 20,
                                            color: Color(0xffffffff),
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.center,
                                        )),
                                    Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                          'Our doctors listen to you\npatiently and only prescribe \nwhat\'s necessary.',
                                          style: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 16,
                                            color: Color(0xffffffff),
                                          ),
                                          textAlign: TextAlign.left,
                                        )),
                                  ],
                                ),
                                Container(
                                  width: 100,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        right: 10,
                                        bottom: 5,
                                        child: Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Image.asset(
                                            "assets/images/welcome.png",
                                            height: 130,
                                            width: 80,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 150,
                            // width: 335,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              shape: BoxShape.rectangle,
                              color: const Color(0xfff3c306),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(6, 3),
                                  blurRadius: 16,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Text(
                                        'Curated Doctors',
                                        style: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 20,
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                          'We hand-pick doctors for you,\nonboarding after a multi-step \nscreening process.',
                                          style: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 16,
                                            color: const Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.left,
                                        )),
                                  ],
                                ),
                                Container(
                                  width: 100,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        right: 10,
                                        bottom: 5,
                                        child: Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Image.asset(
                                            "assets/images/exp2.png",
                                            height: 130,
                                            width: 80,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 150,
                            // width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              shape: BoxShape.rectangle,
                              color: const Color(0xfffdb0c7),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(6, 3),
                                  blurRadius: 16,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Text(
                                          'Secure',
                                          style: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 20,
                                            color: const Color(0xff000000),
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.center,
                                        )),
                                    Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                          'Noting is hidden. Access your\n records in your health locker,\n24*7  ',
                                          style: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 16,
                                            color: const Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.left,
                                        )),
                                  ],
                                ),
                                Container(
                                  width: 100,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        right: 10,
                                        bottom: 5,
                                        child: Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Image.asset(
                                            "assets/images/exp3.png",
                                            height: 130,
                                            width: 80,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }

  buildDoctorOnlineRow() {
    return FutureBuilder<Doctors>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.doctors.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DoctorsList();
                  }));
                },
                child: Container(
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
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 60.0,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            image: DecorationImage(
                              image: AssetImage('assets/placeholder.png'),
                              fit: BoxFit.cover,
                            ),
                            //shape: BoxShape.circle,
                          ),
                          child: Image.network('${AppConfig.IMAGE_URL}' +
                              snapshot.data.doctors[index].doctordetails.image),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data.doctors[index].doctordetails
                                        .firstName
                                        .toUpperCase() +
                                    "." +
                                    snapshot.data.doctors[index].doctordetails
                                        .lastName
                                        .toUpperCase(),
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 14,
                                  color: const Color(0xff000000),
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                snapshot.data.doctors[index].designation,
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 12,
                                  color: const Color(0xff858585),
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Row(
                                children: [
                                  SvgPicture.string(
                                    '<svg viewBox="1.6 1.9 9.3 8.9" ><path transform="translate(0.0, 0.0)" d="M 6.473546981811523 2.048804759979248 L 7.469562530517578 4.998483657836914 L 10.58250045776367 5.035536766052246 C 10.850022315979 5.038276672363281 10.96114730834961 5.378499984741211 10.74715137481689 5.539006233215332 L 8.250211715698242 7.397995948791504 L 9.177633285522461 10.37100982666016 C 9.257219314575195 10.6261682510376 8.967746734619141 10.83609008789062 8.748236656188965 10.68243312835693 L 6.207395076751709 8.881077766418457 L 3.667926549911499 10.68243312835693 C 3.448415994644165 10.83609008789062 3.158936262130737 10.62479877471924 3.238511562347412 10.37100982666016 L 4.16594123840332 7.397995948791504 L 1.669012069702148 5.539006233215332 C 1.453617930412292 5.378499984741211 1.564742803573608 5.038276672363281 1.832271575927734 5.035536766052246 L 4.94656229019165 4.998483657836914 L 5.942612648010254 2.048804759979248 C 6.027677059173584 1.793624877929688 6.388482093811035 1.793624877929688 6.473546981811523 2.048804759979248 Z" fill="#f3c306" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                  Text(
                                    '   5.0',
                                    style: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 12,
                                      color: const Color(0xff858585),
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return Container(
            width: 50,
            height: 50,
            child: Center(child: CircularProgressIndicator()));
      },
    );
  }

  ///Newly Added row................
  ///

  buildHomeStoryRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MoreStories()));
          },
          child: Container(
            height: 60,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xff6b0772),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    "assets/images/welcome.png",
                  ),
                ),
                // Adobe XD layer: 'surface1' (group)
                Positioned(
                  bottom: 4,
                  right: 3,
                  child: Container(
                    height: 15,
                    width: 15,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: SvgPicture.string(
                            '<svg viewBox="0.0 0.0 12.5 12.8" ><path transform="translate(-2.0, -2.0)" d="M 8.253783226013184 1.999999761581421 C 4.799543380737305 1.999999761581421 1.999999523162842 4.862797737121582 1.999999523162842 8.395085334777832 C 1.999999523162842 11.92734622955322 4.799543380737305 14.79017162322998 8.253783226013184 14.79017162322998 C 11.70799827575684 14.79017162322998 14.507568359375 11.92734622955322 14.507568359375 8.395085334777832 C 14.507568359375 4.862797737121582 11.70799827575684 1.999999761581421 8.253783226013184 1.999999761581421 Z M 10.75529766082764 9.03459358215332 L 8.87916088104248 9.03459358215332 L 8.87916088104248 10.95312023162842 L 7.628403663635254 10.95312023162842 L 7.628403663635254 9.03459358215332 L 5.752269744873047 9.03459358215332 L 5.752269744873047 7.755575656890869 L 7.628403663635254 7.755575656890869 L 7.628403663635254 5.837050914764404 L 8.87916088104248 5.837050914764404 L 8.87916088104248 7.755575656890869 L 10.75529766082764 7.755575656890869 L 10.75529766082764 9.03459358215332 Z" fill="#f3c306" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return Filter(
            //     selected_filter: "brands",
            //   );
            // }));
          },
          child: Container(
            height: 60,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xfff6b2e1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(
                "assets/images/lady1.png",
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 60,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xff6b0772),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(
                "assets/images/lady2.png",
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 60,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xfff6b2e1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(
                "assets/doctor.png",
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 60,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xfff3c306),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(
                "assets/images/lady.png",
              ),
            ),
          ),
        ),
        SizedBox(),
      ],
    );
  }

  buildHomeMenuRow(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DoctorsList(
                    parent_category_name: "Doctors Online",
                  );
                }));
              },
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width / 5 - 4,
                child: Column(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: const Color(0x80fdb0c7),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x33000000),
                              offset: Offset(6, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.string(
                              '<svg viewBox="0.0 0.0 18.5 18.5" ><path transform="translate(-3.95, -3.95)" d="M 5.368607521057129 3.949220418930054 C 4.584428310394287 3.949220418930054 3.949220418930054 4.584428310394287 3.949220418930054 5.368607521057129 L 3.949220418930054 18.14868927001953 C 3.949220418930054 18.93283271789551 4.584428310394287 19.56810760498047 5.368607521057129 19.56810760498047 L 12.95742797851562 19.56810760498047 C 13.75840950012207 21.24324226379395 15.46448421478271 22.40967178344727 17.44038581848145 22.40967178344727 C 20.177978515625 22.40967178344727 22.40967178344727 20.177978515625 22.40967178344727 17.44038581848145 C 22.40967178344727 15.46448421478271 21.24324226379395 13.75840950012207 19.56810760498047 12.95742797851562 L 19.56810760498047 5.368607521057129 C 19.56810760498047 4.584428310394287 18.93283271789551 3.949220418930054 18.14868927001953 3.949220418930054 L 5.368607521057129 3.949220418930054 Z M 5.368607521057129 5.368607521057129 L 18.14868927001953 5.368607521057129 L 18.14868927001953 8.207374572753906 L 5.368607521057129 8.207374572753906 L 5.368607521057129 5.368607521057129 Z M 8.918492317199707 10.33783721923828 C 9.309125900268555 10.33783721923828 9.629603385925293 10.65824413299561 9.629603385925293 11.04894733428955 C 9.629603385925293 11.43965244293213 9.309125900268555 11.75725364685059 8.918492317199707 11.75725364685059 C 8.527788162231445 11.75725364685059 8.207374572753906 11.43965244293213 8.207374572753906 11.04894733428955 C 8.207374572753906 10.65824413299561 8.527788162231445 10.33783721923828 8.918492317199707 10.33783721923828 Z M 11.75725364685059 10.33783721923828 C 12.15076351165771 10.33783721923828 12.46836376190186 10.65824413299561 12.46836376190186 11.04894733428955 C 12.46836376190186 11.43965244293213 12.15076351165771 11.75725364685059 11.75725364685059 11.75725364685059 C 11.36654758453369 11.75725364685059 11.04894733428955 11.43965244293213 11.04894733428955 11.04894733428955 C 11.04894733428955 10.65824413299561 11.36654758453369 10.33783721923828 11.75725364685059 10.33783721923828 Z M 14.5988187789917 10.33783721923828 C 14.98952293395996 10.33783721923828 15.3099308013916 10.65824413299561 15.3099308013916 11.04894733428955 C 15.3099308013916 11.43965244293213 14.98952293395996 11.75725364685059 14.5988187789917 11.75725364685059 C 14.20811462402344 11.75725364685059 13.88770771026611 11.43965244293213 13.88770771026611 11.04894733428955 C 13.88770771026611 10.65824413299561 14.20811462402344 10.33783721923828 14.5988187789917 10.33783721923828 Z M 17.44038581848145 10.33783721923828 C 17.83109092712402 10.33783721923828 18.14868927001953 10.65824413299561 18.14868927001953 11.04894733428955 C 18.14868927001953 11.43965244293213 17.83109092712402 11.75725364685059 17.44038581848145 11.75725364685059 C 17.046875 11.75725364685059 16.72927474975586 11.43965244293213 16.72927474975586 11.04894733428955 C 16.72927474975586 10.65824413299561 17.046875 10.33783721923828 17.44038581848145 10.33783721923828 Z M 6.07689094543457 13.17940235137939 C 6.470386981964111 13.17940235137939 6.78798770904541 13.49707508087158 6.78798770904541 13.88770771026611 C 6.78798770904541 14.28121852874756 6.470386981964111 14.5988187789917 6.07689094543457 14.5988187789917 C 5.686207294464111 14.5988187789917 5.368607521057129 14.28121852874756 5.368607521057129 13.88770771026611 C 5.368607521057129 13.49707508087158 5.686207294464111 13.17940235137939 6.07689094543457 13.17940235137939 Z M 8.918492317199707 13.17940235137939 C 9.309125900268555 13.17940235137939 9.629603385925293 13.49707508087158 9.629603385925293 13.88770771026611 C 9.629603385925293 14.28121852874756 9.309125900268555 14.5988187789917 8.918492317199707 14.5988187789917 C 8.527788162231445 14.5988187789917 8.207374572753906 14.28121852874756 8.207374572753906 13.88770771026611 C 8.207374572753906 13.49707508087158 8.527788162231445 13.17940235137939 8.918492317199707 13.17940235137939 Z M 11.75725364685059 13.17940235137939 C 12.15076351165771 13.17940235137939 12.46836376190186 13.49707508087158 12.46836376190186 13.88770771026611 C 12.46836376190186 14.28121852874756 12.15076351165771 14.5988187789917 11.75725364685059 14.5988187789917 C 11.36654758453369 14.5988187789917 11.04894733428955 14.28121852874756 11.04894733428955 13.88770771026611 C 11.04894733428955 13.49707508087158 11.36654758453369 13.17940235137939 11.75725364685059 13.17940235137939 Z M 17.44038581848145 13.88770771026611 C 19.40786743164062 13.88770771026611 20.99025535583496 15.47009754180908 20.99025535583496 17.44038581848145 C 20.99025535583496 19.40786743164062 19.40786743164062 20.99025535583496 17.44038581848145 20.99025535583496 C 15.47009754180908 20.99025535583496 13.88770771026611 19.40786743164062 13.88770771026611 17.44038581848145 C 13.88770771026611 15.47009754180908 15.47009754180908 13.88770771026611 17.44038581848145 13.88770771026611 Z M 17.42916107177734 14.5875940322876 C 17.0356502532959 14.59601306915283 16.72366333007812 14.91641998291016 16.72927474975586 15.3099308013916 L 16.72927474975586 17.73273086547852 L 17.9969425201416 19.00032615661621 C 18.17401695251465 19.18581962585449 18.44096183776855 19.2617301940918 18.6883373260498 19.19423866271973 C 18.93563842773438 19.13243293762207 19.13243293762207 18.93563842773438 19.19423866271973 18.6883373260498 C 19.2617301940918 18.44096183776855 19.18581962585449 18.17401695251465 19.00032615661621 17.9969425201416 L 18.14868927001953 17.14530754089355 L 18.14868927001953 15.3099308013916 C 18.15149688720703 15.11882400512695 18.07839202880859 14.93045043945312 17.94067573547363 14.7955379486084 C 17.80576324462891 14.66062641143799 17.62026786804199 14.58478832244873 17.42916107177734 14.5875940322876 Z M 6.07689094543457 16.01823616027832 C 6.470386981964111 16.01823616027832 6.78798770904541 16.33864212036133 6.78798770904541 16.72927474975586 C 6.78798770904541 17.11997985839844 6.470386981964111 17.44038581848145 6.07689094543457 17.44038581848145 C 5.686207294464111 17.44038581848145 5.368607521057129 17.11997985839844 5.368607521057129 16.72927474975586 C 5.368607521057129 16.33864212036133 5.686207294464111 16.01823616027832 6.07689094543457 16.01823616027832 Z M 8.918492317199707 16.01823616027832 C 9.309125900268555 16.01823616027832 9.629603385925293 16.33864212036133 9.629603385925293 16.72927474975586 C 9.629603385925293 17.11997985839844 9.309125900268555 17.44038581848145 8.918492317199707 17.44038581848145 C 8.527788162231445 17.44038581848145 8.207374572753906 17.11997985839844 8.207374572753906 16.72927474975586 C 8.207374572753906 16.33864212036133 8.527788162231445 16.01823616027832 8.918492317199707 16.01823616027832 Z M 11.75725364685059 16.01823616027832 C 12.15076351165771 16.01823616027832 12.46836376190186 16.33864212036133 12.46836376190186 16.72927474975586 C 12.46836376190186 17.11997985839844 12.15076351165771 17.44038581848145 11.75725364685059 17.44038581848145 C 11.36654758453369 17.44038581848145 11.04894733428955 17.11997985839844 11.04894733428955 16.72927474975586 C 11.04894733428955 16.33864212036133 11.36654758453369 16.01823616027832 11.75725364685059 16.01823616027832 Z" fill="#dd2c00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                              allowDrawingOutsideViewBox: true,
                              fit: BoxFit.fill,
                            ))),
                    Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Appointment',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 10,
                            color: const Color(0xff000000),
                          ),
                          textAlign: TextAlign.left,
                        ))
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MedicineData();
                }));
              },
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width / 5 - 4,
                child: Column(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: const Color(0x80f8cf95),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x33000000),
                              offset: Offset(6, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: // Adobe XD layer: 'surface1' (group)
                                Stack(
                              children: <Widget>[
                                Pinned.fromPins(
                                  Pin(start: 0.0, end: 0.0),
                                  Pin(start: 0.0, end: 0.0),
                                  child: SvgPicture.string(
                                    '<svg viewBox="0.0 0.0 16.2 16.1" ><path transform="translate(-2.97, -2.97)" d="M 14.17392063140869 2.96875 C 12.90151691436768 2.96875 11.63184547424316 3.448900699615479 10.6635274887085 4.417191982269287 L 4.416261672973633 10.66445732116699 C 2.482336521148682 12.59836196899414 2.482336521148682 15.7513370513916 4.416261672973633 17.68257904052734 C 4.477618217468262 17.74663352966309 4.552304267883301 17.79730224609375 4.637664318084717 17.83199310302734 C 4.637664318084717 17.83199310302734 4.637664318084717 17.83199310302734 4.640334129333496 17.83199310302734 C 6.584932804107666 19.57121086120605 9.567169189453125 19.54983711242676 11.43442440032959 17.68257904052734 L 17.68164825439453 11.43535614013672 C 19.61562347412109 9.501450538635254 19.61562347412109 6.348453998565674 17.68164825439453 4.417191982269287 C 16.716064453125 3.448900699615479 15.44632339477539 2.96875 14.17392063140869 2.96875 Z M 14.17392063140869 4.305159568786621 C 15.09689331054688 4.305159568786621 16.02246475219727 4.659933567047119 16.72937774658203 5.369489669799805 C 18.14579772949219 6.78591775894165 18.14579772949219 9.063931465148926 16.72937774658203 10.48042106628418 L 14.0805721282959 13.12923049926758 C 13.81916618347168 13.39329814910889 13.39236831665039 13.39329814910889 13.13096237182617 13.13189315795898 C 12.23735046386719 12.23828125 10.39679527282715 10.39772510528564 10.39679527282715 10.39772510528564 C 9.868590354919434 9.86952018737793 9.017659187316895 9.86952018737793 8.489521980285645 10.39772510528564 L 6.339520931243896 12.55035591125488 C 6.075438976287842 12.81442356109619 5.648641586303711 12.81442356109619 5.387229442596436 12.55035591125488 C 5.125818252563477 12.28895092010498 5.125818252563477 11.86748027801514 5.381896495819092 11.60607528686523 L 11.6184606552124 5.369489669799805 C 12.32537269592285 4.659933567047119 13.2482795715332 4.305159568786621 14.17392063140869 4.305159568786621 Z" fill="#a78602" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ))),
                    Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Medicine',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 10,
                            color: const Color(0xff000000),
                          ),
                          textAlign: TextAlign.left,
                        )),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return DoctorOnlineList(
                //     is_top_category: true,
                //     parent_category_name: "Doctors Online",
                //   );
                // }));
              },
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width / 5 - 4,
                child: Column(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: const Color(0x8096d8e5),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x33000000),
                              offset: Offset(6, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: // Adobe XD layer: 'surface1' (group)
                                Stack(
                              children: <Widget>[
                                Pinned.fromPins(
                                  Pin(start: 0.0, end: 0.0),
                                  Pin(start: 0.0, end: 0.0),
                                  child: SvgPicture.string(
                                    '<svg viewBox="0.0 0.0 19.3 14.8" ><path transform="translate(-1.97, -4.93)" d="M 19.74253273010254 4.933589935302734 L 3.455676078796387 4.933589935302734 C 2.63503360748291 4.933589935302734 1.972659826278687 5.595971584320068 1.972659826278687 6.413679599761963 L 1.972659826278687 18.26315498352051 C 1.972659826278687 19.08090782165527 2.63503360748291 19.7432746887207 3.455676078796387 19.7432746887207 L 19.74253273010254 19.7432746887207 C 20.56313705444336 19.7432746887207 21.22550201416016 19.08090782165527 21.22550201416016 18.26315498352051 L 21.22550201416016 6.413679599761963 C 21.22550201416016 5.595971584320068 20.56313705444336 4.933589935302734 19.74253273010254 4.933589935302734 Z M 13.08060264587402 16.78018379211426 L 4.935765743255615 16.78018379211426 C 4.525440692901611 16.78018379211426 4.194250583648682 16.45192527770996 4.194250583648682 16.04158592224121 C 4.194250583648682 15.63124656677246 4.525440692901611 15.30006408691406 4.935765743255615 15.30006408691406 L 13.08060264587402 15.30006408691406 C 13.49094390869141 15.30006408691406 13.81920051574707 15.63124656677246 13.81920051574707 16.04158592224121 C 13.81920051574707 16.45192527770996 13.49094390869141 16.78018379211426 13.08060264587402 16.78018379211426 Z M 10.85903549194336 13.07849502563477 L 4.935765743255615 13.07849502563477 C 4.525440692901611 13.07849502563477 4.194250583648682 12.7502384185791 4.194250583648682 12.33697319030762 C 4.194250583648682 11.92663192749023 4.525440692901611 11.59837532043457 4.935765743255615 11.59837532043457 L 10.85903549194336 11.59837532043457 C 11.26937675476074 11.59837532043457 11.59763336181641 11.92663192749023 11.59763336181641 12.33697319030762 C 11.59763336181641 12.7502384185791 11.26937675476074 13.07849502563477 10.85903549194336 13.07849502563477 Z M 13.08060264587402 9.376808166503906 L 4.935765743255615 9.376808166503906 C 4.525440692901611 9.376808166503906 4.194250583648682 9.045623779296875 4.194250583648682 8.635278701782227 C 4.194250583648682 8.224952697753906 4.525440692901611 7.8966965675354 4.935765743255615 7.8966965675354 L 13.08060264587402 7.8966965675354 C 13.49094390869141 7.8966965675354 13.81920051574707 8.224952697753906 13.81920051574707 8.635278701782227 C 13.81920051574707 9.045623779296875 13.49094390869141 9.376808166503906 13.08060264587402 9.376808166503906 Z M 17.5238151550293 10.11833190917969 L 16.04084396362305 8.635278701782227 L 17.5238151550293 7.155187606811523 L 19.00393486022949 8.635278701782227 L 17.5238151550293 10.11833190917969 Z M 17.5238151550293 13.81994247436523 L 16.04084396362305 12.33697319030762 L 17.5238151550293 10.85685348510742 L 19.00393486022949 12.33697319030762 L 17.5238151550293 13.81994247436523 Z M 17.5238151550293 17.52163124084473 L 16.04084396362305 16.04158592224121 L 17.5238151550293 14.55854034423828 L 19.00393486022949 16.04158592224121 L 17.5238151550293 17.52163124084473 Z" fill="#0aa5a8" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ))),
                    Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Test Report',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 10,
                            color: const Color(0xff000000),
                          ),
                          textAlign: TextAlign.left,
                        )),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return VideoCall1();
                }));
              },
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width / 5 - 4,
                child: Column(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: const Color(0x80c398e7),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x33000000),
                              offset: Offset(6, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: // Adobe XD layer: 'surface1' (group)
                                Stack(
                              children: <Widget>[
                                Pinned.fromPins(
                                  Pin(start: 0.0, end: 0.0),
                                  Pin(start: 0.0, end: 0.0),
                                  child: SvgPicture.string(
                                    '<svg viewBox="0.0 0.0 18.5 17.6" ><path transform="translate(-1.98, -2.98)" d="M 16.54952049255371 2.976560115814209 C 15.53017234802246 2.976560115814209 14.70304775238037 3.803684949874878 14.70304775238037 4.823054790496826 C 14.70304775238037 5.842420101165771 15.53017234802246 6.669565677642822 16.54952049255371 6.669565677642822 C 17.56891250610352 6.669565677642822 18.39603805541992 5.842420101165771 18.39603805541992 4.823054790496826 C 18.39603805541992 3.803684949874878 17.56891250610352 2.976560115814209 16.54952049255371 2.976560115814209 Z M 4.446367263793945 3.386892795562744 C 4.15234899520874 3.386892795562744 3.882565498352051 3.543595552444458 3.735556602478027 3.7972252368927 L 2.394708395004272 3.7972252368927 C 2.168543577194214 3.7972252368927 1.98438024520874 3.981388807296753 1.98438024520874 4.207558155059814 L 1.98438024520874 7.490198135375977 C 1.98438024520874 10.06528663635254 3.974649429321289 12.18156814575195 6.498009204864502 12.39157581329346 C 6.498009204864502 12.39802742004395 6.498009204864502 12.40609169006348 6.498009204864502 12.41258430480957 C 6.498009204864502 13.41903018951416 6.480267524719238 14.81802845001221 7.100611686706543 16.02153778076172 C 7.722568035125732 17.2250862121582 9.035959243774414 18.1572151184082 11.3686990737915 18.1572151184082 C 12.57708740234375 18.1572151184082 13.51244258880615 17.77433967590332 14.21355533599854 17.22024726867676 L 14.21516799926758 17.24609565734863 C 15.04713153839111 16.59341049194336 15.53662395477295 15.69362545013428 15.81772327423096 14.86327171325684 C 15.84034442901611 14.79540824890137 15.86296558380127 14.72915458679199 15.88232135772705 14.66294384002686 C 15.90816974639893 14.58056259155273 15.93079090118408 14.50301933288574 15.95180034637451 14.42386245727539 C 15.99059200286865 14.2784538269043 16.02289009094238 14.1395378112793 16.04874038696289 14.00541973114014 C 16.05196571350098 13.98279857635498 16.05519104003906 13.9634428024292 16.05841636657715 13.94082069396973 C 16.07942390441895 13.82448673248291 16.0939826965332 13.72109508514404 16.10527229309082 13.61770534515381 C 16.12628173828125 13.44326591491699 16.13918495178223 13.28007221221924 16.13918495178223 13.14922142028809 C 16.13918495178223 13.14760780334473 16.13918495178223 13.14760780334473 16.13918495178223 13.14760780334473 L 16.13918495178223 12.3495569229126 C 15.54795551300049 12.1734619140625 15.11338424682617 11.6242094039917 15.11338424682617 10.97640514373779 C 15.11338424682617 10.18484687805176 15.75796222686768 9.540268898010254 16.54952049255371 9.540268898010254 C 17.34112167358398 9.540268898010254 17.9857006072998 10.18484687805176 17.9857006072998 10.97640514373779 C 17.9857006072998 11.6242094039917 17.55112838745117 12.1734619140625 16.95985984802246 12.3495569229126 L 16.95985984802246 13.14760780334473 C 16.95985984802246 13.98279857635498 16.6835994720459 15.38183784484863 15.90171718597412 16.58695793151855 C 15.54468822479248 17.13947868347168 15.01805782318115 17.74687767028809 14.26363754272461 18.20890998840332 L 14.38803768157959 20.61919403076172 L 18.7110481262207 20.61919403076172 L 19.01154327392578 14.79701995849609 L 20.44767951965332 14.20575046539307 L 20.44767951965332 11.10080528259277 C 20.44767951965332 8.881133079528809 18.69810485839844 7.079861164093018 16.54952049255371 7.079861164093018 C 14.39932632446289 7.079861164093018 12.65136337280273 8.881133079528809 12.65136337280273 11.10080528259277 L 12.65136337280273 14.20575046539307 L 14.0875415802002 14.79701995849609 L 14.15863418579102 16.16210556030273 C 13.57381534576416 16.83414459228516 12.71600341796875 17.33654022216797 11.3686990737915 17.33654022216797 C 9.241127014160156 17.33654022216797 8.325128555297852 16.6047420501709 7.830796718597412 15.64515399932861 C 7.334853172302246 14.68717670440674 7.31868314743042 13.41903018951416 7.31868314743042 12.41258430480957 C 7.31868314743042 12.40609169006348 7.31868314743042 12.39802742004395 7.31868314743042 12.39157581329346 C 9.840461730957031 12.18156814575195 11.83073139190674 10.06528663635254 11.83073139190674 7.490198135375977 L 11.83073139190674 4.207558155059814 C 11.83073139190674 3.981388807296753 11.64657211303711 3.7972252368927 11.42039489746094 3.7972252368927 L 10.0795431137085 3.7972252368927 C 9.932521820068359 3.543595552444458 9.662755012512207 3.386892795562744 9.368711471557617 3.386892795562744 C 8.916398048400879 3.386892795562744 8.548079490661621 3.753607034683228 8.548079490661621 4.207558155059814 C 8.548079490661621 4.661504745483398 8.916398048400879 5.028219223022461 9.368711471557617 5.028219223022461 C 9.662755012512207 5.028219223022461 9.934134483337402 4.871516227722168 10.0795431137085 4.617886543273926 L 11.01005744934082 4.617886543273926 L 11.01005744934082 7.490198135375977 C 11.01005744934082 9.759953498840332 9.1781005859375 11.59190940856934 6.908346176147461 11.59190940856934 C 4.6369948387146 11.59190940856934 2.805041074752808 9.759953498840332 2.805041074752808 7.490198135375977 L 2.805041074752808 4.617886543273926 L 3.737174034118652 4.617886543273926 C 3.884182929992676 4.871516227722168 4.15234899520874 5.028219223022461 4.446367263793945 5.028219223022461 C 4.900318622589111 5.028219223022461 5.267032146453857 4.661504745483398 5.267032146453857 4.207558155059814 C 5.267032146453857 3.753607034683228 4.900318622589111 3.386892795562744 4.446367263793945 3.386892795562744 Z M 16.54952049255371 10.36090087890625 C 16.20866394042969 10.36090087890625 15.93401622772217 10.63716125488281 15.93401622772217 10.97640514373779 C 15.93401622772217 11.31726455688477 16.20866394042969 11.59190940856934 16.54952049255371 11.59190940856934 C 16.88876724243164 11.59190940856934 17.1650276184082 11.31726455688477 17.1650276184082 10.97640514373779 C 17.1650276184082 10.63716125488281 16.88876724243164 10.36090087890625 16.54952049255371 10.36090087890625 Z" fill="#f8004a" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ))),
                    Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Diagnosis',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 10,
                            color: const Color(0xff000000),
                          ),
                          textAlign: TextAlign.left,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(),
          ],
        ),

        ///Second Row
        ///

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width / 5 - 4,
                child: Column(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: const Color(0x80fdb0c7),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x33000000),
                              offset: Offset(6, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: // Adobe XD layer: 'surface1' (group)
                                Stack(
                              children: <Widget>[
                                Pinned.fromPins(
                                  Pin(start: 0.0, end: 0.0),
                                  Pin(start: 0.0, end: 0.0),
                                  child: SvgPicture.string(
                                    '<svg viewBox="0.0 0.0 19.6 17.8" ><path transform="translate(0.0, -2.16)" d="M 9.810125350952148 2.15625 C 9.052953720092773 2.15625 8.442420959472656 2.766767501831055 8.442420959472656 3.520927429199219 C 8.442420959472656 3.79026985168457 8.442420959472656 4.789837837219238 8.442420959472656 5.03225040435791 L 11.17775058746338 5.03225040435791 C 11.17775058746338 4.783854007720947 11.17775058746338 3.79026985168457 11.17775058746338 3.520927429199219 C 11.17775058746338 2.766767501831055 10.56430816650391 2.15625 9.810125350952148 2.15625 Z M 0.7541638016700745 5.786410808563232 C 0.338176429271698 5.786410808563232 0 6.124589920043945 0 6.540578365325928 L 0 17.10487747192383 C 0 17.52081298828125 0.338176429271698 17.85898399353027 0.7541638016700745 17.85898399353027 L 2.262495279312134 17.85898399353027 C 2.44803786277771 16.55716896057129 3.555347442626953 15.54862880706787 4.905054569244385 15.54862880706787 C 6.254769325256348 15.54862880706787 7.35908317565918 16.55716896057129 7.544633865356445 17.85898399353027 L 12.85068321228027 17.85898399353027 C 13.03325271606445 16.56613159179688 14.12560749053955 15.57260894775391 15.46634387969971 15.57260894775391 C 16.81006622314453 15.57260894775391 17.89943504333496 16.56613159179688 18.08499145507812 17.85898399353027 L 18.86307907104492 17.85898399353027 C 19.27908897399902 17.85898399353027 19.61726188659668 17.52081298828125 19.61726188659668 17.10487747192383 L 19.61726188659668 14.08523464202881 C 19.61726188659668 13.37295913696289 19.02764320373535 12.55296516418457 19.02764320373535 12.55296516418457 L 14.33506870269775 6.540578365325928 C 13.99092102050781 6.124589920043945 13.75748062133789 5.786410808563232 13.20387172698975 5.786410808563232 L 0.7541638016700745 5.786410808563232 Z M 6.036306381225586 7.130142211914062 C 7.793045043945312 7.130142211914062 9.220583915710449 8.560638427734375 9.220583915710449 10.31439685821533 C 9.220583915710449 12.06815528869629 7.793045043945312 13.49561882019043 6.036306381225586 13.49561882019043 C 4.279582023620605 13.49561882019043 2.852059125900269 12.06815528869629 2.852059125900269 10.31439685821533 C 2.852059125900269 8.560638427734375 4.279582023620605 7.130142211914062 6.036306381225586 7.130142211914062 Z M 5.282138347625732 8.048906326293945 L 5.282138347625732 9.557225227355957 L 3.773810625076294 9.557225227355957 L 3.773810625076294 11.06857967376709 L 5.282138347625732 11.06857967376709 L 5.282138347625732 12.57686901092529 L 6.790465831756592 12.57686901092529 L 6.790465831756592 11.06857967376709 L 8.298770904541016 11.06857967376709 L 8.298770904541016 9.557225227355957 L 6.790465831756592 9.557225227355957 L 6.790465831756592 8.048906326293945 L 5.282138347625732 8.048906326293945 Z M 12.07259750366211 8.048906326293945 L 13.98195743560791 8.048906326293945 C 14.10170459747314 8.048906326293945 14.26626968383789 8.237482070922852 14.26626968383789 8.237482070922852 L 17.11836051940918 11.93944549560547 C 17.25894546508789 12.14591884613037 17.42358779907227 12.3883228302002 17.42358779907227 12.57686901092529 L 12.07259750366211 12.57686901092529 L 12.07259750366211 8.048906326293945 Z M 4.905054569244385 16.49135780334473 C 3.941402673721313 16.49135780334473 3.160305500030518 17.27243041992188 3.160305500030518 18.23607635498047 C 3.160305500030518 19.19972038269043 3.941402673721313 19.98087120056152 4.905054569244385 19.98087120056152 C 5.868714332580566 19.98087120056152 6.649811744689941 19.19972038269043 6.649811744689941 18.23607635498047 C 6.649811744689941 17.27243041992188 5.868714332580566 16.49135780334473 4.905054569244385 16.49135780334473 Z M 15.46634387969971 16.49135780334473 C 14.50269985198975 16.49135780334473 13.72162532806396 17.27243041992188 13.72162532806396 18.23607635498047 C 13.72162532806396 19.19972038269043 14.50269985198975 19.98087120056152 15.46634387969971 19.98087120056152 C 16.43297576904297 19.98087120056152 17.21412658691406 19.19972038269043 17.21412658691406 18.23607635498047 C 17.21412658691406 17.27243041992188 16.43297576904297 16.49135780334473 15.46634387969971 16.49135780334473 Z" fill="#6b00c3" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ))),
                    Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Ambulance',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 10,
                            color: const Color(0xff000000),
                          ),
                          textAlign: TextAlign.left,
                        ))
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width / 5 - 4,
                child: Column(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: const Color(0x80f8cf95),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x33000000),
                              offset: Offset(6, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: // Adobe XD layer: 'surface1' (group)
                                Stack(
                              children: <Widget>[
                                Pinned.fromPins(
                                  Pin(start: 0.0, end: 0.0),
                                  Pin(start: 1.6, end: 0.0),
                                  child: SvgPicture.string(
                                    '<svg viewBox="0.0 1.6 12.9 16.1" ><path transform="translate(-8.0, -4.39)" d="M 19.30207252502441 6.000000953674316 L 15.26561450958252 6.000000953674316 C 15.26561450958252 6.446218490600586 14.90455341339111 6.807291507720947 14.45832538604736 6.807291507720947 C 14.01209449768066 6.807291507720947 13.65103435516357 6.446218490600586 13.65103435516357 6.000000953674316 L 9.614581108093262 6.000000953674316 C 8.722145080566406 6.000000953674316 8 6.722146511077881 8 7.61458158493042 L 8 20.53123474121094 C 8 21.42365074157715 8.722145080566406 22.14581489562988 9.614581108093262 22.14581489562988 L 19.30207252502441 22.14581489562988 C 20.19448852539062 22.14581489562988 20.91665267944336 21.42365074157715 20.91665267944336 20.53123474121094 L 20.91665267944336 7.61458158493042 C 20.91665267944336 6.722146511077881 20.19448852539062 6.000000953674316 19.30207252502441 6.000000953674316" fill="#0aa5a8" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(start: 1.2, end: 1.2),
                                  Pin(size: 13.7, end: 1.2),
                                  child: SvgPicture.string(
                                    '<svg viewBox="1.2 2.8 10.5 13.7" ><path transform="translate(-9.79, -6.17)" d="M 21.09113121032715 22.72394180297852 L 11.40364646911621 22.72394180297852 C 11.18131828308105 22.72394180297852 11 22.5426197052002 11 22.32029342651367 L 11 9.403646469116211 C 11 9.181326866149902 11.18131828308105 9 11.40364646911621 9 L 21.09113121032715 9 C 21.31345748901367 9 21.49477767944336 9.181326866149902 21.49477767944336 9.403646469116211 L 21.49477767944336 22.32029342651367 C 21.49477767944336 22.5426197052002 21.31345748901367 22.72394180297852 21.09113121032715 22.72394180297852" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(start: 2.8, end: 2.8),
                                  Pin(size: 2.4, start: 1.6),
                                  child: SvgPicture.string(
                                    '<svg viewBox="2.8 1.6 7.3 2.4" ><path transform="translate(-12.17, -4.39)" d="M 19.44009971618652 6.000000953674316 C 19.44009971618652 6.446218490600586 19.07903861999512 6.807291507720947 18.63280868530273 6.807291507720947 C 18.18658065795898 6.807291507720947 17.82551765441895 6.446218490600586 17.82551765441895 6.000000953674316 L 15 6.000000953674316 L 15 7.61458158493042 C 15 8.060811996459961 15.36106300354004 8.421872138977051 15.80729103088379 8.421872138977051 L 21.45832824707031 8.421872138977051 C 21.9045581817627 8.421872138977051 22.26561737060547 8.060811996459961 22.26561737060547 7.61458158493042 L 22.26561737060547 6.000000953674316 L 19.44009971618652 6.000000953674316 Z" fill="#90a4ae" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 3.2, middle: 0.5),
                                  Pin(size: 3.2, start: 0.0),
                                  child: SvgPicture.string(
                                    '<svg viewBox="4.8 0.0 3.2 3.2" ><path transform="translate(-15.16, -2.0)" d="M 21.61458206176758 2 C 20.7237377166748 2 20 2.723723888397217 20 3.614581346511841 C 20 4.505439281463623 20.7237377166748 5.22916316986084 21.61458206176758 5.22916316986084 C 22.50542831420898 5.22916316986084 23.22916221618652 4.505439281463623 23.22916221618652 3.614581346511841 C 23.22916221618652 2.723723888397217 22.50542831420898 2 21.61458206176758 2 M 21.61458206176758 4.421872615814209 C 21.16835403442383 4.421872615814209 20.80729293823242 4.060799121856689 20.80729293823242 3.614581346511841 C 20.80729293823242 3.168363332748413 21.16835403442383 2.807290554046631 21.61458206176758 2.807290554046631 C 22.06081199645996 2.807290554046631 22.42187309265137 3.168363332748413 22.42187309265137 3.614581346511841 C 22.42187309265137 4.060799121856689 22.06081199645996 4.421872615814209 21.61458206176758 4.421872615814209" fill="#90a4ae" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 2.4, middle: 0.7308),
                                  Pin(size: 1.0, middle: 0.4335),
                                  child: SvgPicture.string(
                                    '<svg viewBox="7.7 7.3 2.4 1.0" ><path transform="translate(-19.33, -12.73)" d="M 27 20 L 29.42187118530273 20 L 29.42187118530273 20.80729293823242 L 27 20.80729293823242 L 27 20 Z" fill="#57c5c7" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 2.4, middle: 0.7308),
                                  Pin(size: 1.0, middle: 0.3372),
                                  child: SvgPicture.string(
                                    '<svg viewBox="7.7 5.7 2.4 1.0" ><path transform="translate(-19.33, -10.35)" d="M 27 16 L 29.42187118530273 16 L 29.42187118530273 16.80729293823242 L 27 16.80729293823242 L 27 16 Z" fill="#57c5c7" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 2.4, middle: 0.7308),
                                  Pin(size: 1.0, middle: 0.5298),
                                  child: SvgPicture.string(
                                    '<svg viewBox="7.7 8.9 2.4 1.0" ><path transform="translate(-19.33, -15.12)" d="M 27 24.00000381469727 L 29.42187118530273 24.00000381469727 L 29.42187118530273 24.80729293823242 L 27 24.80729293823242 L 27 24.00000381469727 Z" fill="#57c5c7" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(start: 2.8, end: 2.8),
                                  Pin(size: 1.0, middle: 0.6262),
                                  child: SvgPicture.string(
                                    '<svg viewBox="2.8 10.5 7.3 1.0" ><path transform="translate(-12.17, -17.51)" d="M 15 28.00000190734863 L 22.26561737060547 28.00000190734863 L 22.26561737060547 28.80729103088379 L 15 28.80729103088379 L 15 28.00000190734863 Z" fill="#57c5c7" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(start: 2.8, end: 2.8),
                                  Pin(size: 1.0, middle: 0.7225),
                                  child: SvgPicture.string(
                                    '<svg viewBox="2.8 12.1 7.3 1.0" ><path transform="translate(-12.17, -19.89)" d="M 15 32 L 22.26561737060547 32 L 22.26561737060547 32.80728912353516 L 15 32.80728912353516 L 15 32 Z" fill="#57c5c7" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(start: 2.8, end: 2.8),
                                  Pin(size: 1.0, middle: 0.8188),
                                  child: SvgPicture.string(
                                    '<svg viewBox="2.8 13.7 7.3 1.0" ><path transform="translate(-12.17, -22.28)" d="M 15 36 L 22.26561737060547 36 L 22.26561737060547 36.80729293823242 L 15 36.80729293823242 L 15 36 Z" fill="#57c5c7" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 4.0, middle: 0.3182),
                                  Pin(size: 1.6, middle: 0.425),
                                  child: SvgPicture.string(
                                    '<svg viewBox="2.8 6.9 4.0 1.6" ><path transform="translate(-12.17, -12.14)" d="M 15 19.00000190734863 L 19.03645324707031 19.00000190734863 L 19.03645324707031 20.61458206176758 L 15 20.61458206176758 L 15 19.00000190734863 Z" fill="#f44336" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 1.6, middle: 0.3571),
                                  Pin(size: 4.0, middle: 0.4118),
                                  child: SvgPicture.string(
                                    '<svg viewBox="4.0 5.7 1.6 4.0" ><path transform="translate(-13.96, -10.35)" d="M 18 16 L 19.61458206176758 16 L 19.61458206176758 20.03645515441895 L 18 20.03645515441895 L 18 16 Z" fill="#f44336" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ))),
                    Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Prescription',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 10,
                            color: const Color(0xff000000),
                          ),
                          textAlign: TextAlign.left,
                        )),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width / 5 - 4,
                child: Column(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: const Color(0x8096d8e5),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x33000000),
                              offset: Offset(6, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: // Adobe XD layer: 'surface1' (group)
                                Stack(
                              children: <Widget>[
                                Pinned.fromPins(
                                  Pin(start: 0.0, end: 0.0),
                                  Pin(start: 0.0, end: 0.0),
                                  child: SvgPicture.string(
                                    '<svg viewBox="0.0 0.0 11.5 17.8" ><path transform="translate(-11.0, -4.0)" d="M 22.53956604003906 15.9833927154541 C 22.53956604003906 19.17861175537109 19.96500015258789 21.75317764282227 16.7697811126709 21.75317764282227 C 13.57456493377686 21.75317764282227 11 19.17861175537109 11 15.9833927154541 C 11 12.78817749023438 16.7697811126709 4 16.7697811126709 4 C 16.7697811126709 4 22.53956604003906 12.78817749023438 22.53956604003906 15.9833927154541 Z" fill="#dd2c00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 4.4, middle: 0.3125),
                                  Pin(size: 4.4, end: 2.2),
                                  child: SvgPicture.string(
                                    '<svg viewBox="2.2 11.1 4.4 4.4" ><path transform="translate(-13.78, -17.9)" d="M 19.55063438415527 33.43829727172852 C 17.59849548339844 33.43829727172852 16 31.83979797363281 16 29.88766098022461 C 16 29.39873886108398 16.39873695373535 29.00000381469727 16.88766098022461 29.00000381469727 C 17.37658309936523 29.00000381469727 17.77531814575195 29.39873886108398 17.77531814575195 29.88766098022461 C 17.77531814575195 30.86373138427734 18.57456588745117 31.66297912597656 19.55063438415527 31.66297912597656 C 20.03955841064453 31.66297912597656 20.43829345703125 32.06171417236328 20.43829345703125 32.55063247680664 C 20.43829345703125 33.03955841064453 20.03955841064453 33.43829727172852 19.55063438415527 33.43829727172852 Z" fill="#ffccbc" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ))),
                    Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Blood Bank',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 10,
                            color: const Color(0xff000000),
                          ),
                          textAlign: TextAlign.left,
                        )),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BottomBar2();
                }));
              },
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width / 5 - 4,
                child: Column(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: const Color(0x8096d8e5),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x33000000),
                              offset: Offset(6, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: // Adobe XD layer: 'surface1' (group)
                                Stack(
                              children: <Widget>[
                                Pinned.fromPins(
                                  Pin(start: 0.0, end: 0.0),
                                  Pin(start: 0.0, end: 0.0),
                                  child: SvgPicture.string(
                                    '<svg viewBox="0.0 0.0 18.9 18.9" ><path transform="translate(-1.17, -1.17)" d="M 10.61991024017334 1.167969942092896 C 5.400557994842529 1.167969942092896 1.167969942092896 5.400557994842529 1.167969942092896 10.61991024017334 C 1.167969942092896 15.83610248565674 5.400557994842529 20.06865501403809 10.61991024017334 20.06865501403809 C 15.83610248565674 20.06865501403809 20.06865501403809 15.83610248565674 20.06865501403809 10.61991024017334 C 20.06865501403809 5.400557994842529 15.83610248565674 1.167969942092896 10.61991024017334 1.167969942092896 Z M 10.57547950744629 16.391357421875 C 9.820330619812012 16.391357421875 9.226982116699219 15.79483985900879 9.226982116699219 15.0428581237793 C 9.226982116699219 14.2908763885498 9.820330619812012 13.69760894775391 10.57547950744629 13.69760894775391 C 11.324294090271 13.69760894775391 11.92397880554199 14.2908763885498 11.92397880554199 15.0428581237793 C 11.92397880554199 15.79483985900879 11.3274621963501 16.391357421875 10.57547950744629 16.391357421875 Z M 12.55850887298584 10.2835578918457 L 11.67965412139893 11.04504299163818 C 11.01969909667969 11.62888813018799 11.13073539733887 11.91122531890869 11.13073539733887 12.26975440979004 L 10.14718151092529 12.26975440979004 L 10.14718151092529 11.90805816650391 C 10.14718151092529 10.17569065093994 11.80335903167725 9.874263763427734 11.80335903167725 7.313789844512939 C 11.80335903167725 6.327027320861816 11.47975921630859 5.879656314849854 10.66117382049561 5.879656314849854 C 9.90919017791748 5.879656314849854 9.57283878326416 6.247710704803467 9.680706024169922 7.1329345703125 C 9.747390747070312 7.694531917572021 9.185799598693848 7.916625499725342 8.814520835876465 7.916625499725342 C 8.398892402648926 7.916625499725342 8.046716690063477 7.500981330871582 8.046716690063477 6.936215877532959 C 8.046716690063477 5.984363079071045 9.046175003051758 4.984913349151611 10.78804588317871 4.984913349151611 C 12.48240089416504 4.984913349151611 13.95777320861816 5.749565601348877 13.95777320861816 7.593001365661621 C 13.96093940734863 8.735244750976562 13.5420618057251 9.423709869384766 12.55850887298584 10.2835578918457 Z" fill="#a78602" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ))),
                    Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Help Line',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 10,
                            color: const Color(0xff000000),
                          ),
                          textAlign: TextAlign.left,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(),
          ],
        ),
      ],
    );
  }

  AppBar buildAppBar(double statusBarHeight, BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      leading: Container(
        //width: 120,
        child: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState.openDrawer();
          },
          child: widget.show_back_button
              ? Builder(
                  builder: (context) => IconButton(
                    icon: Icon(Icons.arrow_back, color: MyTheme.dark_grey),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                )

              ///change here
              : Builder(
                  builder: (context) => Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                    child: Container(
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
                              color: HexColor('33BEA3'),
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
                                  width: 1.0, color: HexColor('33BEA3')),
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
                              color: HexColor('33BEA3'),
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
                                  width: 1.0, color: HexColor('33BEA3')),
                            ),
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
        ),
      ),
      elevation: 0.0,
      titleSpacing: 0,
      toolbarHeight: 60,
    );
  }

  buildHomeSearchBox(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 3 / 5,
      child: Row(
        children: [
          SizedBox(
            width: 8,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: const Color(0xffffffff),
              border: Border.all(width: 1.0, color: const Color(0xffedccef)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x4d6b0772),
                  offset: Offset(6, 3),
                  blurRadius: 12,
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.9 - 50,
            child: TextField(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return Filter();
                // }));
              },
              autofocus: false,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search",
                  hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 0.1),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  contentPadding: EdgeInsets.only(left: 10.0, top: 15)),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Container(
            height: 50,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: const Color(0xffffffff),
              border: Border.all(width: 1.0, color: const Color(0xffedccef)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x4d6b0772),
                  offset: Offset(6, 3),
                  blurRadius: 12,
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                'assets/filter.png',
                height: 25,
                width: 25,

                fit: BoxFit.scaleDown,
                //color: MyTheme.dark_grey,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
