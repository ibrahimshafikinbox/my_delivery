import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/resources/images/images.dart';
import 'package:my_store/core/resources/styles/app_sized_box.dart';
import 'package:my_store/core/resources/styles/app_text_style.dart';
import 'package:my_store/features/home/controller/home_controller.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return AppBar(
      title: Obx(() => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(
                    AppImages.person,
                  ),
                ),
                AppSizedBox.sizedW15,
                Text(
                  'Welcome back,${controller.userName.value}',
                  style: AppTextStyle.textStyleBoldBlack.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )),
      backgroundColor: Colors.white,
      elevation: 1,
    );
  }
}
