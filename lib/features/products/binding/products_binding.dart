import 'package:get/get.dart';
import 'package:my_store/features/cart/controller/cart_controller.dart';
import '../controller/products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductsController());
    Get.put(CartController());
  }
}
