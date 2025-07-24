import 'package:european_single_marriage/core/utils/constant/app_images.dart';
import 'package:european_single_marriage/model/chat_model.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxList<String> tabs = ["All Messages", "Unread Messages", "Calls"].obs;

  final chats =
      <ChatModel>[
        ChatModel(
          name: "Tamara",
          message: "I'm interested with your profile",
          time: "50 Min",
          image: AppImages.imageURL,
          isOnline: true,
          unreadCount: 2,
        ),
        ChatModel(
          name: "Lavanya",
          message: "✓✓ I'm interested with your profile",
          time: "10:00 AM",
          image: AppImages.imageURL,
        ),
        ChatModel(
          name: "Harika",
          message: "✓✓ pls send me your details",
          time: "10:00 AM",
          image: AppImages.imageURL,
        ),
        ChatModel(
          name: "Kavya",
          message: "✓✓ pls send me your details",
          time: "10:00 AM",
          image: AppImages.imageURL,
        ),
        ChatModel(
          name: "Divya",
          message: "✓✓ pls send me your details",
          time: "10:00 AM",
          image: AppImages.imageURL,
        ),
        ChatModel(
          name: "Deepika",
          message: "✓✓ pls send me your details",
          time: "10:00 AM",
          image: AppImages.imageURL,
        ),
      ].obs;
}
