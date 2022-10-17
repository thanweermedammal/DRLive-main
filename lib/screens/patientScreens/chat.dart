import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/dummy_data/chats.dart';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:active_ecommerce_flutter/ui_sections/main_drawer.dart';
import 'dart:async';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';

class Chat extends StatefulWidget {
  Chat({
    Key key,
    this.messenger_name,
    this.messenger_image, this.parent_category_name,
  }) : super(key: key);

  final String messenger_name;
  final String messenger_image;
  final String parent_category_name;

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _chatTextController = TextEditingController();
  final ScrollController _chatScrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final lastKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        drawer: MainDrawer(),
        backgroundColor: Colors.white,
        //appBar: buildAppBar(context),
        body: Stack(
          children: [
            Container(
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      //Colors.cyan,
                      Colors.cyanAccent,
                      Colors.white
                    ],
                  )),
            ),

            CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        children: [
                          Container(height: 120,child: buildAppBar(context)),
                        ],
                      ),
                    ),
                  ]),
                ),
                
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Container(height: MediaQuery.of(context).size.height * 0.67,child: buildChatList()),
                          ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                              child: Container(
                                decoration: new BoxDecoration(color: Colors.transparent),
                                height: 80,
                                child: buildMessageSendingRow(context),

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                )
              ],
            ),
            //original
          ],
        ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading:widget.parent_category_name != "Dr. John" ? GestureDetector(
        onTap: () {
          _scaffoldKey.currentState.openDrawer();
        },
        child: Column(
          children: [
            Builder(
              builder: (context) => Padding(
                padding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                child: Container(
                  child: Image.asset(
                    'assets/homebox.png',
                    height: 30,
                    width: 30,
                    //color: MyTheme.dark_grey,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ) : Column(
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
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            widget.parent_category_name != "Dr. John" ? Row(
              children: [
                Spacer(),
                Text(
                  "Help",
                  style: TextStyle(fontSize: 26, color: Colors.white),
                ),
                SizedBox(width: 50,),
                Spacer(),
              ],
            ): Text(
              widget.parent_category_name,
              style: TextStyle(fontSize: 26, color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            widget.parent_category_name != "Dr. John" ? Container(): Text(
              "Consultation Start",
              style: TextStyle(fontSize: 18, color: Colors.cyan[800]),
            ),
            SizedBox(
              height: 10,
            ),
            widget.parent_category_name != "Dr. John" ? Container(): Text(
              "You can consult with your problems with doctor",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
      ),
      elevation: 0.0,
      titleSpacing: 0,
    );
  }

  SingleChildScrollView buildChatList() {
    return SingleChildScrollView(
      child: ListView.builder(
        key: lastKey,
        controller: _chatScrollController,
        itemCount: chatList.length,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: buildChatItem(index),
          );
        },
      ),
    );
  }

  buildChatItem(index) {
    return chatList[index].is_sender
        ? getSenderView(
            ChatBubbleClipper5(type: BubbleType.sendBubble),
            context,
            chatList[index].text,
            chatList[index].date,
            chatList[index].time)
        : getReceiverView(
            ChatBubbleClipper5(type: BubbleType.receiverBubble),
            context,
            chatList[index].text,
            chatList[index].date,
            chatList[index].time);
  }

  Row buildMessageSendingRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          color: Colors.transparent,
          height: 40,
          width: (MediaQuery.of(context).size.width - 32) * (4 / 5),
          child: TextField(
            autofocus: false,
            maxLines: null,
            controller: _chatTextController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(251, 251, 251, 1),
                hintText: "Type your message here ...",
                hintStyle:
                    TextStyle(fontSize: 14.0, color: MyTheme.textfield_grey),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: MyTheme.textfield_grey, width: 0.5),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(35.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: MyTheme.medium_grey, width: 0.5),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(35.0),
                  ),
                ),
                contentPadding: EdgeInsets.only(left: 16.0)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              //print('dd');
              var chatText = _chatTextController.text.toString();
              //print(chatText);
              if (chatText != "") {
                final DateTime now = DateTime.now();
                final DateFormat date_formatter = DateFormat('yyyy-MM-dd');
                final DateFormat time_formatter = DateFormat('hh:ss');
                final String formatted_date = date_formatter.format(now);
                final String formatted_time = time_formatter.format(now);
                /* print(chatText);
                print(formatted_date);
                print(formatted_time);
                print("--------------------");*/
                var a_chat_item = AChat(
                    text: chatText,
                    date: formatted_date,
                    time: formatted_time,
                    is_sender: true);
                setState(() {
                  chatList.add(a_chat_item);
                });

                //print(_chatScrollController.positions.elementAt(0).viewportDimension);

                /*_chatScrollController.animateTo(
                      500,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn);*/

                _chatScrollController.jumpTo(200);
              }
            },
            child: Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
              decoration: BoxDecoration(
                color: Colors.cyan[800],
                borderRadius: BorderRadius.circular(35),
                border: Border.all(
                    color: Color.fromRGBO(112, 112, 112, .3), width: 1),
                //shape: BoxShape.rectangle,
              ),
              child: Center(
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  getSenderView(
          CustomClipper clipper, BuildContext context, text, date, time) =>
      ChatBubble(
        elevation: 0.0,
        clipper: clipper,
        alignment: Alignment.topRight,
        margin: EdgeInsets.only(top: 10),
        backGroundColor: Colors.cyan[200],
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.6,
            minWidth: MediaQuery.of(context).size.width * 0.6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: MyTheme.font_grey, fontSize: 13, wordSpacing: 1),
                ),
              ),
              Text(date + " " + time,
                  style: TextStyle(color: MyTheme.medium_grey, fontSize: 10)),
            ],
          ),
        ),
      );

  getReceiverView(
          CustomClipper clipper, BuildContext context, text, date, time) =>
      ChatBubble(
        elevation: 0.0,
        clipper: clipper,
        backGroundColor: Colors.grey[100],
        margin: EdgeInsets.only(top: 10),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.6,
            minWidth: MediaQuery.of(context).size.width * 0.6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: MyTheme.font_grey, fontSize: 14, wordSpacing: 1),
                ),
              ),
              Text(date + " " + time,
                  style: TextStyle(color: MyTheme.medium_grey, fontSize: 10)),
            ],
          ),
        ),
      );
}
