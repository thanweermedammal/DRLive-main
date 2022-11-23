import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  var url;

  var img;

  ImageScreen({Key key, @required this.url, @required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage("https://${url}${img}"))),
      ),
    );
  }
}
