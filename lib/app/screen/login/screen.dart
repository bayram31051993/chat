import 'package:chat_app/app/global/global.dart';
import 'package:chat_app/app/screen/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<LoginController>(
        init: LoginController(),
        builder: (lc) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: lc.state.loginForm,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextFormField(
                        controller: lc.state.emailCtrl,
                        label: 'email',
                        hintText: 'email',
                        inputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 16.h),
                      MyTextFormField(
                        controller: lc.state.passwordCtrl,
                        label: 'password',
                        hintText: '*******',
                        inputType: TextInputType.visiblePassword,
                      ),
                      lc.state.isLoading.value
                          ? const CustomLoader()
                          : Container(
                              height: 50,
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 15.h),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: ElevatedButton(
                                onPressed: lc.login,
                                style: ElevatedButton.styleFrom(
                                  elevation: 3.5,
                                  splashFactory: InkRipple.splashFactory,
                                  backgroundColor: Colors.blue,
                                  shadowColor: Colors.blue.withOpacity(0.4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                child: Text(
                                  'Войти',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
