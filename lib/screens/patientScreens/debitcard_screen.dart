import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/screens/patientScreens/payment_success.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adobe_xd/pinned.dart';

class CardDetails extends StatefulWidget {
  CardDetails(
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
  CardDetailsState createState() => CardDetailsState();
}

class CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff6b0772),
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
      centerTitle: false,
      backgroundColor: Color(0xff6b0772),
      leading: Column(
        children: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
      title: Text(
        'Credit/Debit Card',
        style: TextStyle(
          fontFamily: 'Arial',
          fontSize: 24,
          color: const Color(0xffffffff),
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.left,
      ),
      elevation: 0.0,
      titleSpacing: 0,
    );
  }

  buildMethodList() {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.85,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36.0),
              topRight: Radius.circular(36.0),
            ),
            color: const Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      'Card Number',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18,
                        color: const Color(0xff000000),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: const Color(0xffd8d8d8),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      'Expiry Date',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18,
                        color: const Color(0xff000000),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      'CVV',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18,
                        color: const Color(0xff000000),
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xffd8d8d8),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xffd8d8d8),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      'Name',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18,
                        color: const Color(0xff000000),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: const Color(0xffd8d8d8),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Row(
                    children: [
                      // Adobe XD layer: 'surface1' (group)
                      Container(
                        height: 50,
                        width: 50,
                        child: Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(start: 0.0, end: 0.0),
                              child: SvgPicture.string(
                                '<svg viewBox="4.0 4.0 40.0 40.0" ><path  d="M 44 24 C 44 35.04690170288086 35.04690170288086 44 24 44 C 12.95310020446777 44 4 35.04690170288086 4 24 C 4 12.95310020446777 12.95310020446777 4 24 4 C 35.04690170288086 4 44 12.95310020446777 44 24 Z" fill="#f6b2e1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 24.8, middle: 0.5659),
                              Pin(size: 19.2, middle: 0.51),
                              child: SvgPicture.string(
                                '<svg viewBox="12.6 14.6 24.8 19.2" ><path  d="M 34.58589935302734 14.58590030670166 L 21.01560020446777 28.17189979553223 L 15.41409969329834 22.58589935302734 L 12.58590030670166 25.41410064697266 L 21.01950073242188 33.82809829711914 L 37.41410064697266 17.41410064697266 L 34.58589935302734 14.58590030670166 Z" fill="#6b0772" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '   Save Card Details',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 18,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PaymentSuccess();
                    }));
                  },
                  child: Center(
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color(0xff6b0772),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Center(
                          child: Text(
                        'Pay',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
