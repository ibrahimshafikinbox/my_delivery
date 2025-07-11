import 'package:get/get.dart';
import 'package:my_store/features/stores/controller/store_controller.dart';

class StoresBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoresController());
  }
}
