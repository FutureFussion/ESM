import 'package:european_single_marriage/model/message_text_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageTextController extends GetxController {
  final scrollController = ScrollController();
  TextEditingController chatTypeController = TextEditingController();
  final currentText = ''.obs;

  //=============Emojii Code=======================//
  var isemojiVisible = false.obs;
  FocusNode focusNode = FocusNode();
  
  @override
  void onInit() {
    super.onInit();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        isemojiVisible.value = false;
      }
    });
  }
  @override
  void onClose() {
  chatTypeController.dispose();
  }
  //============End Emojii Code===============//

  final messages =
      <ChatMessage>[
        ChatMessage(
          message:
              "Hai Juan Dela Cruz, I’m on the way to your home, Please wait a moment. Thanks!",
          time: "4:26 Am",

          isSender: false,
          day: DateTime.now().subtract(Duration(days: 1)),
        ),
        ChatMessage(
          message: "Thank You! I’ll be waiting for that",
          time: "5:22 Am",

          isSender: true,
          day: DateTime.now().subtract(Duration(days: 1)),
        ),
        ChatMessage(
          message:
              "Hai Rizal, I’m on the way to your home, Please wait a moment. Thanks!",
          time: "6:28 Am",

          isSender: false,
          day: DateTime.now().subtract(Duration(days: 1)),
        ),
      ].obs;

  void sendMessage() {
    final text = chatTypeController.text.trim();
    if (text.isNotEmpty) {
      messages.add(
        ChatMessage(
          message: text,
          time: TimeOfDay.now().format(Get.context!),
          isSender: true,
          day: DateTime.now(),
        ),
      );
      chatTypeController.clear();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }
}
