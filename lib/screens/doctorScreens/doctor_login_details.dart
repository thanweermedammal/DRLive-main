import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:active_ecommerce_flutter/app_config.dart';
import 'package:active_ecommerce_flutter/custom/toast_component.dart';
import 'package:active_ecommerce_flutter/custom/input_decorations.dart';
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/cupertino.dart';

class DoctorLoginDetails extends StatefulWidget {
  @override
  DoctorLoginDetailsState createState() => DoctorLoginDetailsState();
}

class DoctorLoginDetailsState extends State<DoctorLoginDetails> {
  ScrollController _mainScrollController = ScrollController();

  TextEditingController _nameController =
      TextEditingController(text: "${user_name.$}");

  //for image uploading
  XFile _file;

  chooseAndUploadImage(context) async {
    var status = await Permission.photos.request();

    if (status.isDenied) {
      // We didn't ask for permission yet.
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text('Photo Permission'),
                content: Text(
                    'This app needs photo to take pictures for upload user profile photo'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('Deny'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoDialogAction(
                    child: Text('Settings'),
                    onPressed: () => openAppSettings(),
                  ),
                ],
              ));
    } else if (status.isRestricted) {
      // ToastComponent.showDialog(
      //     "Go to your application settings and give photo permission ", context,
      //     gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
    } else if (status.isGranted) {
      //file = await ImagePicker.pickImage(source: ImageSource.camera);
      _file = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (_file == null) {
        // ToastComponent.showDialog("No file is chosen", context,
        //     gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
        return;
      }

      //return;
      String base64Image = base64Encode(await _file.readAsBytes());
      String fileName = _file.path.split("/").last;

      //var profileImageUpdateResponse =
      // await ProfileRepository().getProfileImageUpdateResponse(
      //   base64Image,
      //   fileName,
      // );
      //
      // if (profileImageUpdateResponse.result == false) {
      //   ToastComponent.showDialog(profileImageUpdateResponse.message, context,
      //       gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
      //   return;
      // } else {
      //   ToastComponent.showDialog(profileImageUpdateResponse.message, context,
      //       gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
      //
      //   avatar_original.value = profileImageUpdateResponse.path;
      //   setState(() {});
      // }
    }
  }

  Future<void> _onPageRefresh() async {}

  onPressUpdate() async {
    var name = _nameController.text.toString();
    // var password = _passwordController.text.toString();
    //var password_confirm = _passwordConfirmController.text.toString();

    // var change_password = password != "" ||
    //     password_confirm !=
    //         ""; // if both fields are empty we will not change user's password
    //
    // if (name == "") {
    //   ToastComponent.showDialog("Enter your name", context,
    //       gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
    //   return;
    // }
    // if (change_password && password == "") {
    //   ToastComponent.showDialog("Enter password", context,
    //       gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
    //   return;
    // }
    // if (change_password && password_confirm == "") {
    //   ToastComponent.showDialog("Confirm your password", context,
    //       gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
    //   return;
    // }
    // if (change_password && password.length < 6) {
    //   ToastComponent.showDialog(
    //       "Password must contain atleast 6 characters", context,
    //       gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
    //   return;
    // }
    // if (change_password && password != password_confirm) {
    //   ToastComponent.showDialog("Passwords do not match", context,
    //       gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
    //   return;
    // }

    // var profileUpdateResponse =
    //     await ProfileRepository().getProfileUpdateResponse(
    //   name,
    //   change_password ? password : "",
    // );

    // if (profileUpdateResponse.result == false) {
    //   ToastComponent.showDialog(profileUpdateResponse.message, context,
    //       gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
    // } else {
    //   ToastComponent.showDialog(profileUpdateResponse.message, context,
    //       gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
    //
    //   user_name.value = name;
    //   setState(() {});
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.arrow_back, color: MyTheme.dark_grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      title: Text(
        "Login Details",
        style: TextStyle(fontSize: 22, color: Colors.black),
      ),
      elevation: 0.0,
      titleSpacing: 0,
    );
  }

  buildBody(context) {
    // if (is_logged_in.value == false) {
    //   return Container(
    //       height: 100,
    //       child: Center(
    //           child: Text(
    //             "Please log in to see the profile",
    //             style: TextStyle(color: MyTheme.font_grey),
    //           )));
    // } else {
    return RefreshIndicator(
      color: MyTheme.accent_color,
      backgroundColor: Colors.white,
      onRefresh: _onPageRefresh,
      displacement: 10,
      child: CustomScrollView(
        controller: _mainScrollController,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 150,
              ),
              buildProfileForm(context)
            ]),
          )
        ],
      ),
    );
    //}
  }

  buildProfileForm(context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      //margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      width: 60,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.only(),
                        child: Image.asset(
                          'assets/user.png',
                          fit: BoxFit.fill,
                        ),
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Text(
                          "User Name",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                      Container(
                        height: 35,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextField(
                          controller: _nameController,
                          autofocus: false,
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      //margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      width: 60,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.only(),
                        child: Image.asset(
                          'assets/search.png',
                          fit: BoxFit.fill,
                        ),
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Text(
                          "Password",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                      Container(
                        height: 35,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextField(
                          controller: _nameController,
                          autofocus: false,
                          obscureText: true,
                          // decoration: InputDecoration.collapsed(hintText: "MBBS,MCS"),
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.38,
                      height: 45,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/back.png'),
                          fit: BoxFit.fill,
                        ),
                        //shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      onPressUpdate();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.38,
                      height: 45,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/submit.png'),
                          fit: BoxFit.fill,
                        ),
                        //shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
