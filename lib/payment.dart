import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class payment extends StatelessWidget {
  payment({
    Key key,
  }) : super(key: key);

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      centerTitle: false,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16.0),
            bottomLeft: Radius.circular(16.0),
          ),
          gradient: LinearGradient(
            begin: Alignment(0.0, -0.37),
            end: Alignment(0.0, 1.0),
            colors: [const Color(0xff6b0772), const Color(0xfff6b2e1)],
            stops: [0.0, 1.0],
          ),
        ),
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
      actions: [
        // Adobe XD layer: 'surface1' (group)
        Container(
          height: 50,
          width: 50,
          child: Center(
            child: SvgPicture.string(
              '<svg viewBox="2.0 2.0 33.9 29.8" ><path transform="translate(0.0, 0.0)" d="M 8.625893592834473 1.984379887580872 L 8.625893592834473 10.41416168212891 L 4.198207855224609 10.41416168212891 C 2.983799457550049 10.41416168212891 1.984380006790161 11.292405128479 1.984380006790161 12.35697364807129 L 1.984380006790161 24.0289478302002 C 1.984380006790161 25.09613037109375 2.983799457550049 25.97430801391602 4.198207855224609 25.97430801391602 L 8.625893592834473 25.97430801391602 L 8.625893592834473 31.80777740478516 L 29.28536605834961 31.80777740478516 L 29.28536605834961 25.97430801391602 L 33.7130126953125 25.97430801391602 C 34.92451095581055 25.97430801391602 35.92396545410156 25.09613037109375 35.92396545410156 24.0289478302002 L 35.92396545410156 12.35697364807129 C 35.92396545410156 11.292405128479 34.92451095581055 10.41416168212891 33.7130126953125 10.41416168212891 L 29.28536605834961 10.41416168212891 L 29.28536605834961 1.984379887580872 L 8.625893592834473 1.984379887580872 Z M 10.10172462463379 3.281267881393433 L 27.80946350097656 3.281267881393433 L 27.80946350097656 10.41416168212891 L 10.10172462463379 10.41416168212891 L 10.10172462463379 3.281267881393433 Z M 4.198207855224609 11.70852088928223 L 9.238895416259766 11.70852088928223 C 9.32026195526123 11.72126483917236 9.401554107666016 11.72126483917236 9.477120399475098 11.70852088928223 L 28.42253875732422 11.70852088928223 C 28.50382995605469 11.72126483917236 28.58519744873047 11.72126483917236 28.66076278686523 11.70852088928223 L 33.7130126953125 11.70852088928223 C 34.12847137451172 11.70852088928223 34.45096206665039 11.99190044403076 34.45096206665039 12.35697364807129 L 34.45096206665039 24.0289478302002 C 34.45096206665039 24.39657020568848 34.12847137451172 24.67740249633789 33.7130126953125 24.67740249633789 L 29.28536605834961 24.67740249633789 L 29.28536605834961 18.84138107299805 L 8.625893592834473 18.84138107299805 L 8.625893592834473 24.67740249633789 L 4.198207855224609 24.67740249633789 C 3.77984619140625 24.67740249633789 3.460262775421143 24.39657020568848 3.460262775421143 24.0289478302002 L 3.460262775421143 12.35697364807129 C 3.460262775421143 11.99190044403076 3.77984619140625 11.70852088928223 4.198207855224609 11.70852088928223 Z M 30.76127243041992 13.65381622314453 C 29.94485282897949 13.65381622314453 29.28536605834961 14.23593425750732 29.28536605834961 14.95072364807129 C 29.28536605834961 15.66812801361084 29.94485282897949 16.24763107299805 30.76127243041992 16.24763107299805 C 31.57471656799316 16.24763107299805 32.23717880249023 15.66812801361084 32.23717880249023 14.95072364807129 C 32.23717880249023 14.23593425750732 31.57471656799316 13.65381622314453 30.76127243041992 13.65381622314453 Z M 10.10172462463379 20.1382884979248 L 27.80946350097656 20.1382884979248 L 27.80946350097656 25.21612358093262 C 27.79495811462402 25.28755569458008 27.79495811462402 25.35905456542969 27.80946350097656 25.42545509338379 L 27.80946350097656 30.51342010498047 L 10.10172462463379 30.51342010498047 L 10.10172462463379 25.43310165405273 C 10.11630249023438 25.3641529083252 10.11630249023438 25.29265403747559 10.10172462463379 25.22377014160156 L 10.10172462463379 20.1382884979248 Z M 13.05063438415527 22.08365058898926 C 12.78622913360596 22.08110237121582 12.53930377960205 22.20364379882812 12.40275001525879 22.40532684326172 C 12.27199745178223 22.60701560974121 12.27199745178223 22.85719680786133 12.40275001525879 23.05887985229492 C 12.53930377960205 23.26056671142578 12.78622913360596 23.38310813903809 13.05063438415527 23.38055610656738 L 24.85772705078125 23.38055610656738 C 25.12213134765625 23.38310813903809 25.37195777893066 23.26056671142578 25.50561141967773 23.05887985229492 C 25.63926315307617 22.85719680786133 25.63926315307617 22.60701560974121 25.50561141967773 22.40532684326172 C 25.37195777893066 22.20364379882812 25.12213134765625 22.08110237121582 24.85772705078125 22.08365058898926 L 13.05063438415527 22.08365058898926 Z M 13.05063438415527 24.67740249633789 C 12.78622913360596 24.67485046386719 12.53930377960205 24.79484367370605 12.40275001525879 24.99907875061035 C 12.27199745178223 25.20076560974121 12.27199745178223 25.44839477539062 12.40275001525879 25.65262985229492 C 12.53930377960205 25.85431671142578 12.78622913360596 25.97685813903809 13.05063438415527 25.97430801391602 L 21.90591621398926 25.97430801391602 C 22.17032051086426 25.97685813903809 22.42014694213867 25.85431671142578 22.55380058288574 25.65262985229492 C 22.68745231628418 25.44839477539062 22.68745231628418 25.20076560974121 22.55380058288574 24.99907875061035 C 22.42014694213867 24.79484367370605 22.17032051086426 24.67485046386719 21.90591621398926 24.67740249633789 L 13.05063438415527 24.67740249633789 Z M 13.05063438415527 27.27121543884277 C 12.78622913360596 27.26866912841797 12.53930377960205 27.38865852355957 12.40275001525879 27.59289360046387 C 12.27199745178223 27.79458045959473 12.27199745178223 28.04220962524414 12.40275001525879 28.24644470214844 C 12.53930377960205 28.4481315612793 12.78622913360596 28.5706729888916 13.05063438415527 28.56812477111816 L 24.85772705078125 28.56812477111816 C 25.12213134765625 28.5706729888916 25.37195777893066 28.4481315612793 25.50561141967773 28.24644470214844 C 25.63926315307617 28.04220962524414 25.63926315307617 27.79458045959473 25.50561141967773 27.59289360046387 C 25.37195777893066 27.38865852355957 25.12213134765625 27.26866912841797 24.85772705078125 27.27121543884277 L 13.05063438415527 27.27121543884277 Z" fill="#ffffff" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: 50,
          width: 50,
          child: Center(
            child: // Adobe XD layer: 'surface1' (group)
                SvgPicture.string(
              '<svg viewBox="15.0 9.0 26.4 28.6" ><path  d="M 15 9 L 15 37.62229919433594 L 41.40200805664062 37.62229919433594 L 41.40200805664062 15.73358058929443 L 33.70006561279297 9 L 15 9 Z M 16.05607986450195 9.923299789428711 L 32.95336532592773 9.923299789428711 L 32.95336532592773 16.38640022277832 L 40.34592437744141 16.38640022277832 L 40.34592437744141 36.69900131225586 L 16.05607986450195 36.69900131225586 L 16.05607986450195 9.923299789428711 Z M 34.00944519042969 10.5761194229126 L 39.59922409057617 15.46309947967529 L 34.00944519042969 15.46309947967529 L 34.00944519042969 10.5761194229126 Z M 18.69628143310547 10.84660053253174 C 18.40543556213379 10.84660053253174 18.16823959350586 11.05397319793701 18.16823959350586 11.30825042724609 C 18.16823959350586 11.56252765655518 18.40543556213379 11.76990127563477 18.69628143310547 11.76990127563477 C 18.98712539672852 11.76990127563477 19.22431945800781 11.56252765655518 19.22431945800781 11.30825042724609 C 19.22431945800781 11.05397319793701 18.98712539672852 10.84660053253174 18.69628143310547 10.84660053253174 Z M 18.69628143310547 12.69320011138916 C 18.40543556213379 12.69320011138916 18.16823959350586 12.90057373046875 18.16823959350586 13.15485000610352 C 18.16823959350586 13.40912628173828 18.40543556213379 13.61649990081787 18.69628143310547 13.61649990081787 C 18.98712539672852 13.61649990081787 19.22431945800781 13.40912628173828 19.22431945800781 13.15485000610352 C 19.22431945800781 12.90057373046875 18.98712539672852 12.69320011138916 18.69628143310547 12.69320011138916 Z M 18.69628143310547 14.53979969024658 C 18.40543556213379 14.53979969024658 18.16823959350586 14.74717330932617 18.16823959350586 15.00144958496094 C 18.16823959350586 15.25572776794434 18.40543556213379 15.46309947967529 18.69628143310547 15.46309947967529 C 18.98712539672852 15.46309947967529 19.22431945800781 15.25572776794434 19.22431945800781 15.00144958496094 C 19.22431945800781 14.74717330932617 18.98712539672852 14.53979969024658 18.69628143310547 14.53979969024658 Z M 18.69628143310547 16.38640022277832 C 18.40543556213379 16.38640022277832 18.16823959350586 16.59377288818359 18.16823959350586 16.84805107116699 C 18.16823959350586 17.10232734680176 18.40543556213379 17.30970001220703 18.69628143310547 17.30970001220703 C 18.98712539672852 17.30970001220703 19.22431945800781 17.10232734680176 19.22431945800781 16.84805107116699 C 19.22431945800781 16.59377288818359 18.98712539672852 16.38640022277832 18.69628143310547 16.38640022277832 Z M 18.69628143310547 18.23299980163574 C 18.40543556213379 18.23299980163574 18.16823959350586 18.44037246704102 18.16823959350586 18.69464874267578 C 18.16823959350586 18.94892501831055 18.40543556213379 19.15629959106445 18.69628143310547 19.15629959106445 C 18.98712539672852 19.15629959106445 19.22431945800781 18.94892501831055 19.22431945800781 18.69464874267578 C 19.22431945800781 18.44037246704102 18.98712539672852 18.23299980163574 18.69628143310547 18.23299980163574 Z M 18.69628143310547 20.07959938049316 C 18.40543556213379 20.07959938049316 18.16823959350586 20.28697204589844 18.16823959350586 20.5412483215332 C 18.16823959350586 20.7955265045166 18.40543556213379 21.00289726257324 18.69628143310547 21.00289726257324 C 18.98712539672852 21.00289726257324 19.22431945800781 20.7955265045166 19.22431945800781 20.5412483215332 C 19.22431945800781 20.28697204589844 18.98712539672852 20.07959938049316 18.69628143310547 20.07959938049316 Z M 18.69628143310547 21.92619705200195 C 18.40543556213379 21.92619705200195 18.16823959350586 22.13357162475586 18.16823959350586 22.38784980773926 C 18.16823959350586 22.64212608337402 18.40543556213379 22.8494987487793 18.69628143310547 22.8494987487793 C 18.98712539672852 22.8494987487793 19.22431945800781 22.64212608337402 19.22431945800781 22.38784980773926 C 19.22431945800781 22.13357162475586 18.98712539672852 21.92619705200195 18.69628143310547 21.92619705200195 Z M 18.69628143310547 23.77279853820801 C 18.40543556213379 23.77279853820801 18.16823959350586 23.98017311096191 18.16823959350586 24.23444938659668 C 18.16823959350586 24.48872566223145 18.40543556213379 24.69609832763672 18.69628143310547 24.69609832763672 C 18.98712539672852 24.69609832763672 19.22431945800781 24.48872566223145 19.22431945800781 24.23444938659668 C 19.22431945800781 23.98017311096191 18.98712539672852 23.77279853820801 18.69628143310547 23.77279853820801 Z M 27.11191940307617 24.12263679504395 L 27.11191940307617 28.02865600585938 L 28.98688507080078 28.02865600585938 C 30.32968902587891 28.02865600585938 31.07427978515625 27.31993293762207 31.07427978515625 26.03779220581055 C 31.07427978515625 24.81871223449707 30.31728363037109 24.12263679504395 28.98688507080078 24.12263679504395 L 27.11191940307617 24.12263679504395 Z M 24.3541259765625 24.1262378692627 L 22.39873886108398 24.1262378692627 L 22.39873886108398 28.02865600585938 L 23.53323364257812 28.02865600585938 L 23.53323364257812 26.88353538513184 L 24.28606033325195 26.88353538513184 C 25.28030776977539 26.88353538513184 25.96300888061523 26.34072685241699 25.96300888061523 25.51118659973145 C 25.96300888061523 24.67264556884766 25.31330871582031 24.1262378692627 24.3541259765625 24.1262378692627 Z M 32.23554611206055 24.1262378692627 L 32.23554611206055 28.02865600585938 L 33.36798095703125 28.02865600585938 L 33.36798095703125 26.5733528137207 L 35.09646606445312 26.5733528137207 L 35.09646606445312 25.81417083740234 L 33.36798095703125 25.81417083740234 L 33.36798095703125 24.9233226776123 L 35.27177429199219 24.9233226776123 L 35.27177429199219 24.1262378692627 L 32.23554611206055 24.1262378692627 Z M 23.53323364257812 24.88726806640625 L 24.05298233032227 24.88726806640625 C 24.53360366821289 24.88726806640625 24.816162109375 25.10184288024902 24.816162109375 25.51298904418945 C 24.816162109375 25.91873168945312 24.52948760986328 26.13515281677246 24.04886627197266 26.13515281677246 L 23.53323364257812 26.13515281677246 L 23.53323364257812 24.88726806640625 Z M 28.24842071533203 24.91972160339355 L 28.78269195556641 24.91972160339355 C 29.496337890625 24.91972160339355 29.91713333129883 25.32906723022461 29.91713333129883 26.05759620666504 C 29.91713333129883 26.83123016357422 29.51904296875 27.22977256774902 28.78269195556641 27.22977256774902 L 28.24842071533203 27.22977256774902 L 28.24842071533203 24.91972160339355 Z M 18.69628143310547 25.61939811706543 C 18.40543556213379 25.61939811706543 18.16823959350586 25.8267707824707 18.16823959350586 26.08104705810547 C 18.16823959350586 26.33532524108887 18.40543556213379 26.54269790649414 18.69628143310547 26.54269790649414 C 18.98712539672852 26.54269790649414 19.22431945800781 26.33532524108887 19.22431945800781 26.08104705810547 C 19.22431945800781 25.8267707824707 18.98712539672852 25.61939811706543 18.69628143310547 25.61939811706543 Z M 18.69628143310547 27.46599960327148 C 18.40543556213379 27.46599960327148 18.16823959350586 27.67337036132812 18.16823959350586 27.92764854431152 C 18.16823959350586 28.18192481994629 18.40543556213379 28.3892993927002 18.69628143310547 28.3892993927002 C 18.98712539672852 28.3892993927002 19.22431945800781 28.18192481994629 19.22431945800781 27.92764854431152 C 19.22431945800781 27.67337036132812 18.98712539672852 27.46599960327148 18.69628143310547 27.46599960327148 Z M 18.69628143310547 29.31259918212891 C 18.40543556213379 29.31259918212891 18.16823959350586 29.51997375488281 18.16823959350586 29.77425003051758 C 18.16823959350586 30.02852630615234 18.40543556213379 30.23589897155762 18.69628143310547 30.23589897155762 C 18.98712539672852 30.23589897155762 19.22431945800781 30.02852630615234 19.22431945800781 29.77425003051758 C 19.22431945800781 29.51997375488281 18.98712539672852 29.31259918212891 18.69628143310547 29.31259918212891 Z M 18.69628143310547 31.1591968536377 C 18.40543556213379 31.1591968536377 18.16823959350586 31.36657333374023 18.16823959350586 31.620849609375 C 18.16823959350586 31.87512588500977 18.40543556213379 32.08250045776367 18.69628143310547 32.08250045776367 C 18.98712539672852 32.08250045776367 19.22431945800781 31.87512588500977 19.22431945800781 31.620849609375 C 19.22431945800781 31.36657333374023 18.98712539672852 31.1591968536377 18.69628143310547 31.1591968536377 Z M 18.69628143310547 33.00579833984375 C 18.40543556213379 33.00579833984375 18.16823959350586 33.21317291259766 18.16823959350586 33.46744918823242 C 18.16823959350586 33.72172546386719 18.40543556213379 33.92910003662109 18.69628143310547 33.92910003662109 C 18.98712539672852 33.92910003662109 19.22431945800781 33.72172546386719 19.22431945800781 33.46744918823242 C 19.22431945800781 33.21317291259766 18.98712539672852 33.00579833984375 18.69628143310547 33.00579833984375 Z M 18.69628143310547 34.85240173339844 C 18.40543556213379 34.85240173339844 18.16823959350586 35.05977249145508 18.16823959350586 35.31404876708984 C 18.16823959350586 35.56832504272461 18.40543556213379 35.77569961547852 18.69628143310547 35.77569961547852 C 18.98712539672852 35.77569961547852 19.22431945800781 35.56832504272461 19.22431945800781 35.31404876708984 C 19.22431945800781 35.05977249145508 18.98712539672852 34.85240173339844 18.69628143310547 34.85240173339844 Z" fill="#ffffff" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 100.0, middle: 0.5),
            Pin(size: 36.0, end: 58.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  //pageBuilder: () => Payment3(),
                ),
              ],
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color(0xff6b0772),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 25.0, middle: 0.5015),
            Pin(size: 16.0, end: 68.0),
            child: Text(
              'Pay',
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
            Pin(size: 72.0, start: 25.0),
            Pin(size: 14.0, middle: 0.7091),
            child: Text(
              'Price Details',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 12,
                color: const Color(0xff6b0772),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 56.0, start: 25.0),
            Pin(size: 14.0, middle: 0.7466),
            child: Text(
              'Gross Amt',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 12,
                color: const Color(0xff858585),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 60.0, start: 25.0),
            Pin(size: 14.0, end: 113.0),
            child: Text(
              'Total Price',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 12,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 47.0, start: 25.0),
            Pin(size: 14.0, middle: 0.7976),
            child: Text(
              'Discount',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 12,
                color: const Color(0xff858585),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 86.0, start: 25.0),
            Pin(size: 14.0, end: 132.0),
            child: Text(
              'Delivery Charge',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 12,
                color: const Color(0xff858585),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 63.0, end: 14.0),
            Pin(size: 14.0, middle: 0.7466),
            child: Text(
              '\$ 31,500.00',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 12,
                color: const Color(0xff858585),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 63.0, end: 14.0),
            Pin(size: 14.0, end: 113.0),
            child: Text(
              '\$ 33,535.00',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 12,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 53.0, end: 14.0),
            Pin(size: 14.0, middle: 0.7976),
            child: Text(
              '\$ 1000.00',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 12,
                color: const Color(0xff858585),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 40.0, end: 14.0),
            Pin(size: 14.0, end: 132.0),
            child: Text(
              '\$ 50.00',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 12,
                color: const Color(0xff858585),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 13.5, end: 13.5),
            Pin(size: 1.0, middle: 0.72),
            child: SvgPicture.string(
              _svg_go2rn,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 13.5, end: 13.5),
            Pin(size: 1.0, end: 101.5),
            child: SvgPicture.string(
              _svg_xudutf,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 19.0, start: 25.0),
            Pin(size: 14.0, middle: 0.7721),
            child: Text(
              'Tax',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 12,
                color: const Color(0xff858585),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 57.0, end: 14.0),
            Pin(size: 14.0, middle: 0.7721),
            child: Text(
              '\$ 2,985.00',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 12,
                color: const Color(0xff858585),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 28.0, middle: 0.491),
            Pin(size: 28.0, start: 108.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xffffffff),
                border: Border.all(width: 2.0, color: const Color(0xff6b0772)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 28.0, end: 50.0),
            Pin(size: 28.0, start: 108.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xffffffff),
                border: Border.all(width: 2.0, color: const Color(0xffc2c2c2)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 28.0, start: 44.0),
            Pin(size: 28.0, start: 108.0),
            child:
                // Adobe XD layer: 'surface1' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: SvgPicture.string(
                    _svg_sfbsa,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 1.8, end: 1.4),
                  Pin(start: 4.5, end: 4.3),
                  child: SvgPicture.string(
                    _svg_e9fj6,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 28.0, middle: 0.491),
            Pin(size: 28.0, start: 108.0),
            child:
                // Adobe XD layer: 'surface1' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: SvgPicture.string(
                    _svg_sfbsa,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 1.8, end: 1.4),
                  Pin(start: 4.5, end: 4.3),
                  child: SvgPicture.string(
                    _svg_e9fj6,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 56.0, start: 31.0),
            Pin(size: 16.0, middle: 0.2003),
            child: Text(
              'Address',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14,
                color: const Color(0xff6b0772),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 58.0, end: 32.0),
            Pin(size: 16.0, middle: 0.2003),
            child: Text(
              'Payment',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14,
                color: const Color(0xff6b0772),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 66.0, middle: 0.483),
            Pin(size: 32.0, middle: 0.2047),
            child: Text(
              'order\n summary',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14,
                color: const Color(0xff6b0772),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 91.0, middle: 0.2695),
            Pin(size: 1.0, start: 122.5),
            child: SvgPicture.string(
              _svg_enhk,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 91.0, middle: 0.7115),
            Pin(size: 1.0, start: 122.5),
            child: SvgPicture.string(
              _svg_hjh2vh,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 168.0, start: 36.0),
            Pin(size: 17.0, middle: 0.3136),
            child: Text(
              'Other Payment Options',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 15,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 178.0, middle: 0.4396),
            Pin(size: 221.0, middle: 0.5009),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 41.0, start: 5.0),
                  Pin(size: 41.0, start: 0.0),
                  child:
                      // Adobe XD layer: 'google-pay' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/images/gpay.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 45.0, start: 3.0),
                  Pin(size: 45.0, middle: 0.2045),
                  child:
                      // Adobe XD layer: 'credit-card' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/images/card.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 63.0, middle: 0.7391),
                  Pin(size: 14.0, start: 16.0),
                  child: Text(
                    'Google Pay',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 93.0, end: 0.0),
                  Pin(size: 14.0, middle: 0.2802),
                  child: Text(
                    'Credit/Debit Card',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 30.0, middle: 0.5743),
                  Pin(size: 14.0, middle: 0.4831),
                  child: Text(
                    'BHIM',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 33.0, middle: 0.5862),
                  Pin(size: 14.0, middle: 0.8019),
                  child: Text(
                    'Wallet',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 20.0, middle: 0.538),
                  Pin(size: 14.0, middle: 0.6425),
                  child: Text(
                    'UPI',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 65.0, middle: 0.7522),
                  Pin(size: 14.0, end: 8.0),
                  child: Text(
                    'Net Banking',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 51.0, start: 0.0),
                  Pin(size: 34.0, middle: 0.4545),
                  child:
                      // Adobe XD layer: 'mygov-1000000000133…' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/images/bhim.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 39.0, start: 6.0),
                  Pin(size: 29.0, middle: 0.6458),
                  child:
                      // Adobe XD layer: 'UPI1' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/images/upi.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 27.0, start: 12.0),
                  Pin(size: 26.0, middle: 0.8051),
                  child:
                      // Adobe XD layer: 'PikPng.com_wallet-p…' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/images/wallet.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 26.0, start: 13.0),
                  Pin(size: 26.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'bank' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/images/bank.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 18.0, start: 35.0),
            Pin(size: 18.0, middle: 0.3801),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff6b0772)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 14.0, start: 37.0),
            Pin(size: 14.0, middle: 0.3807),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xff6b0772),
                border: Border.all(width: 1.0, color: const Color(0xff6b0772)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 18.0, start: 35.0),
            Pin(size: 18.0, middle: 0.4313),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff6b0772)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 18.0, start: 35.0),
            Pin(size: 18.0, middle: 0.4865),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff6b0772)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 18.0, start: 35.0),
            Pin(size: 18.0, middle: 0.535),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff6b0772)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 18.0, start: 35.0),
            Pin(size: 18.0, middle: 0.5822),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff6b0772)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 18.0, start: 35.0),
            Pin(size: 18.0, middle: 0.6321),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff6b0772)),
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
const String _svg_kgt0c =
    '<svg viewBox="3.0 2.0 17.0 17.0" ><path transform="translate(0.0, 0.0)" d="M 11.45956230163574 1.972659945487976 C 11.27451324462891 1.972659945487976 11.09786319732666 2.045559406280518 10.9660758972168 2.174540042877197 L 3.238526344299316 8.494503974914551 C 3.230113744735718 8.500102043151855 3.221701145172119 8.508501052856445 3.2132887840271 8.514100074768066 L 3.188050746917725 8.536566734313965 L 3.188050746917725 8.539365768432617 C 3.045058250427246 8.671152114868164 2.960939645767212 8.861800193786621 2.960939645767212 9.05811595916748 C 2.960939645767212 9.447807312011719 3.277775526046753 9.764642715454102 3.670324563980103 9.764642715454102 L 4.376903533935547 9.764642715454102 L 4.376903533935547 17.55666542053223 C 4.376903533935547 18.33891868591309 5.010589599609375 18.97266006469727 5.792873859405518 18.97266006469727 L 17.12901306152344 18.97266006469727 C 17.91134071350098 18.97266006469727 18.54501152038574 18.33891868591309 18.54501152038574 17.55666542053223 L 18.54501152038574 9.764642715454102 L 19.25161170959473 9.764642715454102 C 19.64410209655762 9.764642715454102 19.96093940734863 9.447807312011719 19.96093940734863 9.05811595916748 C 19.96093940734863 8.861800193786621 19.87968254089355 8.671152114868164 19.73662948608398 8.536566734313965 L 19.72542953491211 8.528168678283691 C 19.70863342285156 8.514100074768066 19.6917667388916 8.502902030944824 19.67496681213379 8.48890495300293 L 18.54501152038574 7.563608646392822 L 18.54501152038574 4.807390689849854 C 18.54501152038574 4.417649745941162 18.22537612915039 4.098001003265381 17.83561325073242 4.098001003265381 L 17.12901306152344 4.098001003265381 C 16.73644828796387 4.098001003265381 16.41961288452148 4.417649745941162 16.41961288452148 4.807390689849854 L 16.41961288452148 5.825195789337158 L 11.93904972076416 2.160521507263184 C 11.81006145477295 2.042752742767334 11.63901138305664 1.972659945487976 11.45956230163574 1.972659945487976 Z M 13.58488750457764 11.18063735961914 L 16.41961288452148 11.18063735961914 L 16.41961288452148 16.85006904602051 L 13.58488750457764 16.85006904602051 L 13.58488750457764 11.18063735961914 Z" fill="#858585" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fz26g =
    '<svg viewBox="3.9 3.9 17.0 17.0" ><path  d="M 5.256316184997559 3.949219942092896 C 4.534174919128418 3.949219942092896 3.949219942092896 4.534174919128418 3.949219942092896 5.256316184997559 L 3.949219942092896 17.02533531188965 C 3.949219942092896 17.7474422454834 4.534174919128418 18.33245849609375 5.256316184997559 18.33245849609375 L 12.24476718902588 18.33245849609375 C 12.98238086700439 19.87507057189941 14.55348491668701 20.94922065734863 16.3730640411377 20.94922065734863 C 18.89408302307129 20.94922065734863 20.94922065734863 18.89408302307129 20.94922065734863 16.3730640411377 C 20.94922065734863 14.55348491668701 19.87507057189941 12.98238086700439 18.33245849609375 12.24476718902588 L 18.33245849609375 5.256316184997559 C 18.33245849609375 4.534174919128418 17.7474422454834 3.949219942092896 17.02533531188965 3.949219942092896 L 5.256316184997559 3.949219942092896 Z M 5.256316184997559 5.256316184997559 L 17.02533531188965 5.256316184997559 L 17.02533531188965 7.870501518249512 L 5.256316184997559 7.870501518249512 L 5.256316184997559 5.256316184997559 Z M 8.525362014770508 9.832418441772461 C 8.885090827941895 9.832418441772461 9.180214881896973 10.12747669219971 9.180214881896973 10.48727130889893 C 9.180214881896973 10.84706687927246 8.885090827941895 11.13954067230225 8.525362014770508 11.13954067230225 C 8.165566444396973 11.13954067230225 7.870501518249512 10.84706687927246 7.870501518249512 10.48727130889893 C 7.870501518249512 10.12747669219971 8.165566444396973 9.832418441772461 8.525362014770508 9.832418441772461 Z M 11.13954067230225 9.832418441772461 C 11.50191974639893 9.832418441772461 11.79439449310303 10.12747669219971 11.79439449310303 10.48727130889893 C 11.79439449310303 10.84706687927246 11.50191974639893 11.13954067230225 11.13954067230225 11.13954067230225 C 10.77974605560303 11.13954067230225 10.48727130889893 10.84706687927246 10.48727130889893 10.48727130889893 C 10.48727130889893 10.12747669219971 10.77974605560303 9.832418441772461 11.13954067230225 9.832418441772461 Z M 13.75630378723145 9.832418441772461 C 14.11609840393066 9.832418441772461 14.41115760803223 10.12747669219971 14.41115760803223 10.48727130889893 C 14.41115760803223 10.84706687927246 14.11609840393066 11.13954067230225 13.75630378723145 11.13954067230225 C 13.39650917053223 11.13954067230225 13.10145092010498 10.84706687927246 13.10145092010498 10.48727130889893 C 13.10145092010498 10.12747669219971 13.39650917053223 9.832418441772461 13.75630378723145 9.832418441772461 Z M 16.3730640411377 9.832418441772461 C 16.73286056518555 9.832418441772461 17.02533531188965 10.12747669219971 17.02533531188965 10.48727130889893 C 17.02533531188965 10.84706687927246 16.73286056518555 11.13954067230225 16.3730640411377 11.13954067230225 C 16.01068687438965 11.13954067230225 15.71821308135986 10.84706687927246 15.71821308135986 10.48727130889893 C 15.71821308135986 10.12747669219971 16.01068687438965 9.832418441772461 16.3730640411377 9.832418441772461 Z M 5.908565521240234 12.44918155670166 C 6.270931243896484 12.44918155670166 6.563405513763428 12.74172210693359 6.563405513763428 13.10145092010498 C 6.563405513763428 13.46382904052734 6.270931243896484 13.75630378723145 5.908565521240234 13.75630378723145 C 5.548790454864502 13.75630378723145 5.256316184997559 13.46382904052734 5.256316184997559 13.10145092010498 C 5.256316184997559 12.74172210693359 5.548790454864502 12.44918155670166 5.908565521240234 12.44918155670166 Z M 8.525362014770508 12.44918155670166 C 8.885090827941895 12.44918155670166 9.180214881896973 12.74172210693359 9.180214881896973 13.10145092010498 C 9.180214881896973 13.46382904052734 8.885090827941895 13.75630378723145 8.525362014770508 13.75630378723145 C 8.165566444396973 13.75630378723145 7.870501518249512 13.46382904052734 7.870501518249512 13.10145092010498 C 7.870501518249512 12.74172210693359 8.165566444396973 12.44918155670166 8.525362014770508 12.44918155670166 Z M 11.13954067230225 12.44918155670166 C 11.50191974639893 12.44918155670166 11.79439449310303 12.74172210693359 11.79439449310303 13.10145092010498 C 11.79439449310303 13.46382904052734 11.50191974639893 13.75630378723145 11.13954067230225 13.75630378723145 C 10.77974605560303 13.75630378723145 10.48727130889893 13.46382904052734 10.48727130889893 13.10145092010498 C 10.48727130889893 12.74172210693359 10.77974605560303 12.44918155670166 11.13954067230225 12.44918155670166 Z M 16.3730640411377 13.10145092010498 C 18.18489456176758 13.10145092010498 19.64209747314453 14.5586519241333 19.64209747314453 16.3730640411377 C 19.64209747314453 18.18489456176758 18.18489456176758 19.64209747314453 16.3730640411377 19.64209747314453 C 14.5586519241333 19.64209747314453 13.10145092010498 18.18489456176758 13.10145092010498 16.3730640411377 C 13.10145092010498 14.5586519241333 14.5586519241333 13.10145092010498 16.3730640411377 13.10145092010498 Z M 16.36272811889648 13.74596691131592 C 16.0003490447998 13.75371932983398 15.71304416656494 14.04877853393555 15.71821308135986 14.41115760803223 L 15.71821308135986 16.64228248596191 L 16.88559150695801 17.80959510803223 C 17.04865837097168 17.98041534423828 17.29448509216309 18.05031967163086 17.52228927612305 17.98816871643066 C 17.75002670288086 17.93125152587891 17.93125152587891 17.75002670288086 17.98816871643066 17.52228927612305 C 18.05031967163086 17.29448509216309 17.98041534423828 17.04865837097168 17.80959510803223 16.88559150695801 L 17.02533531188965 16.10133171081543 L 17.02533531188965 14.41115760803223 C 17.02791976928711 14.23516941070557 16.96059799194336 14.0616979598999 16.83377647399902 13.93745994567871 C 16.70953750610352 13.81322193145752 16.53871726989746 13.74338245391846 16.36272811889648 13.74596691131592 Z M 5.908565521240234 15.06342601776123 C 6.270931243896484 15.06342601776123 6.563405513763428 15.35848426818848 6.563405513763428 15.71821308135986 C 6.563405513763428 16.0780086517334 6.270931243896484 16.3730640411377 5.908565521240234 16.3730640411377 C 5.548790454864502 16.3730640411377 5.256316184997559 16.0780086517334 5.256316184997559 15.71821308135986 C 5.256316184997559 15.35848426818848 5.548790454864502 15.06342601776123 5.908565521240234 15.06342601776123 Z M 8.525362014770508 15.06342601776123 C 8.885090827941895 15.06342601776123 9.180214881896973 15.35848426818848 9.180214881896973 15.71821308135986 C 9.180214881896973 16.0780086517334 8.885090827941895 16.3730640411377 8.525362014770508 16.3730640411377 C 8.165566444396973 16.3730640411377 7.870501518249512 16.0780086517334 7.870501518249512 15.71821308135986 C 7.870501518249512 15.35848426818848 8.165566444396973 15.06342601776123 8.525362014770508 15.06342601776123 Z M 11.13954067230225 15.06342601776123 C 11.50191974639893 15.06342601776123 11.79439449310303 15.35848426818848 11.79439449310303 15.71821308135986 C 11.79439449310303 16.0780086517334 11.50191974639893 16.3730640411377 11.13954067230225 16.3730640411377 C 10.77974605560303 16.3730640411377 10.48727130889893 16.0780086517334 10.48727130889893 15.71821308135986 C 10.48727130889893 15.35848426818848 10.77974605560303 15.06342601776123 11.13954067230225 15.06342601776123 Z" fill="#6b0772" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nnq98p =
    '<svg viewBox="2.1 0.2 17.0 17.0" ><path transform="translate(0.0, 0.0)" d="M 17.41831588745117 0.1835939884185791 C 16.50238418579102 0.1835939884185791 15.75998306274414 0.8703322410583496 15.75998306274414 1.717566967010498 C 15.75998306274414 1.746510863304138 15.75714302062988 1.772820949554443 15.75998306274414 1.801764369010925 C 13.94231796264648 1.030832648277283 10.7763147354126 1.351833701133728 7.826558589935303 4.080355167388916 C 6.41850757598877 5.382781505584717 3.383384466171265 5.085463523864746 2.512957572937012 5.885339260101318 C 1.648218035697937 6.685214519500732 1.801824688911438 9.332151412963867 5.471277236938477 12.72638416290283 C 9.143613815307617 16.12061882019043 11.97675514221191 16.24691390991211 12.84717655181885 15.44171619415283 C 13.71759510040283 14.63658809661865 13.45872020721436 12.03434944152832 14.97490787506104 10.63195705413818 C 17.85924339294434 7.963977813720703 18.1209602355957 4.974956035614014 17.28461837768555 3.251536130905151 C 17.32729148864746 3.254169702529907 17.37280464172363 3.251536130905151 17.41831588745117 3.251536130905151 C 18.33424758911133 3.251536130905151 19.07672309875488 2.564801931381226 19.07672309875488 1.717566967010498 C 19.07672309875488 0.8703322410583496 18.33424758911133 0.1835939884185791 17.41831588745117 0.1835939884185791 Z M 17.41831588745117 0.9518958926200867 C 17.87344360351562 0.9518958926200867 18.24613571166992 1.296579957008362 18.24613571166992 1.717566967010498 C 18.24613571166992 2.141180992126465 17.87344360351562 2.485865354537964 17.41831588745117 2.485865354537964 C 16.96035194396973 2.485865354537964 16.58773040771484 2.141180992126465 16.58773040771484 1.717566967010498 C 16.58773040771484 1.512334227561951 16.67875671386719 1.325523734092712 16.83524513244629 1.178178191184998 C 16.99166297912598 1.033459663391113 17.19643402099609 0.9518958926200867 17.41831588745117 0.9518958926200867 Z M 14.03334331512451 2.817394018173218 C 14.368971824646 2.830549001693726 14.73591232299805 2.898957967758179 15.13132572174072 3.004204511642456 C 12.8983678817749 2.901591539382935 10.05386543273926 6.195817947387695 8.989963531494141 7.398238182067871 C 8.236202239990234 8.253414154052734 6.967505931854248 9.190093040466309 5.38309907913208 9.305881500244141 C 4.083142280578613 8.60859203338623 4.171327590942383 7.669286727905273 4.171327590942383 7.669286727905273 C 4.171327590942383 7.669286727905273 5.954846858978271 7.908677101135254 8.341426849365234 6.237916946411133 C 10.55734443664551 4.685525417327881 11.67520713806152 2.725302457809448 14.03334331512451 2.817394018173218 Z M 6.412820339202881 14.40507793426514 C 5.997519493103027 14.68393993377686 5.718756675720215 15.13651847839355 5.718756675720215 15.64958381652832 C 5.718756675720215 16.49681091308594 6.461180210113525 17.18359375 7.377119064331055 17.18359375 C 8.187849044799805 17.18359375 8.864785194396973 16.64681816101074 9.01275634765625 15.93902015686035 C 8.261761665344238 15.62331390380859 7.385653972625732 15.13651847839355 6.412820339202881 14.40507793426514 Z" fill="#858585" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_a4tru1 =
    '<svg viewBox="1.0 0.0 17.0 17.6" ><path  d="M 9.5 0 C 6.086114406585693 0 3.318181753158569 2.633127212524414 3.318181753158569 5.880748271942139 C 3.318181753158569 9.128391265869141 6.086114406585693 11.76149654388428 9.5 11.76149654388428 C 12.91390800476074 11.76149654388428 15.68181896209717 9.128391265869141 15.68181896209717 5.880748271942139 C 15.68181896209717 2.633127212524414 12.91390800476074 0 9.5 0 Z M 5.370738983154297 7.833376884460449 L 13.62930011749268 7.833376884460449 C 12.86862754821777 9.280555725097656 11.31714630126953 10.29130935668945 9.5 10.29130935668945 C 7.682885646820068 10.29130935668945 6.131395816802979 9.280555725097656 5.370738983154297 7.833376884460449 Z M 5.926136493682861 12.77225017547607 C 3.626067161560059 13.34657859802246 1.827057719230652 14.71333789825439 1 17.64224433898926 L 18.00000190734863 17.64224433898926 C 17.17295074462891 14.71333789825439 15.37396430969238 13.34657859802246 13.0738639831543 12.77225017547607 C 12.00835037231445 13.31497001647949 10.7919225692749 13.62223815917969 9.5 13.62223815917969 C 8.208077430725098 13.62223815917969 6.991658210754395 13.31497001647949 5.926136493682861 12.77225017547607 Z" fill="#858585" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ezed9 =
    '<svg viewBox="2.0 2.0 33.9 29.8" ><path transform="translate(0.0, 0.0)" d="M 8.625893592834473 1.984379887580872 L 8.625893592834473 10.41416168212891 L 4.198207855224609 10.41416168212891 C 2.983799457550049 10.41416168212891 1.984380006790161 11.292405128479 1.984380006790161 12.35697364807129 L 1.984380006790161 24.0289478302002 C 1.984380006790161 25.09613037109375 2.983799457550049 25.97430801391602 4.198207855224609 25.97430801391602 L 8.625893592834473 25.97430801391602 L 8.625893592834473 31.80777740478516 L 29.28536605834961 31.80777740478516 L 29.28536605834961 25.97430801391602 L 33.7130126953125 25.97430801391602 C 34.92451095581055 25.97430801391602 35.92396545410156 25.09613037109375 35.92396545410156 24.0289478302002 L 35.92396545410156 12.35697364807129 C 35.92396545410156 11.292405128479 34.92451095581055 10.41416168212891 33.7130126953125 10.41416168212891 L 29.28536605834961 10.41416168212891 L 29.28536605834961 1.984379887580872 L 8.625893592834473 1.984379887580872 Z M 10.10172462463379 3.281267881393433 L 27.80946350097656 3.281267881393433 L 27.80946350097656 10.41416168212891 L 10.10172462463379 10.41416168212891 L 10.10172462463379 3.281267881393433 Z M 4.198207855224609 11.70852088928223 L 9.238895416259766 11.70852088928223 C 9.32026195526123 11.72126483917236 9.401554107666016 11.72126483917236 9.477120399475098 11.70852088928223 L 28.42253875732422 11.70852088928223 C 28.50382995605469 11.72126483917236 28.58519744873047 11.72126483917236 28.66076278686523 11.70852088928223 L 33.7130126953125 11.70852088928223 C 34.12847137451172 11.70852088928223 34.45096206665039 11.99190044403076 34.45096206665039 12.35697364807129 L 34.45096206665039 24.0289478302002 C 34.45096206665039 24.39657020568848 34.12847137451172 24.67740249633789 33.7130126953125 24.67740249633789 L 29.28536605834961 24.67740249633789 L 29.28536605834961 18.84138107299805 L 8.625893592834473 18.84138107299805 L 8.625893592834473 24.67740249633789 L 4.198207855224609 24.67740249633789 C 3.77984619140625 24.67740249633789 3.460262775421143 24.39657020568848 3.460262775421143 24.0289478302002 L 3.460262775421143 12.35697364807129 C 3.460262775421143 11.99190044403076 3.77984619140625 11.70852088928223 4.198207855224609 11.70852088928223 Z M 30.76127243041992 13.65381622314453 C 29.94485282897949 13.65381622314453 29.28536605834961 14.23593425750732 29.28536605834961 14.95072364807129 C 29.28536605834961 15.66812801361084 29.94485282897949 16.24763107299805 30.76127243041992 16.24763107299805 C 31.57471656799316 16.24763107299805 32.23717880249023 15.66812801361084 32.23717880249023 14.95072364807129 C 32.23717880249023 14.23593425750732 31.57471656799316 13.65381622314453 30.76127243041992 13.65381622314453 Z M 10.10172462463379 20.1382884979248 L 27.80946350097656 20.1382884979248 L 27.80946350097656 25.21612358093262 C 27.79495811462402 25.28755569458008 27.79495811462402 25.35905456542969 27.80946350097656 25.42545509338379 L 27.80946350097656 30.51342010498047 L 10.10172462463379 30.51342010498047 L 10.10172462463379 25.43310165405273 C 10.11630249023438 25.3641529083252 10.11630249023438 25.29265403747559 10.10172462463379 25.22377014160156 L 10.10172462463379 20.1382884979248 Z M 13.05063438415527 22.08365058898926 C 12.78622913360596 22.08110237121582 12.53930377960205 22.20364379882812 12.40275001525879 22.40532684326172 C 12.27199745178223 22.60701560974121 12.27199745178223 22.85719680786133 12.40275001525879 23.05887985229492 C 12.53930377960205 23.26056671142578 12.78622913360596 23.38310813903809 13.05063438415527 23.38055610656738 L 24.85772705078125 23.38055610656738 C 25.12213134765625 23.38310813903809 25.37195777893066 23.26056671142578 25.50561141967773 23.05887985229492 C 25.63926315307617 22.85719680786133 25.63926315307617 22.60701560974121 25.50561141967773 22.40532684326172 C 25.37195777893066 22.20364379882812 25.12213134765625 22.08110237121582 24.85772705078125 22.08365058898926 L 13.05063438415527 22.08365058898926 Z M 13.05063438415527 24.67740249633789 C 12.78622913360596 24.67485046386719 12.53930377960205 24.79484367370605 12.40275001525879 24.99907875061035 C 12.27199745178223 25.20076560974121 12.27199745178223 25.44839477539062 12.40275001525879 25.65262985229492 C 12.53930377960205 25.85431671142578 12.78622913360596 25.97685813903809 13.05063438415527 25.97430801391602 L 21.90591621398926 25.97430801391602 C 22.17032051086426 25.97685813903809 22.42014694213867 25.85431671142578 22.55380058288574 25.65262985229492 C 22.68745231628418 25.44839477539062 22.68745231628418 25.20076560974121 22.55380058288574 24.99907875061035 C 22.42014694213867 24.79484367370605 22.17032051086426 24.67485046386719 21.90591621398926 24.67740249633789 L 13.05063438415527 24.67740249633789 Z M 13.05063438415527 27.27121543884277 C 12.78622913360596 27.26866912841797 12.53930377960205 27.38865852355957 12.40275001525879 27.59289360046387 C 12.27199745178223 27.79458045959473 12.27199745178223 28.04220962524414 12.40275001525879 28.24644470214844 C 12.53930377960205 28.4481315612793 12.78622913360596 28.5706729888916 13.05063438415527 28.56812477111816 L 24.85772705078125 28.56812477111816 C 25.12213134765625 28.5706729888916 25.37195777893066 28.4481315612793 25.50561141967773 28.24644470214844 C 25.63926315307617 28.04220962524414 25.63926315307617 27.79458045959473 25.50561141967773 27.59289360046387 C 25.37195777893066 27.38865852355957 25.12213134765625 27.26866912841797 24.85772705078125 27.27121543884277 L 13.05063438415527 27.27121543884277 Z" fill="#ffffff" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_soctnb =
    '<svg viewBox="15.0 9.0 26.4 28.6" ><path  d="M 15 9 L 15 37.62229919433594 L 41.40200805664062 37.62229919433594 L 41.40200805664062 15.73358058929443 L 33.70006561279297 9 L 15 9 Z M 16.05607986450195 9.923299789428711 L 32.95336532592773 9.923299789428711 L 32.95336532592773 16.38640022277832 L 40.34592437744141 16.38640022277832 L 40.34592437744141 36.69900131225586 L 16.05607986450195 36.69900131225586 L 16.05607986450195 9.923299789428711 Z M 34.00944519042969 10.5761194229126 L 39.59922409057617 15.46309947967529 L 34.00944519042969 15.46309947967529 L 34.00944519042969 10.5761194229126 Z M 18.69628143310547 10.84660053253174 C 18.40543556213379 10.84660053253174 18.16823959350586 11.05397319793701 18.16823959350586 11.30825042724609 C 18.16823959350586 11.56252765655518 18.40543556213379 11.76990127563477 18.69628143310547 11.76990127563477 C 18.98712539672852 11.76990127563477 19.22431945800781 11.56252765655518 19.22431945800781 11.30825042724609 C 19.22431945800781 11.05397319793701 18.98712539672852 10.84660053253174 18.69628143310547 10.84660053253174 Z M 18.69628143310547 12.69320011138916 C 18.40543556213379 12.69320011138916 18.16823959350586 12.90057373046875 18.16823959350586 13.15485000610352 C 18.16823959350586 13.40912628173828 18.40543556213379 13.61649990081787 18.69628143310547 13.61649990081787 C 18.98712539672852 13.61649990081787 19.22431945800781 13.40912628173828 19.22431945800781 13.15485000610352 C 19.22431945800781 12.90057373046875 18.98712539672852 12.69320011138916 18.69628143310547 12.69320011138916 Z M 18.69628143310547 14.53979969024658 C 18.40543556213379 14.53979969024658 18.16823959350586 14.74717330932617 18.16823959350586 15.00144958496094 C 18.16823959350586 15.25572776794434 18.40543556213379 15.46309947967529 18.69628143310547 15.46309947967529 C 18.98712539672852 15.46309947967529 19.22431945800781 15.25572776794434 19.22431945800781 15.00144958496094 C 19.22431945800781 14.74717330932617 18.98712539672852 14.53979969024658 18.69628143310547 14.53979969024658 Z M 18.69628143310547 16.38640022277832 C 18.40543556213379 16.38640022277832 18.16823959350586 16.59377288818359 18.16823959350586 16.84805107116699 C 18.16823959350586 17.10232734680176 18.40543556213379 17.30970001220703 18.69628143310547 17.30970001220703 C 18.98712539672852 17.30970001220703 19.22431945800781 17.10232734680176 19.22431945800781 16.84805107116699 C 19.22431945800781 16.59377288818359 18.98712539672852 16.38640022277832 18.69628143310547 16.38640022277832 Z M 18.69628143310547 18.23299980163574 C 18.40543556213379 18.23299980163574 18.16823959350586 18.44037246704102 18.16823959350586 18.69464874267578 C 18.16823959350586 18.94892501831055 18.40543556213379 19.15629959106445 18.69628143310547 19.15629959106445 C 18.98712539672852 19.15629959106445 19.22431945800781 18.94892501831055 19.22431945800781 18.69464874267578 C 19.22431945800781 18.44037246704102 18.98712539672852 18.23299980163574 18.69628143310547 18.23299980163574 Z M 18.69628143310547 20.07959938049316 C 18.40543556213379 20.07959938049316 18.16823959350586 20.28697204589844 18.16823959350586 20.5412483215332 C 18.16823959350586 20.7955265045166 18.40543556213379 21.00289726257324 18.69628143310547 21.00289726257324 C 18.98712539672852 21.00289726257324 19.22431945800781 20.7955265045166 19.22431945800781 20.5412483215332 C 19.22431945800781 20.28697204589844 18.98712539672852 20.07959938049316 18.69628143310547 20.07959938049316 Z M 18.69628143310547 21.92619705200195 C 18.40543556213379 21.92619705200195 18.16823959350586 22.13357162475586 18.16823959350586 22.38784980773926 C 18.16823959350586 22.64212608337402 18.40543556213379 22.8494987487793 18.69628143310547 22.8494987487793 C 18.98712539672852 22.8494987487793 19.22431945800781 22.64212608337402 19.22431945800781 22.38784980773926 C 19.22431945800781 22.13357162475586 18.98712539672852 21.92619705200195 18.69628143310547 21.92619705200195 Z M 18.69628143310547 23.77279853820801 C 18.40543556213379 23.77279853820801 18.16823959350586 23.98017311096191 18.16823959350586 24.23444938659668 C 18.16823959350586 24.48872566223145 18.40543556213379 24.69609832763672 18.69628143310547 24.69609832763672 C 18.98712539672852 24.69609832763672 19.22431945800781 24.48872566223145 19.22431945800781 24.23444938659668 C 19.22431945800781 23.98017311096191 18.98712539672852 23.77279853820801 18.69628143310547 23.77279853820801 Z M 27.11191940307617 24.12263679504395 L 27.11191940307617 28.02865600585938 L 28.98688507080078 28.02865600585938 C 30.32968902587891 28.02865600585938 31.07427978515625 27.31993293762207 31.07427978515625 26.03779220581055 C 31.07427978515625 24.81871223449707 30.31728363037109 24.12263679504395 28.98688507080078 24.12263679504395 L 27.11191940307617 24.12263679504395 Z M 24.3541259765625 24.1262378692627 L 22.39873886108398 24.1262378692627 L 22.39873886108398 28.02865600585938 L 23.53323364257812 28.02865600585938 L 23.53323364257812 26.88353538513184 L 24.28606033325195 26.88353538513184 C 25.28030776977539 26.88353538513184 25.96300888061523 26.34072685241699 25.96300888061523 25.51118659973145 C 25.96300888061523 24.67264556884766 25.31330871582031 24.1262378692627 24.3541259765625 24.1262378692627 Z M 32.23554611206055 24.1262378692627 L 32.23554611206055 28.02865600585938 L 33.36798095703125 28.02865600585938 L 33.36798095703125 26.5733528137207 L 35.09646606445312 26.5733528137207 L 35.09646606445312 25.81417083740234 L 33.36798095703125 25.81417083740234 L 33.36798095703125 24.9233226776123 L 35.27177429199219 24.9233226776123 L 35.27177429199219 24.1262378692627 L 32.23554611206055 24.1262378692627 Z M 23.53323364257812 24.88726806640625 L 24.05298233032227 24.88726806640625 C 24.53360366821289 24.88726806640625 24.816162109375 25.10184288024902 24.816162109375 25.51298904418945 C 24.816162109375 25.91873168945312 24.52948760986328 26.13515281677246 24.04886627197266 26.13515281677246 L 23.53323364257812 26.13515281677246 L 23.53323364257812 24.88726806640625 Z M 28.24842071533203 24.91972160339355 L 28.78269195556641 24.91972160339355 C 29.496337890625 24.91972160339355 29.91713333129883 25.32906723022461 29.91713333129883 26.05759620666504 C 29.91713333129883 26.83123016357422 29.51904296875 27.22977256774902 28.78269195556641 27.22977256774902 L 28.24842071533203 27.22977256774902 L 28.24842071533203 24.91972160339355 Z M 18.69628143310547 25.61939811706543 C 18.40543556213379 25.61939811706543 18.16823959350586 25.8267707824707 18.16823959350586 26.08104705810547 C 18.16823959350586 26.33532524108887 18.40543556213379 26.54269790649414 18.69628143310547 26.54269790649414 C 18.98712539672852 26.54269790649414 19.22431945800781 26.33532524108887 19.22431945800781 26.08104705810547 C 19.22431945800781 25.8267707824707 18.98712539672852 25.61939811706543 18.69628143310547 25.61939811706543 Z M 18.69628143310547 27.46599960327148 C 18.40543556213379 27.46599960327148 18.16823959350586 27.67337036132812 18.16823959350586 27.92764854431152 C 18.16823959350586 28.18192481994629 18.40543556213379 28.3892993927002 18.69628143310547 28.3892993927002 C 18.98712539672852 28.3892993927002 19.22431945800781 28.18192481994629 19.22431945800781 27.92764854431152 C 19.22431945800781 27.67337036132812 18.98712539672852 27.46599960327148 18.69628143310547 27.46599960327148 Z M 18.69628143310547 29.31259918212891 C 18.40543556213379 29.31259918212891 18.16823959350586 29.51997375488281 18.16823959350586 29.77425003051758 C 18.16823959350586 30.02852630615234 18.40543556213379 30.23589897155762 18.69628143310547 30.23589897155762 C 18.98712539672852 30.23589897155762 19.22431945800781 30.02852630615234 19.22431945800781 29.77425003051758 C 19.22431945800781 29.51997375488281 18.98712539672852 29.31259918212891 18.69628143310547 29.31259918212891 Z M 18.69628143310547 31.1591968536377 C 18.40543556213379 31.1591968536377 18.16823959350586 31.36657333374023 18.16823959350586 31.620849609375 C 18.16823959350586 31.87512588500977 18.40543556213379 32.08250045776367 18.69628143310547 32.08250045776367 C 18.98712539672852 32.08250045776367 19.22431945800781 31.87512588500977 19.22431945800781 31.620849609375 C 19.22431945800781 31.36657333374023 18.98712539672852 31.1591968536377 18.69628143310547 31.1591968536377 Z M 18.69628143310547 33.00579833984375 C 18.40543556213379 33.00579833984375 18.16823959350586 33.21317291259766 18.16823959350586 33.46744918823242 C 18.16823959350586 33.72172546386719 18.40543556213379 33.92910003662109 18.69628143310547 33.92910003662109 C 18.98712539672852 33.92910003662109 19.22431945800781 33.72172546386719 19.22431945800781 33.46744918823242 C 19.22431945800781 33.21317291259766 18.98712539672852 33.00579833984375 18.69628143310547 33.00579833984375 Z M 18.69628143310547 34.85240173339844 C 18.40543556213379 34.85240173339844 18.16823959350586 35.05977249145508 18.16823959350586 35.31404876708984 C 18.16823959350586 35.56832504272461 18.40543556213379 35.77569961547852 18.69628143310547 35.77569961547852 C 18.98712539672852 35.77569961547852 19.22431945800781 35.56832504272461 19.22431945800781 35.31404876708984 C 19.22431945800781 35.05977249145508 18.98712539672852 34.85240173339844 18.69628143310547 34.85240173339844 Z" fill="#ffffff" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_go2rn =
    '<svg viewBox="13.5 546.5 333.0 1.0" ><path transform="translate(13.5, 546.5)" d="M 0 0 L 333 0" fill="none" stroke="#707070" stroke-width="1" stroke-dasharray="3 3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xudutf =
    '<svg viewBox="13.5 657.5 333.0 1.0" ><path transform="translate(13.5, 657.5)" d="M 0 0 L 333 0" fill="none" stroke="#707070" stroke-width="1" stroke-dasharray="3 3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sfbsa =
    '<svg viewBox="4.0 4.0 28.0 28.0" ><path  d="M 32 18 C 32 25.73283195495605 25.73283195495605 32 18 32 C 10.26716995239258 32 4 25.73283195495605 4 18 C 4 10.26716995239258 10.26716995239258 4 18 4 C 25.73283195495605 4 32 10.26716995239258 32 18 Z" fill="#f6b2e1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_e9fj6 =
    '<svg viewBox="5.8 8.5 24.8 19.2" ><path transform="translate(-6.79, -6.12)" d="M 34.58589935302734 14.58590030670166 L 21.01560020446777 28.17189979553223 L 15.41409969329834 22.58589935302734 L 12.58590030670166 25.41410064697266 L 21.01950073242188 33.82809829711914 L 37.41410064697266 17.41410064697266 L 34.58589935302734 14.58590030670166 Z" fill="#6b0772" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_enhk =
    '<svg viewBox="72.5 122.5 91.0 1.0" ><path transform="translate(72.5, 122.5)" d="M 0 0 L 91 0" fill="none" stroke="#6b0772" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hjh2vh =
    '<svg viewBox="191.4 122.5 91.0 1.0" ><path transform="translate(191.4, 122.5)" d="M 0 0 L 91 0" fill="none" stroke="#c2c2c2" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
