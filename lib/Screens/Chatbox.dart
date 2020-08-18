import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:letstalk/modals/messagemodel.dart';

import 'package:letstalk/widgets/variableproperties.dart';

import 'package:letstalk/widgets/widgets.dart';
import 'package:letstalk/main.dart';


class Chatbox extends StatefulWidget {
  final String cname;

  final int index;


  Chatbox(
      {@required this.cname,
      @required this.index,
     });

  _ChatboxState createState() => _ChatboxState(cname, index);
}

final inputtextcontroller = TextEditingController();



@override
class _ChatboxState extends State<Chatbox> {
  final String cname;

  final int index;

  String messageMe = "";
  Welcome dta;
  Message msgs;
  bool isRead;
  _ChatboxState(
    this.cname,
    this.index,

  );

  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double heigthofscreen = MediaQuery.of(context).size.width;
    return Scaffold(

        body: SafeArea(

      child: Container(
        color:  bgColor,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 8),
              child: CustomAppbar(
                  cname,

                  iconbuttons(Icons.arrow_back_ios, context, () {
                    Navigator.pop(context);
                  }),
                  iconbuttons(Icons.more_vert, context, () {})),
            ),
            Expanded(

              child: FutureBuilder(
                  future: datajson(context),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return new ListView.builder(
                          padding: EdgeInsets.all(0.0),
                          itemCount: snapshot.data[index].message.length,
                          reverse: true,
                          itemBuilder: (BuildContext context, int index2) {
                         dta=snapshot.data[index];
                         msgs=dta.message[index2];

                            return Column(
                              crossAxisAlignment: dta.message[index2].isMe
                                  ?CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                  onTap: (){
                                    print(snapshot.data[index].message.length);
                                  },
                                  child: Container(

                                      constraints: BoxConstraints(
                                          maxWidth: (heigthofscreen) * (3 / 4)),
                                      decoration: BoxDecoration( boxShadow: [
                                        cardShadowpositive,
                                        cardShadownegative
                                      ]  ,

                                          color: dta.message[index2].isMe
                                              ? Theme.of(context).accentColor
                                              : Theme.of(context).primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        msgs.msg,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      )),
                                ),
                              ],
                            );
                          });
                    }
                    return CircularProgressIndicator();
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15,top: 12),
              child: Material(
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      enableFeedback: true,
                      onPressed: () {

                      },
                      icon: Icon(
                        Icons.insert_emoticon,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Container(

                      decoration: BoxDecoration(
                          color:cardColorbg,
                          boxShadow: [
                            cardShadowpositive,
                            cardShadownegative
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.only(left: 4),
                      width: MediaQuery.of(context).size.width - 100,
                      child: TextField(
                        onChanged: (String msg) {
                          messageMe = msg;
                        },
                        onSubmitted: (String msg) {
                          setState(() {
                            print(msg);
                            inputtextcontroller.clear();
                          });
                        },
                        controller: inputtextcontroller,
                        maxLines: null,
                        minLines: null,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter a Message....",
                            hintStyle: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor)),
                      ),
                    ),
                    IconButton(
                      enableFeedback: true,
                      onPressed: () {


                        print(messageMe);
                        inputtextcontroller.clear();
                      },
                      icon: Icon(
                        Icons.send,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}



