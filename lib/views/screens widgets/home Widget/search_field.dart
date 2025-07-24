import 'package:european_single_marriage/controller/home%20controller/matches_controller.dart';
import 'package:european_single_marriage/core/extensions/size_box_extension.dart';
import 'package:european_single_marriage/core/utils/constant/app_colors.dart';
import 'package:european_single_marriage/core/utils/constant/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final MatchesController controller = Get.find();

    return Column(
      children: [
        AppSizes.spaceBtwItems.heightBox,
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color(0x40B9B9B9),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
          child: TextField(
            // onChanged: (value) => controller.searchQuery.value = value,
            decoration: const InputDecoration(
              hintText: "Search by criteria",
              border: InputBorder.none,
              icon: Icon(Icons.search),
            ),
          ),
        ),
        AppSizes.spaceBtwItems.heightBox,
      ],
    );
  }
}
