import 'package:european_single_marriage/views/screens%20widgets/home%20Widget/match_card.dart';
import 'package:european_single_marriage/views/screens%20widgets/home%20Widget/selected_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:european_single_marriage/controller/home%20controller/matches_controller.dart';
import 'package:european_single_marriage/core/common/custam_container.dart';
import 'package:european_single_marriage/core/extensions/size_box_extension.dart';
import 'package:european_single_marriage/core/utils/constant/app_colors.dart';
import 'package:european_single_marriage/core/utils/constant/app_sizes.dart';
import 'package:european_single_marriage/views/screens%20widgets/home%20Widget/search_field.dart';

class MatchesScreen extends StatelessWidget {
  final MatchesController controller = Get.put(MatchesController());
  MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Column(
        children: [
          CustomContainer(
            padding: EdgeInsets.only(top: AppSizes.lg),
            color: AppColors.appBarColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingSH,
                vertical: AppSizes.paddingSV,
              ),
              child: SearchField(),
            ),
          ),
          AppSizes.spaceBtwItems.heightBox,
          SelectedTabBar(tabs: controller.tabs),
          AppSizes.spaceBtwItems.heightBox,
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.matches.length,
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  final match = controller.matches[index];
                  return MatchCard(match: match);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
