import 'package:chat_app/app/global/text_field.dart';
import 'package:chat_app/app/screen/home/home.dart';
import 'package:chat_app/app/screen/home/widget/users_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: HomeController(),
      builder: (hc) {
        return Scaffold(
            body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Чаты',
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2B333E),
                    ),
                  ),
                  MyTextFormField(
                    controller: hc.state.searchText,
                    label: 'Поиск',
                    hintText: 'Поиск',
                    prefix: const Icon(
                      Icons.search,
                      size: 30,
                      color: Color(0xFF9DB7CB),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  ListView.builder(
                      itemCount: hc.state.usersList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return UserItem(
                          user: hc.state.usersList[index],
                          authService: hc.state.authService,
                        );
                      })
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
