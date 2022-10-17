import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Message extends StatelessWidget {
  Message();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6b2e1),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 38.0, start: 30.0),
            Pin(size: 38.0, middle: 0.2269),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xfff3c306),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 38.0, start: 30.0),
            Pin(size: 38.0, middle: 0.5987),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xfff3c306),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 38.0, end: 30.3),
            Pin(size: 38.0, middle: 0.4128),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xff6b0772),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 38.0, end: 30.3),
            Pin(size: 38.0, middle: 0.7628),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xff6b0772),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 18.0, start: 40.0),
            Pin(size: 34.0, middle: 0.2309),
            child:
                // Adobe XD layer: 'PikPng.com_doctor-c…' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/doctor.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 18.0, start: 40.0),
            Pin(size: 34.0, middle: 0.6008),
            child:
                // Adobe XD layer: 'PikPng.com_doctor-c…' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/doctor.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 102.0, middle: 0.3043),
            Pin(size: 16.0, middle: 0.2344),
            child: Text(
              'Dr. Jone Francis',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14,
                color: const Color(0xff6b0772),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 102.0, middle: 0.3043),
            Pin(size: 16.0, middle: 0.596),
            child: Text(
              'Dr. Jone Francis',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14,
                color: const Color(0xff6b0772),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 80.0, middle: 0.7188),
            Pin(size: 16.0, middle: 0.4152),
            child: Text(
              'Jaan Francis',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14,
                color: const Color(0xff6b0772),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 80.0, middle: 0.7188),
            Pin(size: 16.0, middle: 0.7556),
            child: Text(
              'Jaan Francis',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14,
                color: const Color(0xff6b0772),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 95.0, middle: 0.5019),
            Pin(size: 14.0, start: 108.0),
            child: Text(
              'Consultation Start',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 12,
                color: const Color(0xff6b0772),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 190.0, middle: 0.5),
            Pin(size: 11.0, start: 142.0),
            child: Text(
              'You can consult your problem to the doctor',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 10,
                color: const Color(0xff6b0772),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 68.0, start: 24.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16.0),
                        bottomLeft: Radius.circular(16.0),
                      ),
                      color: const Color(0xff6b0772),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 38.0, middle: 0.1708),
                  Pin(size: 38.0, middle: 0.6333),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      color: const Color(0xfff3c306),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 18.0, middle: 0.1901),
                  Pin(size: 34.0, middle: 0.6765),
                  child:
                      // Adobe XD layer: 'PikPng.com_doctor-c…' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/images/doctor.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 109.0, middle: 0.4122),
                  Pin(size: 16.0, middle: 0.6538),
                  child: Text(
                    'Dr. Jone Francis',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 10.2, end: 61.2),
                  Pin(size: 10.2, middle: 0.6233),
                  child:
                      // Adobe XD layer: 'surface1' (group)
                      Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child: SvgPicture.string(
                          _svg_l70dr0,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 14.3, end: 32.7),
                  Pin(size: 6.5, middle: 0.618),
                  child:
                      // Adobe XD layer: 'surface1' (group)
                      Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child: SvgPicture.string(
                          _svg_ec7lza,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 2.6, end: 16.4),
                  Pin(size: 11.8, middle: 0.6405),
                  child:
                      // Adobe XD layer: 'surface1' (group)
                      Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child: SvgPicture.string(
                          _svg_r04zi2,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 228.0, middle: 0.5682),
            Pin(size: 57.0, middle: 0.2943),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                ),
                color: const Color(0xfff3c306),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 228.0, middle: 0.5682),
            Pin(size: 57.0, middle: 0.6754),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                ),
                color: const Color(0xfff3c306),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 228.0, middle: 0.4318),
            Pin(size: 81.0, middle: 0.5007),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                ),
                color: const Color(0xff6b0772),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 228.0, middle: 0.4318),
            Pin(size: 36.0, middle: 0.821),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                ),
                color: const Color(0xff6b0772),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 14.0, end: 42.0),
            Pin(size: 25.0, middle: 0.4174),
            child:
                // Adobe XD layer: 'PikPng.com_cute-png…' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 14.0, end: 42.0),
            Pin(size: 25.0, middle: 0.7617),
            child:
                // Adobe XD layer: 'PikPng.com_cute-png…' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 109.0, middle: 0.3586),
            Pin(size: 14.0, middle: 0.291),
            child: Text(
              'How can I help you?',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 12,
                color: const Color(0xff6b0772),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 178.0, middle: 0.4945),
            Pin(size: 42.0, middle: 0.6753),
            child: Text(
              'It is a long established fact that a \nreader will be distracted by the \nreadable content ',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 12,
                color: const Color(0xff6b0772),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 195.0, middle: 0.4364),
            Pin(size: 56.0, middle: 0.4974),
            child: Text(
              'There are many variations of\n passages of Lorem Ipsum available,\n but the majority form, by injected\n humour,',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 12,
                color: const Color(0xfff3c306),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 43.0, middle: 0.7571),
            Pin(size: 11.0, middle: 0.3271),
            child: Text(
              '02:30 PM',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 10,
                color: const Color(0xff6b0772),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 43.0, middle: 0.7571),
            Pin(size: 11.0, middle: 0.6877),
            child: Text(
              '02:30 PM',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 10,
                color: const Color(0xff6b0772),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 43.0, middle: 0.7003),
            Pin(size: 11.0, middle: 0.5353),
            child: Text(
              '02:30 PM',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 10,
                color: const Color(0xfff3c306),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 43.0, middle: 0.7003),
            Pin(size: 11.0, end: 147.0),
            child: Text(
              '02:30 PM',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 10,
                color: const Color(0xfff3c306),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 4.0, middle: 0.2219),
            Pin(size: 18.0, end: 147.0),
            child: Transform.rotate(
              angle: 1.5708,
              child:
                  // Adobe XD layer: 'surface1' (group)
                  Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: SvgPicture.string(
                      _svg_e6t6wz,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 4.0, end: -302.0),
            Pin(size: 18.0, end: -2.0),
            child: Transform.rotate(
              angle: 1.5708,
              child:
                  // Adobe XD layer: 'surface1' (group)
                  Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: SvgPicture.string(
                      _svg_ywpj,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_l70dr0 =
    '<svg viewBox="3.0 3.0 10.2 10.2" ><path transform="translate(0.0, 0.0)" d="M 4.911573886871338 2.977715492248535 C 4.76951265335083 2.986879587173462 4.617376327514648 3.037285089492798 4.471654415130615 3.139015436172485 C 4.456076145172119 3.149094820022583 2.95671558380127 4.236040592193604 2.975961446762085 4.846409797668457 C 3.030951261520386 6.58772611618042 4.727351188659668 8.637892723083496 6.139637470245361 10.05200958251953 C 7.552862644195557 11.46431922912598 9.602114677429199 13.15979099273682 11.35166645050049 13.217529296875 L 11.36266899108887 13.217529296875 C 11.96753978729248 13.217529296875 13.04073143005371 11.7355842590332 13.05082035064697 11.72183704376221 C 13.17270469665527 11.54770374298096 13.23044586181641 11.34884071350098 13.21395015716553 11.16004371643066 C 13.1974573135376 10.97398948669434 13.11130619049072 10.8136043548584 12.97933101654053 10.72104835510254 C 12.82077789306641 10.61014366149902 11.10329818725586 9.468208312988281 10.89434719085693 9.339919090270996 C 10.68997097015381 9.214350700378418 10.38935470581055 9.234504699707031 10.09150505065918 9.392145156860352 C 9.92286205291748 9.481040954589844 9.408719062805176 9.774314880371094 9.168610572814941 9.910885810852051 C 8.956912994384766 9.763335227966309 8.44000244140625 9.370162010192871 7.63075590133667 8.560914993286133 C 6.820594310760498 7.751645088195801 6.428335666656494 7.234756469726562 6.280784130096436 7.023975372314453 C 6.418247222900391 6.783843040466309 6.710605621337891 6.268784999847412 6.799502372741699 6.10107946395874 C 6.958972454071045 5.797717094421387 6.978234767913818 5.4952712059021 6.849006652832031 5.293663501739502 C 6.726184844970703 5.097522735595703 5.589762210845947 3.375466823577881 5.46970796585083 3.20958399772644 C 5.358803749084473 3.055615901947021 5.148937702178955 2.960301876068115 4.911573886871338 2.977715492248535 Z M 8.096332550048828 3.441452980041504 L 8.096332550048828 3.907022953033447 C 10.40676307678223 3.907022953033447 12.28647994995117 5.785799503326416 12.28647994995117 8.096251487731934 L 12.75203323364258 8.096251487731934 C 12.75203323364258 5.530112266540527 10.66338920593262 3.441452980041504 8.096332550048828 3.441452980041504 Z M 8.096332550048828 4.731845855712891 L 8.096332550048828 5.197422981262207 C 9.695588111877441 5.197422981262207 10.99607753753662 6.497913837432861 10.99607753753662 8.096251487731934 L 11.46163177490234 8.096251487731934 C 11.46163177490234 6.240373134613037 9.952189445495605 4.731845855712891 8.096332550048828 4.731845855712891 Z M 8.096332550048828 6.001179695129395 L 8.096332550048828 6.466756343841553 C 8.994476318359375 6.466756343841553 9.725829124450684 7.198109149932861 9.725829124450684 8.096251487731934 L 10.19140625 8.096251487731934 C 10.19140625 6.940568923950195 9.251102447509766 6.001179695129395 8.096332550048828 6.001179695129395 Z" fill="#f6b2e1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ec7lza =
    '<svg viewBox="0.0 5.9 14.3 6.5" ><path  d="M 4.67568826675415 5.910160064697266 C 1.374562621116638 5.910160064697266 0 6.288142204284668 0 6.592372894287109 L 0 11.72005844116211 C 0 12.0187520980835 1.374562621116638 12.41699314117432 4.67568826675415 12.41699314117432 C 7.976847171783447 12.41699314117432 9.351387977600098 12.04084205627441 9.351387977600098 11.73478603363037 L 9.351387977600098 6.607123374938965 C 9.351387977600098 6.308425903320312 7.976847171783447 5.910160064697266 4.67568826675415 5.910160064697266 Z M 13.95944118499756 5.924911022186279 C 13.86124801635742 5.928597450256348 13.76305484771729 5.956253051757812 13.69976997375488 5.996818065643311 L 10.12593173980713 7.943915367126465 C 9.988471031188965 8.03053092956543 9.901226043701172 8.174354553222656 9.901226043701172 8.321859359741211 L 9.901226043701172 10.00710487365723 C 9.901226043701172 10.15092945098877 9.988471031188965 10.29659461975098 10.12593173980713 10.38325691223145 L 13.69976997375488 12.33032989501953 C 13.79796314239502 12.39301490783691 14.26708984375 12.58663654327393 14.26708984375 11.95233821868896 L 14.26708984375 6.374800682067871 C 14.26708984375 6.007882118225098 14.11868381500244 5.919379234313965 13.95944118499756 5.924911022186279 Z" fill="#f6b2e1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_r04zi2 =
    '<svg viewBox="10.0 3.0 2.6 11.8" ><path  d="M 10.65042114257812 3 C 10.29216957092285 3 10 3.294370889663696 10 3.655293703079224 L 10 4.96588134765625 C 10 5.326803684234619 10.29216957092285 5.621174812316895 10.65042114257812 5.621174812316895 L 11.95126342773438 5.621174812316895 C 12.30951595306396 5.621174812316895 12.6016845703125 5.326803684234619 12.6016845703125 4.96588134765625 L 12.6016845703125 3.655293703079224 C 12.6016845703125 3.294370889663696 12.30951595306396 3 11.95126342773438 3 L 10.65042114257812 3 Z M 10.65042114257812 7.587056159973145 C 10.29216957092285 7.587056159973145 10 7.88141393661499 10 8.242349624633789 L 10 9.552937507629395 C 10 9.913873672485352 10.29216957092285 10.20823097229004 10.65042114257812 10.20823097229004 L 11.95126342773438 10.20823097229004 C 12.30951595306396 10.20823097229004 12.6016845703125 9.913873672485352 12.6016845703125 9.552937507629395 L 12.6016845703125 8.242349624633789 C 12.6016845703125 7.88141393661499 12.30951595306396 7.587056159973145 11.95126342773438 7.587056159973145 L 10.65042114257812 7.587056159973145 Z M 10.65042114257812 12.17411231994629 C 10.29216957092285 12.17411231994629 10 12.46847057342529 10 12.82940673828125 L 10 14.13999366760254 C 10 14.5009298324585 10.29216957092285 14.7952880859375 10.65042114257812 14.7952880859375 L 11.95126342773438 14.7952880859375 C 12.30951595306396 14.7952880859375 12.6016845703125 14.5009298324585 12.6016845703125 14.13999366760254 L 12.6016845703125 12.82940673828125 C 12.6016845703125 12.46847057342529 12.30951595306396 12.17411231994629 11.95126342773438 12.17411231994629 L 10.65042114257812 12.17411231994629 Z" fill="#f6b2e1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_e6t6wz =
    '<svg viewBox="10.0 3.0 4.0 18.0" ><path  d="M 11 3 C 10.44919967651367 3 10 3.449219942092896 10 4 L 10 6 C 10 6.550779819488525 10.44919967651367 7 11 7 L 13 7 C 13.55080032348633 7 14 6.550779819488525 14 6 L 14 4 C 14 3.449219942092896 13.55080032348633 3 13 3 L 11 3 Z M 11 10 C 10.44919967651367 10 10 10.44919967651367 10 11 L 10 13 C 10 13.55080032348633 10.44919967651367 14 11 14 L 13 14 C 13.55080032348633 14 14 13.55080032348633 14 13 L 14 11 C 14 10.44919967651367 13.55080032348633 10 13 10 L 11 10 Z M 11 17 C 10.44919967651367 17 10 17.44919967651367 10 18 L 10 20 C 10 20.55080032348633 10.44919967651367 21 11 21 L 13 21 C 13.55080032348633 21 14 20.55080032348633 14 20 L 14 18 C 14 17.44919967651367 13.55080032348633 17 13 17 L 11 17 Z" fill="#f6b2e1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ywpj =
    '<svg viewBox="10.0 3.0 4.0 18.0" ><path  d="M 11 3 C 10.44919967651367 3 10 3.449219942092896 10 4 L 10 6 C 10 6.550779819488525 10.44919967651367 7 11 7 L 13 7 C 13.55080032348633 7 14 6.550779819488525 14 6 L 14 4 C 14 3.449219942092896 13.55080032348633 3 13 3 L 11 3 Z M 11 10 C 10.44919967651367 10 10 10.44919967651367 10 11 L 10 13 C 10 13.55080032348633 10.44919967651367 14 11 14 L 13 14 C 13.55080032348633 14 14 13.55080032348633 14 13 L 14 11 C 14 10.44919967651367 13.55080032348633 10 13 10 L 11 10 Z M 11 17 C 10.44919967651367 17 10 17.44919967651367 10 18 L 10 20 C 10 20.55080032348633 10.44919967651367 21 11 21 L 13 21 C 13.55080032348633 21 14 20.55080032348633 14 20 L 14 18 C 14 17.44919967651367 13.55080032348633 17 13 17 L 11 17 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
