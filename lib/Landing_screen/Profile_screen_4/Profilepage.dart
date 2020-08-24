import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:letstalk/Reusable_widgets/variableproperties.dart';

import 'package:letstalk/Services/Auth_services.dart';

// ignore: must_be_immutable
class Profilepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("building profilePage");
    return Container(
      color: bgColor,
      child: ListView(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 46.0,
                        backgroundImage: AssetImage("assets/images/feed/c.jpg"),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(height: 20),
                      Text(
                        currentUser == null ? "wait" : currentUser.username,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        currentUser == null ? "wait" : currentUser.bio,
                        style: TextStyle(color: Colors.grey, fontSize: 15.0),
                      ),
                      GoogleSignInButton(text: "Sign Out", onPressed: () {})
                    ],
                  ),
                ],
              )),
          Padding(
            padding: EdgeInsets.only(
              top: 40.0,
              bottom: 30.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '173',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 17.0),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Likes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '1.2k',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 17.0),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Followers',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '29k',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 17.0),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Views',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage('assets/images/feed/a.jpg'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(width: 10.0),
                Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage('assets/images/feed/c.jpg'),
                          fit: BoxFit.cover)),
                )
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            height: 100.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage('assets/images/feed/e.jpg'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(width: 10.0),
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage('assets/images/feed/i.jpg'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(width: 10.0),
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage('assets/images/feed/f.jpg'),
                          fit: BoxFit.cover)),
                )
              ],
            ),
          ),
          SizedBox(height: 140),
        ],
      ),
    );
  }
}
