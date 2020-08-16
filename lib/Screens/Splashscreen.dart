import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:letstalk/Screens/MyHomePage.dart';
import 'package:letstalk/Screens/loginscreen.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (ctx, AsyncSnapshot<FirebaseUser> snapshot)
    {
      if(snapshot.hasData){
        if(snapshot.data != null){
          return MyHomePage();
        }
        else{
          return LoginScreen1();
        }

      }
            return LoginScreen1();
    }

    );
  }
}
