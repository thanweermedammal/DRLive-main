import 'package:active_ecommerce_flutter/data_handler/fetch_history.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:active_ecommerce_flutter/models/active_patient_history.dart';
import 'package:active_ecommerce_flutter/screens/patientScreens/prescriptionscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:active_ecommerce_flutter/payment.dart';

class MedicineData extends StatefulWidget {
  MedicineData(
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
  MedicineDataState createState() => MedicineDataState();
}

class MedicineDataState extends State<MedicineData> {
  Future<ActivePatientHistory> fetchAppointment;
  @override
  void initState() {
    // TODO: implement initState
    fetchAppointment = History().activePatientData(user_id.$.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: FutureBuilder<ActivePatientHistory>(
          future: fetchAppointment,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.appointments.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PrescriptionScreen(
                                        snapshot: snapshot,
                                        index: index,
                                        drname: snapshot
                                            .data
                                            .appointments[index]
                                            .doctor
                                            .doctordetails
                                            .firstName
                                            .name,
                                        patientname: snapshot
                                            .data
                                            .appointments[index]
                                            .patient
                                            .firstName,
                                        gender: snapshot
                                            .data
                                            .appointments[index]
                                            .patient
                                            .gender
                                            .name,
                                      )));
                        },
                        child: Container(
                          height: 50,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Name : ${snapshot.data.appointments[index].doctor.doctordetails.firstName.name.toString()}"),
                                Text(
                                    "Appointment ID : ${snapshot.data.appointments[index].id}"),
                                Text(
                                    "Date : ${snapshot.data.appointments[index].date.day}-${snapshot.data.appointments[index].date.month}-${snapshot.data.appointments[index].date.year}")
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),

