import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:letstalk/Data_models/user.dart';
import 'package:letstalk/Reusable_widgets/ProgressWidget.dart';
import 'package:letstalk/Reusable_widgets/variableproperties.dart';
import 'package:letstalk/Reusable_widgets/widgets.dart';
import 'package:letstalk/Services/Auth_services.dart';
import 'package:letstalk/Reusable_widgets/Custom_widgets/Custom_appbar.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with AutomaticKeepAliveClientMixin<SearchPage> {
  emptyTheTextFormField() {
    searchTextEditingController.clear();
  }

  controlSearching(String str) {
    Future<QuerySnapshot> allusers =
        usersReference.where("profileName", isGreaterThanOrEqualTo: str).get();
    setState(() {
      futureSearchResults = allusers;
    });
  }

  TextEditingController searchTextEditingController = TextEditingController();
  Future<QuerySnapshot> futureSearchResults;

  Container displayNoSearchResultScreen() {
    return Container(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Icon(
              Icons.group,
              color: Colors.grey,
              size: 200.0,
            ),
            Text(
              "Search users",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

  displayUsersFoundScreen() {
    return FutureBuilder(
      future: futureSearchResults,
      builder: (context, dataSnapshot) {
        if (!dataSnapshot.hasData) {
          return circularProgress();
        }
        List<UserResult> searchUserResult = [];
        dataSnapshot.data.documents.forEach((document) {
          User_ eachUser = User_.fromDocument(document);
          UserResult userResult = UserResult(eachUser);
          searchUserResult.add(userResult);
        });
        return ListView(
          children: searchUserResult,
        );
      },
    );
  }

  bool get wantKeepAlive => true;
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    print("building searchbar");
    return Scaffold(
      appBar: CustomAppBar(
        Container(
          height: 50,
          child: TextFormField(
            controller: searchTextEditingController,
            decoration: InputDecoration(
                alignLabelWithHint: true,
                isDense: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelStyle: TextStyle(fontSize: 16),
                hintText: "Search........",
                hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 1.3)),
            onFieldSubmitted: controlSearching,
          ),
        ),
        iconbuttons(Icons.search, context, () {}),
        iconbuttons(Icons.clear, context, emptyTheTextFormField),
      ),
      backgroundColor: cardColorbg,
      body: futureSearchResults == null
          ? displayNoSearchResultScreen()
          : displayUsersFoundScreen(),
    );
  }
}

class UserResult extends StatelessWidget {
  final User_ eachUser;
  UserResult(this.eachUser);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        color: cardColorbg,
        child: Column(
          children: [
            GestureDetector(
              onTap: () => print("tapped"),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage:
                      CachedNetworkImageProvider('${eachUser.url}'),
                ),
                title: Text(
                  '${eachUser.profileName}',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                subtitle: Text(
                  eachUser.username,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
