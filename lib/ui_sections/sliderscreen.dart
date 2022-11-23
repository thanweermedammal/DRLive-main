import 'dart:async';

import 'package:active_ecommerce_flutter/screens/patientScreens/login.dart';
import 'package:active_ecommerce_flutter/ui_sections/introscreeencustomlayout.dart';
import 'package:active_ecommerce_flutter/ui_sections/introscreencustom.dart';
import 'package:active_ecommerce_flutter/ui_sections/introscreendefault.dart';
import 'package:active_ecommerce_flutter/ui_sections/slidedotes.dart';
import 'package:active_ecommerce_flutter/ui_sections/slideitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class SliderScreen extends StatefulWidget {
  SliderScreen({Key key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int index = 0;
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 2) {
        setState(() {
          _currentPage++;
        });
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    // _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: 3,
                    itemBuilder: (ctx, i) => SlideItem(
                      index: i,
                    ),
                  ),
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 35),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    for (int i = 0; i < 3; i++)
                                      if (i == _currentPage)
                                        SlideDots(true)
                                      else
                                        SlideDots(false)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Login()),
                                            (route) => false);
                                      },
                                      child: Text(
                                        'Skip',
                                        style: TextStyle(fontSize: 28),
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (_currentPage < 2) {
                                            setState(() {
                                              _currentPage++;
                                            });
                                          } else {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Login()),
                                                (route) => false);
                                          }
                                        },
                                        child: Text("Next",
                                            style: TextStyle(fontSize: 28)))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
