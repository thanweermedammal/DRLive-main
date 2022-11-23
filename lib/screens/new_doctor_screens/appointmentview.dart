import 'package:active_ecommerce_flutter/app_config.dart';
import 'package:active_ecommerce_flutter/data_handler/fetch_history.dart';
import 'package:active_ecommerce_flutter/screens/new_doctor_screens/imageScreen.dart';
import 'package:active_ecommerce_flutter/screens/new_doctor_screens/patientdocs.dart';
import 'package:active_ecommerce_flutter/screens/new_doctor_screens/pdfviewr.dart';
import 'package:active_ecommerce_flutter/screens/patientScreens/ChatRoom.dart';
import 'package:active_ecommerce_flutter/screens/patientScreens/meeting1_scree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flexible_toast/flutter_flexible_toast.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:url_launcher/url_launcher.dart';

class AppointmentView extends StatefulWidget {
  var snapshot;
  int index;

  AppointmentView({Key key, @required this.snapshot, @required this.index})
      : super(key: key);

  @override
  State<AppointmentView> createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView> {
  Future<PatientDocuments> fetchdocs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdocs = History().patientDocument(
        widget.snapshot.data.appointments[widget.index].id.toString());
    // widget.snapshot.data.appointments[widget.index].id.toString()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60.0,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        image: AssetImage('assets/placeholder.png'),
                        fit: BoxFit.cover,
                      ),
                      //shape: BoxShape.circle,
                    ),
                    child: widget.snapshot.data.appointments[widget.index]
                                .patient.image !=
                            null
                        ? Image.network('${AppConfig.IMAGE_URL}' +
                            widget.snapshot.data.appointments[widget.index]
                                .patient.image)
                        : Container(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tokon Number',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "TKNO#${widget.snapshot.data.appointments[widget.index].tokenNo.toString()}",
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Patient Name',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget
                    .snapshot.data.appointments[widget.index].patient.firstName
                    .toUpperCase(),
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 14,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Date',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Time',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "${widget.snapshot.data.appointments[widget.index].date.day.toString()}-${widget.snapshot.data.appointments[widget.index].date.month.toString()}-${widget.snapshot.data.appointments[widget.index].date.year.toString()}",
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14,
                        color: const Color(0xff000000),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.snapshot.data.time[widget.index].toString(),
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14,
                        color: const Color(0xff000000),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Age',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      (DateTime.now().year -
                              widget.snapshot.data.appointments[widget.index]
                                  .patient.dob.year)
                          .toString(),
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 15,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Blood Group',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.snapshot.data.appointments[widget.index].patient
                          .bloodGroup
                          .toString(),
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Contact Info',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.snapshot.data.appointments[widget.index].patient
                          .phone
                          .toString(),
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Paid Details',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.snapshot.data.appointments[widget.index]
                          .paymentStatus,
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'First Consultation',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.snapshot.data.appointments[widget.index].status ==
                              "new"
                          ? "Yes"
                          : "No",
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Mode of Consultation',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Expanded(
                      child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: widget.snapshot.data
                                        .appointments[widget.index].method !=
                                    "video"
                                ? HexColor('33BEA3')
                                : Colors.grey),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.phone_enabled_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: widget.snapshot.data
                                        .appointments[widget.index].method ==
                                    "video"
                                ? HexColor('33BEA3')
                                : Colors.grey),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.video_call_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text("Uploads"),
              Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2)),
                  child: FutureBuilder<PatientDocuments>(
                      future: fetchdocs,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) => Column(
                                    children: [
                                      snapshot.data.documents.first.document
                                                  .substring(snapshot
                                                          .data
                                                          .documents
                                                          .first
                                                          .document
                                                          .lastIndexOf(".") +
                                                      1) ==
                                              "pdf"
                                          ? InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            PdfViewer(
                                                              url: snapshot
                                                                  .data.path,
                                                              img: snapshot
                                                                  .data
                                                                  .documents
                                                                  .first
                                                                  .document,
                                                            )));
                                              },
                                              child: Icon(
                                                Icons.picture_as_pdf,
                                                size: 60,
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () {
                                                print(snapshot.data.path);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ImageScreen(
                                                              url: snapshot
                                                                  .data.path,
                                                              img: snapshot
                                                                  .data
                                                                  .documents
                                                                  .first
                                                                  .document,
                                                            )));
                                              },
                                              child: Icon(
                                                Icons.image,
                                                size: 60,
                                              ),
                                            ),
                                      Text(snapshot.data.documents[index].name)
                                    ],
                                  ));
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      final phoneNumber = widget.snapshot.data
                          .appointments[widget.index].patient.phone;
                      widget.snapshot.data.appointments[widget.index]
                                  .paymentStatus ==
                              "paid"
                          ? widget.snapshot.data.appointments[widget.index]
                                      .method ==
                                  "call"
                              ? launchUrl(Uri.parse("tel: $phoneNumber"))
                              : widget.snapshot.data.appointments[widget.index]
                                          .method ==
                                      "video"
                                  ? Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                      return VideoCall1();
                                    }))
                                  : launchUrl(Uri.parse("tel: $phoneNumber"))
                          : FlutterFlexibleToast.showToast(
                              message: 'Not paid',
                              toastLength: Toast.LENGTH_LONG,
                              toastGravity: ToastGravity.BOTTOM,
                              icon: ICON.ERROR,
                              radius: 15,
                              elevation: 5,
                              imageSize: 20,
                              textColor: Colors.white,
                              backgroundColor: HexColor('33BEA3'),
                              timeInSeconds: 3);
                      ;
                    },
                    child: Container(
                      height: 39,
                      width: 112,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: HexColor('33BEA3')),
                      child: Center(
                        child: Text(
                          "Connect",
                          style: TextStyle(color: Colors.white),
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
    );
  }
}
