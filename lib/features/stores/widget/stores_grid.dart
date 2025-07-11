// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:my_store/features/stores/controller/store_controller.dart';
// import 'package:my_store/features/stores/widget/store_card.dart';

// class StoresGridList extends StatelessWidget {
//   const StoresGridList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<StoresController>();

//     return Obx(() => GridView.builder(
//           itemCount: controller.stores.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 16,
//             mainAxisSpacing: 16,
//             childAspectRatio: 3 / 4,
//           ),
//           itemBuilder: (context, index) {
//             final store = controller.stores[index];
//             return GestureDetector(
//                 onTap: () {
//                   Get.toNamed('/products', arguments: {'store': store.name});
//                 },
//                 child: StoreCard(
//                   store: store,
//                 ));
//           },
//         ));
//   }
// }
