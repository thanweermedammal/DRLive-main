import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
/////import './Home2.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class wallet1 extends StatelessWidget {
  wallet1({
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
            Pin(size: 158.7, start: 31.3),
            Pin(size: 22.0, start: 29.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  ease: Curves.easeOut,
                  duration: 1.0,
                 // pageBuilder: () => Home2(),
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
                    Pin(size: 120.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Text(
                      'Bank Details',
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
            Pin(size: 138.0, middle: 0.5),
            Pin(size: 40.0, end: 58.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  ease: Curves.easeOut,
                  duration: 1.0,
                  //pageBuilder: () => Home2(),
                ),
              ],
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff6b0772),
                  borderRadius: BorderRadius.circular(8.0),
                  border:
                      Border.all(width: 1.0, color: const Color(0xff707070)),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 118.0, middle: 0.5),
            Pin(size: 17.0, end: 69.0),
            child: Text(
              'Transfer to Bank',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 15,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 27.0, end: 24.0),
            Pin(size: 45.0, start: 102.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1.0, color: const Color(0xfff3c306)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 123.0, middle: 0.2363),
            Pin(size: 17.0, start: 117.0),
            child: Text(
              'Enter your amount',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 15,
                color: const Color(0xffc2c2c2),
              ),
              softWrap: false,
            ),
          ),
          Align(
            alignment: Alignment(-0.339, -0.502),
            child: SizedBox(
              width: 127.0,
              height: 17.0,
              child: Text(
                'State Bank of India',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                softWrap: false,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.461, -0.45),
            child: SizedBox(
              width: 67.0,
              height: 11.0,
              child: Text(
                'xxxxxxxxxx987',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 10,
                  color: const Color(0xff858585),
                ),
                softWrap: false,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.461, -0.295),
            child: SizedBox(
              width: 67.0,
              height: 11.0,
              child: Text(
                'xxxxxxxxxx987',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 10,
                  color: const Color(0xff858585),
                ),
                softWrap: false,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.463, -0.346),
            child: SizedBox(
              width: 73.0,
              height: 17.0,
              child: Text(
                'ICICI Bank',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 19.0, start: 43.0),
            Pin(size: 19.0, middle: 0.2497),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 18.0, start: 43.0),
            Pin(size: 19.0, middle: 0.3252),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
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
