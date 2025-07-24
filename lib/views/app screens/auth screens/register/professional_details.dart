import 'package:european_single_marriage/controller/auth%20controller/register_controller.dart';
import 'package:european_single_marriage/core/common/custom_drop_down.dart';
import 'package:european_single_marriage/core/common/main_button.dart';
import 'package:european_single_marriage/core/extensions/media_query.dart';
import 'package:european_single_marriage/core/extensions/size_box_extension.dart';
import 'package:european_single_marriage/core/utils/constant/app_sizes.dart';
import 'package:european_single_marriage/routes/app_routes.dart';
import 'package:european_single_marriage/views/screens%20widgets/auth%20widget/register_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfessionalDetails extends StatelessWidget {
  final controller = Get.put(RegisterController());

  ProfessionalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegisterHeader(
                step: 4,
                title: "Professional Details",
                subtitle: "Next Step: About Yourself",
                backStep: "Personal Details",
                heading: "Please provide your professional details:",
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDropdown(
                      title: "Highest Education:",
                      hint: "No",
                      items: controller.educationOptions,
                      value: controller.education.value,
                      onChanged:
                          (val) => controller.education.value = val ?? '',
                    ),
                    CustomDropdown(
                      title: "Employed In:",
                      hint: "",
                      items: controller.employedInOptions,
                      value: controller.employedIn.value,
                      onChanged:
                          (val) => controller.employedIn.value = val ?? '',
                    ),
                    CustomDropdown(
                      title: "Occupation:",
                      hint: "",
                      items: controller.occupationOptions,
                      value: controller.occupation.value,
                      onChanged:
                          (val) => controller.occupation.value = val ?? '',
                    ),
                    CustomDropdown(
                      title: "Annual Income (Rs):",
                      hint: "",
                      items: [],
                      value: controller.annualIncome.value,
                      onChanged:
                          (val) => controller.annualIncome.value = val ?? '',
                    ),
                    CustomDropdown(
                      title: "Work Location:",
                      hint: "",
                      items: controller.workLocationOptions,
                      value: controller.workLocation.value,
                      onChanged:
                          (val) => controller.workLocation.value = val ?? '',
                    ),
                    CustomDropdown(
                      title: "State:",
                      hint: "",
                      items: [],
                      value: controller.selectedState.value,
                      onChanged:
                          (val) => controller.selectedState.value = val ?? '',
                    ),
                    CustomDropdown(
                      title: "City:",
                      hint: "",
                      items: [],
                      value: controller.selectedCity.value,
                      onChanged:
                          (val) => controller.selectedCity.value = val ?? '',
                    ),

                    SizedBox(height: context.screenHeight * 0.1),
                    MainButton(
                      title: "Continue",
                      onPressed: () {
                        Get.toNamed(AppRoutes.aboutYourself);
                      },
                    ),
                    AppSizes.spaceLg.heightBox,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
