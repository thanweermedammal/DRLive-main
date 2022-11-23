import 'package:active_ecommerce_flutter/data_handler/doctors_data_fetch.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:active_ecommerce_flutter/screens/new_doctor_screens/docmedicinetext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_svg/svg.dart';

class GivePrescription extends StatefulWidget {
  var snapshot;

  int index;

  GivePrescription({Key key, @required this.snapshot, @required this.index})
      : super(key: key);

  @override
  State<GivePrescription> createState() => _GivePrescriptionState();
}

class _GivePrescriptionState extends State<GivePrescription> {
  TextEditingController controllermed0 = TextEditingController();
  TextEditingController controllermed1 = TextEditingController();
  TextEditingController controllermed2 = TextEditingController();
  TextEditingController controllermed3 = TextEditingController();
  TextEditingController controllermed4 = TextEditingController();
  TextEditingController controllermed5 = TextEditingController();
  TextEditingController controllermed6 = TextEditingController();
  TextEditingController controllermed7 = TextEditingController();
  TextEditingController controllermed8 = TextEditingController();
  TextEditingController controllermed9 = TextEditingController();
  TextEditingController controllerdos1 = TextEditingController();
  TextEditingController controllerdos0 = TextEditingController();
  TextEditingController controllerdos2 = TextEditingController();
  TextEditingController controllerdos3 = TextEditingController();
  TextEditingController controllerdos4 = TextEditingController();
  TextEditingController controllerdos5 = TextEditingController();
  TextEditingController controllerdos6 = TextEditingController();
  TextEditingController controllerdos7 = TextEditingController();
  TextEditingController controllerdos8 = TextEditingController();
  TextEditingController controllerdos9 = TextEditingController();
  TextEditingController controllerdays1 = TextEditingController();
  TextEditingController controllerdays2 = TextEditingController();
  TextEditingController controllerdays3 = TextEditingController();
  TextEditingController controllerdays4 = TextEditingController();
  TextEditingController controllerdays5 = TextEditingController();
  TextEditingController controllerdays6 = TextEditingController();
  TextEditingController controllerdays7 = TextEditingController();
  TextEditingController controllerdays8 = TextEditingController();
  TextEditingController controllerdays9 = TextEditingController();
  TextEditingController controllerdays0 = TextEditingController();

  TextEditingController controllertime0 = TextEditingController();
  TextEditingController controllertime1 = TextEditingController();
  TextEditingController controllertime2 = TextEditingController();
  TextEditingController controllertime3 = TextEditingController();
  TextEditingController controllertime4 = TextEditingController();
  TextEditingController controllertime5 = TextEditingController();
  TextEditingController controllertime6 = TextEditingController();
  TextEditingController controllertime7 = TextEditingController();
  TextEditingController controllertime8 = TextEditingController();
  TextEditingController controllertime9 = TextEditingController();
  List medicines = [];
  List doses = [];
  List days = [];
  List time = [];
  var contrmed;

