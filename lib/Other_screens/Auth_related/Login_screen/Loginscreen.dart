import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:letstalk/Reusable_widgets/variableproperties.dart';
import 'package:letstalk/Reusable_widgets/widgets.dart';

import 'package:letstalk/Services/Auth_services.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.teal, Colors.tealAccent]),
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Row(children: <Widget>[
                  VerticalText(),
                ]),
                Positioned(
                    bottom: 50,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "LetStalk",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ))
              ],
            ),
            Container(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0XFFA7FFEB),
                  boxShadow: [
                    cardShadowpositive,
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    TextLogin(),
                    Container(
                      height: 50,
                    ),
                    Text(
                      'Your first time?',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    customLogButton(() async {
                      authobject.gSignInFunction();
                    }, "SignIn with Google"),
                  ],
                ),
              ),
            ),
            Container(
              height: 40,
            ),
            Icon(
              FontAwesomeIcons.arrowAltCircleRight,
              size: 100,
              color: Colors.teal,
            )
          ],
        ),
      ),
    );
  }
}

class TextLogin extends StatefulWidget {
  @override
  _TextLoginState createState() => _TextLoginState();
}

class _TextLoginState extends State<TextLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              '   Hello World \nWelcome Here',
              style: TextStyle(
                fontSize: 24,
                color: Color(0XFF004D40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VerticalText extends StatefulWidget {
  @override
  _VerticalTextState createState() => _VerticalTextState();
}

class _VerticalTextState extends State<VerticalText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 10),
      child: RotatedBox(
          quarterTurns: -1,
          child: Text(
            'Lets Get social!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.w900,
            ),
          )),
    );
  }
}
