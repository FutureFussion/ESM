import 'package:european_single_marriage/controller/auth%20controller/register_controller.dart';
import 'package:european_single_marriage/core/common/custom_drop_down.dart';
import 'package:european_single_marriage/core/common/custom_textfield.dart';
import 'package:european_single_marriage/core/common/custom_toggle_selector.dart';
import 'package:european_single_marriage/core/common/main_button.dart';
import 'package:european_single_marriage/core/extensions/media_query.dart';
import 'package:european_single_marriage/core/extensions/size_box_extension.dart';
import 'package:european_single_marriage/core/utils/constant/app_sizes.dart';
import 'package:european_single_marriage/routes/app_routes.dart';
import 'package:european_single_marriage/views/screens%20widgets/auth%20widget/register_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalDetails extends StatelessWidget {
  final controller = Get.put(RegisterController());
  PersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegisterHeader(
                step: 3,
                title: "Personal Details",
                subtitle: "Next Step: Professional Details",
                backStep: "Religion Details",
                heading: "Please provide your personal details:",
              ),

              Obx(
                () => CustomDropdown(
                  title: "Marital Status",
                  hint: "No",
                  items: controller.maritalStatusOptions,
                  value: controller.maritalStatus.value,
                  onChanged:
                      (val) => controller.maritalStatus.value = val ?? '',
                ),
              ),

              Obx(
                () => CustomDropdown(
                  title: "No. of Children",
                  hint: "",
                  items: controller.childrenOptions,
                  value: controller.numberOfChildren.value,
                  onChanged:
                      (val) => controller.numberOfChildren.value = val ?? '',
                ),
              ),

              CustomToggleSelector(
                title: "Is Children living with you?",
                options: ['Yes', 'No'],
                selectedValue: controller.isChildrenLivingWithYou,
                onChanged: (val) => controller.isChildrenLivingWithYou(val),
              ),

              CustomDropdown(
                title: "Height",
                hint: "",
                items: controller.heightOption,
                value: controller.height.value,
                onChanged: (val) => controller.height.value = val ?? '',
              ),

              CustomDropdown(
                title: "Family Status",
                hint: "",
                items: controller.familyStatusOptions,
                value: controller.familyStatus.value,
                onChanged: (val) => controller.familyStatus.value = val ?? '',
              ),
              CustomToggleSelector(
                title: "Family Type",
                options: ['Joint', 'Nuclear'],
                selectedValue: controller.familyType,
                onChanged: (val) => controller.updateFamilyType(val),
              ),
              CustomTextField(
                title: "Family Values",
                hintText: "",
                controller: controller.familyValuesController,
              ),
              CustomToggleSelector(
                title: "Any Disability",
                options: ['Yes', 'No'],
                selectedValue: controller.familyType,
                onChanged: (val) => controller.updateFamilyType(val),
              ),
              SizedBox(height: context.screenHeight * 0.1),
              MainButton(
                title: "Continue",
                onPressed: () {
                  Get.toNamed(AppRoutes.professionalDetails);
                },
              ),
              AppSizes.spaceMd.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
