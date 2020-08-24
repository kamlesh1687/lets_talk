import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:letstalk/Other_screens/Chats_related/Chat_room/Chatbox.dart';
import 'package:letstalk/Data_models/messagemodel.dart';
import 'package:letstalk/Reusable_widgets/variableproperties.dart';

import 'package:letstalk/Reusable_widgets/widgets.dart';

// ignore: must_be_immutable
class Feeds extends StatelessWidget {
  Welcome postdata;
  int index;
  Feeds(this.postdata, this.index);
  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(
          top: 10,
          left: 5,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  cardShadowpositive,
                ],
                shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 25,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.teal[50],
              boxShadow: [
                cardShadowpositive,
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(23.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screensize.width - 85,
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                        ),
                        Expanded(
                          child: Container(
                            height: 30,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        pageroutanimated(
                                            Chatbox(
                                              cname: postdata.firstName,
                                              index: index,
                                            ),
                                            Alignment.center));
                                  },
                                  child: Text(
                                    postdata.firstName,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "@userId",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Icon(Icons.more_vert)
                      ],
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Container(
                    width: screensize.width - 85,
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    child: postdata.message.isEmpty
                        ? Container()
                        : Text(
                            postdata.message[0].msg,
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                  ),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          margin: EdgeInsets.only(top: 5),
                          width: screensize.width - 85,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red),
                          child: Image.asset(
                            'assets/images/feed/i.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 10,
                        child: Container(
                          color: Colors.black87,
                          child: Text(
                            postdata.msgtime,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    width: MediaQuery.of(context).size.width - 85,
                    height: screensize.height * 0.05,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [LikeButton(postdata), postCommentButton()],
                        ),
                        FlatButton(
                          color: cardColorbg,
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.share,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 5,
          child: Container(
            decoration:
                BoxDecoration(color: Colors.teal[50], shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(postdata.profilepic),
                radius: 25,
              ),
            ),
          ),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class LikeButton extends StatefulWidget {
  Welcome postdata;
  LikeButton(this.postdata);
  @override
  _LikeButtonState createState() => _LikeButtonState(postdata);
}

class _LikeButtonState extends State<LikeButton> {
  Welcome postdata;
  _LikeButtonState(this.postdata);
  Color clr = Colors.red;
  Color clr2 = cardColorbg;
  bool isLiked = false;
  double slide = -10;
  double slide2 = 20;
  int add = 0;
  likefunction() {
    setState(() {
      if (isLiked == false) {
        isLiked = true;
        slide = 55;
        slide2 = -30;
        clr = cardColorbg;
        clr2 = Colors.red;
        add = 1;
      } else {
        isLiked = false;
        slide = -10;
        slide2 = 20;
        clr = Colors.red;
        clr2 = cardColorbg;
        add = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        minWidth: 100,
        color: clr2,
        onPressed: () {
          likefunction();
        },
        child: Container(
          child: Row(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                transform: Matrix4.translationValues(slide, 0, 0),
                child: Icon(
                  Icons.favorite_border,
                  color: clr,
                ),
              ),
              AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  transform: Matrix4.translationValues(slide2, 0, 0),
                  width: 50,
                  child: Text(
                    "${postdata.message.length + add}",
                    style: TextStyle(fontSize: 20, color: clr),
                  ))
            ],
          ),
        ));
  }
}

Widget postCommentButton() {
  return FlatButton(
    color: cardColorbg,
    onPressed: () {},
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Text(
      "Comments",
      style: TextStyle(color: Colors.black, fontSize: 15),
    ),
  );
}
