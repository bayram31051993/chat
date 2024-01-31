import 'package:chat_app/app/screen/home/home.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  final state = HomeState();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    state.usersList.bindStream(state.chatServices.getUsers());
  }
}
