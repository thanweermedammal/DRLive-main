import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/ui_sections/main_drawer.dart';
import 'package:shimmer/shimmer.dart';

class TokenList extends StatefulWidget {
  TokenList(
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
  TokenListState createState() => TokenListState();
}

class TokenListState extends State<TokenList> {
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
      leading: widget.parent_category_name != "fromPayment"  ? GestureDetector(
        onTap: () {
          _scaffoldKey.currentState.openDrawer();
        },
        child: Column(
          children: [
            Builder(
              builder: (context) => Padding(
                padding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                child: Container(
                  child: Image.asset(
                    'assets/homebox.png',
                    height: 30,
                    width: 30,
                    //color: MyTheme.dark_grey,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ) : Column(
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
        height: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Get your token",
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
            Text(
              "status now",
              style: TextStyle(fontSize: 22, color: Colors.black),
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
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 280,
          child: Card(
            shape: RoundedRectangleBorder(
              side: new BorderSide(color: Colors.cyan[800], width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 0.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          //color: Colors.cyan[700],
                          shape: BoxShape.circle,
                          border: Border.all(width: 1,color: Colors.cyan[800]),
                          //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Center(
                          child: Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Center(
                              child: Container(
                                height: 25.0,
                                width: 25.0,
                                decoration: BoxDecoration(
                                  //color: Colors.cyan[800],
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/person.png',
                                    ),
                                    fit: BoxFit.fill,
                                    //colorFilter: ColorFilter.mode(Colors.cyan, BlendMode.overlay)
                                  ),
                                  //shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),

                    Container(
                      decoration: BoxDecoration(
                        //color: Colors.cyan[700],
                        shape: BoxShape.rectangle,
                        border: Border.all(width: 0.5,color: Colors.cyan[800]),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      height: 40,
                      width: 200,
                      child: TextField(
                        //controller: _passwordController,
                        autofocus: false,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.cyan[800],fontSize: 20),
                          hintText:
                          "   Doctor Name",

                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 10,),


                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          //color: Colors.cyan[700],
                          shape: BoxShape.circle,
                          border: Border.all(width: 1,color: Colors.cyan[800]),
                          //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Center(
                          child: Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Center(
                              child: Container(
                                height: 25.0,
                                width: 25.0,
                                decoration: BoxDecoration(
                                  //color: Colors.cyan[800],
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/print.png',
                                    ),
                                    fit: BoxFit.fill,
                                    //colorFilter: ColorFilter.mode(Colors.cyan, BlendMode.overlay)
                                  ),
                                  //shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),

                    Container(
                      decoration: BoxDecoration(
                        //color: Colors.cyan[700],
                        shape: BoxShape.rectangle,
                        border: Border.all(width: 0.5,color: Colors.cyan[800]),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      height: 40,
                      width: 200,
                      child: TextField(
                        //controller: _passwordController,
                        autofocus: false,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.cyan[800],fontSize: 20),
                          hintText:
                          "   Token Number",

                        ),
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 20,),

                Container(
                  //margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  height: 40.0,
                  width: 250.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/getstatus.png'),
                      fit: BoxFit.fill,
                    ),
                    //shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Center(
                      child: Text(
                        "Get Status",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            //height: 1.6,
                            fontWeight: FontWeight.bold),
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
