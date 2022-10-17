import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/screens/patientScreens/debitcard_screen.dart';

class PaymentDetails extends StatefulWidget {
  PaymentDetails(
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
  PaymentDetailState createState() => PaymentDetailState();
}

class PaymentDetailState extends State<PaymentDetails> {


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
          Positioned(
            bottom: 0,
            child: Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color(0xff6b0772),
                borderRadius: BorderRadius.circular(15.0),),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Consultation Fee",
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                //height: 1.6,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " ₹150/-",
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                //height: 1.6,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CardDetails(
                        );
                      }));
                    },
                    child: Center(
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius: BorderRadius.circular(5.0),
                          //shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: Text(
                          'Pay',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 18,
                            color: const Color(0xff6b0772),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
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
        'Payment',
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
          height: 100,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36.0),
              topRight: Radius.circular(36.0),
            ),
            color: const Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width:200,
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/images/gpay.png',
                            height: 50,
                            //color: MyTheme.dark_grey,
                          ),
                        ),
                        SizedBox(width: 30,),
                        Text(
                          'Google Pay',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16,
                            color: const Color(0xff000000),
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    width:200,
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/images/card.png',
                            height: 50,
                            //color: MyTheme.dark_grey,
                          ),
                        ),
                        SizedBox(width: 30,),
                        Text(
                          ' UPI',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16,
                            color: const Color(0xff000000),
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    width:200,
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/images/bhim.png',
                            height: 40,
                            //color: MyTheme.dark_grey,
                          ),
                        ),
                        SizedBox(width: 25,),
                        Text(
                          'BHIM',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16,
                            color: const Color(0xff000000),
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    width:200,
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/images/upi.jpg',
                            height: 40,
                            //color: MyTheme.dark_grey,
                          ),
                        ),
                        SizedBox(width: 30,),
                        Text(
                          ' UPI',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16,
                            color: const Color(0xff000000),
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    width:200,
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/images/wallet.png',
                            height: 40,
                            //color: MyTheme.dark_grey,
                          ),
                        ),
                        SizedBox(width: 30,),
                        Text(
                          '     Wallet',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16,
                            color: const Color(0xff000000),
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    width:200,
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/images/bank.png',
                            height: 40,
                            //color: MyTheme.dark_grey,
                          ),
                        ),
                        SizedBox(width: 30,),
                        Text(
                          '      Net Banking',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16,
                            color: const Color(0xff000000),
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
