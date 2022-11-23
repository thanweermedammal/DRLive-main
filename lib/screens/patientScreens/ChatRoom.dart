// @dart=2.9
import 'dart:convert';
import 'dart:io';
import 'package:active_ecommerce_flutter/data_handler/notification_handler.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:active_ecommerce_flutter/models/chats.dart';
import 'package:active_ecommerce_flutter/models/notification.dart';
import 'package:active_ecommerce_flutter/models/chats.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:active_ecommerce_flutter/app_config.dart';
import 'dart:convert';

import '../../my_theme.dart';

class ChatPage extends StatefulWidget {
  ChatPage(this.id, this.doctorName);

  final String id;
  final String doctorName;

  @override
  ChatRoom createState() => ChatRoom();
}

class ChatRoom extends State<ChatPage> {
  String chatRoomId;
  bool _isPlaying = false;
  bool _isUploading = false;
  bool _isRecorded = false;
  bool _isRecording = false;
  String _filePath;
  int _totalDuration;
  int _totalDurationSec = 0;
  int _currentDuration;
  double _completedPercentage = 0.0;
  bool isPlaying;
  int selectedIndex;
  int index = 0;
  String text = "hi";
  bool isCurrentUser = true;
  final TextEditingController _message = TextEditingController();
  Future<Chats> fetchAll;
  File imageFile;
  String profilePic;

  roomId() async {
    final prefs = await SharedPreferences.getInstance();
    String chatId = prefs.getString("roomId");

    setState(() {
      //profilePic=FarmerDetails.profilePic;
      chatRoomId = chatId;
    });
  }

  Future<void> _onFileUploadButtonPressed() async {
    //FirebaseStorage firebaseStorage = FirebaseStorage.instance;

    // String fileName = Uuid().v1();
    // int status = 1;
    //
    // setState(() {
    //   _isUploading = true;
    // });
    //
    // await _firestore
    //     .collection('chatroom')
    //     .doc(chatRoomId)
    //     .collection('chats')
    //     .doc(fileName)
    //     .set({
    //   "messageId" : fileName,
    //   "seen" : false,
    //   "sendby": _auth.currentUser.displayName,
    //   "message": "",
    //   "type": "audio",
    //   "time": FieldValue.serverTimestamp(),
    // });
    //
    // var ref = FirebaseStorage.instance.ref().child('audios').child(
    //     _filePath.substring(_filePath.lastIndexOf('/'), _filePath.length));
    //
    // var uploadTask =
    //     await ref.putFile(File(_filePath)).catchError((error) async {
    //   await _firestore
    //       .collection('chatroom')
    //       .doc(chatRoomId)
    //       .collection('chats')
    //       .doc(fileName)
    //       .delete();
    //
    //   print('Error occured while uplaoding to Firebase ${error.toString()}');
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('Error occured while uplaoding'),
    //     ),
    //   );
    //
    //   status = 0;
    // });
    //
    // if (status == 1) {
    //   String audUrl = await uploadTask.ref.getDownloadURL();
    //
    //   await _firestore
    //       .collection('chatroom')
    //       .doc(chatRoomId)
    //       .collection('chats')
    //       .doc(fileName)
    //       .update({"message": audUrl});
    //
    //   // print(audUrl);
    //   setState(() {
    //     _isUploading = false;
    //   });
    // }
  }

  UpdateReadStatus(Map<String, dynamic> data) async {
    // if(data["sendby"] !=  _auth.currentUser.displayName){
    //   await _firestore
    //       .collection('chatroom')
    //       .doc(chatRoomId)
    //       .collection('chats')
    //       .doc(data["messageId"])
    //       .update({"seen": true});
    // }
  }

  String formatedTime(int secTime) {
    String getParsedTime(String time) {
      if (time.length <= 1) return "0$time";
      return time;
    }

    int min = secTime ~/ 60;
    int sec = secTime % 60;

    String parsedTime =
        getParsedTime(min.toString()) + " : " + getParsedTime(sec.toString());

    return parsedTime;
  }

  Future<void> _onPageRefresh() async {
    setState(() {
      fetchAll =
          NotificationHandler().allChats(user_id.$.toString(), widget.id);
    });
  }

