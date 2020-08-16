import 'package:fancy_bar/fancy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:letstalk/Screens/Allcontacts.dart';

import 'package:letstalk/widgets/variableproperties.dart';




class customappbar extends StatelessWidget{

  String titl;
  Widget icon1;
  Widget icon2;
  customappbar(this.titl,this.icon1,this.icon2);

  @override





  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 6),
      child: Container(
        height: 50,
        decoration: BoxDecoration( boxShadow: [
          cardShadowpositive,
          cardShadownegative,
        ], borderRadius: BorderRadius.circular(10)),
        child: Material(

          color:cardColorbg,
          borderRadius: BorderRadius.circular(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              icon1,
              Container(
                height: 50,
                child: Center(
                    child: Text(
                      titl,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Theme.of(context).primaryColor,
                          letterSpacing: 1.3),
                    )),
              ),
              icon2,
            ],
          ),
        ),
      ),
    );

  }
}



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

Widget iconbuttons(IconData icn, BuildContext context, Function func) {
  return IconButton(
    onPressed: func,
    icon: Icon(
      icn,
      color: Theme.of(context).primaryColor,
      size: 35,
    ),
  );
}



class Customfab extends FloatingActionButton{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.width*0.13,
      width: MediaQuery.of(context).size.width*0.3,
      decoration: BoxDecoration( boxShadow: [
      cardShadowpositive
      ], borderRadius: BorderRadius.circular(10)),
      child: Material(

        color: cardColorbg,
        borderRadius: BorderRadius.circular(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            iconbuttons(Icons.add, context, () {
              Navigator.push(
                  context,
                  pageroutanimated(
                      Allcontacts(), Alignment.bottomRight));
            }),
            iconbuttons(Icons.search, context, () {}),


          ],
        ),
      ),
    );
  }

}


Widget nav(var bottomnavbar)
     {


  return Container(
    height: 50,
    decoration: BoxDecoration( boxShadow: [
      cardShadowpositive,
      cardShadownegative,
    ], borderRadius: BorderRadius.circular(10)),
    child:Material(

      child: bottomnavbar,
      elevation: 0.5,


    ),
  );
}

