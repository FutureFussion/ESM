import 'package:european_single_marriage/controller/auth%20controller/register_controller.dart';
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

class BasicDetails extends StatelessWidget {
  final controller = Get.put(RegisterController());

  BasicDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegisterHeader(
                step: 1,
                title: "Basic Details",
                subtitle: "Next Step: Religion Details",
                heading: "Please provide your basic details:",
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingSH,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      title: "Age",
                      hintText: "26",
                      keyboardType: TextInputType.number,
                      controller: controller.ageController,
                    ),
                    CustomTextField(
                      title: "Date Of Birth:",
                      keyboardType: TextInputType.text,
                      hintText: "",
                      controller: controller.dobController,
                    ),
                    CustomTextField(
                      title: "Email ID:",
                      hintText: "",
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                    ),
                    AppSizes.spaceMd.heightBox,

                    CustomToggleSelector(
                      title: "Gender",
                      options: ['Male', 'Female'],
                      selectedValue: controller.selectedGender,
                      onChanged:
                          (value) => controller.selectedGender.value = value,
                    ),

                    SizedBox(height: context.screenHeight * 0.1),
                    MainButton(
                      title: "Continue",
                      onPressed: () {
                        Get.toNamed(AppRoutes.religionDetails);
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
