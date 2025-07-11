import 'package:flutter/material.dart';
import 'package:my_store/core/resources/colors/colors.dart';
import 'package:my_store/core/resources/styles/app_sized_box.dart';
import 'package:my_store/features/home/view/widget/home_appBar.dart';
import 'package:my_store/features/home/view/widget/home_categories_list.dart';
import 'package:my_store/features/home/view/widget/home_slider.dart';
import 'package:my_store/features/home/view/widget/home_text_headers.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: HomeAppBar(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          AppSizedBox.sizedH15,
          HomeTextHeaders(text: "Exclusive Offers for You"),
          AppSizedBox.sizedH15,
          HomeSlider(),
          AppSizedBox.sizedH35,
          HomeTextHeaders(text: "Explore Our Categories"),
          AppSizedBox.sizedH15,
          HomeCategoriesList(),
        ],
      ),
    );
  }
}
