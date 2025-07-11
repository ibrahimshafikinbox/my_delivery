import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:my_store/core/constants/api_consts.dart';
import 'package:my_store/features/products/model/products_model.dart';
import 'dart:convert';

class ProductsController extends GetxController {
  var products = <ProductModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(ApiConsts.getProducts));
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        products.value = data.map((e) => ProductModel.fromJson(e)).toList();
      }
    } catch (e) {
      print('❌ Error fetching products: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
