import 'package:chat_app/app/app.dart';
import 'package:chat_app/app/screen/chat/widget/message_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  final String senderName;
  final String receiverId;
  const ChatScreen({super.key, required this.senderName, required this.receiverId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      init: ChatController(),
      builder: (cc) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              senderName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: messageList(
                    cc.state.authService,
                    cc.state.chatServices,
                    receiverId,
                    context,
                  ),
                ),
                Row(
                  children: [
                    Expanded(child: MyTextFormField(controller: cc.state.messageCtrl, label: 'Пишите тут')),
                    IconButton(
                      onPressed: () => cc.onSendMessage(receiverId),
                      icon: const Icon(Icons.send),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
