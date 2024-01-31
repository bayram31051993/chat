import 'dart:developer';

import 'package:chat_app/app/screen/chat/widget/message_item.dart';
import 'package:flutter/material.dart';

import '../../../app.dart';

Widget messageList(AuthService authService, ChatServices chatServices, String receiverId, BuildContext context) {
  String senderId = authService.getCurrentUser().uid;

  return StreamBuilder(
    stream: chatServices.getMessage(receiverId, senderId),
    builder: (context, snapShot) {
      if (snapShot.hasError) {
        return const Text('Произошла ошибка по пробуйте чуть позже');
      }

      if (snapShot.connectionState == ConnectionState.waiting) {
        return const Text('Загрузка');
      }
      debugPrint('${inspect(snapShot.data!.docs)}');
      return ListView(
        children: snapShot.data!.docs
            .map((doc) => MessageItem(
                  document: doc,
                  authService: authService,
                ))
            .toList(),
      );
    },
  );
}
