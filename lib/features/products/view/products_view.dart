import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/resources/colors/colors.dart';
import 'package:my_store/core/resources/styles/app_text_style.dart';
import 'package:my_store/features/products/view/widget/products_grid_viw.dart';
import '../controller/products_controller.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductsController>();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Products', style: AppTextStyle.textStyleBoldBlack),
        backgroundColor: AppColors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Get.toNamed('/cart');
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return const ProductGridView();
      }),
    );
  }
}
