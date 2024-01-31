import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app.dart';

Widget lastMessage(String receiverId, BuildContext context) {
  final AuthService authService = AuthService();
  String senderId = authService.getCurrentUser().uid;
  final ChatServices chatServices = ChatServices();
  return StreamBuilder(
    stream: chatServices.getMessage(receiverId, senderId),
    builder: (context, snapShot) {
      bool isCurrentUser = false;
      try {
        isCurrentUser = snapShot.data!.docs.last['senderId'] == authService.getCurrentUser().uid;
      } catch (e) {
        isCurrentUser = false;
      }
      if (snapShot.hasError) {
        return const Text('Произошла ошибка по пробуйте чуть позже');
      }

      if (snapShot.connectionState == ConnectionState.waiting) {
        return const Text('Загрузка');
      }

      return Column(
        children: [
          if (snapShot.data!.docs.isNotEmpty) SizedBox(height: 10.h),
          Text(isCurrentUser
              ? 'Вы: ${snapShot.data!.docs.last['message']}'
              : snapShot.data!.docs.isNotEmpty
                  ? snapShot.data!.docs.last['message']
                  : ''),
        ],
      );
    },
  );
}
