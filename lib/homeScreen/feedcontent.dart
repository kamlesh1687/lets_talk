import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letstalk/Screens/Chatbox.dart';
import 'package:letstalk/modals/messagemodel.dart';
import 'package:letstalk/widgets/widgets.dart';




// ignore: must_be_immutable
class Feeds extends StatefulWidget {

  Welcome postdata;
  int index;
  Feeds(
      this.postdata,this.index
      );

  @override
  _FeedsState createState() => _FeedsState(postdata,index);
}

class _FeedsState extends State<Feeds> {

  Welcome postdata;
  int index;
  _FeedsState(this.postdata,this.index);
  @override
  Widget build(BuildContext context) {
    final hg=MediaQuery.of(context).size.height;
    return Column(children: <Widget>[
      Expanded(

        child: Container(



          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Container(

                  height: hg*0.5,
                  width: 500,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                    ),
                    child: Image.network(
                      postdata.profilepic,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: InkWell(
                  enableFeedback: true,
                  onLongPress: (){

                  },
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
                      fontSize: 25,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(postdata.profilepic),
                  radius: 20,
                ),
                trailing: Icon(Icons.more_vert),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width - 16,
                  height: 50,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.favorite_border),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.comment),
                        ],
                      ),
                      Row(
                        children: <Widget>[Icon(Icons.send)],
                      ),
                      Row(
                        children: <Widget>[Icon(Icons.add_to_photos)],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}