  AddToList() {
    if (controllermed0.text.isNotEmpty) {
      medicines.add(controllermed0.text);
      if (controllerdos0.text.isNotEmpty) {
        doses.add(controllerdos0.text);
        if (controllerdays0.text.isNotEmpty) {
          days.add(controllerdays0.text);
          if (controllertime0.text.isNotEmpty) {
            time.add(controllertime0.text);
          }
        }
      }
    }
    if (controllermed1.text.isNotEmpty) {
      medicines.add(controllermed1.text);
      if (controllerdos1.text.isNotEmpty) {
        doses.add(controllerdos1.text);
        if (controllerdays1.text.isNotEmpty) {
          days.add(controllerdays1.text);
          if (controllertime1.text.isNotEmpty) {
            time.add(controllertime1.text);
          }
        }
      }
    }
    if (controllermed2.text.isNotEmpty) {
      medicines.add(controllermed2.text);
      if (controllerdos2.text.isNotEmpty) {
        doses.add(controllerdos2.text);
        if (controllerdays2.text.isNotEmpty) {
          days.add(controllerdays2.text);
          if (controllertime2.text.isNotEmpty) {
            time.add(controllertime2.text);
          }
        }
      }
    }
    if (controllermed3.text.isNotEmpty) {
      medicines.add(controllermed3.text);
      if (controllerdos3.text.isNotEmpty) {
        doses.add(controllerdos3.text);
        if (controllerdays3.text.isNotEmpty) {
          days.add(controllerdays3.text);
          if (controllertime3.text.isNotEmpty) {
            time.add(controllertime3.text);
          }
        }
      }
    }
    if (controllermed4.text.isNotEmpty) {
      medicines.add(controllermed4.text);
      if (controllerdos4.text.isNotEmpty) {
        doses.add(controllerdos4.text);
        if (controllerdays4.text.isNotEmpty) {
          days.add(controllerdays4.text);
          if (controllertime4.text.isNotEmpty) {
            time.add(controllertime4.text);
          }
        }
      }
    }
    if (controllermed5.text.isNotEmpty) {
      medicines.add(controllermed5.text);
      if (controllerdos5.text.isNotEmpty) {
        doses.add(controllerdos5.text);
        if (controllerdays5.text.isNotEmpty) {
          days.add(controllerdays5.text);
          if (controllertime5.text.isNotEmpty) {
            time.add(controllertime5.text);
          }
        }
      }
    }
    if (controllermed6.text.isNotEmpty) {
      medicines.add(controllermed6.text);
      if (controllerdos6.text.isNotEmpty) {
        doses.add(controllerdos6.text);
        if (controllerdays6.text.isNotEmpty) {
          days.add(controllerdays6.text);
          if (controllertime6.text.isNotEmpty) {
            time.add(controllertime6.text);
          }
        }
      }
    }
    if (controllermed7.text.isNotEmpty) {
      medicines.add(controllermed7.text);
      if (controllerdos7.text.isNotEmpty) {
        doses.add(controllerdos7.text);
        if (controllerdays7.text.isNotEmpty) {
          days.add(controllerdays7.text);
          if (controllertime7.text.isNotEmpty) {
            time.add(controllertime7.text);
          }
        }
      }
    }
    if (controllermed8.text.isNotEmpty) {
      medicines.add(controllermed8.text);
      if (controllerdos8.text.isNotEmpty) {
        doses.add(controllerdos8.text);
        if (controllerdays8.text.isNotEmpty) {
          days.add(controllerdays8.text);
          if (controllertime8.text.isNotEmpty) {
            time.add(controllertime8.text);
          }
        }
      }
    }
    if (controllermed9.text.isNotEmpty) {
      medicines.add(controllermed9.text);
      if (controllerdos9.text.isNotEmpty) {
        doses.add(controllerdos9.text);
        if (controllerdays9.text.isNotEmpty) {
          days.add(controllerdays9.text);
          if (controllertime9.text.isNotEmpty) {
            time.add(controllertime9.text);
          }
        }
      }
    }
    // for (var i = 0; i < 4; i++) {
    //   print(medicines[i]);
    //   print(doses[i]);
    //   print(days[i]);
    //   print(time[i]);
    // }
    setState(() {
      doses = [];
      days = [];
      medicines = [];
      time = [];
    });
    DoctorsData()
        .addPrescription(
            appointment:
                widget.snapshot.data.appointments[widget.index].id.toString(),
            weight: widget.snapshot.data.appointments[widget.index].weight,
            bloodpressure:
                widget.snapshot.data.appointments[widget.index].bloodPressure,
            pulse: widget.snapshot.data.appointments[widget.index].pulse,
            temperature:
                widget.snapshot.data.appointments[widget.index].temperature,
            problem: widget.snapshot.data.appointments[widget.index].problem,
            medicine: medicines,
            dosage: doses,
            days: days,
            time: time)
        .then((value) => {
              if (value)
                {
                  controllerdays0.clear(),
                  controllertime0.clear(),
                  controllermed0.clear(),
                  controllerdos0.clear(),
                  controllerdays1.clear(),
                  controllertime1.clear(),
                  controllermed1.clear(),
                  controllerdos1.clear(),
                  controllerdays2.clear(),
                  controllertime2.clear(),
                  controllermed2.clear(),
                  controllerdos2.clear(),
                  controllerdays3.clear(),
                  controllertime3.clear(),
                  controllermed3.clear(),
                  controllerdos3.clear(),
                  controllerdays4.clear(),
                  controllertime4.clear(),
                  controllermed4.clear(),
                  controllerdos4.clear(),
                  controllerdays5.clear(),
                  controllertime5.clear(),
                  controllermed5.clear(),
                  controllerdos5.clear(),
                  controllerdays6.clear(),
                  controllertime6.clear(),
                  controllermed6.clear(),
                  controllerdos6.clear(),
                  controllerdays7.clear(),
                  controllertime7.clear(),
                  controllermed7.clear(),
                  controllerdos7.clear(),
                  controllerdays8.clear(),
                  controllertime8.clear(),
                  controllermed8.clear(),
                  controllerdos8.clear(),
                  controllerdays9.clear(),
                  controllertime9.clear(),
                  controllermed9.clear(),
                  controllerdos9.clear(),
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 100,
          centerTitle: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40.0),
                  bottomLeft: Radius.circular(40.0),
                ),
                color: HexColor('33BEA3')),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          title: Text(
            'Medicine',
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
          actions: [
            // Adobe XD layer: 'surface1' (group)
            // Container(
            //   height: 50,
            //   width: 50,
            //   child: Center(
            //     child: SvgPicture.string(
            //       '<svg viewBox="2.0 2.0 33.9 29.8" ><path transform="translate(0.0, 0.0)" d="M 8.625893592834473 1.984379887580872 L 8.625893592834473 10.41416168212891 L 4.198207855224609 10.41416168212891 C 2.983799457550049 10.41416168212891 1.984380006790161 11.292405128479 1.984380006790161 12.35697364807129 L 1.984380006790161 24.0289478302002 C 1.984380006790161 25.09613037109375 2.983799457550049 25.97430801391602 4.198207855224609 25.97430801391602 L 8.625893592834473 25.97430801391602 L 8.625893592834473 31.80777740478516 L 29.28536605834961 31.80777740478516 L 29.28536605834961 25.97430801391602 L 33.7130126953125 25.97430801391602 C 34.92451095581055 25.97430801391602 35.92396545410156 25.09613037109375 35.92396545410156 24.0289478302002 L 35.92396545410156 12.35697364807129 C 35.92396545410156 11.292405128479 34.92451095581055 10.41416168212891 33.7130126953125 10.41416168212891 L 29.28536605834961 10.41416168212891 L 29.28536605834961 1.984379887580872 L 8.625893592834473 1.984379887580872 Z M 10.10172462463379 3.281267881393433 L 27.80946350097656 3.281267881393433 L 27.80946350097656 10.41416168212891 L 10.10172462463379 10.41416168212891 L 10.10172462463379 3.281267881393433 Z M 4.198207855224609 11.70852088928223 L 9.238895416259766 11.70852088928223 C 9.32026195526123 11.72126483917236 9.401554107666016 11.72126483917236 9.477120399475098 11.70852088928223 L 28.42253875732422 11.70852088928223 C 28.50382995605469 11.72126483917236 28.58519744873047 11.72126483917236 28.66076278686523 11.70852088928223 L 33.7130126953125 11.70852088928223 C 34.12847137451172 11.70852088928223 34.45096206665039 11.99190044403076 34.45096206665039 12.35697364807129 L 34.45096206665039 24.0289478302002 C 34.45096206665039 24.39657020568848 34.12847137451172 24.67740249633789 33.7130126953125 24.67740249633789 L 29.28536605834961 24.67740249633789 L 29.28536605834961 18.84138107299805 L 8.625893592834473 18.84138107299805 L 8.625893592834473 24.67740249633789 L 4.198207855224609 24.67740249633789 C 3.77984619140625 24.67740249633789 3.460262775421143 24.39657020568848 3.460262775421143 24.0289478302002 L 3.460262775421143 12.35697364807129 C 3.460262775421143 11.99190044403076 3.77984619140625 11.70852088928223 4.198207855224609 11.70852088928223 Z M 30.76127243041992 13.65381622314453 C 29.94485282897949 13.65381622314453 29.28536605834961 14.23593425750732 29.28536605834961 14.95072364807129 C 29.28536605834961 15.66812801361084 29.94485282897949 16.24763107299805 30.76127243041992 16.24763107299805 C 31.57471656799316 16.24763107299805 32.23717880249023 15.66812801361084 32.23717880249023 14.95072364807129 C 32.23717880249023 14.23593425750732 31.57471656799316 13.65381622314453 30.76127243041992 13.65381622314453 Z M 10.10172462463379 20.1382884979248 L 27.80946350097656 20.1382884979248 L 27.80946350097656 25.21612358093262 C 27.79495811462402 25.28755569458008 27.79495811462402 25.35905456542969 27.80946350097656 25.42545509338379 L 27.80946350097656 30.51342010498047 L 10.10172462463379 30.51342010498047 L 10.10172462463379 25.43310165405273 C 10.11630249023438 25.3641529083252 10.11630249023438 25.29265403747559 10.10172462463379 25.22377014160156 L 10.10172462463379 20.1382884979248 Z M 13.05063438415527 22.08365058898926 C 12.78622913360596 22.08110237121582 12.53930377960205 22.20364379882812 12.40275001525879 22.40532684326172 C 12.27199745178223 22.60701560974121 12.27199745178223 22.85719680786133 12.40275001525879 23.05887985229492 C 12.53930377960205 23.26056671142578 12.78622913360596 23.38310813903809 13.05063438415527 23.38055610656738 L 24.85772705078125 23.38055610656738 C 25.12213134765625 23.38310813903809 25.37195777893066 23.26056671142578 25.50561141967773 23.05887985229492 C 25.63926315307617 22.85719680786133 25.63926315307617 22.60701560974121 25.50561141967773 22.40532684326172 C 25.37195777893066 22.20364379882812 25.12213134765625 22.08110237121582 24.85772705078125 22.08365058898926 L 13.05063438415527 22.08365058898926 Z M 13.05063438415527 24.67740249633789 C 12.78622913360596 24.67485046386719 12.53930377960205 24.79484367370605 12.40275001525879 24.99907875061035 C 12.27199745178223 25.20076560974121 12.27199745178223 25.44839477539062 12.40275001525879 25.65262985229492 C 12.53930377960205 25.85431671142578 12.78622913360596 25.97685813903809 13.05063438415527 25.97430801391602 L 21.90591621398926 25.97430801391602 C 22.17032051086426 25.97685813903809 22.42014694213867 25.85431671142578 22.55380058288574 25.65262985229492 C 22.68745231628418 25.44839477539062 22.68745231628418 25.20076560974121 22.55380058288574 24.99907875061035 C 22.42014694213867 24.79484367370605 22.17032051086426 24.67485046386719 21.90591621398926 24.67740249633789 L 13.05063438415527 24.67740249633789 Z M 13.05063438415527 27.27121543884277 C 12.78622913360596 27.26866912841797 12.53930377960205 27.38865852355957 12.40275001525879 27.59289360046387 C 12.27199745178223 27.79458045959473 12.27199745178223 28.04220962524414 12.40275001525879 28.24644470214844 C 12.53930377960205 28.4481315612793 12.78622913360596 28.5706729888916 13.05063438415527 28.56812477111816 L 24.85772705078125 28.56812477111816 C 25.12213134765625 28.5706729888916 25.37195777893066 28.4481315612793 25.50561141967773 28.24644470214844 C 25.63926315307617 28.04220962524414 25.63926315307617 27.79458045959473 25.50561141967773 27.59289360046387 C 25.37195777893066 27.38865852355957 25.12213134765625 27.26866912841797 24.85772705078125 27.27121543884277 L 13.05063438415527 27.27121543884277 Z" fill="#ffffff" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
            //       allowDrawingOutsideViewBox: true,
            //       fit: BoxFit.fill,
            //     ),
            //   ),
            // ),
            // Container(
            //   height: 50,
            //   width: 50,
            //   child: Center(
            //     child: // Adobe XD layer: 'surface1' (group)
            //         SvgPicture.string(
            //       '<svg viewBox="15.0 9.0 26.4 28.6" ><path  d="M 15 9 L 15 37.62229919433594 L 41.40200805664062 37.62229919433594 L 41.40200805664062 15.73358058929443 L 33.70006561279297 9 L 15 9 Z M 16.05607986450195 9.923299789428711 L 32.95336532592773 9.923299789428711 L 32.95336532592773 16.38640022277832 L 40.34592437744141 16.38640022277832 L 40.34592437744141 36.69900131225586 L 16.05607986450195 36.69900131225586 L 16.05607986450195 9.923299789428711 Z M 34.00944519042969 10.5761194229126 L 39.59922409057617 15.46309947967529 L 34.00944519042969 15.46309947967529 L 34.00944519042969 10.5761194229126 Z M 18.69628143310547 10.84660053253174 C 18.40543556213379 10.84660053253174 18.16823959350586 11.05397319793701 18.16823959350586 11.30825042724609 C 18.16823959350586 11.56252765655518 18.40543556213379 11.76990127563477 18.69628143310547 11.76990127563477 C 18.98712539672852 11.76990127563477 19.22431945800781 11.56252765655518 19.22431945800781 11.30825042724609 C 19.22431945800781 11.05397319793701 18.98712539672852 10.84660053253174 18.69628143310547 10.84660053253174 Z M 18.69628143310547 12.69320011138916 C 18.40543556213379 12.69320011138916 18.16823959350586 12.90057373046875 18.16823959350586 13.15485000610352 C 18.16823959350586 13.40912628173828 18.40543556213379 13.61649990081787 18.69628143310547 13.61649990081787 C 18.98712539672852 13.61649990081787 19.22431945800781 13.40912628173828 19.22431945800781 13.15485000610352 C 19.22431945800781 12.90057373046875 18.98712539672852 12.69320011138916 18.69628143310547 12.69320011138916 Z M 18.69628143310547 14.53979969024658 C 18.40543556213379 14.53979969024658 18.16823959350586 14.74717330932617 18.16823959350586 15.00144958496094 C 18.16823959350586 15.25572776794434 18.40543556213379 15.46309947967529 18.69628143310547 15.46309947967529 C 18.98712539672852 15.46309947967529 19.22431945800781 15.25572776794434 19.22431945800781 15.00144958496094 C 19.22431945800781 14.74717330932617 18.98712539672852 14.53979969024658 18.69628143310547 14.53979969024658 Z M 18.69628143310547 16.38640022277832 C 18.40543556213379 16.38640022277832 18.16823959350586 16.59377288818359 18.16823959350586 16.84805107116699 C 18.16823959350586 17.10232734680176 18.40543556213379 17.30970001220703 18.69628143310547 17.30970001220703 C 18.98712539672852 17.30970001220703 19.22431945800781 17.10232734680176 19.22431945800781 16.84805107116699 C 19.22431945800781 16.59377288818359 18.98712539672852 16.38640022277832 18.69628143310547 16.38640022277832 Z M 18.69628143310547 18.23299980163574 C 18.40543556213379 18.23299980163574 18.16823959350586 18.44037246704102 18.16823959350586 18.69464874267578 C 18.16823959350586 18.94892501831055 18.40543556213379 19.15629959106445 18.69628143310547 19.15629959106445 C 18.98712539672852 19.15629959106445 19.22431945800781 18.94892501831055 19.22431945800781 18.69464874267578 C 19.22431945800781 18.44037246704102 18.98712539672852 18.23299980163574 18.69628143310547 18.23299980163574 Z M 18.69628143310547 20.07959938049316 C 18.40543556213379 20.07959938049316 18.16823959350586 20.28697204589844 18.16823959350586 20.5412483215332 C 18.16823959350586 20.7955265045166 18.40543556213379 21.00289726257324 18.69628143310547 21.00289726257324 C 18.98712539672852 21.00289726257324 19.22431945800781 20.7955265045166 19.22431945800781 20.5412483215332 C 19.22431945800781 20.28697204589844 18.98712539672852 20.07959938049316 18.69628143310547 20.07959938049316 Z M 18.69628143310547 21.92619705200195 C 18.40543556213379 21.92619705200195 18.16823959350586 22.13357162475586 18.16823959350586 22.38784980773926 C 18.16823959350586 22.64212608337402 18.40543556213379 22.8494987487793 18.69628143310547 22.8494987487793 C 18.98712539672852 22.8494987487793 19.22431945800781 22.64212608337402 19.22431945800781 22.38784980773926 C 19.22431945800781 22.13357162475586 18.98712539672852 21.92619705200195 18.69628143310547 21.92619705200195 Z M 18.69628143310547 23.77279853820801 C 18.40543556213379 23.77279853820801 18.16823959350586 23.98017311096191 18.16823959350586 24.23444938659668 C 18.16823959350586 24.48872566223145 18.40543556213379 24.69609832763672 18.69628143310547 24.69609832763672 C 18.98712539672852 24.69609832763672 19.22431945800781 24.48872566223145 19.22431945800781 24.23444938659668 C 19.22431945800781 23.98017311096191 18.98712539672852 23.77279853820801 18.69628143310547 23.77279853820801 Z M 27.11191940307617 24.12263679504395 L 27.11191940307617 28.02865600585938 L 28.98688507080078 28.02865600585938 C 30.32968902587891 28.02865600585938 31.07427978515625 27.31993293762207 31.07427978515625 26.03779220581055 C 31.07427978515625 24.81871223449707 30.31728363037109 24.12263679504395 28.98688507080078 24.12263679504395 L 27.11191940307617 24.12263679504395 Z M 24.3541259765625 24.1262378692627 L 22.39873886108398 24.1262378692627 L 22.39873886108398 28.02865600585938 L 23.53323364257812 28.02865600585938 L 23.53323364257812 26.88353538513184 L 24.28606033325195 26.88353538513184 C 25.28030776977539 26.88353538513184 25.96300888061523 26.34072685241699 25.96300888061523 25.51118659973145 C 25.96300888061523 24.67264556884766 25.31330871582031 24.1262378692627 24.3541259765625 24.1262378692627 Z M 32.23554611206055 24.1262378692627 L 32.23554611206055 28.02865600585938 L 33.36798095703125 28.02865600585938 L 33.36798095703125 26.5733528137207 L 35.09646606445312 26.5733528137207 L 35.09646606445312 25.81417083740234 L 33.36798095703125 25.81417083740234 L 33.36798095703125 24.9233226776123 L 35.27177429199219 24.9233226776123 L 35.27177429199219 24.1262378692627 L 32.23554611206055 24.1262378692627 Z M 23.53323364257812 24.88726806640625 L 24.05298233032227 24.88726806640625 C 24.53360366821289 24.88726806640625 24.816162109375 25.10184288024902 24.816162109375 25.51298904418945 C 24.816162109375 25.91873168945312 24.52948760986328 26.13515281677246 24.04886627197266 26.13515281677246 L 23.53323364257812 26.13515281677246 L 23.53323364257812 24.88726806640625 Z M 28.24842071533203 24.91972160339355 L 28.78269195556641 24.91972160339355 C 29.496337890625 24.91972160339355 29.91713333129883 25.32906723022461 29.91713333129883 26.05759620666504 C 29.91713333129883 26.83123016357422 29.51904296875 27.22977256774902 28.78269195556641 27.22977256774902 L 28.24842071533203 27.22977256774902 L 28.24842071533203 24.91972160339355 Z M 18.69628143310547 25.61939811706543 C 18.40543556213379 25.61939811706543 18.16823959350586 25.8267707824707 18.16823959350586 26.08104705810547 C 18.16823959350586 26.33532524108887 18.40543556213379 26.54269790649414 18.69628143310547 26.54269790649414 C 18.98712539672852 26.54269790649414 19.22431945800781 26.33532524108887 19.22431945800781 26.08104705810547 C 19.22431945800781 25.8267707824707 18.98712539672852 25.61939811706543 18.69628143310547 25.61939811706543 Z M 18.69628143310547 27.46599960327148 C 18.40543556213379 27.46599960327148 18.16823959350586 27.67337036132812 18.16823959350586 27.92764854431152 C 18.16823959350586 28.18192481994629 18.40543556213379 28.3892993927002 18.69628143310547 28.3892993927002 C 18.98712539672852 28.3892993927002 19.22431945800781 28.18192481994629 19.22431945800781 27.92764854431152 C 19.22431945800781 27.67337036132812 18.98712539672852 27.46599960327148 18.69628143310547 27.46599960327148 Z M 18.69628143310547 29.31259918212891 C 18.40543556213379 29.31259918212891 18.16823959350586 29.51997375488281 18.16823959350586 29.77425003051758 C 18.16823959350586 30.02852630615234 18.40543556213379 30.23589897155762 18.69628143310547 30.23589897155762 C 18.98712539672852 30.23589897155762 19.22431945800781 30.02852630615234 19.22431945800781 29.77425003051758 C 19.22431945800781 29.51997375488281 18.98712539672852 29.31259918212891 18.69628143310547 29.31259918212891 Z M 18.69628143310547 31.1591968536377 C 18.40543556213379 31.1591968536377 18.16823959350586 31.36657333374023 18.16823959350586 31.620849609375 C 18.16823959350586 31.87512588500977 18.40543556213379 32.08250045776367 18.69628143310547 32.08250045776367 C 18.98712539672852 32.08250045776367 19.22431945800781 31.87512588500977 19.22431945800781 31.620849609375 C 19.22431945800781 31.36657333374023 18.98712539672852 31.1591968536377 18.69628143310547 31.1591968536377 Z M 18.69628143310547 33.00579833984375 C 18.40543556213379 33.00579833984375 18.16823959350586 33.21317291259766 18.16823959350586 33.46744918823242 C 18.16823959350586 33.72172546386719 18.40543556213379 33.92910003662109 18.69628143310547 33.92910003662109 C 18.98712539672852 33.92910003662109 19.22431945800781 33.72172546386719 19.22431945800781 33.46744918823242 C 19.22431945800781 33.21317291259766 18.98712539672852 33.00579833984375 18.69628143310547 33.00579833984375 Z M 18.69628143310547 34.85240173339844 C 18.40543556213379 34.85240173339844 18.16823959350586 35.05977249145508 18.16823959350586 35.31404876708984 C 18.16823959350586 35.56832504272461 18.40543556213379 35.77569961547852 18.69628143310547 35.77569961547852 C 18.98712539672852 35.77569961547852 19.22431945800781 35.56832504272461 19.22431945800781 35.31404876708984 C 19.22431945800781 35.05977249145508 18.98712539672852 34.85240173339844 18.69628143310547 34.85240173339844 Z" fill="#ffffff" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
            //       allowDrawingOutsideViewBox: true,
            //       fit: BoxFit.fill,
            //     ),
            //   ),
            // ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x29000000),
                        offset: Offset(6, 3),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Dr ${user_name.$.toUpperCase()}",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'BAMS..his designation',
                          style: TextStyle(fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            color: Colors.blue,
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                    'Patient Name :   ${widget.snapshot.data.appointments[widget.index].patient.firstName}'),
                              ),
                              Text(
                                  'Age :  ${DateTime.now().year - widget.snapshot.data.appointments[widget.index].patient.dob.year}'),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  'Gender :  ${widget.snapshot.data.appointments[widget.index].patient.gender}')
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                    'Address :  ${widget.snapshot.data.appointments[widget.index].patient.address}'),
                              ),
                              Text(
                                  'Date :  ${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}'),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text('medicine'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text('dosage'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text('days'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text('time'),
                              ),
                            ],
                          ),
                        ),
                        DocMedicineText(controllermed0, controllerdos0,
                            controllerdays0, controllertime0),
                        DocMedicineText(controllermed1, controllerdos1,
                            controllerdays1, controllertime1),
                        DocMedicineText(controllermed2, controllerdos2,
                            controllerdays2, controllertime2),
                        DocMedicineText(controllermed3, controllerdos3,
                            controllerdays3, controllertime3),
                        DocMedicineText(controllermed4, controllerdos4,
                            controllerdays4, controllertime4),
                        DocMedicineText(controllermed5, controllerdos5,
                            controllerdays5, controllertime5),
                        DocMedicineText(controllermed6, controllerdos6,
                            controllerdays6, controllertime6),
                        DocMedicineText(controllermed7, controllerdos7,
                            controllerdays7, controllertime7),
                        DocMedicineText(controllermed8, controllerdos8,
                            controllerdays8, controllertime8),
                        DocMedicineText(controllermed9, controllerdos9,
                            controllerdays9, controllertime9),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            color: Colors.blue,
                            thickness: 2,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        AddToList();
                      },
                      child: Container(
                        height: 45,
                        width: 95,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black),
                        child: Center(
                          child: Text(
                            'Done',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
