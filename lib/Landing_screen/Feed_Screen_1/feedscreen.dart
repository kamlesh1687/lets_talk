import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letstalk/Other_screens/Chats_related/Chat_screen/chatscreeen.dart';
import 'package:letstalk/Data_models/messagemodel.dart';
import 'package:letstalk/Reusable_widgets/Custom_widgets/Custom_appbar.dart';
import 'package:letstalk/Reusable_widgets/variableproperties.dart';
import 'package:letstalk/Reusable_widgets/widgets.dart';
import 'package:letstalk/main.dart';

import 'feedcontent.dart';

class Feedscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("building feedScreen");
    return AnimatedContainer(
      color: bgColor,
      duration: Duration(milliseconds: 500),
      child: Scaffold(
        backgroundColor: Colors.teal[600],
        appBar: CustomAppBar(
          Text(
            "LetStalk",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Theme.of(context).primaryColor,
                letterSpacing: 1.3),
          ),
          iconbuttons(Icons.logout, context, () {
            FirebaseAuth.instance.signOut();
          }),
          iconbuttons(Icons.chat, context, () {
            Navigator.push(
                context, pageroutanimated(Chatscreen(), Alignment.topRight));
          }),
        ),
        body: FutureBuilder(
            future: datajson(context),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Welcome usersdetail = snapshot.data[index];
                      return Feeds(usersdetail, index);
                    });
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
