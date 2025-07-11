import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:my_store/core/resources/colors/colors.dart';
import 'package:my_store/core/resources/styles/app_sized_box.dart';
import 'package:my_store/features/cart/controller/cart_controller.dart';
import 'package:my_store/features/products/model/products_model.dart';

class ProductItemCard extends StatelessWidget {
  final ProductModel product;

  const ProductItemCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Image.network(product.image, fit: BoxFit.contain),
                ),
                AppSizedBox.sizedH10,
                Text(product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                AppSizedBox.sizedH5,
                RatingBarIndicator(
                    rating: product.rating,
                    itemCount: 5,
                    itemSize: 16,
                    itemBuilder: (context, _) =>
                        const Icon(Icons.star, color: Colors.amber)),
                AppSizedBox.sizedH5,
                Text('\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.green)),
              ],
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: () {
              cartController.addToCart(product);
              Get.snackbar('Added', '${product.title} added to cart',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: AppColors.green,
                  colorText: AppColors.white);
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              radius: 20,
              child: const Icon(Icons.add_shopping_cart,
                  size: 18, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
