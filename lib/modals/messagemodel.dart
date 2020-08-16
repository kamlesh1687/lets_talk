// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    this.id,
    this.isMsgread,
    this.firstName,
    this.profilepic,
    this.msgtime,
    this.message,
  });

  String id;
  bool isMsgread;
  String firstName;
  String profilepic;
  String msgtime;
  List<Message> message;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    id: json["id"],
    isMsgread: json["isMsgread"],
    firstName: json["first_name"],
    profilepic: json["profilepic"],
    msgtime: json["msgtime"],
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isMsgread": isMsgread,
    "first_name": firstName,
    "profilepic": profilepic,
    "msgtime": msgtime,
    "message": List<dynamic>.from(message.map((x) => x.toJson())),
  };
}

class Message {
  Message({
    this.isMe,
    this.msg,
  });

  bool isMe;
  String msg;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    isMe: json["isMe"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "isMe": isMe,
    "msg": msg,
  };
}
