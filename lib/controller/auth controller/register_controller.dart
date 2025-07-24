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

  RxList<File> pickedImages = <File>[].obs;

  Future<void> pickFromGallery() async {
    final picker = ImagePicker();
    final picked = await picker.pickMultiImage();

    if (picked != null) {
      pickedImages.addAll(picked.map((x) => File(x.path))); // ✅ Add to existing list
    }
  }

  Future<void> pickFromFileBrowser() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
    );

    if (result != null) {
      pickedImages.addAll(result.paths.map((path) => File(path!))); // ✅ Add to existing list
    }
  }


  // ==================== Image Picker ===================//
  TextEditingController ageController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController familyValuesController = TextEditingController();
  TextEditingController aboutYourselfController = TextEditingController();

  var selectedGender = ''.obs;

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
  var maritalStatus = ''.obs;
  var numberOfChildren = ''.obs;
  var isChildrenLivingWithYou = ''.obs;
  var height = ''.obs;
  var familyStatus = ''.obs;
  var familyType = ''.obs;

  List<String> maritalStatusOptions = ['Married', 'Unmarried', 'Divorced'];
  List<String> childrenOptions = ['0', '1', '2', '3', '4', '5'];
  List<String> heightOption = [
    "4’6”",
    "5’2”",
    "5’3”",
    "6’0”",
    "6’6”",
    "6’9”",
    "7’2”",
  ];

  List<String> familyStatusOptions = [
    'Middle Class',
    'Upper Class',
    'Rich',
    'Normal',
  ];
  void updateFamilyType(String value) => familyType.value = value;
  void updateisChildrenLivingWithYou(String value) => familyType.value = value;

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
