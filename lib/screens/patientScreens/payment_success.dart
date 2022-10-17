import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:active_ecommerce_flutter/screens/patientScreens/token_status.dart';

class PaymentSuccess extends StatefulWidget {


  @override
  PaymentSuccessState createState() => PaymentSuccessState();
}

class PaymentSuccessState extends State<PaymentSuccess> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
        backgroundColor: Color(0xff6b0772),
        body:buildMethodList());
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
      elevation: 0.0,
      titleSpacing: 0,
    );
  }



  buildMethodList() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/lady.png',
                    height: 200,
                    //color: MyTheme.dark_grey,
                  ),
                ),
                // Adobe XD layer: 'surface1' (group)
                Container(
                  height: 120,
                  width: 120,
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child: SvgPicture.string(
                          '<svg viewBox="4.0 4.0 130.9 130.9" ><path transform="translate(0.0, 0.0)" d="M 134.8994140625 69.44969940185547 C 134.8994140625 105.6005249023438 105.6005249023438 134.8994140625 69.44969940185547 134.8994140625 C 33.29888916015625 134.8994140625 3.999999284744263 105.6005249023438 3.999999284744263 69.44969940185547 C 3.999999284744263 33.29888916015625 33.29888916015625 3.999999284744263 69.44969940185547 3.999999284744263 C 105.6005249023438 3.999999284744263 134.8994140625 33.29888916015625 134.8994140625 69.44969940185547 Z" fill="#f6b2e1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 81.2, middle: 0.5659),
                        Pin(size: 63.0, middle: 0.51),
                        child: SvgPicture.string(
                          '<svg viewBox="32.1 38.6 81.2 63.0" ><path transform="translate(19.51, 24.06)" d="M 84.58057403564453 14.58589839935303 L 40.17197036743164 59.04588317871094 L 21.84113883972168 40.76578140258789 L 12.58589839935303 50.02102279663086 L 40.18473052978516 77.55570983886719 L 93.83582305908203 23.84114456176758 L 84.58057403564453 14.58589839935303 Z" fill="#6b0772" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Payment  Successful ! ',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 24,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
      ),
    );
  }
}
