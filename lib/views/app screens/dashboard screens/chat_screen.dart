import 'package:european_single_marriage/controller/home%20controller/chat_controller.dart';
import 'package:european_single_marriage/core/common/custam_container.dart';
import 'package:european_single_marriage/core/common/custom_text.dart';
import 'package:european_single_marriage/core/extensions/size_box_extension.dart';
import 'package:european_single_marriage/core/utils/constant/app_colors.dart';
import 'package:european_single_marriage/core/utils/constant/app_sizes.dart';
import 'package:european_single_marriage/model/chat_model.dart';
import 'package:european_single_marriage/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  final ChatController controller = Get.put(ChatController());

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            color: AppColors.appBarColor,
            child: SafeArea(
              child: Center(
                child: CustomText(
                  title: "Chat",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          AppSizes.spaceBtwSections.heightBox,

          Obx(
            () => CustomContainer(
              margin: const EdgeInsets.symmetric(horizontal: 16),

              cir: 50,
              borders: true,
              borderCol: AppColors.orange,
              child: Row(
                children: List.generate(controller.tabs.length, (index) {
                  final isSelected = controller.selectedIndex.value == index;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => controller.selectedIndex.value = index,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),

                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? AppColors.primaryColor
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        alignment: Alignment.center,
                        child: Center(
                          child: CustomText(
                            title: controller.tabs[index],
                            maxLines: 1,
                            fontSize: 12,
                            color:
                                isSelected
                                    ? AppColors.white
                                    : Color(0xFF9C9C9C),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          AppSizes.spaceBtwItems.heightBox,

          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.chats.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final ChatModel chat = controller.chats[index];
                  return Column(
                    children: [
                      ListTile(
                        onTap: () => Get.toNamed(AppRoutes.messageTextPage),

                        leading: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(chat.image),
                            ),
                            if (chat.isOnline)
                              Positioned(
                                top: -2,
                                left: 12,
                                child: CircleAvatar(
                                  radius: 8,
                                  backgroundColor: AppColors.primaryColor,
                                ),
                              ),
                          ],
                        ),
                        horizontalTitleGap: 0,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              title: chat.name,

                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                            CustomText(
                              title: chat.time,
                              color: Color(0xFF999999),
                              fontSize: (chat.unreadCount > 0) ? 14 : 12,
                              fontWeight:
                                  (chat.unreadCount > 0)
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                            ),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    if (chat.message.startsWith("✓✓"))
                                      const TextSpan(
                                        text: "✓✓ ",
                                        style: TextStyle(
                                          color: AppColors.blue,
                                          fontSize: 14,
                                        ),
                                      ),
                                    TextSpan(
                                      text: chat.message.replaceFirst(
                                        "✓✓ ",
                                        "",
                                      ),
                                      style: const TextStyle(
                                        color: Color(0xFF999999),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                            if (chat.unreadCount > 0)
                              Container(
                                margin: const EdgeInsets.only(left: 8),
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF1BE05E),
                                  shape: BoxShape.circle,
                                ),
                                child: CustomText(
                                  title: chat.unreadCount.toString(),
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                          ],
                        ),
                      ),
                      const Divider(color: Color(0xFFF2F2F2)),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
