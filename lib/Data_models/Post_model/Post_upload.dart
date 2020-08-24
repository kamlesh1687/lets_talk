import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:letstalk/Services/Auth_services.dart';

CollectionReference ref = FirebaseFirestore.instance.collection('posts');
var user = FirebaseAuth.instance.currentUser;

class Postdata {
  //checking whether user is logged or not
  bool isLoggedIn() {
    if (user != null) {
      return true;
    }
    return false;
  }

//For adding data

  Future<void> addPostData(userdata) async {
    if (isLoggedIn()) {
      ref.doc('${currentUser.id}').set(postdata);
    } else {
      print("You need to logIn");
    }
  }

//user data model
  var postdata = {
    'owner_id': user.uid,
    'post_discription': "this is new post",
    'post_location': "Chittorgarh",
    'post_time': "2:13pm"
        'post_likes'
  };
}
