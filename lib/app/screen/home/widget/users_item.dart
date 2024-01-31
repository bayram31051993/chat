import 'dart:math';

import 'package:chat_app/app/app.dart';
import 'package:chat_app/app/data/model/user.dart';
import 'package:chat_app/app/screen/home/widget/last_date.dart';
import 'package:chat_app/app/screen/home/widget/last_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserItem extends StatelessWidget {
  final UserModel user;
  final AuthService authService;
  const UserItem({super.key, required this.user, required this.authService});

  @override
  Widget build(BuildContext context) {
    return user.uId == authService.getCurrentUser().uid
        ? const SizedBox()
        : InkWell(
            onTap: () => Get.to(() => ChatScreen(senderName: user.name!, receiverId: user.uId!)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    children: [
                      Container(
                        height: 50.h,
                        width: 50.w,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                        ),
                        child: Text(
                          user.name!.substring(0, 1),
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            user.name ?? '',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 0.75.sw,
                            child: Row(
                              children: [
                                lastMessage(user.uId!, context),
                                const Spacer(),
                                lastDate(
                                  user.uId!,
                                  context,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const MyDivider(),
              ],
            ),
          );
  }
}
