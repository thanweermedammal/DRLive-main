import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/ui_sections/main_drawer.dart';
import 'package:active_ecommerce_flutter/screens/doctorScreens/patient_history_profile.dart';

import 'package:active_ecommerce_flutter/screens/doctorScreens/doctor_leave_apply.dart';

class DoctorLeaves extends StatefulWidget {
  DoctorLeaves(
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
  DoctorLeavesState createState() => DoctorLeavesState();
}

class DoctorLeavesState extends State<DoctorLeaves> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isActive = true;
  int index=0;

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
                    buildMethodList(),
                  ]))
            ],
          ),
        ]));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 90,
      centerTitle: false,
      leading:  Column(
        children: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.arrow_back, color: MyTheme.dark_grey),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
      title: Container(
        height: 40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Row(
                children: [
                  Text(
                    "Leaves",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return DoctorLeaveApply();
                          }));
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/addleave.png",
                          fit: BoxFit.cover,
                          //    color: Colors.white
                        )),
                  ),
                  SizedBox(width: 20,)
                ],
              ),
            ),
          ],
        ),
      ),
      elevation: 0.0,
      titleSpacing: 0,
    );
  }

  buildMethodList() {
    return Column(
      children: [
        Container(
          height: 45.0,
          width: MediaQuery.of(context).size.width * 0.9,
          color: Colors.grey[300],
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      //isActive = true;
                      index=0;
                    });
                  },
                  child: Center(
                    child: Container(
                      height: 40.0,
                      width: MediaQuery.of(context).size.width * 0.3 - 5,
                      decoration: BoxDecoration(
                          color: index==0 ? Colors.white : Colors.transparent),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Center(
                          child: Text(
                            "All",
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: index==0 ? Colors.black : Colors.grey,
                                fontSize: 16,
                                //height: 1.6,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                     // isActive = false;
                      index=1;
                    });
                  },
                  child: Center(
                    child: Container(
                      height: 40.0,
                      width: MediaQuery.of(context).size.width * 0.3 - 5,
                      decoration: BoxDecoration(
                          color:
                          index==1 ? Colors.white : Colors.transparent),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Center(
                          child: Text(
                            "Awaiting",
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: index==1 ? Colors.black : Colors.grey,
                                fontSize: 18,
                                //height: 1.6,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 2;
                    });
                  },
                  child: Center(
                    child: Container(
                      height: 40.0,
                      width: MediaQuery.of(context).size.width * 0.3 - 5,
                      decoration: BoxDecoration(
                          color: index == 2 ? Colors.white : Colors.transparent),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Center(
                          child: Text(
                            "Approved",
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: index==2 ? Colors.black : Colors.grey,
                                fontSize: 16,
                                //height: 1.6,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        index==0 ? activeWidget() : Container(),
        //index==1 ? pastWidget() : Container()
      ],
    );
  }

  activeWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "    December 2021",
              textAlign: TextAlign.left,
              // overflow: TextOverflow.ellipsis,
              // maxLines: 1,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  //height: 1.6,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            child: ListView.builder(
              itemCount: 1,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(
                        top: 4.0, bottom: 4.0, left: 16.0, right: 16.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 100,
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: new BorderSide(
                              color: Colors.cyan[800], width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 5.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 100, 0),
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Half day application ",
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                          // maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              //height: 1.6,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Wed, 16 Dec",
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                          // maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              //height: 1.6,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Casual",
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                          // maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.orangeAccent,
                                              fontSize: 16,
                                              //height: 1.6,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Center(
                              child:  Card(
                                color: Colors.orange[100],
                                child: Container(
                                  height: 30.0,
                                  width: 100.0,
                                  child: Center(
                                    child: Text(
                                      "Awaiting",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 14,
                                          //height: 1.6,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              },
            ),
          ),

          ///Second List
          ///
          ///
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "    November 2021",
              textAlign: TextAlign.left,
              // overflow: TextOverflow.ellipsis,
              // maxLines: 1,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  //height: 1.6,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            child: ListView.builder(
              itemCount: 2,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(
                        top: 4.0, bottom: 4.0, left: 16.0, right: 16.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 100,
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: new BorderSide(
                              color: Colors.cyan[800], width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 5.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 100, 0),
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Half day application ",
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                          // maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              //height: 1.6,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Wed, 16 Dec",
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                          // maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              //height: 1.6,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Sick",
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                          // maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 16,
                                              //height: 1.6,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Center(
                              child:  Card(
                                color: Colors.green[100],
                                child: Container(
                                  height: 30.0,
                                  width: 100.0,
                                  child: Center(
                                    child: Text(
                                      "Approved",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 14,
                                          //height: 1.6,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }

  pastWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "    Today",
              textAlign: TextAlign.left,
              // overflow: TextOverflow.ellipsis,
              // maxLines: 1,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  //height: 1.6,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            child: ListView.builder(
              itemCount: 2,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(
                        top: 4.0, bottom: 4.0, left: 16.0, right: 16.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 100,
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: new BorderSide(
                              color: Colors.cyan[800], width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 0.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Container(
                                width: 90,
                                height: 80,
                                decoration: BoxDecoration(
                                  //color: Colors.green[200],
                                  borderRadius: BorderRadius.circular(10.0),
                                  //color: Colors.cyan[800],
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/patient.png',
                                    ),
                                    fit: BoxFit.fitHeight,
                                    //colorFilter: ColorFilter.mode(Colors.cyan, BlendMode.overlay)
                                  ),
                                  //shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 100, 0),
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Akshay",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              //height: 1.6,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Cold",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              //height: 1.6,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Message",
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                          // maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              //height: 1.6,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return PatientProfile();
                                  }));
                                },
                                child: Container(
                                  height: 30.0,
                                  width: 80.0,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[200],
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "View",
                                      textAlign: TextAlign.left,
                                      // overflow: TextOverflow.ellipsis,
                                      // maxLines: 1,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          //height: 1.6,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              },
            ),
          ),

          ///Second List
          ///
          ///
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "    November",
              textAlign: TextAlign.left,
              // overflow: TextOverflow.ellipsis,
              // maxLines: 1,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  //height: 1.6,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            child: ListView.builder(
              itemCount: 2,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(
                        top: 4.0, bottom: 4.0, left: 16.0, right: 16.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 100,
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: new BorderSide(
                              color: Colors.cyan[800], width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 0.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Container(
                                width: 90,
                                height: 80,
                                decoration: BoxDecoration(
                                  //color: Colors.green[200],
                                  borderRadius: BorderRadius.circular(10.0),
                                  //color: Colors.cyan[800],
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/patient.png',
                                    ),
                                    fit: BoxFit.fitHeight,
                                    //colorFilter: ColorFilter.mode(Colors.cyan, BlendMode.overlay)
                                  ),
                                  //shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 100, 0),
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Akshay",
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                          // maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              //height: 1.6,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Cold",
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                          // maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              //height: 1.6,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Message",
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                          // maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              //height: 1.6,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                                child: Container(
                                  height: 30.0,
                                  width: 80.0,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[200],
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "View",
                                      textAlign: TextAlign.left,
                                      // overflow: TextOverflow.ellipsis,
                                      // maxLines: 1,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          //height: 1.6,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
