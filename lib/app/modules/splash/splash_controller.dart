
// class SplashController extends GetxController {
//   final controller = Get.lazyPut(() => SplashBindings());

//   @override
//   void onInit() async {
//     debugPrint('onInit');

//     super.onInit();
//   }

//   @override
//   void onReady() async {
//     await Future.delayed(const Duration(seconds: 5));
//     Get.offAndToNamed(Routes.homeScreen);
//     super.onReady();
//   }
// }


// Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Lottie.asset('assets/pan_q.json'),
//             const SizedBox(height: 12),
//             const Text(
//               'PAN_Q',
//               style: TextStyle(fontSize: 48),
//             ),
//             const SizedBox(height: 64),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           primary: Colors.white,
//                           shape: RoundedRectangleBorder(
//                               side: const BorderSide(
//                                   color: Colors.black, width: 2),
//                               borderRadius: BorderRadius.circular(16))),
//                       onPressed: () {
//                         Get.toNamed(Routes.homeScreen);
//                       },
//                       child: const Padding(
//                         padding: EdgeInsets.all(12.0),
//                         child: Text(
//                           'Entrar',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );