import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
//import './Home2.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConsultationHistory1 extends StatelessWidget {
  ConsultationHistory1({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 67.0, start: 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff6b0772),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 235.7, start: 31.3),
            Pin(size: 22.0, start: 29.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  ease: Curves.easeOut,
                  duration: 1.0,
                //  pageBuilder: () => Home2(),
                ),
              ],
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 16.2, start: 1.7),
                    Pin(size: 19.7, start: 0.0),
                    child: Transform.rotate(
                      angle: 1.5708,
                      child: Stack(
                        children: <Widget>[
                          SizedBox.expand(
                              child: SvgPicture.string(
                            _svg_u3zszc,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          )),
                        ],
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 197.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Text(
                      'Consultation History',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 20,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                      ),
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 265.0, start: 27.0),
            Pin(size: 35.0, start: 94.8),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x29000000),
                        offset: Offset(6, 3),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 27.4, end: 15.6),
            Pin(size: 28.6, start: 97.8),
            child: Stack(
              children: <Widget>[
                SizedBox.expand(
                    child: SvgPicture.string(
                  _svg_bztb,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                )),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 191.5, start: 30.5),
            Pin(size: 14.0, middle: 0.1915),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 28.0, start: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    'From',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      color: const Color(0xffb0b0b0),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 13.0, middle: 0.605),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    'To',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      color: const Color(0xffb0b0b0),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 61.0, middle: 0.2874),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    '01-12-2021',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      color: const Color(0xff6b0772),
                      decoration: TextDecoration.underline,
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 61.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    '31-12-2022',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      color: const Color(0xff6b0772),
                      decoration: TextDecoration.underline,
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 28.0, middle: 0.2459),
            child: Container(
              color: const Color(0xff6b0772),
            ),
          ),
          Pinned.fromPins(
            Pin(start: -1.0, end: 1.0),
            Pin(size: 52.0, middle: 0.339),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 25.0, start: 0.0),
                  child: Container(
                    color: const Color(0x66c2c2c2),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 25.0, end: 0.0),
                  child: Container(
                    color: const Color(0x66f6d3eb),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: -1.0, end: 1.0),
            Pin(size: 52.0, middle: 0.4153),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 25.0, start: 0.0),
                  child: Container(
                    color: const Color(0x66c2c2c2),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 25.0, end: 0.0),
                  child: Container(
                    color: const Color(0x66f6d3eb),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: -1.0, end: 1.0),
            Pin(size: 52.0, middle: 0.4915),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 25.0, start: 0.0),
                  child: Container(
                    color: const Color(0x66c2c2c2),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 25.0, end: 0.0),
                  child: Container(
                    color: const Color(0x66f6d3eb),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: -1.0, end: 1.0),
            Pin(size: 52.0, middle: 0.5678),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 25.0, start: 0.0),
                  child: Container(
                    color: const Color(0x66c2c2c2),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 25.0, end: 0.0),
                  child: Container(
                    color: const Color(0x66f6d3eb),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: -1.0, end: 1.0),
            Pin(size: 52.0, middle: 0.6441),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 25.0, start: 0.0),
                  child: Container(
                    color: const Color(0x66c2c2c2),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 25.0, end: 0.0),
                  child: Container(
                    color: const Color(0x66f6d3eb),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: -1.0, end: 1.0),
            Pin(size: 52.0, middle: 0.7203),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 25.0, start: 0.0),
                  child: Container(
                    color: const Color(0x66c2c2c2),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 25.0, end: 0.0),
                  child: Container(
                    color: const Color(0x66f6d3eb),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: -1.0, end: 1.0),
            Pin(size: 52.0, middle: 0.7966),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 25.0, start: 0.0),
                  child: Container(
                    color: const Color(0x66c2c2c2),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 25.0, end: 0.0),
                  child: Container(
                    color: const Color(0x66f6d3eb),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: -1.0, end: 1.0),
            Pin(size: 52.0, end: 90.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 25.0, start: 0.0),
                  child: Container(
                    color: const Color(0x66c2c2c2),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 25.0, end: 0.0),
                  child: Container(
                    color: const Color(0x66f6d3eb),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: -1.0, end: 1.0),
            Pin(size: 38.0, end: 50.0),
            child: Stack(
              children: <Widget>[
                Container(
                  color: const Color(0x66c2c2c2),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 19.0, start: 6.0),
            Pin(size: 11.0, middle: 0.2523),
            child: Text(
              'SNo',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 10,
                color: const Color(0xffffffff),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 21.0, start: 33.0),
            Pin(size: 11.0, middle: 0.2523),
            child: Text(
              'Date',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 10,
                color: const Color(0xffffffff),
              ),
              softWrap: false,
            ),
          ),
          Align(
            alignment: Alignment(-0.458, -0.495),
            child: SizedBox(
              width: 61.0,
              height: 11.0,
              child: Text(
                'Patient Name',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 10,
                  color: const Color(0xffffffff),
                ),
                softWrap: false,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.125, -0.504),
            child: SizedBox(
              width: 56.0,
              height: 22.0,
              child: Text(
                'Consultation\n Method',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 10,
                  color: const Color(0xffffffff),
                ),
                softWrap: false,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.451, -0.495),
            child: SizedBox(
              width: 36.0,
              height: 11.0,
              child: Text(
                'Disease',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 10,
                  color: const Color(0xffffffff),
                ),
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 18.0, end: 20.0),
            Pin(size: 11.0, middle: 0.2523),
            child: Text(
              'Amt',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 10,
                color: const Color(0xffffffff),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 13.0, end: 7.0),
            Pin(size: 10.0, middle: 0.332),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 4.0, start: 0.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 40.0, start: 21.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '01/01/2022',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 46.0, middle: 0.2313),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    'Jaan Francis',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 17.0, middle: 0.517),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    'Chat',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 64.0, end: 49.0),
                  Pin(start: 1.0, end: 0.0),
                  child: Text(
                    'Heart Arrhythmias',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 31.0, end: 0.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '1,500.00',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 13.0, end: 7.0),
            Pin(size: 10.0, middle: 0.368),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 4.0, start: 0.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 40.0, start: 21.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '10/01/2022',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 46.0, middle: 0.2313),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    'Jaan Francis',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 35.0, middle: 0.5475),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    'Video call',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 64.0, end: 49.0),
                  Pin(start: 1.0, end: 0.0),
                  child: Text(
                    'Heart Arrhythmias',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 31.0, end: 0.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '1,500.00',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 13.0, end: 7.0),
            Pin(size: 10.0, middle: 0.4053),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 4.0, start: 0.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 40.0, start: 21.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '12/01/2022',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 46.0, middle: 0.2313),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    'Jaan Francis',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 14.0, middle: 0.5123),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    'Call',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 64.0, end: 49.0),
                  Pin(start: 1.0, end: 0.0),
                  child: Text(
                    'Heart Arrhythmias',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 31.0, end: 0.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '1,500.00',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 13.0, end: 7.0),
            Pin(size: 10.0, middle: 0.4413),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 4.0, start: 0.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 40.0, start: 21.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '12/01/2022',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 46.0, middle: 0.2313),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    'Jaan Francis',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 17.0, middle: 0.517),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    'Chat',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 64.0, end: 49.0),
                  Pin(start: 1.0, end: 0.0),
                  child: Text(
                    'Heart Arrhythmias',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 31.0, end: 0.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '1,500.00',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 13.0, end: 7.0),
            Pin(size: 10.0, middle: 0.4773),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 4.0, start: 0.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 40.0, start: 21.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '12/01/2022',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 46.0, middle: 0.2313),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    'Jaan Francis',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 17.0, middle: 0.517),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    'Chat',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 64.0, end: 49.0),
                  Pin(start: 1.0, end: 0.0),
                  child: Text(
                    'Heart Arrhythmias',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 31.0, end: 0.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '1,500.00',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 13.0, end: 7.0),
            Pin(size: 10.0, middle: 0.5133),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 4.0, start: 0.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 40.0, start: 21.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '12/01/2022',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 46.0, middle: 0.2313),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    'Jaan Francis',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 17.0, middle: 0.517),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    'Chat',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 64.0, end: 49.0),
                  Pin(start: 1.0, end: 0.0),
                  child: Text(
                    'Heart Arrhythmias',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 31.0, end: 0.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '1,500.00',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 13.0, end: 7.0),
            Pin(size: 10.0, middle: 0.548),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 4.0, start: 0.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 40.0, start: 21.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '12/01/2022',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 46.0, middle: 0.2313),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    'Jaan Francis',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 17.0, middle: 0.517),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    'Chat',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 64.0, end: 49.0),
                  Pin(start: 1.0, end: 0.0),
                  child: Text(
                    'Heart Arrhythmias',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 31.0, end: 0.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '1,500.00',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 13.0, end: 7.0),
            Pin(size: 10.0, middle: 0.584),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 4.0, start: 0.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 40.0, start: 21.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '12/01/2022',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 46.0, middle: 0.2313),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    'Jaan Francis',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 17.0, middle: 0.517),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    'Chat',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 64.0, end: 49.0),
                  Pin(start: 1.0, end: 0.0),
                  child: Text(
                    'Heart Arrhythmias',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 31.0, end: 0.0),
                  Pin(start: 0.0, end: 1.0),
                  child: Text(
                    '1,500.00',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 7.0, end: 7.0),
            Pin(size: 232.0, end: 63.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 4.0, start: 6.0),
                  Pin(size: 9.0, start: 0.0),
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 40.0, start: 27.0),
                  Pin(size: 9.0, start: 0.0),
                  child: Text(
                    '17/01/2022',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Align(
                  alignment: Alignment(-0.507, -1.0),
                  child: SizedBox(
                    width: 46.0,
                    height: 9.0,
                    child: Text(
                      'Jaan Francis',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 8,
                        color: const Color(0xff6b0772),
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.052, -1.0),
                  child: SizedBox(
                    width: 17.0,
                    height: 9.0,
                    child: Text(
                      'Chat',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 8,
                        color: const Color(0xff6b0772),
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 64.0, end: 49.0),
                  Pin(size: 9.0, start: 1.0),
                  child: Text(
                    'Heart Arrhythmias',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      color: const Color(0xff6b0772),
                    ),
                    softWrap: false,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    width: 31.0,
                    height: 9.0,
                    child: Text(
                      '1,500.00',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 8,
                        color: const Color(0xff6b0772),
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 44.0, end: 2.0),
                  Pin(size: 11.0, end: 0.0),
                  child: Text(
                    '13,500.00',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: const Color(0xff6b0772),
                      fontWeight: FontWeight.w700,
                    ),
                    softWrap: false,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    width: 40.0,
                    height: 17.0,
                    child: Text(
                      'Total:',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 15,
                        color: const Color(0xff6b0772),
                        fontWeight: FontWeight.w700,
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 13.7, end: 15.3),
            Pin(size: 13.7, middle: 0.2854),
            child: Stack(
              children: <Widget>[
                SizedBox.expand(
                    child: SvgPicture.string(
                  _svg_aa3hkr,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                )),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 12.5, start: 37.3),
            Pin(size: 12.5, start: 107.2),
            child: Stack(
              children: <Widget>[
                SizedBox.expand(
                    child: SvgPicture.string(
                  _svg_scnjrw,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_u3zszc =
    '<svg viewBox="4.7 3.0 16.2 19.7" ><path  d="M 20.6835994720459 14.47659969329834 C 17.92189979553223 18.61330032348633 13.58979988098145 22.35549926757812 13.39449977874756 22.45700073242188 C 13.29689979553223 22.55080032348633 13 22.65229988098145 12.80469989776611 22.65229988098145 C 12.60550022125244 22.65229988098145 12.3125 22.55080032348633 12.11330032348633 22.45700073242188 C 11.91800022125244 22.35549926757812 7.582029819488525 18.51560020446777 4.824220180511475 14.47659969329834 C 4.628910064697266 14.17969989776611 4.628910064697266 13.78909969329834 4.726560115814209 13.39449977874756 C 5.023439884185791 13 5.316410064697266 12.80469989776611 5.710939884185791 12.80469989776611 L 9.355469703674316 12.80469989776611 C 9.355469703674316 12.80469989776611 9.847660064697266 4.234379768371582 10.14449977874756 3.839839935302734 C 10.53909969329834 3.347660064697266 11.71879959106445 2.953130006790161 12.80469989776611 2.953130006790161 C 13.88669967651367 2.953130006790161 14.96879959106445 3.347660064697266 15.36330032348633 3.839839935302734 C 15.65629959106445 4.234379768371582 16.25 12.80469989776611 16.25 12.80469989776611 L 19.89450073242188 12.80469989776611 C 20.28910064697266 12.80469989776611 20.58200073242188 13 20.78129959106445 13.39449977874756 C 20.97660064697266 13.6875 20.8789005279541 14.08590030670166 20.6835994720459 14.47659969329834 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bztb =
    '<svg viewBox="5.0 4.0 27.4 28.6" ><path transform="translate(0.0, 0.0)" d="M 9.977790832519531 3.999999761581421 L 9.977790832519531 5.244447708129883 L 4.999999523162842 5.244447708129883 L 4.999999523162842 32.62229919433594 L 32.37784957885742 32.62229919433594 L 32.37784957885742 5.244447708129883 L 27.40006065368652 5.244447708129883 L 27.40006065368652 3.999999761581421 L 24.91116523742676 3.999999761581421 L 24.91116523742676 5.244447708129883 L 12.4666862487793 5.244447708129883 L 12.4666862487793 3.999999761581421 L 9.977790832519531 3.999999761581421 Z M 7.488895416259766 7.733343124389648 L 9.977790832519531 7.733343124389648 L 9.977790832519531 8.977790832519531 L 12.4666862487793 8.977790832519531 L 12.4666862487793 7.733343124389648 L 24.91116523742676 7.733343124389648 L 24.91116523742676 8.977790832519531 L 27.40006065368652 8.977790832519531 L 27.40006065368652 7.733343124389648 L 29.88895797729492 7.733343124389648 L 29.88895797729492 10.22223854064941 L 7.488895416259766 10.22223854064941 L 7.488895416259766 7.733343124389648 Z M 7.488895416259766 12.71113395690918 L 29.88895797729492 12.71113395690918 L 29.88895797729492 30.1334056854248 L 7.488895416259766 30.1334056854248 L 7.488895416259766 12.71113395690918 Z M 14.95558261871338 15.20003032684326 L 14.95558261871338 17.68892669677734 L 17.44447898864746 17.68892669677734 L 17.44447898864746 15.20003032684326 L 14.95558261871338 15.20003032684326 Z M 19.93337440490723 15.20003032684326 L 19.93337440490723 17.68892669677734 L 22.42226982116699 17.68892669677734 L 22.42226982116699 15.20003032684326 L 19.93337440490723 15.20003032684326 Z M 24.91116523742676 15.20003032684326 L 24.91116523742676 17.68892669677734 L 27.40006065368652 17.68892669677734 L 27.40006065368652 15.20003032684326 L 24.91116523742676 15.20003032684326 Z M 9.977790832519531 20.17782211303711 L 9.977790832519531 22.66671752929688 L 12.4666862487793 22.66671752929688 L 12.4666862487793 20.17782211303711 L 9.977790832519531 20.17782211303711 Z M 14.95558261871338 20.17782211303711 L 14.95558261871338 22.66671752929688 L 17.44447898864746 22.66671752929688 L 17.44447898864746 20.17782211303711 L 14.95558261871338 20.17782211303711 Z M 19.93337440490723 20.17782211303711 L 19.93337440490723 22.66671752929688 L 22.42226982116699 22.66671752929688 L 22.42226982116699 20.17782211303711 L 19.93337440490723 20.17782211303711 Z M 24.91116523742676 20.17782211303711 L 24.91116523742676 22.66671752929688 L 27.40006065368652 22.66671752929688 L 27.40006065368652 20.17782211303711 L 24.91116523742676 20.17782211303711 Z M 9.977790832519531 25.15561294555664 L 9.977790832519531 27.64450836181641 L 12.4666862487793 27.64450836181641 L 12.4666862487793 25.15561294555664 L 9.977790832519531 25.15561294555664 Z M 14.95558261871338 25.15561294555664 L 14.95558261871338 27.64450836181641 L 17.44447898864746 27.64450836181641 L 17.44447898864746 25.15561294555664 L 14.95558261871338 25.15561294555664 Z M 19.93337440490723 25.15561294555664 L 19.93337440490723 27.64450836181641 L 22.42226982116699 27.64450836181641 L 22.42226982116699 25.15561294555664 L 19.93337440490723 25.15561294555664 Z" fill="#858585" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_aa3hkr =
    '<svg viewBox="2.0 2.0 13.7 13.7" ><path  d="M 8.162121772766113 2 L 8.162121772766113 3.369360446929932 L 9.531481742858887 3.369360446929932 L 9.531481742858887 2 L 8.162121772766113 2 Z M 8.162121772766113 4.738720417022705 L 8.162121772766113 10.61731624603271 L 5.907489776611328 8.362732887268066 L 4.939311504364014 9.330870628356934 L 8.8468017578125 13.2384090423584 L 12.7542724609375 9.330870628356934 L 11.78613376617432 8.362732887268066 L 9.531481742858887 10.61731624603271 L 9.531481742858887 4.738720417022705 L 8.162121772766113 4.738720417022705 Z M 2 12.27020263671875 L 2 14.32424354553223 C 2 15.07314586639404 2.620491504669189 15.693603515625 3.369360446929932 15.693603515625 L 14.32424354553223 15.693603515625 C 15.07314586639404 15.693603515625 15.693603515625 15.07314586639404 15.693603515625 14.32424354553223 L 15.693603515625 12.27020263671875 L 14.32424354553223 12.27020263671875 L 14.32424354553223 14.32424354553223 L 3.369360446929932 14.32424354553223 L 3.369360446929932 12.27020263671875 L 2 12.27020263671875 Z" fill="#6b0772" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_scnjrw =
    '<svg viewBox="0.2 0.2 12.5 12.5" ><path transform="translate(0.0, 0.0)" d="M 4.939493179321289 0.1835939288139343 C 2.311635494232178 0.1835939288139343 0.1835939288139343 2.311635494232178 0.1835939288139343 4.939493179321289 C 0.1835939288139343 7.567346096038818 2.311635494232178 9.695379257202148 4.939493179321289 9.695379257202148 C 6.048706531524658 9.695379257202148 7.069466114044189 9.303207397460938 7.878760814666748 8.665022850036621 L 8.301690101623535 9.089872360229492 C 8.124820709228516 9.424318313598633 8.186335563659668 9.853006362915039 8.468913078308105 10.1356315612793 L 10.69502639770508 12.37704944610596 C 11.04103755950928 12.72311115264893 11.60619068145752 12.72311115264893 11.95225048065186 12.37704944610596 L 12.37704944610596 11.95225048065186 C 12.72311115264893 11.60619068145752 12.72311115264893 11.04103755950928 12.37704944610596 10.69502639770508 L 10.1356315612793 8.468913078308105 C 9.851086616516113 8.184416770935059 9.424318313598633 8.136385917663574 9.089872360229492 8.317043304443359 L 8.665022850036621 7.894164562225342 C 9.307095527648926 7.082901000976562 9.695379257202148 6.054465293884277 9.695379257202148 4.939493179321289 C 9.695379257202148 2.311635494232178 7.567346096038818 0.1835939288139343 4.939493179321289 0.1835939288139343 Z M 4.939493179321289 1.062108516693115 C 7.080981731414795 1.062108516693115 8.816892623901367 2.797989845275879 8.816892623901367 4.939493179321289 C 8.816892623901367 7.080981731414795 7.080981731414795 8.816892623901367 4.939493179321289 8.816892623901367 C 2.797989845275879 8.816892623901367 1.062108516693115 7.080981731414795 1.062108516693115 4.939493179321289 C 1.062108516693115 2.797989845275879 2.797989845275879 1.062108516693115 4.939493179321289 1.062108516693115 Z M 2.486570119857788 3.713031768798828 C 2.236665964126587 4.118649005889893 2.092488765716553 4.595391750335693 2.092488765716553 5.106735706329346 C 2.092488765716553 6.573505878448486 3.276657104492188 7.757649898529053 4.743412017822266 7.757649898529053 C 5.30860424041748 7.757649898529053 5.841080188751221 7.573103904724121 6.273606300354004 7.273204803466797 C 6.156333923339844 7.284770011901855 6.029464721679688 7.286688804626465 5.908353328704834 7.286688804626465 C 4.012916088104248 7.286688804626465 2.486570119857788 5.762242317199707 2.486570119857788 3.864895343780518 C 2.486570119857788 3.812991380691528 2.484650850296021 3.764935493469238 2.486570119857788 3.713031768798828 Z" fill="#c2c2c2" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
