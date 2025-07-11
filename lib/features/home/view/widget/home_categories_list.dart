import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/resources/styles/app_sized_box.dart';
import 'package:my_store/core/resources/styles/app_text_style.dart';
import 'package:my_store/features/home/controller/home_controller.dart';

class HomeCategoriesList extends StatelessWidget {
  const HomeCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() => SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (_, index) {
              final category = controller.categories[index];
              return GestureDetector(
                onTap: () => controller.onCategoryTap(category.title),
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          category.asset,
                          fit: BoxFit.contain,
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                    AppSizedBox.sizedH10,
                    Text(
                      category.title,
                      style: AppTextStyle.textStyleBoldBlack,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
