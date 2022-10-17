import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/ui_sections/main_drawer.dart';

class PrescriptionList extends StatefulWidget {
  PrescriptionList(
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
  PrescriptionListState createState() => PrescriptionListState();
}

class PrescriptionListState extends State<PrescriptionList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
                "Prescription",
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
          width: MediaQuery.of(context).size.width * 0.9,
          height: 100,
          child: Card(
            color: Colors.cyan[500],
            shape: RoundedRectangleBorder(
              side: new BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 0.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 10,10),
                      child: Center(
                        child: Text("Cough",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              //height: 1.6,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Center(
                        child: Container(
                          child: Text("Dr. Helen",
                            textAlign: TextAlign.left,
                            // overflow: TextOverflow.ellipsis,
                            // maxLines: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                //height: 1.6,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    height: 50.0,
                    width: 100.0,
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
                          "Download",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              //height: 1.6,
                              fontWeight: FontWeight.normal),
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
    );
  }
}
