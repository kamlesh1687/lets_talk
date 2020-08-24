import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable

Route pageroutanimated(Widget desirescreen, Alignment alig) {
  return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 300),
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secAnimation, Widget child) {
        return ScaleTransition(
          alignment: alig,
          scale: animation,
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secAnimation) {
        return desirescreen;
      });
}

IconButton iconbuttons(IconData icn, BuildContext context, Function func) {
  return IconButton(
    onPressed: func,
    icon: Icon(
      icn,
      color: Theme.of(context).primaryColor,
      size: 35,
    ),
  );
}

Widget customLogButton(Function ontap, String txt) {
  return GestureDetector(
    onTap: () {
      ontap();
    },
    child: Container(
      height: 55,
      width: 160,
      decoration: BoxDecoration(
          color: Colors.teal, borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          txt,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
