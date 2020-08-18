import 'package:flutter/material.dart';
import 'package:letstalk/widgets/widgets.dart';

class Searchbar extends StatefulWidget {
  @override
  _SearchbarState createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CustomAppbar(
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: "Search....",
                  hintStyle: TextStyle(fontSize: 16, color: Colors.red)),
            ),
            iconbuttons(Icons.arrow_back_ios, context, () {
              Navigator.pop(context);
            }),
            iconbuttons(Icons.more_vert, context, () {}),
          )
        ],
      )),
    );
  }
}
