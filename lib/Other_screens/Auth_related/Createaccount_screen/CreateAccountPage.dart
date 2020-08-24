import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:letstalk/Reusable_widgets/variableproperties.dart';
import 'package:letstalk/Reusable_widgets/widgets.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  String username;
  submitUsername() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      SnackBar snackBar = SnackBar(content: Text("Welcome " + username));
      _scaffoldKey.currentState.showSnackBar(snackBar);
      Timer(Duration(seconds: 4), () {
        Navigator.pop(context, username);
      });
    }
  }

  @override
  Widget build(BuildContext parentContext) {
    print("Building Create page");
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.teal, Colors.tealAccent]),
        ),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              Container(
                height: 100,
              ),
              Padding(
                  padding: EdgeInsets.only(top: 26.0),
                  child: Center(
                      child: Text("Almost there",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.w900,
                          )))),
              Padding(
                  padding: EdgeInsets.only(top: 26.0, left: 20, right: 20),
                  child: Center(
                      child: Text(
                          "Finish creating your username for the full LetsTalk experience ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          )))),
              Container(
                height: 100,
              ),
              Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0XFFB2DFDB),
                      boxShadow: [
                        cardShadowpositive,
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(17.0),
                            child: Container(
                                height: 100,
                                child: Form(
                                    key: _formKey,
                                    autovalidate: true,
                                    child: TextFormField(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                      validator: (val) {
                                        if (val.trim().length < 5 ||
                                            val.isEmpty) {
                                          return "Username is very short";
                                        } else if (val.trim().length > 15 ||
                                            val.isEmpty) {
                                          return "Username is very long";
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (val) => username = val,
                                      decoration: InputDecoration(
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          labelStyle: TextStyle(
                                              fontSize: 16,
                                              color: Color(0XFF004D40)),
                                          hintText:
                                              "Must be atleast 5 character",
                                          labelText: "Username"),
                                    )))),
                        customLogButton(submitUsername, "Proceed"),
                        Container(height: 15)
                      ],
                    ),
                  )),
              Container(
                height: 50,
              ),
              Icon(FontAwesomeIcons.userEdit, size: 100, color: Colors.teal)
            ]),
          ),
        ),
      ),
    );
  }
}
