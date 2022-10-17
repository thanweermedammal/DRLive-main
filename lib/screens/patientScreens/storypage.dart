import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:active_ecommerce_flutter/models/stories.dart';
import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:active_ecommerce_flutter/data_handler/notification_handler.dart';
import 'dart:async';
import 'package:active_ecommerce_flutter/models/notification.dart';
import 'package:active_ecommerce_flutter/models/chats.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:active_ecommerce_flutter/app_config.dart';
import 'dart:convert';
import 'package:active_ecommerce_flutter/models/stories.dart';

class MoreStories extends StatefulWidget {
  @override
  _CustomStoryViewState createState() => _CustomStoryViewState();
}

class _CustomStoryViewState extends State<MoreStories>
    with SingleTickerProviderStateMixin {
  final PageController _controller = PageController();
  double _progressIndicators;
  int _page = 0;
  AnimationController _animationController;
  bool dragEnded = true;
  Size _pageSize;
  Future<Stories> allStory;

  @override
  void initState() {
    allStory = NotificationHandler().allStories();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _animationController.addListener(animationListener);
    _animationController.forward();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _pageSize = MediaQuery.of(context).size;
      _progressIndicators = (_pageSize.width - 100) / 6;
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder<Stories>(
              stream: allStory.asStream(), // snapshots
              builder: (BuildContext context, AsyncSnapshot<Stories> snapshot) {
                if (snapshot.hasData) {
                  return PageView.builder(
                    controller: _controller,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => GestureDetector(
                      onLongPressStart: _onLongPressStart,
                      onLongPressEnd: _onLongPressEnd,
                      onHorizontalDragEnd: _onHorizontalDragEnd,
                      onHorizontalDragStart: _onHorizontalDragStart,
                      onHorizontalDragUpdate: _onHorizontalDragUpdate,
                      onTapUp: _onTapDown,
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                          Text(snapshot.data.stories[index].name,style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),
                          SizedBox(height: 15,),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.83,
                            width: MediaQuery.of(context).size.width,
                            //color: _colorsList[index],
                            child: Container(
                              margin: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                  image: NetworkImage('${AppConfig.STORY_URL}' +
                                      snapshot.data.stories[index].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    itemCount: snapshot.data.stories.length,
                  );
                } else {
                  return Container(
                      child: Center(child: CircularProgressIndicator()));
                }
              },
            ),
          ),
          Positioned(
            top: 48,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ([0, 1, 2, 3, 4, 5]
                  .map((e) => (e == _page)
                      ? Stack(
                          children: [
                            Container(
                              width: _progressIndicators,
                              height: 8,
                              color: Colors.black54,
                            ),
                            AnimatedBuilder(
                              animation: _animationController,
                              builder: (ctx, widget) {
                                return AnimatedContainer(
                                  width: _progressIndicators *
                                      _animationController.value,
                                  height: 8,
                                  color: Colors.white,
                                  duration: Duration(milliseconds: 100),
                                );
                              },
                            ),
                          ],
                        )
                      : Container(
                          width: _progressIndicators,
                          height: 8,
                          color: (_page >= e) ? Colors.white : Colors.black54,
                        ))
                  .toList()),
            ),
          )
        ],
      ),
    );
  }

  animationListener() {
    if (_animationController.value == 1) {
      _moveForward();
    }
  }

  _moveBackward() {
    if (_controller.page != 0) {
      setState(() {
        _page = (_controller.page - 1).toInt();
        _page = (_page < 0) ? 0 : _page;
        _controller.animateToPage(_page,
            duration: Duration(milliseconds: 100), curve: Curves.easeIn);
        _animationController.reset();
        _animationController.forward();
      });
    }
  }

  _moveForward() {
   // if (_controller.page != (length - 1)) {
      setState(() {
        _page = (_controller.page + 1).toInt();
        _controller.animateToPage(_page,
            duration: Duration(milliseconds: 100), curve: Curves.easeIn);
        _animationController.reset();
        _animationController.forward();
      });
   // }
  }

  _onTapDown(TapUpDetails details) {
    var x = details.globalPosition.dx;
    (x < _pageSize.width / 2) ? _moveBackward() : _moveForward();
  }

  _onHorizontalDragUpdate(d) {
    if (!dragEnded) {
      dragEnded = true;
      if (d.delta.dx < -5) {
        _moveForward();
      } else if (d.delta.dx > 5) {
        _moveBackward();
      }
    }
  }

  _onHorizontalDragStart(d) {
    dragEnded = false;
  }

  _onHorizontalDragEnd(d) {
    dragEnded = true;
  }

  _onLongPressEnd(_) {
    _animationController.forward();
  }

  _onLongPressStart(_) {
    _animationController.stop();
  }
}
