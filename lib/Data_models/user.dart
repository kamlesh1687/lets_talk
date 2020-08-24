import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class User_ {
  final String id;
  final String profileName;
  final String username;
  final String url;
  final String email;
  final String bio;

  User_({
    this.id,
    this.profileName,
    this.username,
    this.url,
    this.email,
    this.bio,
  });

  factory User_.fromDocument(DocumentSnapshot doc) {
    return User_(
      id: doc.id,
      email: doc.data()['email'],
      username: doc.data()['username'],
      url: doc.data()['url'],
      profileName: doc.data()['profileName'],
      bio: doc.data()['bio'],
    );
  }
}
