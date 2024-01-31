import 'package:chat_app/app/app.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final state = ChatState();

  Future<void> onSendMessage(String receiverId) async {
    if (state.messageCtrl.text.isEmpty) return;

    await state.chatServices.sendMessage(receiverId, state.messageCtrl.text);

    state.messageCtrl.clear();
  }
}
