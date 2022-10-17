import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
//import './Home2.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Banner1 extends StatelessWidget {
  Banner1({
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
                color: HexColor('33BEA3'),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40.0),
                  bottomLeft: Radius.circular(40.0),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 191.7, start: 31.3),
            Pin(size: 22.0, start: 29.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  ease: Curves.easeOut,
                  duration: 0.3,
                  //pageBuilder: () => Home2(),
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
                    Pin(size: 153.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Text(
                      'Banner Request',
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
            Pin(size: 144.0, start: 39.0),
            Pin(size: 17.0, start: 111.0),
            child: Text(
              'Select Banner Image ',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 15,
                color: HexColor('33BEA3'),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 28.0, start: 36.0),
            Pin(size: 17.0, middle: 0.2086),
            child: Text(
              'Title',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 15,
                color: HexColor('33BEA3'),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 48.0, start: 36.0),
            Pin(size: 17.0, middle: 0.323),
            child: Text(
              'Quotes',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 15,
                color: HexColor('33BEA3'),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 120.0, start: 36.0),
            Pin(size: 17.0, middle: 0.4993),
            child: Text(
              'Background Color',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 15,
                color: HexColor('33BEA3'),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 92.0, middle: 0.7687),
            Pin(size: 33.0, start: 105.0),
            child: Container(
              decoration: BoxDecoration(
                color: HexColor('33BEA3'),
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(6, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 39.0, end: 48.0),
            Pin(size: 45.0, middle: 0.2517),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 1.0, color: HexColor('33BEA3')),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(6, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 39.0, end: 48.0),
            Pin(size: 91.0, middle: 0.3961),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 1.0, color: HexColor('33BEA3')),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(6, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 39.0, end: 48.0),
            Pin(size: 45.0, middle: 0.5538),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 1.0, color: HexColor('33BEA3')),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(6, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 75.0, middle: 0.7544),
            Pin(size: 17.0, start: 111.0),
            child: Text(
              'Choose file',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 15,
                color: const Color(0xffffffff),
              ),
              softWrap: false,
            ),
          ),
          Align(
            alignment: Alignment(0.005, 0.403),
            child: SizedBox(
              width: 155.0,
              height: 33.0,
              child: PageLink(
                links: [
                  PageLinkInfo(
                    ease: Curves.easeOut,
                    duration: 0.3,
                    // pageBuilder: () => Home2(),
                  ),
                ],
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: HexColor('33BEA3'),
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x29000000),
                            offset: Offset(6, 3),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: 97.0,
                        height: 17.0,
                        child: Text(
                          'Make Request',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 15,
                            color: const Color(0xffffffff),
                          ),
                          softWrap: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.623, 0.105),
            child: SizedBox(
              width: 10.0,
              height: 5.0,
              child: Stack(
                children: <Widget>[
                  SizedBox.expand(
                      child: SvgPicture.string(
                    _svg_f0ox06,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_u3zszc =
    '<svg viewBox="4.7 3.0 16.2 19.7" ><path  d="M 20.6835994720459 14.47659969329834 C 17.92189979553223 18.61330032348633 13.58979988098145 22.35549926757812 13.39449977874756 22.45700073242188 C 13.29689979553223 22.55080032348633 13 22.65229988098145 12.80469989776611 22.65229988098145 C 12.60550022125244 22.65229988098145 12.3125 22.55080032348633 12.11330032348633 22.45700073242188 C 11.91800022125244 22.35549926757812 7.582029819488525 18.51560020446777 4.824220180511475 14.47659969329834 C 4.628910064697266 14.17969989776611 4.628910064697266 13.78909969329834 4.726560115814209 13.39449977874756 C 5.023439884185791 13 5.316410064697266 12.80469989776611 5.710939884185791 12.80469989776611 L 9.355469703674316 12.80469989776611 C 9.355469703674316 12.80469989776611 9.847660064697266 4.234379768371582 10.14449977874756 3.839839935302734 C 10.53909969329834 3.347660064697266 11.71879959106445 2.953130006790161 12.80469989776611 2.953130006790161 C 13.88669967651367 2.953130006790161 14.96879959106445 3.347660064697266 15.36330032348633 3.839839935302734 C 15.65629959106445 4.234379768371582 16.25 12.80469989776611 16.25 12.80469989776611 L 19.89450073242188 12.80469989776611 C 20.28910064697266 12.80469989776611 20.58200073242188 13 20.78129959106445 13.39449977874756 C 20.97660064697266 13.6875 20.8789005279541 14.08590030670166 20.6835994720459 14.47659969329834 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_f0ox06 =
    '<svg viewBox="7.0 10.0 10.0 5.0" ><path  d="M 7 10 L 12 15 L 17 10 L 7 10 Z" fill="#33BEA3" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
