import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'package:letstalk/Data_models/user.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
User_ currentUser;

final usersReference = FirebaseFirestore.instance.collection("users");

final DateTime timestamp = DateTime.now();
bool isSignedIn = false;
AuthServices authobject = AuthServices();

class AuthServices {
  //Checking whether user is signedin or not
  controlSignIn(GoogleSignInAccount signInAccount) async {
    print("heelo guys");
    if (signInAccount != null) {
      // await saveUserInfoToFiresStore(context);

      isSignedIn = true;
    } else {
      isSignedIn = false;
    }
  }

  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    }
    return false;
  }

  saveinfo() {
    if (isLoggedIn()) {
      saveUserInfoToFiresStore();
    }
  }

  //this is for saving user info to fire store(cloud storage)
  Future saveUserInfoToFiresStore() async {
    print("started saving user info 3");
    final GoogleSignInAccount gCurrentUser = googleSignIn.currentUser;
    DocumentSnapshot documentSnapshot =
        await usersReference.doc(gCurrentUser.id).get();
    if (!documentSnapshot.exists) {
      final username = gCurrentUser.displayName;
      // await Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => CreateAccountPage()));

      usersReference.doc(gCurrentUser.id).set({
        "id": gCurrentUser.id,
        "profileName": gCurrentUser.displayName,
        "username": username,
        "url": gCurrentUser.photoUrl,
        "email": gCurrentUser.email,
        "bio": "Hey there!!",
        "timestamp": timestamp
      });
      documentSnapshot = await usersReference.doc(gCurrentUser.id).get();
    }
    currentUser = User_.fromDocument(documentSnapshot);
  }

  //this function is for google signIn
  Future<String> gSignInFunction() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignInAccount googleuser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleuser.authentication;
    // ignore: deprecated_member_use
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;
    saveinfo();
    print(user.displayName);

    return 'signInWithGoogle succeeded: $user';
  }
}
