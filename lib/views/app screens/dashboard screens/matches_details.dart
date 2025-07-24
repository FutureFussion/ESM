import 'package:european_single_marriage/controller/home%20controller/matches_details_controller.dart';
import 'package:european_single_marriage/core/common/custom_text.dart';
import 'package:european_single_marriage/core/common/custom_textfield.dart';
import 'package:european_single_marriage/core/extensions/size_box_extension.dart';
import 'package:european_single_marriage/core/utils/constant/app_colors.dart';
import 'package:european_single_marriage/core/utils/constant/app_sizes.dart';
import 'package:european_single_marriage/views/screens%20widgets/home%20Widget/match_card.dart';
import 'package:european_single_marriage/views/screens%20widgets/home%20Widget/search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchesDetails extends StatelessWidget {
  final MatchesDetailsController controller = Get.put(
    MatchesDetailsController(),
  );

  MatchesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 30),
              width: double.infinity,
              color: AppColors.appBarColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const BackButton(),
                  const Expanded(flex: 4, child: SearchField()),
                  AppSizes.sm.widthBox,
                  const CircleAvatar(
                    backgroundColor: AppColors.white,
                    child: Icon(
                      Icons.favorite_border,
                      color: Color(0xFFCFCFCF),
                    ),
                  ),
                ],
              ),
            ),
            AppSizes.sm.heightBox,
            Obx(() => MatchCard(match: controller.matchDetails.value)),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingSH,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: "About her:",
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  AppSizes.sm.heightBox,
                  CustomText(
                    title:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing lit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6D6D6D),
                  ),
                  AppSizes.spaceBtwSections.heightBox,
                  CustomText(
                    title: "Basic Details:",
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  AppSizes.spaceBtwItems.heightBox,
                  CustomTextField(
                    title: "D.O.B",
                    hintText: "",
                    controller: controller.dob,
                    filled: true,
                  ),
                  CustomTextField(
                    title: "Age:",
                    hintText: "",
                    controller: controller.age,
                    filled: true,
                  ),
                  CustomTextField(
                    title: "Mother Tongue:",
                    hintText: "",
                    controller: controller.motherTongue,
                    filled: true,
                  ),
                  CustomTextField(
                    title: "Eating Habits:",
                    hintText: "",
                    controller: controller.eatingHabits,
                    filled: true,
                  ),
                  CustomTextField(
                    title: "Smoking Habits:",
                    hintText: "",
                    controller: controller.smokingHabits,
                    filled: true,
                  ),
                  CustomTextField(
                    title: "Drinking Habits:",
                    hintText: "",
                    controller: controller.drinkingHabits,
                    filled: true,
                  ),
                  CustomTextField(
                    title: "Profile Created by:",
                    hintText: "",
                    controller: controller.profileCreatedBy,
                    filled: true,
                  ),
                  CustomTextField(
                    title: "Material Status:",
                    hintText: "",
                    controller: controller.maritalStatus,
                    filled: true,
                  ),
                  CustomTextField(
                    title: "Lives In:",
                    hintText: "",
                    controller: controller.livesIn,
                    filled: true,
                  ),
                  CustomTextField(
                    title: "Citizen:",
                    hintText: "",
                    controller: controller.citizen,
                    filled: true,
                  ),
                  AppSizes.spaceBtwSections.heightBox,
                  CustomText(
                    title: "Religion Details:",
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  AppSizes.spaceBtwItems.heightBox,
                  CustomTextField(
                    title: "Religion:",
                    hintText: "",
                    controller: controller.religion,
                    filled: true,
                  ),
                  CustomTextField(
                    title: "Caste / Sub-Caste:",
                    hintText: "",
                    controller: controller.caste,
                    filled: true,
                  ),
                  CustomTextField(
                    title: "Gothram:",
                    hintText: "",
                    controller: controller.gothram,
                    filled: true,
                  ),
                  CustomTextField(
                    title: "Dosham:",
                    hintText: "",
                    controller: controller.dosham,
                    filled: true,
                  ),
                  AppSizes.spaceBtwSections.heightBox,
                  CustomText(
                    title: "Professional Details:",
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  AppSizes.spaceBtwItems.heightBox,
                  CustomTextField(
                    title: "Emoloyment:",
                    hintText: "",
                    controller: controller.employment,
                    filled: true,
                  ),
                  AppSizes.spaceBtwItems.heightBox,
                  CustomText(
                    title: "Educational Details:",
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  AppSizes.spaceBtwItems.heightBox,
                  CustomTextField(
                    title: "Degree:",
                    hintText: "",
                    controller: controller.degree,
                    filled: true,
                  ),
                  CustomTextField(
                    title: "University:",
                    hintText: "",
                    controller: controller.university,
                    filled: true,
                  ),
                  AppSizes.spaceBtwItems.heightBox,
                  CustomText(
                    title: "Family Details:",
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  AppSizes.spaceBtwItems.heightBox,
                  CustomTextField(
                    title: "Family Type:",
                    hintText: "",
                    controller: controller.familyType,
                    filled: true,
                  ),
                  CustomTextField(
                    title: "Parents:",
                    hintText: "",
                    controller: controller.parents,
                    filled: true,
                  ),
                  CustomTextField(
                    title: "Ancestral Origin:",
                    hintText: "",
                    controller: controller.ancestralOrigin,
                    filled: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
