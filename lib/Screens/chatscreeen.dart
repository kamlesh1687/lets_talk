import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:letstalk/modals/messagemodel.dart';
import 'package:letstalk/widgets/variableproperties.dart';
import 'package:letstalk/widgets/widgets.dart';

import 'package:letstalk/main.dart';

import 'Chatbox.dart';

class Chatscreen extends StatefulWidget {
  @override
  _ChatscreenState createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Customfab(),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CustomAppbar(
              "Messages",
              iconbuttons(Icons.arrow_back_ios, context, () {
                Navigator.pop(context);
              }),
              iconbuttons(Icons.more_vert, context, () {}),
            ),
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
                              return usersdetail.isMsgread
                                  ? ListTile(
                                      leading: CircleAvatar(
                                        radius: 18,
                                        backgroundImage: NetworkImage(
                                            usersdetail.profilepic),
                                      ),
                                      title: Text(usersdetail.firstName),
                                      subtitle: Text(
                                        msg,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      trailing: Text(usersdetail.msgtime),
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
                                    )
                                  : ListTile(
                                      leading: CircleAvatar(
                                        radius: 18,
                                        backgroundImage: NetworkImage(
                                            usersdetail.profilepic),
                                      ),
                                      title: Text(
                                        usersdetail.firstName,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
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
                                            fontWeight: FontWeight.bold),
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
