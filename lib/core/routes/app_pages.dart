import 'package:get/get.dart';
import 'package:my_store/features/cart/binding/cart_binding.dart';
import 'package:my_store/features/cart/view/cart_view.dart';
import 'package:my_store/features/home/binding/home_binding.dart';
import 'package:my_store/features/home/view/home_view.dart';
import 'package:my_store/features/products/binding/products_binding.dart';
import 'package:my_store/features/products/view/products_view.dart';
import 'package:my_store/features/stores/binding/store_binding.dart';
import 'package:my_store/features/stores/view/store_view.dart';
import '../../features/login/binding/login_binding.dart';
import '../../features/login/view/login_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: AppRoutes.stores,
      page: () => const StoresView(),
      binding: StoresBinding(),
      transition: Transition.downToUp,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.products,
      page: () => const ProductsView(),
      binding: ProductsBinding(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => const CartView(),
      binding: CartBinding(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(seconds: 1),
    ),
  ];
}
