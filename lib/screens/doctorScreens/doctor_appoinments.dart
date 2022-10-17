import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/ui_sections/main_drawer.dart';
import 'package:shimmer/shimmer.dart';

import 'package:active_ecommerce_flutter/screens/doctorScreens/patient_history_profile.dart';

class DoctorAppoinments extends StatefulWidget {
  DoctorAppoinments(
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
  DoctorAppoinmentsState createState() => DoctorAppoinmentsState();
}

class DoctorAppoinmentsState extends State<DoctorAppoinments> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isActive = true;

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
      toolbarHeight: 80,
      centerTitle: false,
      leading: widget.is_base_category
          ? GestureDetector(
              onTap: () {
                _scaffoldKey.currentState.openDrawer();
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
              child: Text(
                "My Appoinments",
                style: TextStyle(fontSize: 22, color: Colors.black),
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
                      isActive = true;
                    });
                  },
                  child: Center(
                    child: Container(
                      height: 40.0,
                      width: MediaQuery.of(context).size.width * 0.45 - 5,
                      decoration: BoxDecoration(
                          color: isActive ? Colors.white : Colors.transparent),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Center(
                          child: Text(
                            "Active",
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: isActive ? Colors.black : Colors.grey,
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
                      isActive = false;
                    });
                  },
                  child: Center(
                    child: Container(
                      height: 40.0,
                      width: MediaQuery.of(context).size.width * 0.45 - 5,
                      decoration: BoxDecoration(
                          color:
                              isActive ? Colors.transparent : Colors.white70),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Center(
                          child: Text(
                            "Past",
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: isActive ? Colors.grey : Colors.black,
                                fontSize: 18,
                                //height: 1.6,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        isActive ? activeWidget() : pastWidget()
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
                            SizedBox(width: 20,),
                            Center(
                              child: Column(
                                children: [
                                  Text(
                                    "\nToken No.",
                                    textAlign: TextAlign.left,
                                    // overflow: TextOverflow.ellipsis,
                                    // maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.blue[300],
                                        fontSize: 14,
                                        //height: 1.6,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      height: 40.0,
                                      width: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.cyan[800],
                                      ),
                                      child: Center(
                                        child: Text(
                                          index.toString(),
                                          textAlign: TextAlign.left,
                                          // overflow: TextOverflow.ellipsis,
                                          // maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              //height: 1.6,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
              "    December",
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
                            SizedBox(width: 20,),
                            Center(
                              child: Column(
                                children: [
                                  Text(
                                    "\nTommorow",
                                    textAlign: TextAlign.left,
                                    // overflow: TextOverflow.ellipsis,
                                    // maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        //height: 1.6,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
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
