import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letstalk/Other_screens/Chats_related/Chat_room/Chatbox.dart';
import 'package:letstalk/Data_models/messagemodel.dart';
import 'package:letstalk/Reusable_widgets/Custom_widgets/Custom_Fab.dart';
import 'package:letstalk/Reusable_widgets/variableproperties.dart';
import 'package:letstalk/Reusable_widgets/widgets.dart';
import 'package:letstalk/Reusable_widgets/Custom_widgets/Custom_appbar.dart';

import 'package:letstalk/main.dart';

class Chatscreen extends StatefulWidget {
  @override
  _ChatscreenState createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  @override
  Widget build(BuildContext context) {
    print("building chatscreen");
    return Scaffold(
      appBar: CustomAppBar(
        Text(
          "Messages",
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
      floatingActionButton: Customfab(),
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

                            if (usersdetail.message.isEmpty) {
                              return Container(
                                height: 0,
                                width: 0,
                                color: Colors.red,
                              );
                            } else {
                              String msg = usersdetail.message[0].msg;
                              return Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                    boxShadow: [
                                      cardShadowpositive,
                                    ],
                                  ),
                                  child: Dismissible(
                                    background: Container(
                                      color: Colors.green,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          "More",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    secondaryBackground: Container(
                                      color: Colors.red,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          "Delete",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    key: UniqueKey(),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        radius: 18,
                                        backgroundImage: NetworkImage(
                                            usersdetail.profilepic),
                                      ),
                                      title: Text(
                                        usersdetail.firstName,
                                        style: TextStyle(
                                            fontWeight: usersdetail.isMsgread
                                                ? FontWeight.bold
                                                : FontWeight.normal),
                                      ),
                                      subtitle: Text(
                                        msg,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      trailing: Text(
                                        usersdetail.msgtime,
                                        style: TextStyle(
                                            fontWeight: usersdetail.isMsgread
                                                ? FontWeight.bold
                                                : FontWeight.normal),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            pageroutanimated(
                                                Chatbox(
                                                  cname: usersdetail.firstName,
                                                  index: index2,
                                                ),
                                                Alignment.center));
                                      },
                                    ),
                                  ),
                                ),
                              );
                            }
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
