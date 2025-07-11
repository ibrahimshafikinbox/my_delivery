import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/resources/styles/app_sized_box.dart';
import 'package:my_store/features/home/controller/home_controller.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Column(
      children: [
        Obx(() => CarouselSlider(
              items: controller.sliderImages
                  .map((img) => ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          img,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  controller.currentSliderIndex.value = index;
                },
              ),
            )),
        AppSizedBox.sizedH20,
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.sliderImages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: controller.currentSliderIndex.value == index ? 12 : 8,
                  height: controller.currentSliderIndex.value == index ? 12 : 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.currentSliderIndex.value == index
                        ? Colors.blue
                        : Colors.grey.shade300,
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
