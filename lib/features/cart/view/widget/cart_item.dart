import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/cart/controller/cart_controller.dart';
import 'package:my_store/features/cart/model/cart_model.dart';

class CartItem extends StatelessWidget {
  final CartItemModel cartItem;

  const CartItem({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 4),
                )
              ],
            ),
            child: Row(
              children: [
                Image.network(
                  cartItem.product.image,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cartItem.product.title,
                          maxLines: 2, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 6),
                      Text(
                        '${(cartItem.totalPrice).toStringAsFixed(2)} EGP',
                        style: const TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _qtyBtn(
                            icon: Icons.remove,
                            onTap: () => controller
                                .decreaseQuantity(cartItem.product.id),
                            color: Colors.grey.shade300,
                            iconColor: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text('${cartItem.quantity}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ),
                          _qtyBtn(
                            icon: Icons.add,
                            onTap: () => controller
                                .increaseQuantity(cartItem.product.id),
                            color: Colors.purple,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -10,
            right: -10,
            child: GestureDetector(
              onTap: () => controller.removeFromCart(cartItem.product.id),
              child: const CircleAvatar(
                backgroundColor: Colors.red,
                radius: 14,
                child: Icon(Icons.delete, color: Colors.white, size: 16),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _qtyBtn({
    required IconData icon,
    required VoidCallback onTap,
    Color color = Colors.blue,
    Color iconColor = Colors.white,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, size: 16, color: iconColor),
      ),
    );
  }
}
