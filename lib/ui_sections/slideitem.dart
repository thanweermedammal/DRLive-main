import 'package:flutter/cupertino.dart';

class SlideItem extends StatelessWidget {
  var index;

  SlideItem({Key key, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: index == 0
                  ? AssetImage('assets/images/splash 1 1.png')
                  : index == 1
                      ? AssetImage('assets/images/splash 2 1.png')
                      : AssetImage('assets/images/splash 3 1.png'),
              fit: BoxFit.fill)),
    );
  }
}
