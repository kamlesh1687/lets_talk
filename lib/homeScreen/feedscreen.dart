import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letstalk/Screens/MyHomePage.dart';
import 'package:letstalk/Screens/chatscreeen.dart';
import 'package:letstalk/modals/messagemodel.dart';
import 'package:letstalk/widgets/variableproperties.dart';
import 'package:letstalk/widgets/widgets.dart';
import '../main.dart';
import 'feedcontent.dart';

class Feedscreen extends StatefulWidget {

  @override
  _FeedscreenState createState() => _FeedscreenState();
}

class _FeedscreenState extends State<Feedscreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: bgColor,
      duration: Duration(milliseconds: 500),

      child: Scaffold(

        body: Container(
           color: bgColor,
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    customappbar(
                      "LetStalk",
                      iconbuttons(Icons.account_circle, context, () {
                      }),
                      iconbuttons(Icons.chat, context, () {
                        Navigator.push(context,
                            pageroutanimated(Chatscreen(), Alignment.topRight));
                      }),
                    ),

                    Expanded(
                   child: FutureBuilder(
                       future: datajson(context),
                       builder: (context, snapshot) {
                         if (snapshot.data != null) {
                           return PageView.builder(
                          scrollDirection:  Axis.vertical,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            Welcome usersdetail = snapshot.data[index];
                            return Feeds(usersdetail,index);
                          });
                         }
                         return CircularProgressIndicator();
                       })
                    ),
                  ],
                ))
              ],
            )),
      ),
    );
  }
}
