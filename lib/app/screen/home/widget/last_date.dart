import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../app.dart';

Widget lastDate(String receiverId, BuildContext context) {
  final AuthService authService = AuthService();
  String senderId = authService.getCurrentUser().uid;
  final ChatServices chatServices = ChatServices();

  return StreamBuilder(
    stream: chatServices.getMessage(receiverId, senderId),
    builder: (context, snapShot) {
      late Timestamp timestamp;
      try {
        timestamp = snapShot.data!.docs.last['date_time'];
      } catch (e) {
        timestamp = Timestamp(0, 0);
      }

      DateTime dateTime = timestamp.toDate();
      String dateSt = DateFormat('hh:mm a').format(dateTime);

      if (snapShot.hasError) {
        return const Text('Произошла ошибка по пробуйте чуть позже');
      }

      if (snapShot.connectionState == ConnectionState.waiting) {
        return const Text('Загрузка');
      }

      return Column(
        children: [
          if (snapShot.data!.docs.isNotEmpty) SizedBox(height: 10.h),
          Text(snapShot.data!.docs.isNotEmpty ? dateSt : ''),
        ],
      );
    },
  );
}