      // Stack(children: [
      //   CustomScrollView(
      //     slivers: [
      //       SliverList(
      //           delegate: SliverChildListDelegate([
      //         buildMethodList(),
      //       ])),
      //       SliverList(
      //           delegate: SliverChildListDelegate([payOrCancelButtons()]))
      //     ],
      //   ),
      // ])
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
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
      // elevation: 0.0,
      titleSpacing: 0,
      // actions: [
      //   // Adobe XD layer: 'surface1' (group)
      //   Container(
      //     height: 50,
      //     width: 50,
      //     child: Center(
      //       child: SvgPicture.string(
      //         '<svg viewBox="2.0 2.0 33.9 29.8" ><path transform="translate(0.0, 0.0)" d="M 8.625893592834473 1.984379887580872 L 8.625893592834473 10.41416168212891 L 4.198207855224609 10.41416168212891 C 2.983799457550049 10.41416168212891 1.984380006790161 11.292405128479 1.984380006790161 12.35697364807129 L 1.984380006790161 24.0289478302002 C 1.984380006790161 25.09613037109375 2.983799457550049 25.97430801391602 4.198207855224609 25.97430801391602 L 8.625893592834473 25.97430801391602 L 8.625893592834473 31.80777740478516 L 29.28536605834961 31.80777740478516 L 29.28536605834961 25.97430801391602 L 33.7130126953125 25.97430801391602 C 34.92451095581055 25.97430801391602 35.92396545410156 25.09613037109375 35.92396545410156 24.0289478302002 L 35.92396545410156 12.35697364807129 C 35.92396545410156 11.292405128479 34.92451095581055 10.41416168212891 33.7130126953125 10.41416168212891 L 29.28536605834961 10.41416168212891 L 29.28536605834961 1.984379887580872 L 8.625893592834473 1.984379887580872 Z M 10.10172462463379 3.281267881393433 L 27.80946350097656 3.281267881393433 L 27.80946350097656 10.41416168212891 L 10.10172462463379 10.41416168212891 L 10.10172462463379 3.281267881393433 Z M 4.198207855224609 11.70852088928223 L 9.238895416259766 11.70852088928223 C 9.32026195526123 11.72126483917236 9.401554107666016 11.72126483917236 9.477120399475098 11.70852088928223 L 28.42253875732422 11.70852088928223 C 28.50382995605469 11.72126483917236 28.58519744873047 11.72126483917236 28.66076278686523 11.70852088928223 L 33.7130126953125 11.70852088928223 C 34.12847137451172 11.70852088928223 34.45096206665039 11.99190044403076 34.45096206665039 12.35697364807129 L 34.45096206665039 24.0289478302002 C 34.45096206665039 24.39657020568848 34.12847137451172 24.67740249633789 33.7130126953125 24.67740249633789 L 29.28536605834961 24.67740249633789 L 29.28536605834961 18.84138107299805 L 8.625893592834473 18.84138107299805 L 8.625893592834473 24.67740249633789 L 4.198207855224609 24.67740249633789 C 3.77984619140625 24.67740249633789 3.460262775421143 24.39657020568848 3.460262775421143 24.0289478302002 L 3.460262775421143 12.35697364807129 C 3.460262775421143 11.99190044403076 3.77984619140625 11.70852088928223 4.198207855224609 11.70852088928223 Z M 30.76127243041992 13.65381622314453 C 29.94485282897949 13.65381622314453 29.28536605834961 14.23593425750732 29.28536605834961 14.95072364807129 C 29.28536605834961 15.66812801361084 29.94485282897949 16.24763107299805 30.76127243041992 16.24763107299805 C 31.57471656799316 16.24763107299805 32.23717880249023 15.66812801361084 32.23717880249023 14.95072364807129 C 32.23717880249023 14.23593425750732 31.57471656799316 13.65381622314453 30.76127243041992 13.65381622314453 Z M 10.10172462463379 20.1382884979248 L 27.80946350097656 20.1382884979248 L 27.80946350097656 25.21612358093262 C 27.79495811462402 25.28755569458008 27.79495811462402 25.35905456542969 27.80946350097656 25.42545509338379 L 27.80946350097656 30.51342010498047 L 10.10172462463379 30.51342010498047 L 10.10172462463379 25.43310165405273 C 10.11630249023438 25.3641529083252 10.11630249023438 25.29265403747559 10.10172462463379 25.22377014160156 L 10.10172462463379 20.1382884979248 Z M 13.05063438415527 22.08365058898926 C 12.78622913360596 22.08110237121582 12.53930377960205 22.20364379882812 12.40275001525879 22.40532684326172 C 12.27199745178223 22.60701560974121 12.27199745178223 22.85719680786133 12.40275001525879 23.05887985229492 C 12.53930377960205 23.26056671142578 12.78622913360596 23.38310813903809 13.05063438415527 23.38055610656738 L 24.85772705078125 23.38055610656738 C 25.12213134765625 23.38310813903809 25.37195777893066 23.26056671142578 25.50561141967773 23.05887985229492 C 25.63926315307617 22.85719680786133 25.63926315307617 22.60701560974121 25.50561141967773 22.40532684326172 C 25.37195777893066 22.20364379882812 25.12213134765625 22.08110237121582 24.85772705078125 22.08365058898926 L 13.05063438415527 22.08365058898926 Z M 13.05063438415527 24.67740249633789 C 12.78622913360596 24.67485046386719 12.53930377960205 24.79484367370605 12.40275001525879 24.99907875061035 C 12.27199745178223 25.20076560974121 12.27199745178223 25.44839477539062 12.40275001525879 25.65262985229492 C 12.53930377960205 25.85431671142578 12.78622913360596 25.97685813903809 13.05063438415527 25.97430801391602 L 21.90591621398926 25.97430801391602 C 22.17032051086426 25.97685813903809 22.42014694213867 25.85431671142578 22.55380058288574 25.65262985229492 C 22.68745231628418 25.44839477539062 22.68745231628418 25.20076560974121 22.55380058288574 24.99907875061035 C 22.42014694213867 24.79484367370605 22.17032051086426 24.67485046386719 21.90591621398926 24.67740249633789 L 13.05063438415527 24.67740249633789 Z M 13.05063438415527 27.27121543884277 C 12.78622913360596 27.26866912841797 12.53930377960205 27.38865852355957 12.40275001525879 27.59289360046387 C 12.27199745178223 27.79458045959473 12.27199745178223 28.04220962524414 12.40275001525879 28.24644470214844 C 12.53930377960205 28.4481315612793 12.78622913360596 28.5706729888916 13.05063438415527 28.56812477111816 L 24.85772705078125 28.56812477111816 C 25.12213134765625 28.5706729888916 25.37195777893066 28.4481315612793 25.50561141967773 28.24644470214844 C 25.63926315307617 28.04220962524414 25.63926315307617 27.79458045959473 25.50561141967773 27.59289360046387 C 25.37195777893066 27.38865852355957 25.12213134765625 27.26866912841797 24.85772705078125 27.27121543884277 L 13.05063438415527 27.27121543884277 Z" fill="#ffffff" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
      //         allowDrawingOutsideViewBox: true,
      //         fit: BoxFit.fill,
      //       ),
      //     ),
      //   ),
      //   Container(
      //     height: 50,
      //     width: 50,
      //     child: Center(
      //       child: // Adobe XD layer: 'surface1' (group)
      //           SvgPicture.string(
      //         '<svg viewBox="15.0 9.0 26.4 28.6" ><path  d="M 15 9 L 15 37.62229919433594 L 41.40200805664062 37.62229919433594 L 41.40200805664062 15.73358058929443 L 33.70006561279297 9 L 15 9 Z M 16.05607986450195 9.923299789428711 L 32.95336532592773 9.923299789428711 L 32.95336532592773 16.38640022277832 L 40.34592437744141 16.38640022277832 L 40.34592437744141 36.69900131225586 L 16.05607986450195 36.69900131225586 L 16.05607986450195 9.923299789428711 Z M 34.00944519042969 10.5761194229126 L 39.59922409057617 15.46309947967529 L 34.00944519042969 15.46309947967529 L 34.00944519042969 10.5761194229126 Z M 18.69628143310547 10.84660053253174 C 18.40543556213379 10.84660053253174 18.16823959350586 11.05397319793701 18.16823959350586 11.30825042724609 C 18.16823959350586 11.56252765655518 18.40543556213379 11.76990127563477 18.69628143310547 11.76990127563477 C 18.98712539672852 11.76990127563477 19.22431945800781 11.56252765655518 19.22431945800781 11.30825042724609 C 19.22431945800781 11.05397319793701 18.98712539672852 10.84660053253174 18.69628143310547 10.84660053253174 Z M 18.69628143310547 12.69320011138916 C 18.40543556213379 12.69320011138916 18.16823959350586 12.90057373046875 18.16823959350586 13.15485000610352 C 18.16823959350586 13.40912628173828 18.40543556213379 13.61649990081787 18.69628143310547 13.61649990081787 C 18.98712539672852 13.61649990081787 19.22431945800781 13.40912628173828 19.22431945800781 13.15485000610352 C 19.22431945800781 12.90057373046875 18.98712539672852 12.69320011138916 18.69628143310547 12.69320011138916 Z M 18.69628143310547 14.53979969024658 C 18.40543556213379 14.53979969024658 18.16823959350586 14.74717330932617 18.16823959350586 15.00144958496094 C 18.16823959350586 15.25572776794434 18.40543556213379 15.46309947967529 18.69628143310547 15.46309947967529 C 18.98712539672852 15.46309947967529 19.22431945800781 15.25572776794434 19.22431945800781 15.00144958496094 C 19.22431945800781 14.74717330932617 18.98712539672852 14.53979969024658 18.69628143310547 14.53979969024658 Z M 18.69628143310547 16.38640022277832 C 18.40543556213379 16.38640022277832 18.16823959350586 16.59377288818359 18.16823959350586 16.84805107116699 C 18.16823959350586 17.10232734680176 18.40543556213379 17.30970001220703 18.69628143310547 17.30970001220703 C 18.98712539672852 17.30970001220703 19.22431945800781 17.10232734680176 19.22431945800781 16.84805107116699 C 19.22431945800781 16.59377288818359 18.98712539672852 16.38640022277832 18.69628143310547 16.38640022277832 Z M 18.69628143310547 18.23299980163574 C 18.40543556213379 18.23299980163574 18.16823959350586 18.44037246704102 18.16823959350586 18.69464874267578 C 18.16823959350586 18.94892501831055 18.40543556213379 19.15629959106445 18.69628143310547 19.15629959106445 C 18.98712539672852 19.15629959106445 19.22431945800781 18.94892501831055 19.22431945800781 18.69464874267578 C 19.22431945800781 18.44037246704102 18.98712539672852 18.23299980163574 18.69628143310547 18.23299980163574 Z M 18.69628143310547 20.07959938049316 C 18.40543556213379 20.07959938049316 18.16823959350586 20.28697204589844 18.16823959350586 20.5412483215332 C 18.16823959350586 20.7955265045166 18.40543556213379 21.00289726257324 18.69628143310547 21.00289726257324 C 18.98712539672852 21.00289726257324 19.22431945800781 20.7955265045166 19.22431945800781 20.5412483215332 C 19.22431945800781 20.28697204589844 18.98712539672852 20.07959938049316 18.69628143310547 20.07959938049316 Z M 18.69628143310547 21.92619705200195 C 18.40543556213379 21.92619705200195 18.16823959350586 22.13357162475586 18.16823959350586 22.38784980773926 C 18.16823959350586 22.64212608337402 18.40543556213379 22.8494987487793 18.69628143310547 22.8494987487793 C 18.98712539672852 22.8494987487793 19.22431945800781 22.64212608337402 19.22431945800781 22.38784980773926 C 19.22431945800781 22.13357162475586 18.98712539672852 21.92619705200195 18.69628143310547 21.92619705200195 Z M 18.69628143310547 23.77279853820801 C 18.40543556213379 23.77279853820801 18.16823959350586 23.98017311096191 18.16823959350586 24.23444938659668 C 18.16823959350586 24.48872566223145 18.40543556213379 24.69609832763672 18.69628143310547 24.69609832763672 C 18.98712539672852 24.69609832763672 19.22431945800781 24.48872566223145 19.22431945800781 24.23444938659668 C 19.22431945800781 23.98017311096191 18.98712539672852 23.77279853820801 18.69628143310547 23.77279853820801 Z M 27.11191940307617 24.12263679504395 L 27.11191940307617 28.02865600585938 L 28.98688507080078 28.02865600585938 C 30.32968902587891 28.02865600585938 31.07427978515625 27.31993293762207 31.07427978515625 26.03779220581055 C 31.07427978515625 24.81871223449707 30.31728363037109 24.12263679504395 28.98688507080078 24.12263679504395 L 27.11191940307617 24.12263679504395 Z M 24.3541259765625 24.1262378692627 L 22.39873886108398 24.1262378692627 L 22.39873886108398 28.02865600585938 L 23.53323364257812 28.02865600585938 L 23.53323364257812 26.88353538513184 L 24.28606033325195 26.88353538513184 C 25.28030776977539 26.88353538513184 25.96300888061523 26.34072685241699 25.96300888061523 25.51118659973145 C 25.96300888061523 24.67264556884766 25.31330871582031 24.1262378692627 24.3541259765625 24.1262378692627 Z M 32.23554611206055 24.1262378692627 L 32.23554611206055 28.02865600585938 L 33.36798095703125 28.02865600585938 L 33.36798095703125 26.5733528137207 L 35.09646606445312 26.5733528137207 L 35.09646606445312 25.81417083740234 L 33.36798095703125 25.81417083740234 L 33.36798095703125 24.9233226776123 L 35.27177429199219 24.9233226776123 L 35.27177429199219 24.1262378692627 L 32.23554611206055 24.1262378692627 Z M 23.53323364257812 24.88726806640625 L 24.05298233032227 24.88726806640625 C 24.53360366821289 24.88726806640625 24.816162109375 25.10184288024902 24.816162109375 25.51298904418945 C 24.816162109375 25.91873168945312 24.52948760986328 26.13515281677246 24.04886627197266 26.13515281677246 L 23.53323364257812 26.13515281677246 L 23.53323364257812 24.88726806640625 Z M 28.24842071533203 24.91972160339355 L 28.78269195556641 24.91972160339355 C 29.496337890625 24.91972160339355 29.91713333129883 25.32906723022461 29.91713333129883 26.05759620666504 C 29.91713333129883 26.83123016357422 29.51904296875 27.22977256774902 28.78269195556641 27.22977256774902 L 28.24842071533203 27.22977256774902 L 28.24842071533203 24.91972160339355 Z M 18.69628143310547 25.61939811706543 C 18.40543556213379 25.61939811706543 18.16823959350586 25.8267707824707 18.16823959350586 26.08104705810547 C 18.16823959350586 26.33532524108887 18.40543556213379 26.54269790649414 18.69628143310547 26.54269790649414 C 18.98712539672852 26.54269790649414 19.22431945800781 26.33532524108887 19.22431945800781 26.08104705810547 C 19.22431945800781 25.8267707824707 18.98712539672852 25.61939811706543 18.69628143310547 25.61939811706543 Z M 18.69628143310547 27.46599960327148 C 18.40543556213379 27.46599960327148 18.16823959350586 27.67337036132812 18.16823959350586 27.92764854431152 C 18.16823959350586 28.18192481994629 18.40543556213379 28.3892993927002 18.69628143310547 28.3892993927002 C 18.98712539672852 28.3892993927002 19.22431945800781 28.18192481994629 19.22431945800781 27.92764854431152 C 19.22431945800781 27.67337036132812 18.98712539672852 27.46599960327148 18.69628143310547 27.46599960327148 Z M 18.69628143310547 29.31259918212891 C 18.40543556213379 29.31259918212891 18.16823959350586 29.51997375488281 18.16823959350586 29.77425003051758 C 18.16823959350586 30.02852630615234 18.40543556213379 30.23589897155762 18.69628143310547 30.23589897155762 C 18.98712539672852 30.23589897155762 19.22431945800781 30.02852630615234 19.22431945800781 29.77425003051758 C 19.22431945800781 29.51997375488281 18.98712539672852 29.31259918212891 18.69628143310547 29.31259918212891 Z M 18.69628143310547 31.1591968536377 C 18.40543556213379 31.1591968536377 18.16823959350586 31.36657333374023 18.16823959350586 31.620849609375 C 18.16823959350586 31.87512588500977 18.40543556213379 32.08250045776367 18.69628143310547 32.08250045776367 C 18.98712539672852 32.08250045776367 19.22431945800781 31.87512588500977 19.22431945800781 31.620849609375 C 19.22431945800781 31.36657333374023 18.98712539672852 31.1591968536377 18.69628143310547 31.1591968536377 Z M 18.69628143310547 33.00579833984375 C 18.40543556213379 33.00579833984375 18.16823959350586 33.21317291259766 18.16823959350586 33.46744918823242 C 18.16823959350586 33.72172546386719 18.40543556213379 33.92910003662109 18.69628143310547 33.92910003662109 C 18.98712539672852 33.92910003662109 19.22431945800781 33.72172546386719 19.22431945800781 33.46744918823242 C 19.22431945800781 33.21317291259766 18.98712539672852 33.00579833984375 18.69628143310547 33.00579833984375 Z M 18.69628143310547 34.85240173339844 C 18.40543556213379 34.85240173339844 18.16823959350586 35.05977249145508 18.16823959350586 35.31404876708984 C 18.16823959350586 35.56832504272461 18.40543556213379 35.77569961547852 18.69628143310547 35.77569961547852 C 18.98712539672852 35.77569961547852 19.22431945800781 35.56832504272461 19.22431945800781 35.31404876708984 C 19.22431945800781 35.05977249145508 18.98712539672852 34.85240173339844 18.69628143310547 34.85240173339844 Z" fill="#ffffff" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
      //         allowDrawingOutsideViewBox: true,
      //         fit: BoxFit.fill,
      //       ),
      //     ),
      //   ),
      // ],
    );
  }

  buildMethodList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Container(
              child: Text(
                '      Upload Prescription Details',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16,
                  color: HexColor('33BEA3'),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color(0xffc2c2c2),
                ),
                child: Center(
                  child: Text(
                    'Choose the file',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 16,
                      color: HexColor('33BEA3'),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: HexColor('33BEA3'),
                ),
                child: Center(
                  child: Text(
                    'Upload',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 16,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 320,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 151.0, start: 3.5),
                  Pin(size: 14.0, start: 0.0),
                  child: Text(
                    'Patient Name : Jaan Francis',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      color: const Color(0xff5b5b5b),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 32.0, start: 3.5),
                  Pin(size: 14.0, start: 23.0),
                  child: Text(
                    'Date :',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      color: const Color(0xff5b5b5b),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 63.0, end: 0.5),
                  Pin(size: 11.0, start: 25.0),
                  child: Text(
                    'DD/MM/YYYY',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: const Color(0xff5b5b5b),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 50.0, start: 3.5),
                  Pin(size: 14.0, middle: 0.2022),
                  child: Text(
                    'Balance :',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      color: const Color(0xff5b5b5b),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 45.0, start: 3.5),
                  Pin(size: 14.0, middle: 0.3033),
                  child: Text(
                    'Mobile : ',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      color: const Color(0xff5b5b5b),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 113.0, start: 3.5),
                  Pin(size: 56.0, middle: 0.7601),
                  child: Text(
                    'Benazepril (Lotensin)\nCaptopril (Capoten)\nEnalapril (Vasotec)\nFosinopril (Monopril)',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      color: const Color(0xff5b5b5b),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 13.0, middle: 0.4328),
                  Pin(size: 56.0, middle: 0.7601),
                  child: Text(
                    '30\n30\n30\n30',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      color: const Color(0xff5b5b5b),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 20.0, middle: 0.6278),
                  Pin(size: 56.0, middle: 0.7601),
                  child: Text(
                    '150\n300\n200\n400',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      color: const Color(0xff5b5b5b),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 37.0, end: 1.5),
                  Pin(size: 56.0, middle: 0.7655),
                  child: Text(
                    '  4,500\n9,000\n  6,000\n12,000',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      color: const Color(0xff5b5b5b),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 24.0, middle: 0.7848),
                  Pin(size: 56.0, middle: 0.7601),
                  child: Text(
                    '5%\n12%\n18%\n5%',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      color: const Color(0xff5b5b5b),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 23.0, end: 0.5),
                  Pin(size: 14.0, middle: 0.2022),
                  child: Text(
                    '0.00',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      color: const Color(0xff5b5b5b),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 24.0, start: 3.5),
                  Pin(size: 11.0, middle: 0.5119),
                  child: Text(
                    'ITEM',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: const Color(0xff5b5b5b),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 23.0, middle: 0.7145),
                  Pin(size: 11.0, end: 6.5),
                  child: Text(
                    'Total',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: HexColor('33BEA3'),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 21.0, middle: 0.4439),
                  Pin(size: 11.0, middle: 0.5119),
                  child: Text(
                    'QTY',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: const Color(0xff5b5b5b),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 26.0, middle: 0.6173),
                  Pin(size: 11.0, middle: 0.5119),
                  child: Text(
                    'RATE',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: const Color(0xff5b5b5b),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 19.0, middle: 0.7818),
                  Pin(size: 11.0, middle: 0.5119),
                  child: Text(
                    'TAX',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: const Color(0xff5b5b5b),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 31.0, end: 7.5),
                  Pin(size: 11.0, middle: 0.5119),
                  child: Text(
                    'TOTAL',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: const Color(0xff5b5b5b),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 31.0, end: 5.5),
                  Pin(size: 11.0, end: 5.5),
                  child: Text(
                    '31,500',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: HexColor('33BEA3'),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 90.0, end: 0.5),
                  Pin(size: 14.0, middle: 0.3033),
                  child: Text(
                    '+ 971551549870',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      color: const Color(0xff5b5b5b),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 1.0, middle: 0.4678),
                  child: SvgPicture.string(
                    '<svg viewBox="15.5 328.5 333.0 1.0" ><path transform="translate(15.5, 328.5)" d="M 0 0 L 333 0" fill="none" stroke="#707070" stroke-width="1" stroke-dasharray="3 3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 1.0, middle: 0.5468),
                  child: SvgPicture.string(
                    '<svg viewBox="15.5 347.5 333.0 1.0" ><path transform="translate(15.5, 347.5)" d="M 0 0 L 333 0" fill="none" stroke="#707070" stroke-width="1" stroke-dasharray="3 3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 1.0, end: 26.0),
                  child: SvgPicture.string(
                    '<svg viewBox="15.5 430.5 333.0 1.0" ><path transform="translate(15.5, 430.5)" d="M 0 0 L 333 0" fill="none" stroke="#707070" stroke-width="1" stroke-dasharray="3 3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 1.0, end: -1.0),
                  child: SvgPicture.string(
                    '<svg viewBox="15.5 457.5 333.0 1.0" ><path transform="translate(15.5, 457.5)" d="M 0 0 L 333 0" fill="none" stroke="#707070" stroke-width="1" stroke-dasharray="3 3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }

  payOrCancelButtons() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return payment();
            }));
          },
          child: Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              height: 40.0,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: HexColor('33BEA3'),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Center(
                  child: Text(
                    "Pay",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        //height: 1.6,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
