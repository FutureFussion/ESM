import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  //=============== Image Picker =============//
  // var pickedImage = Rx<File?>(null);

  // Future<void> pickImage() async {
  //   final picker = ImagePicker();
  //   final image = await picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     pickedImage.value = File(image.path);
  //   } else {
  //     Get.snackbar("No Image", "No image was selected.");
  //   }
  // }
   //=============== Image Picker =============//
  // final pickedImage = Rx<File?>(null);

  // Future<void> pickFromGallery() async {
  //   final picker = ImagePicker();
  //   final image = await picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     pickedImage.value = File(image.path);
  //   } else {
  //     Get.snackbar("No Image", "No image was selected.");
  //   }
  // }

  // Future<void> pickFromFileBrowser() async {
  //   final result = await FilePicker.platform.pickFiles(type: FileType.image);
  //   if (result != null && result.files.single.path != null) {
  //     pickedImage.value = File(result.files.single.path!);
  //   } else {
  //     Get.snackbar("No File", "No file was selected.");
  //   }
  // } //=============== Image Picker =============//




  
  



  // Religion Details
  var selectedReligion = ''.obs;
  var selectedCaste = ''.obs;
  var selectedSubCaste = ''.obs;
  var willingToMarryOtherCaste = false.obs;

  final List<String> religionOptions = [
    "Islam",
    "Christianity",
    "Hinduism",
    "Buddhism",
    "Sikhism",
    "Judaism",
    "Bahá'í Faith",
    "Jainism",
    "Zoroastrianism",
    "Taoism",
    "Shinto",
    "Confucianism",
    "Agnostic",
    "Atheist",
    "Spiritual but not religious",
    "Paganism",
    "Animism",
    "Druidism",
    "Rastafarianism",
    "Unitarian Universalism",
    "Prefer not to say",
    "Other",
  ];

  void updateReligion(String value) => selectedReligion.value = value;
  void updateCaste(String value) => selectedCaste.value = value;
  void updateSubCaste(String value) => selectedSubCaste.value = value;

  // Personal Details Controller
  



 

  // Professional Details
  var education = ''.obs;
  var employedIn = ''.obs;
  var occupation = ''.obs;
  var annualIncome = ''.obs;
  var workLocation = ''.obs;
  var selectedState = ''.obs;
  var selectedCity = ''.obs;

  List<String> educationOptions = [
    'Primary',
    'Middle',
    'Matric',
    'Inter',
    'Bachelor’s',
    'Master’s',
    'M.Phil',
    'Ph.D.',
    'Diploma',
    'Other',
  ];
  List<String> employedInOptions = [
    'Government',
    'Private Sector',
    'Self-employed',
    'Business Owner',
    'Non-profit / NGO',
    'Freelancer',
    'Student',
    'Retired',
    'Unemployed',
    'Other',
  ];

  List<String> occupationOptions = [
    'Student',
    'Teacher',
    'Engineer',
    'Doctor',
    'Nurse',
    'Software Developer',
    'Graphic Designer',
    'Content Writer',
    'Lecturer',
    'Fashion Designer',
    'Beautician',
    'Receptionist',
    'HR Manager',
    'Banker',
    'Air Hostess',
    'Businessman',
    'Businesswoman',
    'Freelancer',
    'Government Employee',
    'Private Employee',
    'Police Officer',
    'Army Officer',
    'Driver',
    'Shopkeeper',
    'Farmer',
    'Laborer',
    'Housewife',
    'Unemployed',
    'Other',
  ];

  List<String> workLocationOptions = ['Remote', 'On-site', 'Hybrid'];

  // About YourSelf
}
