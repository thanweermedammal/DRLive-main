// import 'package:active_ecommerce_flutter/my_theme.dart';
// import 'package:active_ecommerce_flutter/screens/patientScreens/storypage.dart';
// import 'package:active_ecommerce_flutter/screens/doctorScreens/doctor_notification.dart';
// import 'package:active_ecommerce_flutter/app_config.dart';
// import 'package:active_ecommerce_flutter/screens/patientScreens/medicine_data.dart';
// import 'package:active_ecommerce_flutter/screens/doctorScreens/doctor_profile.dart';
// import 'package:active_ecommerce_flutter/ui_sections/doctor_drawer.dart';
// import 'package:flutter/material.dart';
// import 'package:active_ecommerce_flutter/screens/doctorScreens/doctor_todays_patients.dart';
// import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
//
// class DoctorHome extends StatefulWidget {
//   DoctorHome({Key key, this.title, this.show_back_button = false}) : super(key: key);
//
//   final String title;
//   bool show_back_button;
//
//   @override
//   _DoctorHome createState() => _DoctorHome();
// }
//
// class _DoctorHome extends State<DoctorHome> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   int _current_slider = 0;
//   ScrollController _featuredProductScrollController;
//
//   @override
//   Widget build(BuildContext context) {
//     final double statusBarHeight = MediaQuery.of(context).padding.top;
//     //print(MediaQuery.of(context).viewPadding.top);
//
//     return Scaffold(
//         key: _scaffoldKey,
//         backgroundColor: Colors.white,
//         appBar: buildAppBar(statusBarHeight, context),
//         drawer:DoctorDrawer(),
//         body: Stack(
//           children: [
//             CustomScrollView(
//               physics: AlwaysScrollableScrollPhysics(),
//               slivers: <Widget>[
//                 SliverList(
//                   delegate: SliverChildListDelegate([
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(
//                         8.0,
//                         16.0,
//                         8.0,
//                         0.0,
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(5.0),
//                             child: Text(
//                               " Hello Welcome Back,",
//                               style: TextStyle(
//                                   fontSize: 26, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(5.0),
//                             child: Text(
//                               " Dr. Helen",
//                               style: TextStyle(
//                                   fontSize: 22, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ]),
//                 ),
//                 SliverList(
//                   delegate: SliverChildListDelegate([
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(
//                         8.0,
//                         16.0,
//                         8.0,
//                         0.0,
//                       ),
//                       child: buildHomeMedicineRow(context),
//                     ),
//                   ]),
//                 ),
//                 SliverList(
//                   delegate: SliverChildListDelegate([
//                     Padding(
//                       padding: EdgeInsets.all(15.0),
//                       child: Container(
//                         height: 180,
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                           image: DecorationImage(
//                             image: AssetImage('assets/homecontainerbackground.png'),
//                             fit: BoxFit.fill,
//                             colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.overlay),
//                           ),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(15.0),
//                               child: Text(
//                                 " Lorem Ipsum",
//                                 style: TextStyle(
//                                     fontSize: 22, color: Colors.white,fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 Padding(
//                                     padding:
//                                     const EdgeInsets.only(top: 0.0, left: 30),
//                                     child:Center(
//                                       child: Container(
//                                         width: 200,
//                                         child: Text(
//                                           "it is a long established fact that a reader will be distracted by the readable content ",
//                                           style: TextStyle(
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.bold,color: Colors.white),
//                                         ),
//                                       ),
//                                     )
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ]),
//                 ),
//                 SliverList(
//                   delegate: SliverChildListDelegate([
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(
//                         16.0,
//                         16.0,
//                         8.0,
//                         0.0,
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 "Todays Patients",
//                                 style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
//                               ),
//                               Spacer(),
//                               GestureDetector(
//                                 onTap: (){
//                                   Navigator.push(context,
//                                       MaterialPageRoute(builder: (context) {
//                                         return TodaysPatients();
//                                       }));
//                                 },
//                                 child: Text(
//                                   "See all",
//                                   style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Container(
//                               height: 180,
//                               width: MediaQuery.of(context).size.width,
//                               //color: Colors.pink,
//                               child:buildDoctorOnlineRow()
//                           ),
//                         ],
//
//                       ),
//                     ),
//                   ]),
//                 ),
//               ],
//             ),
//
//             Positioned(
//               bottom: 0,
//               child: Container(
//                 height: 80.0,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage('assets/greenbar.png'),
//                     fit: BoxFit.cover,
//                   ),
//                   //shape: BoxShape.circle,
//                 ),
//                 child:  Center(
//                   child: Column(
//                     children: [
//                       SizedBox(height: 3,),
//                       Container(
//                         height: 50.0,
//                         width: 50,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage('assets/greenround.png'),
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         child: Center(
//                           child: Container(
//                             height: 28.0,
//                             width: 28,
//                             margin: EdgeInsets.only(bottom: 5,right: 5),
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: AssetImage('assets/live.png'),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Text("Live",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ));
//   }
//
//
//
//   buildAddStory() {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(0),
//           child: Stack(
//             children: [
//               Container(
//                 width: 60,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(100),
//                   border: Border.all(
//                       color: Color.fromRGBO(112, 112, 112, .3), width: 1),
//                 ),
//                 child: ClipRRect(
//                     clipBehavior: Clip.hardEdge,
//                     borderRadius: BorderRadius.all(Radius.circular(100.0)),
//                     child: FadeInImage.assetNetwork(
//                       placeholder: 'assets/placeholder.png',
//                       image: AppConfig.BASE_PATH + "${avatar_original.value}",
//                       fit: BoxFit.cover,
//                     )),
//               ),
//               Positioned(
//                 right: 5,
//                 bottom: 5,
//                 child: SizedBox(
//                   width: 18,
//                   height: 18,
//                   child: FlatButton(
//                     padding: EdgeInsets.all(0),
//                     child: Icon(
//                       Icons.edit,
//                       color: MyTheme.font_grey,
//                       size: 10,
//                     ),
//                     shape: CircleBorder(
//                       side:
//                       new BorderSide(color: MyTheme.light_grey, width: 0.5),
//                     ),
//                     color: MyTheme.light_grey,
//                     onPressed: () {
//                       //chooseAndUploadImage(context);
//                     },
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 8.0),
//           child: Text(
//             "${user_name.value.toUpperCase()}",
//             style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.cyan[500],
//                 fontWeight: FontWeight.w600),
//           ),
//         ),
//       ],
//     );
//   }
//
//   ListView buildDoctorOnlineRow() {
//     return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: 3,
//       //padding: EdgeInsets.all(8),
//        physics: NeverScrollableScrollPhysics(),
//       shrinkWrap: false,
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: (){
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) {
//                   return TodaysPatients();
//                 }));
//           },
//           child: Card(
//             child: Container(
//               decoration: BoxDecoration(
//                 //color: Colors.cyan[800],
//                 //border: Border.all(color: Colors.cyan[800], width: 0.5),
//               ),
//               margin: EdgeInsets.all(5),
//               padding:EdgeInsets.all(5) ,
//               height: 150,
//               width: MediaQuery.of(context).size.width * 0.275,
//               //color: Colors.pink,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     height: 80.0,
//                     width: 80,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(50)),
//                       image: DecorationImage(
//                         image: AssetImage('assets/patient.png'),
//                         fit: BoxFit.cover,
//                       ),
//                       //shape: BoxShape.circle,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         child: Text(
//                           "John Smith",
//                           textAlign: TextAlign.left,
//                           // overflow: TextOverflow.ellipsis,
//                           // maxLines: 1,
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 16,
//                               //height: 1.6,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         child: Text(
//                           "Video Call",
//                           textAlign: TextAlign.left,
//                           // overflow: TextOverflow.ellipsis,
//                           // maxLines: 1,
//                           style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 13,
//                               //height: 1.6,
//                               fontWeight: FontWeight.normal),
//                         ),
//                       ),
//                       Spacer(),
//                       Container(
//                         child: Text(
//                           "Token : "+index.toString(),
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 13,
//                               //height: 1.6,
//                               fontWeight: FontWeight.normal),
//                         ),
//                       ),
//                     ],
//                   ),
//
//
//                 ],
//               ),
//
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//
//   ///Newly Added row................
//   ///
//
//   buildHomeMedicineRow(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         buildAddStory(),
//         GestureDetector(
//           onTap: () {
//             Navigator.of(context)
//                 .push(MaterialPageRoute(builder: (context) => MoreStories()));
//             // Navigator.push(context, MaterialPageRoute(builder: (context) {
//             //   return CategoryList(
//             //     is_top_category: true,
//             //   );
//             // }));
//           },
//           child: Container(
//             height: 80,
//             width: MediaQuery.of(context).size.width / 5 - 4,
//             child: Column(
//               children: [
//                 Container(
//                   height: 57,
//                   width: 57,
//                   decoration: BoxDecoration(
//                     color: Colors.cyan[700],
//                     shape: BoxShape.rectangle,
//                     borderRadius: BorderRadius.all(Radius.circular(50.0)),
//                   ),
//                   child: Image.asset(
//                     "assets/medicine.png",
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//
//           },
//           child: Container(
//             height: 80,
//             width: MediaQuery.of(context).size.width / 5 - 4,
//             child: Column(
//               children: [
//                 Container(
//                   height: 57,
//                   width: 57,
//                   decoration: BoxDecoration(
//                     color: Colors.cyan[700],
//                     shape: BoxShape.rectangle,
//                     borderRadius: BorderRadius.all(Radius.circular(50.0)),
//                   ),
//                   child: Image.asset(
//                     "assets/medicine.png",
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//
//
//           },
//           child: Container(
//             height: 80,
//             width: MediaQuery.of(context).size.width / 5 - 4,
//             child: Column(
//               children: [
//                 Container(
//                   height: 57,
//                   width: 57,
//                   decoration: BoxDecoration(
//                     color: Colors.cyan[700],
//                     shape: BoxShape.rectangle,
//                     borderRadius: BorderRadius.all(Radius.circular(50.0)),
//                   ),
//                   child: Image.asset(
//                     "assets/medicine.png",
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             // Navigator.push(context, MaterialPageRoute(builder: (context) {
//             //   return TodaysDealProducts();
//             // }));
//           },
//           child: Container(
//             height: 80,
//             width: MediaQuery.of(context).size.width / 5 - 4,
//             child: Column(
//               children: [
//                 Container(
//                   height: 57,
//                   width: 57,
//                   decoration: BoxDecoration(
//                     color: Colors.cyan[700],
//                     shape: BoxShape.rectangle,
//                     borderRadius: BorderRadius.all(Radius.circular(50.0)),
//                   ),
//                   child: Image.asset(
//                     "assets/medicine.png",
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//
//   AppBar buildAppBar(double statusBarHeight, BuildContext context) {
//     return AppBar(
//       centerTitle: false,
//       actions: [
//         InkWell(
//           onTap: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) {
//               return DoctorNotification(
//               );
//             }));
//           },
//           child: Visibility(
//             visible: true,
//             child: Center(
//               child:Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Container(
//                   height: 38.0,
//                   width: 38.0,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     border: Border.all(color: Colors.cyan[800], width: 0.5),
//                     color: Colors.white,
//                   ),
//                   child: Center(
//                     child: Container(
//                       height: 20.0,
//                       width: 20.0,
//                       child: Center(
//                             child: Image.asset(
//                               'assets/bell.png',
//                               height: 25,
//                               width: 25,
//                               color: Colors.green[700],
//                             ),
//                           ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 10,
//         ),
//         GestureDetector(
//           onTap: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context) {
//               return DoctorProfile();
//             }));
//           },
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
//             child: ClipRRect(
//               borderRadius: BorderRadius.all(Radius.circular(50)),
//               child: Container(
//                 height: 50,
//                 width: 50,
//                 child: Image.asset(
//                   'assets/placeholder.png',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 10,
//         ),
//       ],
//       leading: Container(
//         //width: 120,
//         child: GestureDetector(
//           onTap: () {
//             _scaffoldKey.currentState.openDrawer();
//           },
//           child: widget.show_back_button
//               ? Builder(
//             builder: (context) => IconButton(
//               icon: Icon(Icons.arrow_back, color: MyTheme.dark_grey),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//           )
//
//           ///change here
//               : Builder(
//             builder: (context) => Padding(
//               padding:
//               EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
//               child: Container(
//                 child: Image.asset(
//                   'assets/doctordrawer.png',
//                   height: 30,
//                   width: 30,
//                   //color: MyTheme.dark_grey,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       elevation: 0.0,
//       titleSpacing: 0,
//       toolbarHeight: 60,
//     );
//   }
//
// }
