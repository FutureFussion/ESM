import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  var isProfilePic = false.obs;
  var profilePicPath = "".obs;
  void setProfileImagePath(String path) {
    profilePicPath.value = path;
    isProfilePic.value = true;
  }

  TextEditingController fullName = TextEditingController();

  var selectedReligion = ''.obs;
  var selectedCaste = ''.obs;
  var selectedSubCaste = ''.obs;
  var materialStatus = ''.obs;
}
