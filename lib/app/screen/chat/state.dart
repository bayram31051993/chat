import 'package:chat_app/app/data/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatState {
  RxBool isLoading = false.obs;

  ChatServices chatServices = ChatServices();
  AuthService authService = AuthService();

  TextEditingController messageCtrl = TextEditingController();
}
