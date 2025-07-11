import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/resources/colors/colors.dart';
import 'package:my_store/core/resources/styles/app_sized_box.dart';
import 'package:my_store/features/cart/view/widget/cart_item.dart';
import 'package:my_store/features/cart/view/widget/confirmation_dialog.dart';
import 'package:my_store/features/cart/view/widget/summary_row.dart';
import 'package:my_store/features/login/view/widgets/default_button.dart';
import '../controller/cart_controller.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text('My Cart'),
        centerTitle: false,
        elevation: 1,
      ),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart_outlined, size: 60),
                AppSizedBox.sizedH10,
                Text("Your cart is empty"),
              ],
            ),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ...controller.cartItems.map((item) => CartItem(cartItem: item)),
              AppSizedBox.sizedH20,
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    SummaryRow(
                        label: 'Subtotal:',
                        value:
                            '${controller.totalPrice.toStringAsFixed(2)} EGP'),
                    const SummaryRow(label: 'Shipping:', value: 'Free'),
                    SummaryRow(
                      label: 'Total:',
                      value: '${controller.totalPrice.toStringAsFixed(2)} EGP',
                      isBold: true,
                    ),
                    AppSizedBox.sizedH15,
                    GestureDetector(
                      onTap: () {
                        Get.dialog(
                          ConfirmationDialog(
                            title: 'Confirm Payment',
                            content: 'Are you sure you want to proceed?',
                            onConfirm: () {
                              controller.clearCart();
                              Get.back();
                              Get.snackbar(
                                  'Success', 'Order placed successfully!');
                            },
                          ),
                        );
                      },
                      child: DefaultButton(
                          function: () {},
                          text: "Confirm Payment",
                          textColor: AppColors.white,
                          bottonColor: AppColors.blue),
                      // child: Container(
                      //   width: double.infinity,
                      //   padding: const EdgeInsets.symmetric(vertical: 14),
                      //   decoration: BoxDecoration(
                      //     color: Colors.purple,
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      //   child: const Center(
                      //     child: Text(
                      //       'Confirm Payment',
                      //       style: TextStyle(
                      //           color: Colors.white,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //   ),
                      // ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
