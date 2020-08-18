import 'package:flutter/material.dart';
import 'Screens/Splashscreen.dart';
import 'modals/messagemodel.dart';
import 'package:google_fonts/google_fonts.dart';

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
          splashColor: Colors.redAccent,
          textTheme: GoogleFonts.ubuntuTextTheme(
            Theme.of(context).textTheme,
          ),
          accentColor: Colors.grey,
          primarySwatch: Colors.red,
          backgroundColor: Colors.white,
          cardColor: Colors.white,
        ),
        home: SplashScreen());
  }
}
