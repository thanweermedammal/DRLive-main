import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/ui_sections/main_drawer.dart';
import 'package:shimmer/shimmer.dart';

import 'package:active_ecommerce_flutter/screens/patientScreens/consultation_history.dart';


class PatientProfile extends StatefulWidget {
  const PatientProfile({
    Key key,
  }) : super(key: key);

  @override
  PatientProfileState createState() => PatientProfileState();
}


class PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: SafeArea(
          child: Column(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  child: Container(
                    height: 150,
                    width: 150,
                    child: Center(
                      child: Container(
                          height: 150,
                          width: 150,
                          child: Image.asset("assets/patient.png",
                            fit: BoxFit.cover,
                            //    color: Colors.white
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "John Smith"
                ,style: TextStyle(
                  fontSize: 25.0,
                  color:Colors.blueGrey,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400
              ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "24, Male"
                ,style: TextStyle(
                  fontSize: 18.0,
                  color:Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300
              ),
              ),

              SizedBox(
                height: 10,
              ),
              Text(
                "Consultation Method : Chat",style: TextStyle(
                  fontSize: 15.0,
                  color:Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300
              ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
              ),

              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return ConsultationList();
                      }));
                },
                child: Container(
                  height: 150,
                  width:  MediaQuery.of(context).size.width * 0.85,
                  child: Center(
                    child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Image.asset("assets/viewprescription.png",
                          fit: BoxFit.cover,
                          //    color: Colors.white
                        )),
                  ),
                ),
              ),


            ],
          ),
        )
    );
  }



  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      leading:  Column(
        children: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.arrow_back, color: MyTheme.dark_grey),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
      elevation: 0.0,
      titleSpacing: 0,
    );
  }
}