import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../app.dart';

class MessageItem extends StatelessWidget {
  final DocumentSnapshot document;
  final AuthService authService;
  const MessageItem({super.key, required this.document, required this.authService});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    bool isCurrentUser = data['senderId'] == authService.getCurrentUser().uid;
    Timestamp timestamp = data['date_time'];
    DateTime dateTime = timestamp.toDate();
    String dateSt = DateFormat('hh:mm a').format(dateTime);
    return Column(
      crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: const BoxDecoration(),
            child: Bubble(
              color: isCurrentUser ? const Color(0XFF3CED78) : const Color(0xFFEDF2F6),
              elevation: 0,
              padding: const BubbleEdges.all(10.0),
              nip: isCurrentUser ? BubbleNip.rightBottom : BubbleNip.leftBottom,
              child: SizedBox(
                width: 0.5.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (!isCurrentUser)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 5),
                        child: Text(
                          dateSt,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: isCurrentUser ? const Color(0xFF00521C) : Colors.black,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    Expanded(
                      child: Text(
                        data['message'],
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: isCurrentUser ? const Color(0xFF00521C) : Colors.black,
                        ),
                        maxLines: 120,
                      ),
                    ),
                    if (isCurrentUser)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 5),
                        child: Text(
                          dateSt,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: isCurrentUser ? const Color(0xFF00521C) : Colors.black,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                  ],
                ),
              ),
            )
            // BubbleNormal(
            //   color: isCurrentUser ? const Color(0XFF3CED78) : const Color(0xFFEDF2F6),
            //   isSender: isCurrentUser,
            //   text: data['message'],
            // ),
            ),
      ],
    );
  }
}
