import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


import 'Screens/MyHomePage.dart';


import 'package:google_fonts/google_fonts.dart';

import 'Screens/Splashscreen.dart';
import 'modals/messagemodel.dart';


void main() => runApp(MyApp());


Future<List<Welcome>> datajson(BuildContext context) async {
  final jsonString = await DefaultAssetBundle.of(context)
      .loadString('assets/jsondata/oldmsg.json');
  return welcomeFromJson(jsonString);
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LetStalk',
      theme: ThemeData(
        splashColor: Colors.cyan,
        textTheme: GoogleFonts.ubuntuTextTheme(
          Theme.of(context).textTheme,
        ),
        accentColor: Colors.grey,
        primarySwatch: Colors.teal,
        backgroundColor: Colors.white,
        cardColor: Colors.white,
      ),
      home:SplashScreen()
    );
  }
}
