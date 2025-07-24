import 'dart:async';
import 'package:european_single_marriage/routes/app_routes.dart';
import 'package:get/get.dart';

class SpalshScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 5), () {
      Get.offAllNamed(AppRoutes.onBoardingScreen);
    });
  }
}
