import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends AppBar {
  Widget child;
  IconButton icon1;
  IconButton icon2;
  CustomAppBar(this.child, this.icon1, this.icon2);

  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      backgroundColor: Colors.white,
      title: child,
      centerTitle: true,
      leading: icon1,
      actions: [icon2],
    );
  }
}
