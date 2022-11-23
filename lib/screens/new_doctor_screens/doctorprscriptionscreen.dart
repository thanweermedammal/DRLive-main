import 'package:active_ecommerce_flutter/app_config.dart';
import 'package:active_ecommerce_flutter/data_handler/fetch_todays_appiontments.dart';
import 'package:active_ecommerce_flutter/models/appointments.dart';
import 'package:active_ecommerce_flutter/screens/new_doctor_screens/appointmentview.dart';
import 'package:active_ecommerce_flutter/screens/new_doctor_screens/giveprescription.dart';
import 'package:active_ecommerce_flutter/ui_sections/doctor_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class DoctorPrescriptionScreen extends StatefulWidget {
  DoctorPrescriptionScreen({
    Key key,
    this.is_base_category,
  }) : super(key: key);

  final bool is_base_category;

  @override
  State<DoctorPrescriptionScreen> createState() =>
      _DoctorPrescriptionScreenState();
}

class _DoctorPrescriptionScreenState extends State<DoctorPrescriptionScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<Appointments> fetchAppointment;
  @override
  void initState() {
    fetchAppointment = AppointmentData().fetchAppointments("1");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: DoctorDrawer(),
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: WillPopScope(
          onWillPop: () async {
            // You can do some work here.
            // Returning true allows the pop to happen, returning false prevents it.
            return widget.is_base_category;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                FutureBuilder<Appointments>(
                  future: fetchAppointment,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.appointments.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context) {
                              //   return PatientsList();
                              // }));
                            },
                            child: Container(
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
                              margin: EdgeInsets.all(5),
                              // height: 0,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 60.0,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/placeholder.png'),
                                          fit: BoxFit.cover,
                                        ),
                                        //shape: BoxShape.circle,
                                      ),
                                      child: snapshot.data.appointments[index]
                                                  .patient.image !=
                                              null
                                          ? Image.network(
                                              '${AppConfig.IMAGE_URL}' +
                                                  snapshot
                                                      .data
                                                      .appointments[index]
                                                      .patient
                                                      .image)
                                          : Container(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      // height: 200,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Tokon Number',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            "TKNO#${snapshot.data.appointments[index].tokenNo.toString()}",
                                            style: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 14,
                                              color: const Color(0xff000000),
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Patient Name',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            snapshot.data.appointments[index]
                                                .patient.firstName
                                                .toUpperCase(),
                                            style: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 14,
                                              color: const Color(0xff000000),
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Date',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'Time',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "${snapshot.data.appointments[index].date.day.toString()}-${snapshot.data.appointments[index].date.month.toString()}-${snapshot.data.appointments[index].date.year.toString()}",
                                                  style: TextStyle(
                                                    fontFamily: 'Arial',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff000000),
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  snapshot.data.time[index]
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontFamily: 'Arial',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff000000),
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              GivePrescription(
                                                                snapshot:
                                                                    snapshot,
                                                                index: index,
                                                              )));
                                                },
                                                child: Container(
                                                  height: 25,
                                                  width: 65,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.black),
                                                  child: Center(
                                                    child: Text(
                                                      'Add',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Container(
                          height: 100,
                          child: Center(child: Text('No Appointments...')));
                    }

                    // By default, show a loading spinner.
                    return Container(
                        width: 50,
                        height: 50,
                        child: Center(child: CircularProgressIndicator()));
                  },
                ),
              ],
            ),
          ),
        ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 100,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
            ),
            color: HexColor('33BEA3')),
      ),
      leading: GestureDetector(
        onTap: () {
          _scaffoldKey.currentState.openDrawer();
        },
        child: widget.is_base_category
            ? Icon(
                Icons.menu,
                color: Colors.black,
              )
            : Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
      ),
      title: Text(
        'Prescription',
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
}
