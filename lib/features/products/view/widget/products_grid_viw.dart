import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:my_store/core/resources/colors/colors.dart';
import 'package:my_store/features/cart/controller/cart_controller.dart';
import 'package:my_store/features/products/controller/products_controller.dart';
import 'package:my_store/features/products/view/widget/product_item_card.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductsController>();

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: controller.products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 3 / 5,
      ),
      itemBuilder: (_, index) {
        final product = controller.products[index];
        return ProductItemCard(product: product);
      },
    );
  }
}
