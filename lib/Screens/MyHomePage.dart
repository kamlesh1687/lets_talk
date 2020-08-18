import 'package:fancy_bar/fancy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letstalk/Screens/Searchscreen.dart';
import 'package:letstalk/Screens/Settings.dart';

import 'package:letstalk/homeScreen/Profilepage.dart';
import 'package:letstalk/widgets/variableproperties.dart';
import 'package:letstalk/widgets/widgets.dart';
import '../homeScreen/Profilepage.dart';
import '../homeScreen/feedscreen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List<Widget> pages = [
  Feedscreen(),
  Searchbar(),
  Setting(),
  Profilepage(),
];

int currentpage = 0;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        extendBody: true,
        bottomNavigationBar: nav(FancyBottomBar(
          type: FancyType.FancyV1,
          selectedIndex: currentpage, // Fancy Bar Type
          items: [
            FancyItem(
              textColor: Colors.orange,
              title: 'Home',
              icon: Icon(Icons.home),
            ),
            FancyItem(
              textColor: Colors.red,
              title: 'Search',
              icon: Icon(Icons.search),
            ),
            FancyItem(
              textColor: Colors.brown,
              title: 'Activity',
              icon: Icon(Icons.notifications),
            ),
            FancyItem(
              textColor: Colors.green,
              title: 'Profile',
              icon: Icon(Icons.account_circle),
            ),
          ],
          onItemSelected: (index) {
            setState(() {
              currentpage = index;
            });
          },
        )),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: pages[currentpage],
              )
            ],
          ),
        ));
  }
}
