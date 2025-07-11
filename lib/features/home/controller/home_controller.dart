import 'package:get/get.dart';
import 'package:my_store/core/resources/images/images.dart';
import 'package:my_store/features/home/model/categories_model.dart';

class HomeController extends GetxController {
  final userName = 'Ibrahim'.obs;
  RxInt currentSliderIndex = 0.obs;

  final sliderImages = [
    AppImages.homeSlider_1,
    AppImages.homeSlider_2,
    AppImages.homeSlider_3,
  ].obs;

  final categories = <CategoryModel>[
    CategoryModel(title: 'Super market', asset: AppImages.market),
    CategoryModel(title: 'child care', asset: AppImages.childCare),
    CategoryModel(title: 'personal care', asset: AppImages.personalCare),
    CategoryModel(title: 'drugs', asset: AppImages.drugs),
    CategoryModel(title: 'fruits', asset: AppImages.fruits),
    CategoryModel(title: 'mixer', asset: AppImages.mixer),
    CategoryModel(title: 'meet', asset: AppImages.meet),
  ].obs;

  void onCategoryTap(String categoryName) {
    Get.toNamed('/stores', arguments: {'category': categoryName});
  }
}
