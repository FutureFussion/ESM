import 'package:european_single_marriage/core/utils/constant/app_images.dart';
import 'package:european_single_marriage/model/home_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt notifications = 2.obs;
  RxInt profileCompletion = 40.obs;
  final user =
      HomeModel(
        name: "Ijaz",
        imageUrl: AppImages.imageURL,
        viewedYou: 5,
        sentRequests: 5,
        receivedRequests: 5,
        acceptedRequests: 5,
        profileCompletion: 0.4,
      ).obs;
}
