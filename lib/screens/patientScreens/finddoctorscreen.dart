import 'package:active_ecommerce_flutter/data_handler/notification_handler.dart';
import 'package:active_ecommerce_flutter/screens/patientScreens/docsearchmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class FindDoctorScreen extends StatefulWidget {
  const FindDoctorScreen({Key key}) : super(key: key);

  @override
  State<FindDoctorScreen> createState() => _FindDoctorScreenState();
}

class _FindDoctorScreenState extends State<FindDoctorScreen> {
  TextEditingController searchController = TextEditingController();
  Future<DoctorSearch> fechdata;
  @override
  void initState() {
    // TODO: implement initState
    fechdata = NotificationHandler().docSearch(searchController.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      // validator: phoneValidator,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.green,
                      controller: searchController,
                      onChanged: (text) {
                        // mobileNumber = value;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        focusColor: Colors.greenAccent,
                        // labelStyle: ktext14,
                        labelText: "Doctor Name",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              color: Colors.black,
                            )),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 40,
                      width: 120,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ElevatedButton(
                          onPressed: () async {
                            fechdata = NotificationHandler()
                                .docSearch(searchController.toString());
                          },
                          style: ElevatedButton.styleFrom(
                            primary: HexColor('33BEA3'),
                          ),
                          child: Text(
                            "Search",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffffffff),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder<DoctorSearch>(
                future: fechdata,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.doctors.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => AddConsignment(
                            //           loginList: widget.loginList,
                            //           customerDetailList: customerDetailList,
                            //           index: index,
                            //         )));
                          },
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              child: Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(1, 1),
                                        blurRadius: 3,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                                "${snapshot.data.doctors[index].firstName.toUpperCase()} ${snapshot.data.doctors[index].lastName.toUpperCase()}")),
                                        Expanded(
                                            child: Text(
                                                'category :  ${snapshot.data.doctors[index].designation}')),
                                      ],
                                    ),
                                  ))),
                        );
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
    );
  }
}
