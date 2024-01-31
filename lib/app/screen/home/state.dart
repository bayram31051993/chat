import 'package:chat_app/app/data/services/services.dart';
import 'package:chat_app/app/data/model/user.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class HomeState {
  RxBool isLoading = false.obs;

  TextEditingController searchText = TextEditingController();

  final ChatServices chatServices = ChatServices();

  RxList<UserModel> usersList = RxList<UserModel>([]);

  AuthService authService = AuthService();
}
