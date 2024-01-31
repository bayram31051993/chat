import 'package:chat_app/app/data/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginState {
  RxBool isLoading = false.obs;

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  GlobalKey<FormState> loginForm = GlobalKey<FormState>();

  AuthService authService = AuthService();
}
