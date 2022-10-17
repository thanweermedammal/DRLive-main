import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/ui_sections/main_drawer.dart';
import 'package:shimmer/shimmer.dart';

class ConsultationList extends StatefulWidget {
  ConsultationList(
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
  ConsultationListState createState() => ConsultationListState();
}

class ConsultationListState extends State<ConsultationList> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        ///key: _scaffoldKey,
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
                "Consultation History",
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
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 100,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: new BorderSide(color: Colors.cyan[800], width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 0.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Center(
                  child: Container(
                    child: Text(
                      "Cold,\nSneezing",
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
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Center(
                        child: Container(
                          child: Text(
                            "Dr. Helen",
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
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Center(
                      child: Container(
                        child: Text(
                          "Last Month",
                          textAlign: TextAlign.left,
                          // overflow: TextOverflow.ellipsis,
                          // maxLines: 1,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              //height: 1.6,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Center(
                        child: Container(
                          child: Text(
                            "09 : 30am",
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Center(
                            child: Container(
                              child: Text(
                                "Chat   ",
                                textAlign: TextAlign.left,
                                // overflow: TextOverflow.ellipsis,
                                // maxLines: 1,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    //height: 1.6,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            child: Text(
                              " ₹150.00/-",
                              textAlign: TextAlign.left,
                              // overflow: TextOverflow.ellipsis,
                              // maxLines: 1,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  //height: 1.6,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          height: 40.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/download.png'),
                              fit: BoxFit.fill,
                            ),
                            //shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Center(
                              child: Text(
                                "Prescription",
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
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
