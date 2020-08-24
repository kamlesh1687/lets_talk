import 'package:fancy_bar/fancy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letstalk/Reusable_widgets/variableproperties.dart';

import 'Feed_Screen_1/feedscreen.dart';
import 'Profile_screen_4/Profilepage.dart';
import 'Search_screen_2/SearchPage.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    print("building home page");

    return Scaffold(
        backgroundColor: bgColor,
        extendBody: true,
        bottomNavigationBar: FancyBottomBar(
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
        ),
        body: IndexedStack(
          index: currentpage,
          children: [Feedscreen(), SearchPage(), Container(), Profilepage()],
        ));
  }
}
