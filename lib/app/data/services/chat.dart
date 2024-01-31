import 'dart:developer';

import 'package:chat_app/app/data/model/message.dart';
import 'package:chat_app/app/data/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<UserModel>> getUsers() {
    return _firestore.collection('Users').snapshots().map((event) {
      return event.docs.map((user) => UserModel.fromMap(user)).toList();
    });
  }

  Future<void> sendMessage(String receiverId, String message) async {
    final String currentUId = _auth.currentUser!.uid;
    final String currentEmail = _auth.currentUser!.email!;
    final DateTime dateTime = DateTime.now();

    MessageModel messageModel = MessageModel(
      senderId: currentUId,
      senderEmail: currentEmail,
      receiverId: receiverId,
      dateTime: dateTime,
      message: message,
    );

    List<String> idList = [currentUId, receiverId];

    idList.sort();

    String chatRoomID = idList.join('_');
    debugPrint('SENDMESSAGE++++++++++> $chatRoomID\nCurrentID: ============> $currentUId');
    await _firestore.collection('Chat').doc(chatRoomID).collection('Messages').add(messageModel.toMap());
  }

  Stream<QuerySnapshot> getMessage(String receiverId, String senderId) {
    List<String> idList = [receiverId, senderId];
    idList.sort();
    String chatRoomID = idList.join('_');

    debugPrint('Get++++++++++> $chatRoomID\nCurrentID: ============> $senderId');

    debugPrint(chatRoomID);
    final result = _firestore
        .collection('Chat')
        .doc(chatRoomID)
        .collection('Messages')
        .orderBy('date_time', descending: false)
        .snapshots();
    debugPrint('${inspect(result)}');
    return result;
  }
}
