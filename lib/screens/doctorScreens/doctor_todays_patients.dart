import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/ui_sections/main_drawer.dart';
import 'package:shimmer/shimmer.dart';

class TodaysPatients extends StatefulWidget {
  TodaysPatients(
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
  TodaysPatientsState createState() => TodaysPatientsState();
}

class TodaysPatientsState extends State<TodaysPatients> {
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
                "Todays Appoinments",
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
                            "Todays",
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
                            "All",
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
          SingleChildScrollView(
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(
                        top: 4.0, bottom: 4.0, left: 16.0, right: 16.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 90,
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: new BorderSide(
                              color: Colors.cyan[800], width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 3.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Container(
                                width: 90,
                                height: 70,
                                decoration: BoxDecoration(
                                  //color: Colors.green[200],
                                  border: Border.all(color: Colors.cyan[800], width: 0.5),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Center(
                                  child: Text(
                                    index.toString(),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.cyan[800],
                                        fontSize: 20,
                                        //height: 1.6,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 100, 0),
                                child: Center(
                                  child: Text(
                                    "   John Smith",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        //height: 1.6,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child:Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: 35.0,
                                  width: 35.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.cyan[800], width: 0.5),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 20.0,
                                      width: 20.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/chat.png'),
                                          fit: BoxFit.fill,
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
          SingleChildScrollView(
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(
                        top: 4.0, bottom: 4.0, left: 16.0, right: 16.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 90,
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: new BorderSide(
                              color: Colors.cyan[800], width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 3.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Container(
                                width: 90,
                                height: 70,
                                decoration: BoxDecoration(
                                  //color: Colors.green[200],
                                  border: Border.all(color: Colors.cyan[800], width: 0.5),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Center(
                                  child: Text(
                                    index.toString(),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.cyan[800],
                                        fontSize: 20,
                                        //height: 1.6,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 100, 0),
                                child: Center(
                                  child: Text(
                                    "   John Smith",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        //height: 1.6,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child:Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: 35.0,
                                  width: 35.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.cyan[800], width: 0.5),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 20.0,
                                      width: 20.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/chat.png'),
                                          fit: BoxFit.fill,
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
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
