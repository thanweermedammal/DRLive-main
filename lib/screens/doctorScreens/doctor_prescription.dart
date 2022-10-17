import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/ui_sections/main_drawer.dart';
import 'package:active_ecommerce_flutter/custom/input_decorations.dart';
import 'package:flutter/cupertino.dart';

class DoctorPrescription extends StatefulWidget {
  @override
  DoctorPrescriptionState createState() => DoctorPrescriptionState();
}

class DoctorPrescriptionState extends State<DoctorPrescription> {
  int _radioValue1 = 0;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: Stack(children: [
          CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                buildTextFieldList(),
              ]))
            ],
          ),
        ]));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      centerTitle: false,
      leading: Column(
        children: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.arrow_back, color: MyTheme.dark_grey),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
      title: Container(
        height: 40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Text(
                "Consultation Form",
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      elevation: 0.0,
      titleSpacing: 0,
    );
  }

  buildTextFieldList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Divider(height: 10,),
        Row(
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Dr. John Smith",style: TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.bold),),
                    Text("Mob : 8222222222",style: TextStyle(fontSize: 15,color: Colors.grey),),
                    Text("johnsmith222@gmail.com",style: TextStyle(fontSize: 15,color: Colors.grey),),
                  ],
                ),
              ),
            )
          ],
        ),
        Divider(height: 0,),
        SizedBox(height: 25,),

        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    height: 40,
                    child: Row(
                      children: [
                        Text(
                            "Name  ",
                            style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold)
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: TextField(
                            //controller: _nameController,
                            autofocus: false,
                            decoration: InputDecorations.buildInputDecoration_1(
                                hint_text: ""),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    height: 40,
                    child: Row(
                      children: [
                        Text(
                            "Age       ",
                            style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold)
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: TextField(
                            //controller: _nameController,
                            autofocus: false,
                            decoration: InputDecorations.buildInputDecoration_1(
                                hint_text: ""),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                          "Gender   ",
                          style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold)
                      ),
                      Radio(
                        activeColor: Colors.cyan,
                        value: 0,
                        groupValue: _radioValue1,
                        onChanged: _handleRadioValueChange1,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _radioValue1 = 0;
                          });
                        },
                        child: Text(
                          "Male",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              //height: 1.6,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      Radio(
                        activeColor: Colors.cyan,
                        value: 1,
                        groupValue: _radioValue1,
                        onChanged: _handleRadioValueChange1,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _radioValue1 = 1;
                          });
                        },
                        child: Text(
                          "Female",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              //height: 1.6,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      Radio(
                        activeColor: Colors.cyan,
                        value: 2,
                        groupValue: _radioValue1,
                        onChanged: _handleRadioValueChange1,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _radioValue1 = 2;
                          });
                        },
                        child: Text(
                          "Other",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              //height: 1.6,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height:MediaQuery.of(context).size.width * 0.45 ,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 20,
                      //controller: _nameController,
                      autofocus: false,
                      decoration: InputDecorations.buildInputDecoration_1(
                          hint_text: "More details..."),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),




        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        Container(
          height: 45.0,
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
            //color: Colors.cyan[800],
            image: DecorationImage(
              image: AssetImage(
                'assets/saveandsent.png',
              ),
              fit: BoxFit.fill,
              //colorFilter: ColorFilter.mode(Colors.cyan, BlendMode.overlay)
            ),
            //shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
