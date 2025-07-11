import 'package:get/get.dart';
import '../model/store_model.dart';

class StoresController extends GetxController {
  late String category;

  @override
  void onInit() {
    super.onInit();
    category = Get.arguments['category'];
  }

  final stores = <StoreModel>[
    StoreModel(
      name: 'Carrefour',
      description: 'Wide range of groceries and more',
      image: 'assets/img/slider_1.png',
      rating: 4.8,
    ),
    StoreModel(
      name: 'Spinneys',
      description: 'Fresh produce and household items',
      image: 'assets/img/slider_2.png',
      rating: 4.5,
    ),
    StoreModel(
      name: 'Hyper One',
      description: 'Everything you need under one roof',
      image: 'assets/img/slider_3.png',
      rating: 4.2,
    ),
    StoreModel(
      name: 'Seoudi Market',
      description: 'Premium supermarket experience',
      image: 'assets/img/slider_1.png',
      rating: 4.0,
    ),
    StoreModel(
      name: 'Gourmet Egypt',
      description: 'High quality food and groceries',
      image: 'assets/img/slider_2.png',
      rating: 4.7,
    ),
    StoreModel(
      name: 'Metro Market',
      description: 'Reliable grocery shopping',
      image: 'assets/img/slider_3.png',
      rating: 4.1,
    ),
    StoreModel(
      name: 'Kazyon',
      description: 'Affordable daily essentials',
      image: 'assets/img/slider_1.png',
      rating: 3.9,
    ),
    StoreModel(
      name: 'Awlad Ragab',
      description: 'Trusted local supermarket chain',
      image: 'assets/img/slider_2.png',
      rating: 4.3,
    ),
  ].obs;
}
