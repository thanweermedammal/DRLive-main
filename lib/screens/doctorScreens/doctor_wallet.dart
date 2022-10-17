import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/ui_sections/main_drawer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:active_ecommerce_flutter/screens/doctorScreens/payment_page.dart';

class DoctorWallet extends StatefulWidget {
  DoctorWallet(
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
  DoctorWalletState createState() => DoctorWalletState();
}

class DoctorWalletState extends State<DoctorWallet> {
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
          Container(
              height: 200,
              width: 300,
              child: Image.asset("assets/cards.png",
                fit: BoxFit.cover,
                //    color: Colors.white
              )),
          CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                    activeWidget(),
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
                "Wallet",
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


  activeWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 200,),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Center(
                child: Text(
                  "Your Balance",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      //height: 1.6,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Center(
                child: Text(
                  "5000.00/-",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      //height: 1.6,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          SingleChildScrollView(
            child: ListView.builder(
              itemCount: 2,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(
                        top: 4.0, bottom: 4.0, left: 25.0, right: 25.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
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
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        "Credit",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            //height: 1.6,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Center(
                                      child: Text(
                                        "Your earnings credited for this booking",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            //height: 1.6,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: Center(
                                  child: Text(
                                    " 200.00/-",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        //height: 1.6,
                                        fontWeight: FontWeight.bold),
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
          SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return PaymentPage();
                  }));
            },
            child: Center(
              child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Image.asset("assets/redeem.png",
                    fit: BoxFit.scaleDown,
                    //    color: Colors.white
                  )),
            ),
          ),
        ],
      ),
    );
  }

}
