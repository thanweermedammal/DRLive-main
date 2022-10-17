import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class VideoCall1 extends StatefulWidget {
  @override
  _VideoCall1State createState() => _VideoCall1State();
}

class _VideoCall1State extends State<VideoCall1> {
  final serverText = TextEditingController();
  final roomText = TextEditingController(text: "demoroom");
  final subjectText = TextEditingController(text: "Meeting");
  final nameText = TextEditingController(text: "Akshay");
  final emailText = TextEditingController(text: "email@email.com");
  final iosAppBarRGBAColor =
      TextEditingController(text: "#0080FF80"); //transparent blue
  bool isAudioOnly = true;
  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    super.initState();
    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin: _onConferenceWillJoin,
        onConferenceJoined: _onConferenceJoined,
        onConferenceTerminated: _onConferenceTerminated,
        onError: _onError));
  }

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // backwardsCompatibility: false,
          // systemOverlayStyle: SystemUiOverlayStyle(
          //   statusBarColor: Colors.transparent,
          //   statusBarIconBrightness: Brightness.dark,
          // ),
          toolbarHeight: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                // SvgPicture.string(
                //   SVGAssets.meetImage,
                //   width: MediaQuery.of(context).size.width,
                //   fit: BoxFit.fitWidth,
                // ),
                const Spacer(flex: 65),
                Container(
                  child: Text(
                    "Join the Meet",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 35,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
                ),
                const Spacer(flex: 65),
                Container(
                  width: 350,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xfff3f3f3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    controller: nameText,
                    maxLines: 1,
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        suffixIcon: Icon(Icons.person, color: Colors.black),
                        hintText: "Name"),
                  ),
                ),
                const Spacer(flex: 58),
                Container(
                  width: 350,
                  child: Text(
                    "Meet Guidelines -\n1) For privacy reasons you may change your name if you want.\n2) By default your audio & video are muted.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff898989),
                    ),
                  ),
                ),
                const Spacer(flex: 58),
                Row(
                  children: [
                    const Spacer(flex: 32),
                    GestureDetector(
                      onTap: () {
                        _onAudioMutedChanged(!isAudioMuted);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                            color: isAudioMuted
                                ? Color(0xffD64467)
                                : Color(0xffffffff),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.06),
                                  offset: Offset(0, 4)),
                            ]),
                        width: 72,
                        height: 72,
                        child: Icon(
                          isAudioMuted
                              ? Icons.mic_off_sharp
                              : Icons.mic_none_sharp,
                          color: isAudioMuted ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    const Spacer(flex: 16),
                    GestureDetector(
                      onTap: () {
                        _onVideoMutedChanged(!isVideoMuted);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                            color: isVideoMuted
                                ? Color(0xffD64467)
                                : Color(0xffffffff),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.06),
                                  offset: Offset(0, 4)),
                            ]),
                        width: 72,
                        height: 72,
                        child: Icon(
                          isVideoMuted
                              ? Icons.videocam_off_sharp
                              : Icons.videocam,
                          color: isVideoMuted ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    const Spacer(flex: 16),
                    GestureDetector(
                      onTap: () {
                        _joinMeeting(); // Join meet on tap
                      },
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                              color: Color(0xffAA66CC),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.06),
                                    offset: Offset(0, 4)),
                              ]),
                          width: 174,
                          height: 72,
                          child: Center(
                            child: Text(
                              "JOIN MEET",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )),
                    ),
                    const Spacer(flex: 32),
                  ],
                ),
                const Spacer(flex: 38),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget meetConfig() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 16.0,
          ),
          TextField(
            controller: serverText,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Server URL",
                hintText: "Hint: Leave empty for meet.jitsi.si"),
          ),
          SizedBox(
            height: 14.0,
          ),
          TextField(
            controller: roomText,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Room",
            ),
          ),
          SizedBox(
            height: 14.0,
          ),
          TextField(
            controller: subjectText,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Subject",
            ),
          ),
          SizedBox(
            height: 14.0,
          ),
          TextField(
            controller: nameText,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Display Name",
            ),
          ),
          SizedBox(
            height: 14.0,
          ),
          TextField(
            controller: emailText,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Email",
            ),
          ),
          SizedBox(
            height: 14.0,
          ),
          TextField(
            controller: iosAppBarRGBAColor,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "AppBar Color(IOS only)",
                hintText: "Hint: This HAS to be in HEX RGBA format"),
          ),
          SizedBox(
            height: 14.0,
          ),
          CheckboxListTile(
            title: Text("Audio Only"),
            value: isAudioOnly,
            onChanged: _onAudioOnlyChanged,
          ),
          SizedBox(
            height: 14.0,
          ),
          CheckboxListTile(
            title: Text("Audio Muted"),
            value: isAudioMuted,
            onChanged: _onAudioMutedChanged,
          ),
          SizedBox(
            height: 14.0,
          ),
          CheckboxListTile(
            title: Text("Video Muted"),
            value: isVideoMuted,
            onChanged: _onVideoMutedChanged,
          ),
          Divider(
            height: 48.0,
            thickness: 2.0,
          ),
          SizedBox(
            height: 64.0,
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () {
                _joinMeeting();
              },
              child: Text(
                "Join Meeting",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.blue)),
            ),
          ),
          SizedBox(
            height: 48.0,
          ),
        ],
      ),
    );
  }

  _onAudioOnlyChanged(bool value) {
    setState(() {
      isAudioOnly = value;
    });
  }

  _onAudioMutedChanged(bool value) {
    setState(() {
      isAudioMuted = value;
    });
  }

  _onVideoMutedChanged(bool value) {
    setState(() {
      isVideoMuted = value;
    });
  }

  _joinMeeting() async {
    String serverUrl = serverText.text.trim().isEmpty ? null : serverText.text;

    // Enable or disable any feature flag here
    // If feature flag are not provided, default values will be used
    // Full list of feature flags (and defaults) available in the README
    Map<FeatureFlagEnum, bool> featureFlags = {
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
    };
    if (!kIsWeb) {
      // Here is an example, disabling features for each platform
      if (Platform.isAndroid) {
        // Disable ConnectionService usage on Android to avoid issues (see README)
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        // Disable PIP on iOS as it looks weird
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
    }
    // Define meetings options here
    var options = JitsiMeetingOptions(room: roomText.text)
      ..serverURL = serverUrl
      ..subject = subjectText.text
      ..userDisplayName = nameText.text
      ..userEmail = emailText.text
      ..iosAppBarRGBAColor = iosAppBarRGBAColor.text
      ..audioOnly = isAudioOnly
      ..audioMuted = isAudioMuted
      ..videoMuted = isVideoMuted
      ..featureFlags.addAll(featureFlags)
      ..webOptions = {
        "roomName": roomText.text,
        "width": "100%",
        "height": "100%",
        "enableWelcomePage": false,
        "chromeExtensionBanner": null,
        "userInfo": {"displayName": nameText.text}
      };

    debugPrint("JitsiMeetingOptions: $options");
    await JitsiMeet.joinMeeting(
      options,
      listener: JitsiMeetingListener(
          onConferenceWillJoin: (message) {
            debugPrint("${options.room} will join with message: $message");
          },
          onConferenceJoined: (message) {
            debugPrint("${options.room} joined with message: $message");
          },
          onConferenceTerminated: (message) {
            debugPrint("${options.room} terminated with message: $message");
          },
          genericListeners: [
            JitsiGenericListener(
                eventName: 'readyToClose',
                callback: (dynamic message) {
                  debugPrint("readyToClose callback");
                }),
          ]),
    );
  }

  void _onConferenceWillJoin(message) {
    debugPrint("_onConferenceWillJoin broadcasted with message: $message");
  }

  void _onConferenceJoined(message) {
    debugPrint("_onConferenceJoined broadcasted with message: $message");
  }

  void _onConferenceTerminated(message) {
    debugPrint("_onConferenceTerminated broadcasted with message: $message");
  }

  _onError(error) {
    debugPrint("_onError broadcasted: $error");
  }
}
