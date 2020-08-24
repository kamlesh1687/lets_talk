import 'package:flutter/material.dart';
import 'package:letstalk/Other_screens/Chats_related/Chat_room/Chatbox.dart';
import 'package:letstalk/Data_models/messagemodel.dart';
import 'package:letstalk/Reusable_widgets/variableproperties.dart';
import 'package:letstalk/Reusable_widgets/Custom_widgets/Custom_appbar.dart';
import 'package:letstalk/main.dart';

import 'package:letstalk/Reusable_widgets/widgets.dart';

class Allcontacts extends StatefulWidget {
  @override
  _AllcontactsState createState() => _AllcontactsState();
}

class _AllcontactsState extends State<Allcontacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Text(
          "Select Contact",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Theme.of(context).primaryColor,
              letterSpacing: 1.3),
        ),
        iconbuttons(Icons.arrow_back_ios, context, () {
          Navigator.pop(context);
        }),
        iconbuttons(Icons.more_vert, context, () {}),
      ),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder(
                  future: datajson(context),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return ListView.builder(
                          padding: EdgeInsets.all(0.0),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index2) {
                            Welcome usersdetail = snapshot.data[index2];

                            return ListTile(
                              leading: CircleAvatar(
                                radius: 18,
                                backgroundImage:
                                    NetworkImage(usersdetail.profilepic),
                              ),
                              title: Text(
                                usersdetail.firstName,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                setState(() {});
                                Navigator.push(
                                    context,
                                    pageroutanimated(
                                        Chatbox(
                                          cname: usersdetail.firstName,
                                          index: index2,
                                        ),
                                        Alignment.center));
                              },
                            );
                          });
                    }
                    return CircularProgressIndicator();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
