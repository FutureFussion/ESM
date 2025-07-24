import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:european_single_marriage/model/matches_model.dart';
import 'package:european_single_marriage/core/utils/constant/app_images.dart';
import 'package:european_single_marriage/model/tab_items.dart';

class MatchesController extends GetxController {
  final RxList<TabItems> tabs =
      [
        TabItems(image: 'assets/svg/filters.svg', text: 'Filters'),
        TabItems(text: 'Match Preference'),
        TabItems(text: 'Basic Details'),
        TabItems(text: 'Religious Details'),
        TabItems(text: 'Profissional Details'),
        TabItems(text: 'Location Details'),
        TabItems(text: 'Family Details'),
      ].obs;

  RxList<MatchesModel> matches =
      <MatchesModel>[
        MatchesModel(
          name: 'G. Srivalli',
          age: 22,
          height: '5’0”',
          education: 'B-tech',
          location: 'Hyderabad',
          profession: 'Software Engg.',
          imageUrl: AppImages.imageURL,
        ),
        MatchesModel(
          name: 'N. Meera',
          age: 23,
          height: '5’4”',
          education: 'MCA',
          location: 'Bangalore',
          profession: 'UI Designer',
          imageUrl: AppImages.imageURL,
        ),
      ].obs;

  RxString profileInterested = ''.obs;

  RxList<String> images = [AppImages.imageURL, AppImages.imageURL].obs;
  RxInt pageIndex = 0.obs;
  PageController pageController = PageController();
}
