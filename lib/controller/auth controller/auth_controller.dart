import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController loginUserName = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController registerPassword = TextEditingController();

  RxBool isPasswordHidden = true.obs;
}
