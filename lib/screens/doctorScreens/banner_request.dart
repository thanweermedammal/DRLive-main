import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/ui_sections/main_drawer.dart';

class BannerRequest extends StatefulWidget {
  @override
  BannerRequestState createState() => BannerRequestState();
}

class BannerRequestState extends State<BannerRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        ///key: _scaffoldKey,
        drawer: MainDrawer(),
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: Stack(children: [
          CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                buildTextFieldList(),
              ]))
            ],
          ),
        ]));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
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
              child: Text(
                "Banner Request",
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      elevation: 0.0,
      titleSpacing: 0,
    );
  }

  buildTextFieldList() {
    return Column(
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              //color: Colors.cyan[700],
              shape: BoxShape.rectangle,
              border: Border.all(width: 0.5, color: Colors.cyan[800]),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            height: 50,
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              //controller: _passwordController,
              autofocus: false,
              enableSuggestions: false,
              maxLines: 1,
              autocorrect: false,
              style: TextStyle(color: Colors.black, fontSize: 22),
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                hintStyle: TextStyle(color: Colors.cyan[800], fontSize: 17),
                hintText: "     Title",
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              //color: Colors.cyan[700],
              shape: BoxShape.rectangle,
              border: Border.all(width: 0.5, color: Colors.cyan[800]),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            height: 250,
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              maxLines: 20,
              //controller: _passwordController,
              autofocus: false,
              enableSuggestions: false,
              autocorrect: false,
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.black, fontSize: 20),
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                hintStyle: TextStyle(color: Colors.cyan[800], fontSize: 17),
                hintText: "     Enter Description",
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Text(
                "Select Banner Image",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              Container(
                // child:
                // FlatButton(
                //     child: Text(
                //       '     Select     ',
                //       style: TextStyle(fontSize: 20.0),
                //     ),
                //     color: Colors.blue[300],
                //     textColor: Colors.white,
                //     onPressed: () {},
                //   ),
                // ),
                margin:
                    EdgeInsets.only(left: 25, right: 30, top: 25, bottom: 25),
                //
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
            //color: Colors.cyan[800],
            image: DecorationImage(
              image: AssetImage(
                'assets/makerequest.png',
              ),
              fit: BoxFit.fill,
              //colorFilter: ColorFilter.mode(Colors.cyan, BlendMode.overlay)
            ),
            //shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
