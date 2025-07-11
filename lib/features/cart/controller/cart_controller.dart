import 'package:get/get.dart';
import 'package:my_store/features/cart/model/cart_model.dart';
import 'package:my_store/features/products/model/products_model.dart';

class CartController extends GetxController {
  var cartItems = <CartItemModel>[].obs;

  void addToCart(ProductModel product) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(CartItemModel(product: product));
    }
    cartItems.refresh();
  }

  void removeFromCart(int productId) {
    cartItems.removeWhere((item) => item.product.id == productId);
    Get.snackbar(
      "success",
      "removed to cart",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void increaseQuantity(int productId) {
    final index = cartItems.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      cartItems[index].quantity++;
      cartItems.refresh();
    }
  }

  void decreaseQuantity(int productId) {
    final index = cartItems.indexWhere((item) => item.product.id == productId);
    if (index != -1 && cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      cartItems.refresh();
    }
  }

  void clearCart() {
    cartItems.clear();
  }

  double get totalPrice => cartItems.fold(
        0.0,
        (sum, item) => sum + item.totalPrice,
      );
}
