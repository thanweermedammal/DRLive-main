import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/ui_sections/main_drawer.dart';

import 'package:active_ecommerce_flutter/screens/patientScreens/chat.dart';


class DoctorOnlineList extends StatefulWidget {
  DoctorOnlineList(
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
  DoctorOnlineListState createState() => DoctorOnlineListState();
}

class DoctorOnlineListState extends State<DoctorOnlineList> {
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
      toolbarHeight: 120,
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
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Choose",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Text(
              "Consultation Method",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(
              height: 10,
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
        GestureDetector(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return Chat(
                    // parent_category_name: featuredCategoryResponse
                    //     .categories[index].name,
                    parent_category_name: "Dr. John",
                  );
                }));
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 100,
            child: Card(
              color: Colors.cyan[50],
              shape: RoundedRectangleBorder(
                side: new BorderSide(color: Colors.white, width: 1.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
              elevation: 0.0,
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.fromLTRB(15, 0, 5, 0),
                    child: Center(
                      child: Container(
                        height: 25.0,
                        width: 25.0,
                        decoration: BoxDecoration(
                          //color: Colors.cyan[800],
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/chat.png',
                            ),
                            fit: BoxFit.fill,
                            //colorFilter: ColorFilter.mode(Colors.cyan, BlendMode.overlay)
                          ),
                          //shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),

                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Center(
                            child: Text("Chat",
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  //height: 1.6,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Center(
                            child: Container(
                              child: Text("When your busy to talk, you should \npic this option",
                                textAlign: TextAlign.left,
                                // overflow: TextOverflow.ellipsis,
                                // maxLines: 1,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    //height: 1.6,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),



        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 100,
          child: Card(
            color: Colors.cyan[50],
            shape: RoundedRectangleBorder(
              side: new BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            elevation: 0.0,
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.fromLTRB(15, 0, 5, 0),
                  child: Center(
                    child: Container(
                      height: 25.0,
                      width: 25.0,
                      decoration: BoxDecoration(
                        //color: Colors.cyan[800],
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/call.png',
                          ),
                          fit: BoxFit.fill,
                          //colorFilter: ColorFilter.mode(Colors.cyan, BlendMode.overlay)
                        ),
                        //shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Center(
                        child: Text("Call",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              //height: 1.6,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Center(
                        child: Container(
                          child: Text("Talk to doctor on voice call",
                            textAlign: TextAlign.left,
                            // overflow: TextOverflow.ellipsis,
                            // maxLines: 1,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                //height: 1.6,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),



        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 100,
          child: Card(
            color: Colors.cyan[50],
            shape: RoundedRectangleBorder(
              side: new BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            elevation: 0.0,
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.fromLTRB(15, 0, 5, 0),
                  child: Center(
                    child: Container(
                      height: 20.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        //color: Colors.cyan[800],
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/videocall.png',
                          ),
                          fit: BoxFit.fill,
                          //colorFilter: ColorFilter.mode(Colors.cyan, BlendMode.overlay)
                        ),
                        //shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Center(
                        child: Text("Chat",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              //height: 1.6,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Center(
                        child: Container(
                          child: Text("Talk to doctor on video call",
                            textAlign: TextAlign.left,
                            // overflow: TextOverflow.ellipsis,
                            // maxLines: 1,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                //height: 1.6,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
