import 'package:active_ecommerce_flutter/screens/patientScreens/ChatRoom.dart';
import 'package:active_ecommerce_flutter/screens/patientScreens/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:custom_horizontal_calendar/custom_horizontal_calendar.dart';
import 'package:custom_horizontal_calendar/date_row.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:active_ecommerce_flutter/Message.dart';
import 'package:active_ecommerce_flutter/models/doctor_list.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:active_ecommerce_flutter/data_handler/doctors_data_fetch.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:active_ecommerce_flutter/app_config.dart';

class DoctorScreen extends StatefulWidget {
  DoctorScreen({Key key, this.is_base_category = false, this.id})
      : super(key: key);

  final bool is_base_category;
  final int id;

  @override
  DoctorScreenState createState() => DoctorScreenState();
}

class DoctorScreenState extends State<DoctorScreen> {
  Future<Doctors> futureAlbum;
  DateTime chosen = DateTime.now();
  //String selected = "Call";
  List<String> _locations = ['Call', 'Chat', 'Video']; // Option 2
  String _selectedLocation = "Call";

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    futureAlbum = DoctorsData().fetchAlbum();
    print(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: Stack(children: [
          CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                buildMethodList(),
              ])),
            ],
          ),
          Column(
            children: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ]));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: 0,
      centerTitle: true,
      leading: widget.is_base_category
          ? GestureDetector(
              onTap: () {
                // _scaffoldKey.currentState.openDrawer();
              },
              child: Column(
                children: [
                  Builder(
                    builder: (context) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 0.0),
                      child: Container(
                        child: Image.asset(
                          'assets/hamburger.png',
                          height: 16,
                          color: MyTheme.dark_grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Builder(
                  builder: (context) => IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
      elevation: 0.0,
      titleSpacing: 0,
    );
  }

  buildMethodList() {
    return FutureBuilder<Doctors>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          for (int i = 0; i < snapshot.data.doctors.length; i++) {
            if (snapshot.data.doctors[i].id == widget.id) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Center(
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          '${AppConfig.IMAGE_URL}' +
                              snapshot.data.doctors[i].doctordetails.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.85,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Center(
                                      child: Container(
                                        child: Text(
                                          "Dr. " +
                                              snapshot.data.doctors[i]
                                                  .doctordetails.firstName
                                                  .toUpperCase() +
                                              "." +
                                              snapshot.data.doctors[i]
                                                  .doctordetails.lastName
                                                  .toUpperCase(),
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                          // maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                              //height: 1.6,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Center(
                                  child: Container(
                                      child: Text(
                                    snapshot.data.doctors[i].designation,
                                    style: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 12,
                                      color: const Color(0xff858585),
                                    ),
                                    textAlign: TextAlign.left,
                                  )),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      SvgPicture.string(
                                        '<svg viewBox="116.2 318.1 12.5 10.4" ><path transform="translate(114.62, 316.29)" d="M 8.165374755859375 2.08109188079834 L 9.504015922546387 5.528390407562256 L 13.68779182434082 5.571694374084473 C 14.04734039306641 5.574896335601807 14.19669151306152 5.972516536712646 13.90908241271973 6.160100936889648 L 10.5532054901123 8.332707405090332 L 11.79965591430664 11.80727767944336 C 11.90661907196045 12.10548114776611 11.51757049560547 12.3508186340332 11.22254943847656 12.17123889923096 L 7.807668209075928 10.06598949432373 L 4.394632816314697 12.17123889923096 C 4.099611282348633 12.3508186340332 3.710551261901855 12.10388088226318 3.817500352859497 11.80727767944336 L 5.063962936401367 8.332707405090332 L 1.708099603652954 6.160100936889648 C 1.418610811233521 5.972516536712646 1.567962169647217 5.574896335601807 1.927519798278809 5.571694374084473 L 6.113113880157471 5.528390407562256 L 7.451801776885986 2.08109188079834 C 7.566127777099609 1.782862544059753 8.051047325134277 1.782862544059753 8.165374755859375 2.08109188079834 Z" fill="#33BEA3" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                        allowDrawingOutsideViewBox: true,
                                        fit: BoxFit.fill,
                                      ),
                                      SvgPicture.string(
                                        '<svg viewBox="116.2 318.1 12.5 10.4" ><path transform="translate(114.62, 316.29)" d="M 8.165374755859375 2.08109188079834 L 9.504015922546387 5.528390407562256 L 13.68779182434082 5.571694374084473 C 14.04734039306641 5.574896335601807 14.19669151306152 5.972516536712646 13.90908241271973 6.160100936889648 L 10.5532054901123 8.332707405090332 L 11.79965591430664 11.80727767944336 C 11.90661907196045 12.10548114776611 11.51757049560547 12.3508186340332 11.22254943847656 12.17123889923096 L 7.807668209075928 10.06598949432373 L 4.394632816314697 12.17123889923096 C 4.099611282348633 12.3508186340332 3.710551261901855 12.10388088226318 3.817500352859497 11.80727767944336 L 5.063962936401367 8.332707405090332 L 1.708099603652954 6.160100936889648 C 1.418610811233521 5.972516536712646 1.567962169647217 5.574896335601807 1.927519798278809 5.571694374084473 L 6.113113880157471 5.528390407562256 L 7.451801776885986 2.08109188079834 C 7.566127777099609 1.782862544059753 8.051047325134277 1.782862544059753 8.165374755859375 2.08109188079834 Z" fill="#33BEA3" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                        allowDrawingOutsideViewBox: true,
                                        fit: BoxFit.fill,
                                      ),
                                      SvgPicture.string(
                                        '<svg viewBox="116.2 318.1 12.5 10.4" ><path transform="translate(114.62, 316.29)" d="M 8.165374755859375 2.08109188079834 L 9.504015922546387 5.528390407562256 L 13.68779182434082 5.571694374084473 C 14.04734039306641 5.574896335601807 14.19669151306152 5.972516536712646 13.90908241271973 6.160100936889648 L 10.5532054901123 8.332707405090332 L 11.79965591430664 11.80727767944336 C 11.90661907196045 12.10548114776611 11.51757049560547 12.3508186340332 11.22254943847656 12.17123889923096 L 7.807668209075928 10.06598949432373 L 4.394632816314697 12.17123889923096 C 4.099611282348633 12.3508186340332 3.710551261901855 12.10388088226318 3.817500352859497 11.80727767944336 L 5.063962936401367 8.332707405090332 L 1.708099603652954 6.160100936889648 C 1.418610811233521 5.972516536712646 1.567962169647217 5.574896335601807 1.927519798278809 5.571694374084473 L 6.113113880157471 5.528390407562256 L 7.451801776885986 2.08109188079834 C 7.566127777099609 1.782862544059753 8.051047325134277 1.782862544059753 8.165374755859375 2.08109188079834 Z" fill="#33BEA3" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
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
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Center(
                                child: Row(
                                  children: [
                                    ///message
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return ChatPage(
                                              snapshot.data.doctors[i].id
                                                  .toString(),
                                              snapshot.data.doctors[i]
                                                  .doctordetails.firstName);
                                        }));
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 25,
                                        child: Stack(
                                          children: <Widget>[
                                            Pinned.fromPins(
                                              Pin(start: 0.0, end: 0.0),
                                              Pin(start: 0.0, end: 0.0),
                                              child:
                                                  // Adobe XD layer: 'surface1' (group)
                                                  Stack(
                                                children: <Widget>[
                                                  Pinned.fromPins(
                                                    Pin(start: 0.0, end: 0.0),
                                                    Pin(start: 0.0, end: 0.0),
                                                    child: SvgPicture.string(
                                                      '<svg viewBox="0.0 0.0 24.9 16.0" ><path transform="translate(-0.99, -5.92)" d="M 2.353575229644775 5.921879768371582 L 12.37508010864258 15.27131843566895 C 12.96628284454346 15.82729816436768 13.89871120452881 15.82729816436768 14.48639965057373 15.27131843566895 L 24.51142883300781 5.921879768371582 L 2.353575229644775 5.921879768371582 Z M 0.9882810115814209 7.076043128967285 L 0.9882810115814209 20.66563987731934 L 8.015302658081055 13.63860034942627 L 0.9882810115814209 7.076043128967285 Z M 25.8766975402832 7.076043128967285 L 18.84965705871582 13.63860034942627 L 25.8766975402832 20.66563987731934 L 25.8766975402832 7.076043128967285 Z M 9.313767433166504 14.85253238677979 L 2.244487047195435 21.92181968688965 L 24.62051773071289 21.92181968688965 L 17.54771423339844 14.85253238677979 L 15.70384502410889 16.5732593536377 C 15.0634593963623 17.16797256469727 14.24705410003662 17.46352958679199 13.43074035644531 17.46352958679199 C 12.61433601379395 17.46352958679199 11.79802227020264 17.16797256469727 11.15754508972168 16.5732593536377 L 9.313767433166504 14.85253238677979 Z" fill="#33BEA3" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                                      allowDrawingOutsideViewBox:
                                                          true,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),

                                    ///call
                                    Container(
                                        height: 20,
                                        width: 25,
                                        child: // Adobe XD layer: 'surface1' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromPins(
                                              Pin(start: 0.0, end: 0.0),
                                              Pin(start: 0.0, end: 0.0),
                                              child: SvgPicture.string(
                                                '<svg viewBox="3.0 3.0 19.8 19.8" ><path transform="translate(0.0, 0.0)" d="M 6.715735912322998 2.979619264602661 C 6.441273212432861 2.997324228286743 6.147346496582031 3.094707727432251 5.865812301635742 3.291251182556152 C 5.835714340209961 3.310724258422852 2.938950061798096 5.410703659057617 2.976133108139038 6.58993673324585 C 3.082373380661011 9.954158782958984 6.359817981719971 13.91508102416992 9.08835506439209 16.64715576171875 C 11.81870555877686 19.37573623657227 15.77786159515381 22.65139007568359 19.15799522399902 22.762939453125 L 19.17925071716309 22.762939453125 C 20.34786224365234 22.762939453125 22.42126846313477 19.89982223510742 22.44075775146484 19.87326049804688 C 22.67623901367188 19.53683471679688 22.78779602050781 19.15263175964355 22.75592613220215 18.78787612915039 C 22.72406196594238 18.42841911315918 22.5576171875 18.11855697631836 22.30264282226562 17.93973731994629 C 21.99631690979004 17.7254695892334 18.67814826965332 15.51925086975098 18.27445411682129 15.27139663696289 C 17.87959861755371 15.02879905700684 17.29880905151367 15.06773567199707 16.72336387634277 15.3722972869873 C 16.39754486083984 15.54404449462891 15.40422058105469 16.11064910888672 14.94033050537109 16.37450408935547 C 14.53133296966553 16.08943557739258 13.53265953063965 15.32982444763184 11.96919536590576 13.76635932922363 C 10.40396404266357 12.20285034179688 9.646120071411133 11.20422172546387 9.361049652099609 10.79699325561523 C 9.626628875732422 10.33305740356445 10.19146537780762 9.33796501159668 10.36321353912354 9.013957977294922 C 10.67131042480469 8.427862167358398 10.70852470397949 7.843536376953125 10.4588565826416 7.454030513763428 C 10.2215633392334 7.075086116790771 8.025996208190918 3.748074769973755 7.794051170349121 3.427589893341064 C 7.579783916473389 3.130122900009155 7.174322605133057 2.945976495742798 6.715735912322998 2.979619264602661 Z M 12.86869049072266 3.875560522079468 L 12.86869049072266 4.775041580200195 C 17.33244132995605 4.775041580200195 20.96405410766602 8.404836654663086 20.96405410766602 12.86863136291504 L 21.86350440979004 12.86863136291504 C 21.86350440979004 7.910849094390869 17.82824325561523 3.875560522079468 12.86869049072266 3.875560522079468 Z M 12.86869049072266 6.368598937988281 L 12.86869049072266 7.268094062805176 C 15.95845127105713 7.268094062805176 18.47099685668945 9.780641555786133 18.47099685668945 12.86863136291504 L 19.37044906616211 12.86863136291504 C 19.37044906616211 9.283073425292969 16.4542064666748 6.368598937988281 12.86869049072266 6.368598937988281 Z M 12.86869049072266 8.820951461791992 L 12.86869049072266 9.72044563293457 C 14.60390472412109 9.72044563293457 16.01687812805176 11.13341903686523 16.01687812805176 12.86863136291504 L 16.91637229919434 12.86863136291504 C 16.91637229919434 10.63585090637207 15.09970569610596 8.820951461791992 12.86869049072266 8.820951461791992 Z" fill="#33BEA3" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                                allowDrawingOutsideViewBox:
                                                    true,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ],
                                        )),
                                    SizedBox(
                                      width: 20,
                                    ),

                                    ///Video call
                                    Container(
                                      height: 20,
                                      width: 25,
                                      child: // Adobe XD layer: 'surface1' (group)
                                          // Adobe XD layer: 'surface1' (group)
                                          Stack(
                                        children: <Widget>[
                                          Pinned.fromPins(
                                            Pin(start: 0.0, end: 0.0),
                                            Pin(start: 0.0, end: 0.0),
                                            child: SvgPicture.string(
                                              '<svg viewBox="0.0 5.9 25.5 13.8" ><path  d="M 8.371089935302734 5.910160064697266 C 2.460939884185791 5.910160064697266 0 6.710939884185791 0 7.355470180511475 L 0 18.21879959106445 C 0 18.85160064697266 2.460939884185791 19.69529914855957 8.371089935302734 19.69529914855957 C 14.28129959106445 19.69529914855957 16.74220085144043 18.89839935302734 16.74220085144043 18.25 L 16.74220085144043 7.386720180511475 C 16.74220085144043 6.753910064697266 14.28129959106445 5.910160064697266 8.371089935302734 5.910160064697266 Z M 24.99220085144043 5.941410064697266 C 24.8164005279541 5.949220180511475 24.64060020446777 6.007810115814209 24.52729988098145 6.09375 L 18.1289005279541 10.21879959106445 C 17.88279914855957 10.40229988098145 17.72660064697266 10.70699977874756 17.72660064697266 11.01949977874756 L 17.72660064697266 14.58979988098145 C 17.72660064697266 14.89449977874756 17.88279914855957 15.20310020446777 18.1289005279541 15.38669967651367 L 24.52729988098145 19.51169967651367 C 24.70310020446777 19.64450073242188 25.54299926757812 20.05470085144043 25.54299926757812 18.71089935302734 L 25.54299926757812 6.894529819488525 C 25.54299926757812 6.117189884185791 25.27729988098145 5.929689884185791 24.99220085144043 5.941410064697266 Z" fill="#33BEA3" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                              allowDrawingOutsideViewBox: true,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Patient",
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      //height: 1.6,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  "Experience",
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      //height: 1.6,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),

                            ///Experience

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "500+",
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: HexColor('33BEA3'),
                                      fontSize: 18,
                                      //height: 1.6,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  "5 year+",
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: HexColor('33BEA3'),
                                      fontSize: 18,
                                      //height: 1.6,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25, left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Appointment",
                                textAlign: TextAlign.left,
                                // overflow: TextOverflow.ellipsis,
                                // maxLines: 1,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    //height: 1.6,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Center(
                                    child: Container(
                                        width: 60,
                                        height: 15,
                                        child: Stack(
                                          children: <Widget>[
                                            // Pinned.fromPins(
                                            //   Pin(size: 60.0, start: 0.0),
                                            //   Pin(start: 0.0, end: 0.0),
                                            //   child: Text(
                                            //     'January',
                                            //     style: TextStyle(
                                            //       fontFamily: 'Arial',
                                            //       fontSize: 14,
                                            //       color:
                                            //           const Color(0xff000000),
                                            //       fontWeight: FontWeight.w700,
                                            //     ),
                                            //     textAlign: TextAlign.left,
                                            //   ),
                                            // ),
                                            // Pinned.fromPins(
                                            //   Pin(size: 6.3, end: 0.0),
                                            //   Pin(size: 6.0, middle: 0.574),
                                            //   child:
                                            //       // Adobe XD layer: 'surface1' (group)
                                            //       Stack(
                                            //     children: <Widget>[
                                            //       Pinned.fromPins(
                                            //         Pin(start: 0.0, end: 0.0),
                                            //         Pin(start: 0.0, end: 0.0),
                                            //         child: SvgPicture.string(
                                            //           '<svg viewBox="7.0 10.0 6.3 4.0" ><path  d="M 7 10 L 10.15271091461182 14.03156280517578 L 13.305419921875 10 L 7 10 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                            //           allowDrawingOutsideViewBox:
                                            //               true,
                                            //           fit: BoxFit.cover,
                                            //         ),
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                          ],
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                                height: 50,
                              ),
                              SizedBox(
                                width: 25,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomHorizontalCalendar(
                          onDateChoosen: (date) {
                            setState(() {
                              chosen = date;
                            });
                          },
                          inintialDate: DateTime.now(),
                          height: 60,
                          builder: (context, i, d, width) {
                            if (i != 2)
                              return DateRow(
                                d,
                                width: width,
                              );
                            else
                              return DateRow(
                                d,
                                background: HexColor('33BEA3'),
                                selectedDayStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                selectedDayOfWeekStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                selectedMonthStyle:
                                    TextStyle(color: Colors.white, fontSize: 0),
                                width: width,
                              );
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, bottom: 15),
                          child: Text(
                            'About',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 22,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Center(
                          child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Text(
                                  snapshot.data.doctors[i].details
                                      .replaceAll("</p>", "")
                                      .replaceAll("<p>", ""),
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 14,
                                    color: const Color(0xff858585),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        appoinmentBookButtons(
                            snapshot.data.doctors[i].fees.toString(),
                            snapshot.data.doctors[i].doctordetails.firstName,
                            snapshot.data.doctors[i].id.toString())
                      ],
                    ),
                  ),
                ],
              );
            }
          }
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
                child: Container(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator())));
      },
    );
  }

  void showBookingDialog(String fees, String docName, String docId) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 500),
      context: context,
      pageBuilder: (_, __, ___) {
        return Material(
            type: MaterialType.transparency,
            child: StatefulBuilder(builder: (context, setState) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ///Dialog Appbar
                        ///
                        Container(
                          height: 70.0,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Container(
                                height: 60.0,
                                width: MediaQuery.of(context).size.width,
                                child: SvgPicture.string(
                                  '<svg viewBox="0.0 280.0 360.0 72.0" ><defs><filter id="shadow"><feDropShadow dx="6" dy="3" stdDeviation="12"/></filter><linearGradient id="gradient" x1="0.5" y1="0.315582" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#33BEA3"  /><stop offset="1.0" stop-color="#33BEA3"  /></linearGradient></defs><path transform="translate(0.0, 280.0)" d="M 36 0 L 324 0 C 343.8822631835938 0 360 16.11774826049805 360 36 L 360 72 L 0 72 L 0 36 C 0 16.11774826049805 16.11774826049805 0 36 0 Z" fill="#33BEA3" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>',
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Row(
                                children: [
                                  Spacer(),
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
                                              '<svg viewBox="3.9 3.9 30.9 30.9" ><path  d="M 6.32553768157959 3.949219942092896 C 5.012675762176514 3.949219942092896 3.949219942092896 5.012675762176514 3.949219942092896 6.32553768157959 L 3.949219942092896 27.72176551818848 C 3.949219942092896 29.03456687927246 5.012675762176514 30.09813117980957 6.32553768157959 30.09813117980957 L 19.03063011169434 30.09813117980957 C 20.37162208557129 32.90262222290039 23.22790908813477 34.85543823242188 26.53593254089355 34.85543823242188 C 31.11917304992676 34.85543823242188 34.85543823242188 31.11917304992676 34.85543823242188 26.53593254089355 C 34.85543823242188 23.22790908813477 32.90262222290039 20.37162208557129 30.09813117980957 19.03063011169434 L 30.09813117980957 6.32553768157959 C 30.09813117980957 5.012675762176514 29.03456687927246 3.949219942092896 27.72176551818848 3.949219942092896 L 6.32553768157959 3.949219942092896 Z M 6.32553768157959 6.32553768157959 L 27.72176551818848 6.32553768157959 L 27.72176551818848 11.07816028594971 L 6.32553768157959 11.07816028594971 L 6.32553768157959 6.32553768157959 Z M 12.26870441436768 14.6449499130249 C 12.92269611358643 14.6449499130249 13.45923519134521 15.18136978149414 13.45923519134521 15.83547973632812 C 13.45923519134521 16.48959350585938 12.92269611358643 17.02131462097168 12.26870441436768 17.02131462097168 C 11.61459255218506 17.02131462097168 11.07816028594971 16.48959350585938 11.07816028594971 15.83547973632812 C 11.07816028594971 15.18136978149414 11.61459255218506 14.6449499130249 12.26870441436768 14.6449499130249 Z M 17.02131462097168 14.6449499130249 C 17.68012428283691 14.6449499130249 18.21184539794922 15.18136978149414 18.21184539794922 15.83547973632812 C 18.21184539794922 16.48959350585938 17.68012428283691 17.02131462097168 17.02131462097168 17.02131462097168 C 16.36720275878906 17.02131462097168 15.83547973632812 16.48959350585938 15.83547973632812 15.83547973632812 C 15.83547973632812 15.18136978149414 16.36720275878906 14.6449499130249 17.02131462097168 14.6449499130249 Z M 21.77862358093262 14.6449499130249 C 22.43273544311523 14.6449499130249 22.96915626525879 15.18136978149414 22.96915626525879 15.83547973632812 C 22.96915626525879 16.48959350585938 22.43273544311523 17.02131462097168 21.77862358093262 17.02131462097168 C 21.12451362609863 17.02131462097168 20.58809089660645 16.48959350585938 20.58809089660645 15.83547973632812 C 20.58809089660645 15.18136978149414 21.12451362609863 14.6449499130249 21.77862358093262 14.6449499130249 Z M 26.53593254089355 14.6449499130249 C 27.1900463104248 14.6449499130249 27.72176551818848 15.18136978149414 27.72176551818848 15.83547973632812 C 27.72176551818848 16.48959350585938 27.1900463104248 17.02131462097168 26.53593254089355 17.02131462097168 C 25.87712287902832 17.02131462097168 25.34539985656738 16.48959350585938 25.34539985656738 15.83547973632812 C 25.34539985656738 15.18136978149414 25.87712287902832 14.6449499130249 26.53593254089355 14.6449499130249 Z M 7.511335849761963 19.40225791931152 C 8.170120239257812 19.40225791931152 8.701842308044434 19.9340991973877 8.701842308044434 20.58809089660645 C 8.701842308044434 21.24690055847168 8.170120239257812 21.77862358093262 7.511335849761963 21.77862358093262 C 6.857259273529053 21.77862358093262 6.32553768157959 21.24690055847168 6.32553768157959 20.58809089660645 C 6.32553768157959 19.9340991973877 6.857259273529053 19.40225791931152 7.511335849761963 19.40225791931152 Z M 12.26870441436768 19.40225791931152 C 12.92269611358643 19.40225791931152 13.45923519134521 19.9340991973877 13.45923519134521 20.58809089660645 C 13.45923519134521 21.24690055847168 12.92269611358643 21.77862358093262 12.26870441436768 21.77862358093262 C 11.61459255218506 21.77862358093262 11.07816028594971 21.24690055847168 11.07816028594971 20.58809089660645 C 11.07816028594971 19.9340991973877 11.61459255218506 19.40225791931152 12.26870441436768 19.40225791931152 Z M 17.02131462097168 19.40225791931152 C 17.68012428283691 19.40225791931152 18.21184539794922 19.9340991973877 18.21184539794922 20.58809089660645 C 18.21184539794922 21.24690055847168 17.68012428283691 21.77862358093262 17.02131462097168 21.77862358093262 C 16.36720275878906 21.77862358093262 15.83547973632812 21.24690055847168 15.83547973632812 20.58809089660645 C 15.83547973632812 19.9340991973877 16.36720275878906 19.40225791931152 17.02131462097168 19.40225791931152 Z M 26.53593254089355 20.58809089660645 C 29.82986068725586 20.58809089660645 32.47907257080078 23.2373046875 32.47907257080078 26.53593254089355 C 32.47907257080078 29.82986068725586 29.82986068725586 32.47907257080078 26.53593254089355 32.47907257080078 C 23.2373046875 32.47907257080078 20.58809089660645 29.82986068725586 20.58809089660645 26.53593254089355 C 20.58809089660645 23.2373046875 23.2373046875 20.58809089660645 26.53593254089355 20.58809089660645 Z M 26.51713943481445 21.75983047485352 C 25.85832977294922 21.77392578125 25.33600425720215 22.31034660339355 25.34539985656738 22.96915626525879 L 25.34539985656738 27.02537155151367 L 27.46771049499512 29.14756202697754 C 27.76416778564453 29.45811462402344 28.21108436584473 29.58520126342773 28.62523460388184 29.47220802307129 C 29.03926658630371 29.36873054504395 29.36873054504395 29.03926658630371 29.47220802307129 28.62523460388184 C 29.58520126342773 28.21108436584473 29.45811462402344 27.76416778564453 29.14756202697754 27.46771049499512 L 27.72176551818848 26.04191589355469 L 27.72176551818848 22.96915626525879 C 27.72646522521973 22.64920616149902 27.60407447814941 22.33383560180664 27.37351036071777 22.10796737670898 C 27.14764213562012 21.88210105895996 26.83708953857422 21.7551326751709 26.51713943481445 21.75983047485352 Z M 7.511335849761963 24.15498924255371 C 8.170120239257812 24.15498924255371 8.701842308044434 24.69140815734863 8.701842308044434 25.34539985656738 C 8.701842308044434 25.99951362609863 8.170120239257812 26.53593254089355 7.511335849761963 26.53593254089355 C 6.857259273529053 26.53593254089355 6.32553768157959 25.99951362609863 6.32553768157959 25.34539985656738 C 6.32553768157959 24.69140815734863 6.857259273529053 24.15498924255371 7.511335849761963 24.15498924255371 Z M 12.26870441436768 24.15498924255371 C 12.92269611358643 24.15498924255371 13.45923519134521 24.69140815734863 13.45923519134521 25.34539985656738 C 13.45923519134521 25.99951362609863 12.92269611358643 26.53593254089355 12.26870441436768 26.53593254089355 C 11.61459255218506 26.53593254089355 11.07816028594971 25.99951362609863 11.07816028594971 25.34539985656738 C 11.07816028594971 24.69140815734863 11.61459255218506 24.15498924255371 12.26870441436768 24.15498924255371 Z M 17.02131462097168 24.15498924255371 C 17.68012428283691 24.15498924255371 18.21184539794922 24.69140815734863 18.21184539794922 25.34539985656738 C 18.21184539794922 25.99951362609863 17.68012428283691 26.53593254089355 17.02131462097168 26.53593254089355 C 16.36720275878906 26.53593254089355 15.83547973632812 25.99951362609863 15.83547973632812 25.34539985656738 C 15.83547973632812 24.69140815734863 16.36720275878906 24.15498924255371 17.02131462097168 24.15498924255371 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                              allowDrawingOutsideViewBox: true,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                        height: 30,
                                        child: Text(
                                          '   Appointment Details',
                                          style: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 22,
                                            color: const Color(0xffffffff),
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.left,
                                        )),
                                  ),
                                  Spacer()
                                ],
                              )
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            height: 240,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Spacer(),
                                    Center(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            child: Text(
                                              "Doctor Name",
                                              textAlign: TextAlign.left,
                                              // overflow: TextOverflow.ellipsis,
                                              // maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  //height: 1.6,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Center(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            child: Text(
                                              ":",
                                              textAlign: TextAlign.left,
                                              // overflow: TextOverflow.ellipsis,
                                              // maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  //height: 1.6,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Center(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            child: Text(
                                              "Dr. " + docName.toUpperCase(),
                                              textAlign: TextAlign.left,
                                              // overflow: TextOverflow.ellipsis,
                                              // maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  //height: 1.6,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Spacer(),
                                    Center(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            child: Text(
                                              "  Appoinment",
                                              textAlign: TextAlign.left,
                                              // overflow: TextOverflow.ellipsis,
                                              // maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  //height: 1.6,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Center(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            child: Text(
                                              "   :",
                                              textAlign: TextAlign.left,
                                              // overflow: TextOverflow.ellipsis,
                                              // maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  //height: 1.6,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Center(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            child: Text(
                                              "Cardiology",
                                              textAlign: TextAlign.left,
                                              // overflow: TextOverflow.ellipsis,
                                              // maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  //height: 1.6,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Spacer(),
                                    Center(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            child: Text(
                                              "Consultation Method   :",
                                              textAlign: TextAlign.left,
                                              // overflow: TextOverflow.ellipsis,
                                              // maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  //height: 1.6,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Center(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            child: DropdownButton<String>(
                                              hint: Text(_selectedLocation),
                                              value: _selectedLocation,
                                              isDense: true,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _selectedLocation = newValue;
                                                });
                                                print(_selectedLocation);
                                              },
                                              items: _locations
                                                  .map((String value) {
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
                                    Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Spacer(),
                                    Center(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            child: Text(
                                              " Appoinment Date               :",
                                              textAlign: TextAlign.left,
                                              // overflow: TextOverflow.ellipsis,
                                              // maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  //height: 1.6,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Center(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            child: Text(
                                              chosen.day.toString() +
                                                  "/" +
                                                  chosen.month.toString() +
                                                  "/" +
                                                  chosen.year.toString() +
                                                  "         ",
                                              textAlign: TextAlign.left,
                                              // overflow: TextOverflow.ellipsis,
                                              // maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  //height: 1.6,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Spacer(),
                                    Center(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            child: Text(
                                              " Patient Name              :",
                                              textAlign: TextAlign.left,
                                              // overflow: TextOverflow.ellipsis,
                                              // maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  //height: 1.6,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Center(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            child: Text(
                                              user_name.$.toUpperCase() + "   ",
                                              textAlign: TextAlign.left,
                                              // overflow: TextOverflow.ellipsis,
                                              // maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  //height: 1.6,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Spacer(),
                                    Center(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            child: Text(
                                              "Phone Number                  :",
                                              textAlign: TextAlign.left,
                                              // overflow: TextOverflow.ellipsis,
                                              // maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  //height: 1.6,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Center(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            child: Text(
                                              user_phone.$,
                                              textAlign: TextAlign.left,
                                              // overflow: TextOverflow.ellipsis,
                                              // maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  //height: 1.6,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Spacer(),
                                    Center(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            child: Text(
                                              "Consultation Fee              :",
                                              textAlign: TextAlign.left,
                                              // overflow: TextOverflow.ellipsis,
                                              // maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  //height: 1.6,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Center(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            child: Text(
                                              fees + "/-        ",
                                              textAlign: TextAlign.left,
                                              // overflow: TextOverflow.ellipsis,
                                              // maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  //height: 1.6,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        ///confirmOrCancelButtons
                        confirmOrCancelButtons(docId),
                      ],
                    )),
              );
            }));
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  confirmOrCancelButtons(String docId) {
    return Container(
      height: 90,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                height: 40.0,
                width: 120.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: HexColor('33BEA3')),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Center(
                      child: Text(
                    'Cancel ',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 16,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  )),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              String date = chosen.year.toString() +
                  "-" +
                  chosen.month.toString() +
                  "-" +
                  chosen.day.toString();
              print(date);
              DoctorsData()
                  .takeAppoinment(docId, user_id.$.toString(), "1", date,
                      _selectedLocation.toLowerCase())
                  .then((value) => {
                        if (value)
                          {
                            Navigator.pop(context),

                            // Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //   return PaymentDetails();
                            // }));
                          }
                      });
            },
            child: Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                height: 40.0,
                width: 120.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: HexColor('33BEA3')),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Center(
                      child: Text(
                    'Confirm ',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 16,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  appoinmentBookButtons(String fees, String docName, String docId) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            showBookingDialog(fees, docName, docId);
          },
          child: Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              height: 50.0,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: HexColor('33BEA3')),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Center(
                  child: Text(
                    "Make an Appointment",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        //height: 1.6,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
