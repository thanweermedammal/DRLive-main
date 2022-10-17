import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class View extends StatelessWidget {
  View({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3c306),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xfff3c306),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xff6b0772)),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: Text(
          'Patient Details',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 20,
            color: const Color(0xff6b0772),
            fontWeight: FontWeight.w700,
          ),
          softWrap: false,
        ),
        elevation: 0.0,
        titleSpacing: 0,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Center(
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(6, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/lady.png'),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Patient Name                      : Anju PP',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 15,
                  color: const Color(0xff6b0772),
                ),
                softWrap: false,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Age                                  : 20',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 15,
                  color: const Color(0xff6b0772),
                ),
                softWrap: false,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Gender                               : Male',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 15,
                  color: const Color(0xff6b0772),
                ),
                softWrap: false,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Consultation Method          : Chat',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 15,
                  color: const Color(0xff6b0772),
                ),
                softWrap: false,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10),
            child: Text(
              'Prescription Details ',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 17,
                color: const Color(0xff6b0772),
                fontWeight: FontWeight.w700,
              ),
              softWrap: false,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '----------------------------------------------------------------------------------------- ',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 16,
                color: const Color(0xff6b0772),
                fontWeight: FontWeight.w700,
              ),
              softWrap: false,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.35,
                child: Text(
                  'ITEM ',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 15,
                    color: const Color(0xff6b0772),
                    fontWeight: FontWeight.w700,
                  ),
                  softWrap: false,
                ),
              ),
              Text(
                'QTY',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 15,
                  color: const Color(0xff6b0772),
                  fontWeight: FontWeight.w700,
                ),
                softWrap: false,
              ),
              Text(
                'RATE ',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 15,
                  color: const Color(0xff6b0772),
                  fontWeight: FontWeight.w700,
                ),
                softWrap: false,
              ),
              Text(
                'TAX',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 15,
                  color: const Color(0xff6b0772),
                  fontWeight: FontWeight.w700,
                ),
                softWrap: false,
              ),
              Text(
                'TOTAL',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 15,
                  color: const Color(0xff6b0772),
                  fontWeight: FontWeight.w700,
                ),
                softWrap: false,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '----------------------------------------------------------------------------------------- ',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 16,
                color: const Color(0xff6b0772),
                fontWeight: FontWeight.w700,
              ),
              softWrap: false,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.35,
                child: Text(
                  'Benazepril(Lotensin) ',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 14,
                    color: const Color(0xff6b0772),
                    fontWeight: FontWeight.w700,
                  ),
                  softWrap: false,
                ),
              ),
              Text(
                '1',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 14,
                  color: const Color(0xff6b0772),
                  fontWeight: FontWeight.w700,
                ),
                softWrap: false,
              ),
              Text(
                '120 ',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 14,
                  color: const Color(0xff6b0772),
                  fontWeight: FontWeight.w700,
                ),
                softWrap: false,
              ),
              Text(
                '2%',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 14,
                  color: const Color(0xff6b0772),
                  fontWeight: FontWeight.w700,
                ),
                softWrap: false,
              ),
              Text(
                '122',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 14,
                  color: const Color(0xff6b0772),
                  fontWeight: FontWeight.w700,
                ),
                softWrap: false,
              ),
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Text(
              '----------------------------------------------------------------------------------------- ',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 16,
                color: const Color(0xff6b0772),
                fontWeight: FontWeight.w700,
              ),
              softWrap: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Spacer(),
                Text(
                  'Total : ',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16,
                    color: const Color(0xff6b0772),
                    fontWeight: FontWeight.w700,
                  ),
                  softWrap: false,
                ),
                Text(
                  ' 122/-',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16,
                    color: const Color(0xff6b0772),
                    fontWeight: FontWeight.w700,
                  ),
                  softWrap: false,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Text(
              '----------------------------------------------------------------------------------------- ',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 16,
                color: const Color(0xff6b0772),
                fontWeight: FontWeight.w700,
              ),
              softWrap: false,
            ),
          ),
          SizedBox(height: 40,),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Center(
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color(0xff6b0772),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(6, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Center(child: Text(
                  'Close',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 14,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