  void onSendMessage() async {
    String token = access_token.$;
    Map data = {
      'from_id': user_id.$,
      'to_id': widget.id,
      'message': _message.text
    };
    //encode Map to JSON
    var body = json.encode(data);
    final response = await http.post(
        Uri.parse('${AppConfig.BASE_URL}chat/send'),
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      //return chatsFromJson(response.body);
      print("done");
      setState(() {
        fetchAll =
            NotificationHandler().allChats(user_id.$.toString(), widget.id);
        _message.text = "";
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.body);
      throw Exception('Failed to load album');
    }

    // String messageId = Uuid().v1();
    // if (_message.text.isNotEmpty) {
    //   Map<String, dynamic> messages = {
    //     "messageId" : messageId,
    //     "seen" : false,
    //     "sendby": _auth.currentUser.displayName,
    //     "message": _message.text,
    //     "type": "text",
    //     "time": FieldValue.serverTimestamp(),
    //   };
    //   _message.clear();
    //   await _firestore
    //       .collection('chatroom')
    //       .doc(chatRoomId)
    //       .collection('chats').doc(messageId).set(messages);
    //
    // } else {
    //   print("Enter Some Text");
    // }
  }

  @override
  void initState() {
    roomId();
    super.initState();
    fetchAll = NotificationHandler().allChats(user_id.$.toString(), widget.id);
    _isUploading = false;
    _isRecorded = false;
    _isRecording = false;
    isPlaying = false;
    selectedIndex = -1;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xff1c0950),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.doctorName.toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              'assets/doctor.png',
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
              //color: MyTheme.dark_grey,
            ),
          ),
          RefreshIndicator(
            color: MyTheme.accent_color,
            backgroundColor: Colors.white,
            onRefresh: _onPageRefresh,
            displacement: 10,
            child: ListView(
              padding: EdgeInsets.only(left: 0, right: 0, bottom: 20),
              children: [
                StreamBuilder<Chats>(
                  // StreamBuilder
                  stream: fetchAll.asStream(), // snapshots
                  builder:
                      (BuildContext context, AsyncSnapshot<Chats> snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data;
                      data.chats
                          .sort((a, b) => a.createdAt.compareTo(b.createdAt));
                      return ListView.builder(
                          itemCount: snapshot.data.chats.length,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          reverse: false,
                          itemBuilder: (context, index) {
                            return Padding(
                              // asymmetric padding
                              padding: EdgeInsets.fromLTRB(
                                data.chats[index].from.id == user_id.$
                                    ? 64.0
                                    : 16.0,
                                4,
                                data.chats[index].from.id == user_id.$
                                    ? 16.0
                                    : 64.0,
                                4,
                              ),
                              child: Align(
                                // align the child within the container
                                alignment:
                                    data.chats[index].from.id == user_id.$
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                child: DecoratedBox(
                                  // chat bubble decoration
                                  decoration: BoxDecoration(
                                    color:
                                        data.chats[index].from.id == user_id.$
                                            ? Colors.blue
                                            : Colors.grey[300],
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      children: [
                                        Text(
                                          data.chats[index].body,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .copyWith(
                                                  color: data.chats[index].from
                                                              .id ==
                                                          user_id.$
                                                      ? Colors.white
                                                      : Colors.black87),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    } else {
                      return Container(
                          child: Center(child: CircularProgressIndicator()));
                    }
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              //color: Colors.white,
              height: 65,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: size.width * 0.74,
                    child: TextField(
                      controller: _message,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 15),
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          hintText: 'Type a message'),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString("roomId", chatRoomId);
                      prefs.setString("Uploadtype", "Home");

                      // showDialog(
                      //     context: context,
                      //     builder: (_) => SentPhotoClass());
                    },
                    child: Container(
                      width: 30,
                      height: 25,
                      decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(50.0),
                          //color: Colors.blueGrey
                          ),
                      child: Icon(
                        Icons.drive_folder_upload,
                        size: 27,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: onSendMessage,
                    child: Container(
                      width: 30,
                      height: 25,
                      decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(50.0),
                          ),
                      child: Icon(
                        Icons.send,
                        size: 27,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShowImage extends StatelessWidget {
  final String imageUrl;

  const ShowImage({this.imageUrl, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.black,
        child: Image.network(imageUrl),
      ),
    );
  }
}

//
