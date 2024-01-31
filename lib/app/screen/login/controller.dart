import 'package:chat_app/app/app.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final state = LoginState();

  Future<void> login() async {
    if (!state.loginForm.currentState!.validate()) return;
    state.isLoading(true);
    try {
      await state.authService.login(state.emailCtrl.text, state.passwordCtrl.text);
      state.isLoading(false);
    } catch (e) {
      state.isLoading(false);
      showSnack('Ошибка', '$e', SnackType.error);
    }
  }
}
