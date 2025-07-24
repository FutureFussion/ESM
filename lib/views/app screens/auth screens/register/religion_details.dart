import 'package:european_single_marriage/controller/auth%20controller/register_controller.dart';
import 'package:european_single_marriage/core/common/custom_drop_down.dart';
import 'package:european_single_marriage/core/common/custom_text.dart';
import 'package:european_single_marriage/core/common/custom_toggle_selector.dart';
import 'package:european_single_marriage/core/common/main_button.dart';
import 'package:european_single_marriage/core/extensions/media_query.dart';
import 'package:european_single_marriage/core/extensions/size_box_extension.dart';
import 'package:european_single_marriage/core/utils/constant/app_colors.dart';
import 'package:european_single_marriage/core/utils/constant/app_sizes.dart';
import 'package:european_single_marriage/routes/app_routes.dart';
import 'package:european_single_marriage/views/screens%20widgets/auth%20widget/register_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReligionDetails extends StatelessWidget {
  final controller = Get.put(RegisterController());
  ReligionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegisterHeader(
                step: 2,
                title: "Religion Details",
                subtitle: "Next Step: Personal Details",
                backStep: "Basic Details",
                heading: "Please provide your religion details:",
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => CustomDropdown(
                        hint: "Islam",
                        title: "Religion",
                        items: controller.religionOptions,
                        value: controller.selectedReligion.value,
                        onChanged: (val) {
                          (val) => controller.updateReligion(val!);
                        },
                      ),
                    ),
                    Obx(
                      () => CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        activeColor: AppColors.primaryColor,
                        value: controller.willingToMarryOtherCaste.value,
                        onChanged:
                            (val) =>
                                controller.willingToMarryOtherCaste.value =
                                    val!,
                        title: CustomText(
                          title: "Willing to marry from other caste also",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.gray1,
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        visualDensity: const VisualDensity(
                          horizontal: -4,
                          // vertical: -4,
                        ),
                      ),
                    ),

                    Obx(
                      () => CustomDropdown(
                        hint: "",
                        title: "Caste",
                        items: [],
                        value: controller.selectedCaste.value,
                        onChanged: (val) {
                          (val) => controller.updateCaste(val!);
                        },
                      ),
                    ),
                    Obx(
                      () => CustomDropdown(
                        hint: "",
                        title: "Sub Caste",
                        items: [],
                        value: controller.selectedSubCaste.value,
                        onChanged: (val) {
                          (val) => controller.updateSubCaste(val!);
                        },
                      ),
                    ),

                    // CustomToggleSelector(
                    //   title: "Dosham",
                    //   options: ['Yes', 'No', 'Don\'t Know'],
                    //   selectedValue: controller.dosham,
                    //   onChanged: (val) => controller.updateDosham(val),
                    // ),
                    SizedBox(height: context.screenHeight * 0.1),
                    MainButton(
                      title: "Continue",
                      onPressed: () {
                        Get.toNamed(AppRoutes.personalDetails);
                      },
                    ),
                    AppSizes.spaceMd.heightBox,
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
