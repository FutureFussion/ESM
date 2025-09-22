// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SplashServices {
//   void isLogin(BuildContext context) async {
//     final email = await AppStorage.get('email');
//     print("Splash email : $email");
//     Timer(const Duration(seconds: 1), () {
//       if (email != null && email.toString().isNotEmpty) {
//         Get.offAllNamed(RouteName.selectCategoriesPage);
//         // Get.offAllNamed(RouteName.bnbPage);
//       } else {
//         Get.offAllNamed(RouteName.signInPage);
//       }
//     });
//   }
// }
