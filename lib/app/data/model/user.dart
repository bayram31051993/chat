import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uId;
  String? name;
  String? email;
  String? lastMessage;
  String? date;

  UserModel({this.uId, this.name, this.email, this.lastMessage, this.date});

  UserModel.fromMap(DocumentSnapshot data) {
    uId = data['uid'];
    name = data['name'];
    email = data['email'];
    lastMessage = data['lastMessage'];
    date = data['date'];
  }
}
