import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/ui_sections/main_drawer.dart';
import 'package:active_ecommerce_flutter/screens/doctorScreens/patient_history_profile.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

class DoctorLeaveApply extends StatefulWidget {
  DoctorLeaveApply(
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
  DoctorLeaveApplyState createState() => DoctorLeaveApplyState();
}

class DoctorLeaveApplyState extends State<DoctorLeaveApply> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<String> _leaves = ['Sick', 'Casual', 'Normal']; // Option 2
  String _selectedLeaveType = "Sick";
  List<String> _cause = ['Trip', 'Marrige', 'Normal']; // Option 2
  String _selectedCause = "Trip";
  DateTime _fromDate = DateTime(2022, 1, 3);
  DateTime _toDate = DateTime(2022, 1, 3);
  bool _isFrom = false;
  bool _isTo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: MainDrawer(),
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: Stack(children: [
          CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                buildMethodList(),
              ]))
            ],
          ),
          Positioned(
            bottom: 40,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                onTap: () {

                },
                child: Center(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/greenbutton.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Apply for leave\n",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ]));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 90,
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
              child: Row(
                children: [
                  Text(
                    "New Leave",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      elevation: 0.0,
      titleSpacing: 0,
    );
  }

  buildMethodList() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: Column(
        children: [
          Divider(),
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                child: Center(
                  child: Container(
                      height: 60,
                      width: 60,
                      child: Image.asset(
                        "assets/leavetype.png",
                        fit: BoxFit.cover,
                        //    color: Colors.white
                      )),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Type",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: DropdownButton(
                      isExpanded: true,
                      // hint: Text('Please choose a location'),
                      // Not necessary for Option 1
                      value: _selectedLeaveType,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedLeaveType = newValue;
                        });
                      },
                      items: _leaves.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                child: Center(
                  child: Container(
                      height: 60,
                      width: 60,
                      child: Image.asset(
                        "assets/leavecause.png",
                        fit: BoxFit.cover,
                        //    color: Colors.white
                      )),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Cause",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: DropdownButton(
                      isExpanded: true,
                      // hint: Text('Please choose a location'),
                      // Not necessary for Option 1
                      value: _selectedCause,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCause = newValue;
                        });
                      },
                      items: _cause.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              setState(() {
                _isFrom = !_isFrom;
              });
            },
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  child: Center(
                    child: Container(
                        height: 60,
                        width: 60,
                        child: Image.asset(
                          "assets/leaveto.png",
                          fit: BoxFit.cover,
                          //    color: Colors.white
                        )),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "From",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Text(
                      _fromDate.day.toString() +
                          "/" +
                          _fromDate.month.toString() +
                          "/" +
                          _fromDate.year.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),

          ///calender widget
          ///
          _isFrom ? calender() : Container(),

          Divider(),
          GestureDetector(
            onTap: (){
              setState(() {
                _isTo=!_isTo;
              });
            },
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  child: Center(
                    child: Container(
                        height: 60,
                        width: 60,
                        child: Image.asset(
                          "assets/leaveto.png",
                          fit: BoxFit.cover,
                          //    color: Colors.white
                        )),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "To",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Text(
                      _toDate.day.toString() +
                          "/" +
                          _toDate.month.toString() +
                          "/" +
                          _toDate.year.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _isTo ? calender2() : Container(),

          SizedBox(height: 100,)


        ],
      ),
    );
  }

  Widget calender() {
    return Card(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0),
        padding: EdgeInsets.all(10),
        child: CalendarCarousel<Event>(
          todayBorderColor: Colors.transparent,
          onDayPressed: (DateTime date, List<Event> events) {
            this.setState(() => _fromDate = date);
            setState(() {
              _isFrom = false;
            });
          },
          daysTextStyle: TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
          weekendTextStyle: TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
          dayPadding: 0,
          weekDayPadding: EdgeInsets.all(0),
          headerTextStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          showHeaderButton: false,
          weekdayTextStyle: TextStyle(
            color: Colors.black,
          ),
          todayButtonColor: Colors.white,
          weekFormat: false,
          // markedDatesMap: _markedDateMap,
          height: 350.0,
          daysHaveCircularBorder: false,
          showOnlyCurrentMonthDate: false,
          customGridViewPhysics: NeverScrollableScrollPhysics(),
          markedDateCustomShapeBorder:
              CircleBorder(side: BorderSide(color: Colors.yellow)),
          markedDateCustomTextStyle: TextStyle(
            fontSize: 16,
            color: Colors.blue,
          ),
          showHeader: true,
          todayTextStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          selectedDateTime:
              DateTime.now(), // null for not rendering any border, true for circular border, false for rectangular border
        ),
      ),
    );
  }

  Widget calender2() {
    return Card(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0),
        padding: EdgeInsets.all(10),
        child: CalendarCarousel<Event>(
          todayBorderColor: Colors.transparent,
          onDayPressed: (DateTime date, List<Event> events) {
            this.setState(() => _toDate = date);
            setState(() {
              _isTo = false;
            });
          },
          daysTextStyle: TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
          weekendTextStyle: TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
          headerTextStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          showHeaderButton: false,
          weekdayTextStyle: TextStyle(
            color: Colors.black,
          ),
          todayButtonColor: Colors.white,
          weekFormat: false,
          // markedDatesMap: _markedDateMap,
          height: 350.0,
          daysHaveCircularBorder: false,
          showOnlyCurrentMonthDate: false,
          customGridViewPhysics: NeverScrollableScrollPhysics(),
          markedDateCustomShapeBorder:
          CircleBorder(side: BorderSide(color: Colors.yellow)),
          markedDateCustomTextStyle: TextStyle(
            fontSize: 16,
            color: Colors.blue,
          ),
          showHeader: true,
          todayTextStyle:
          TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          selectedDateTime:
          DateTime.now(), // null for not rendering any border, true for circular border, false for rectangular border
        ),
      ),
    );
  }
}
