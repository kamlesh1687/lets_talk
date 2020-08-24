import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:letstalk/Other_screens/Auth_related/Login_screen/Loginscreen.dart';

import 'package:google_fonts/google_fonts.dart';

import 'Data_models/messagemodel.dart';
import 'Landing_screen/MyHomePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

Future<List<Welcome>> datajson(BuildContext context) async {
  final jsonString = await DefaultAssetBundle.of(context)
      .loadString('assets/jsondata/oldmsg.json');
  return welcomeFromJson(jsonString);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    print("Staring");
    return MaterialApp(
        title: 'LetStalk',
        theme: ThemeData(
          splashColor: Colors.redAccent,
          textTheme: GoogleFonts.ubuntuTextTheme(
            Theme.of(context).textTheme,
          ),
          accentColor: Colors.grey,
          primarySwatch: Colors.teal,
          backgroundColor: Colors.white,
          cardColor: Colors.white,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, AsyncSnapshot<User> snapshot) {
              print("Checking started");
              if (snapshot.hasData) {
                print("Checking inside 1st if");
                if (snapshot.data != null) {
                  print("Checking inside 2nd if");
                  return MyHomePage();
                } else {
                  print("Returning else 1");
                  return LoginScreen();
                }
              }
              print("Returning else 2");
              return LoginScreen();
            }));
  }
}
