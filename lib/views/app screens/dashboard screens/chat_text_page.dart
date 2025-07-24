import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:european_single_marriage/controller/home%20controller/message_text_controller.dart';
import 'package:european_single_marriage/core/common/custam_container.dart';
import 'package:european_single_marriage/core/common/custom_svg.dart';
import 'package:european_single_marriage/core/common/custom_text.dart';
import 'package:european_single_marriage/core/extensions/size_box_extension.dart';
import 'package:european_single_marriage/core/utils/constant/app_colors.dart';
import 'package:european_single_marriage/core/utils/constant/app_images.dart';
import 'package:european_single_marriage/core/utils/constant/app_sizes.dart';
import 'package:european_single_marriage/views/screens%20widgets/home%20Widget/Message%20Text%20Widget/more_option.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MessageTextPage extends StatelessWidget {
  final MessageTextController controller = Get.put(MessageTextController());

  MessageTextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          messageAppBar(context),
          Expanded(child: Obx(() => chatMessages(context))),
          messageInput((context)),
          Obx(
            () => Offstage(
              offstage: !controller.isemojiVisible.value,
              child: SizedBox(
                height: 250,
                child: EmojiPicker(
                  onEmojiSelected: (category, emojy) {
                    controller.chatTypeController.text =
                        controller.chatTypeController.text + emojy.emoji;
                  },
                  onBackspacePressed: () {},
                  config: Config(
                    height: 256,

                    checkPlatformCompatibility: true,
                    emojiViewConfig: EmojiViewConfig(
                      columns: 7,
                      verticalSpacing: 0,
                      horizontalSpacing: 0,
                      backgroundColor: AppColors.white,
                      emojiSizeMax:
                          28 *
                          (foundation.defaultTargetPlatform ==
                                  TargetPlatform.iOS
                              ? 1.20
                              : 1.0),
                    ),
                    bottomActionBarConfig: BottomActionBarConfig(
                      showSearchViewButton: false,
                      enabled: false,
                    ),
                    viewOrderConfig: const ViewOrderConfig(
                      top: EmojiPickerItem.categoryBar,
                      middle: EmojiPickerItem.emojiView,
                    ),
                    skinToneConfig: const SkinToneConfig(),
                    categoryViewConfig: const CategoryViewConfig(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget messageAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.paddingSH - 20,
        vertical: 8,
      ),
      decoration: BoxDecoration(color: AppColors.appBarColor),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: CustomSvgImage(
                    image: "assets/svg/arrowBackward.svg",
                    width: 16,
                    height: 16,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),

                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(AppImages.imageURL),
                ),
              ],
            ),

            AppSizes.sm.widthBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: 'Mike Thompson',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  CustomText(
                    title: 'Online',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomSvgImage(image: AppImages.vedioCall),
                AppSizes.sm.widthBox,
                CustomSvgImage(image: AppImages.call),
                AppSizes.sm.widthBox,
                MoreOptionsPopupMenu(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget chatMessages(BuildContext context) {
    return ListView.builder(
      controller: controller.scrollController,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingSH),
      itemCount: controller.messages.length,
      itemBuilder: (context, index) {
        final message = controller.messages[index];
        final isSender = message.isSender;

        String? dayLabel;
        if (_shouldShowDateLabel(index)) {
          dayLabel = _formatDateLabel(message.day!);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppSizes.sm.heightBox,
            if (dayLabel != null) ...[
              CustomContainer(
                width: 85,
                color: AppColors.appBarColor,
                padding: EdgeInsets.all(10),
                cir: 20,
                child: CustomText(
                  title: dayLabel,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              AppSizes.xs.heightBox,
            ],
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.sm),
              child: Row(
                mainAxisAlignment:
                    isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment:
                          isSender
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                      children: [
                        messageBubble(message.message, context, isSender),
                        4.heightBox,
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomText(
                              title: message.time,
                              fontSize: 11,
                              color: AppColors.gray1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget messageBubble(String text, BuildContext context, bool isSender) {
    final double maxWidth = MediaQuery.of(context).size.width * 0.9;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.sm + 2,
          vertical: AppSizes.sm + 2,
        ),
        decoration: BoxDecoration(
          color: isSender ? const Color(0xFFD3B174) : const Color(0xFFC4C4C4),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: isSender ? Radius.circular(10) : Radius.circular(0),
            bottomRight: isSender ? Radius.circular(0) : Radius.circular(10),
          ),
        ),
        child: CustomText(
          title: text,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          maxLines: null,
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }

  Widget messageInput(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 70,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.orange, width: 1.0)),
      ),
      child: Row(
        children: [
          AppSizes.spaceBtwItems.widthBox,
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD3B174)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.chatTypeController,
                      focusNode: controller.focusNode,
                      decoration: InputDecoration(
                        prefixIcon: CustomSvgImage(
                          image: "assets/svg/link.svg",
                          height: 22,
                          width: 22,
                        ),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 22,
                          minHeight: 22,
                        ),
                        hintText: "Type your message",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: CustomSvgImage(image: "assets/svg/Emoji.svg"),
                    onPressed: () {
                      controller.isemojiVisible.value =
                          !controller.isemojiVisible.value;
                      controller.focusNode.unfocus();
                      controller.focusNode.canRequestFocus = true;
                    },
                  ),
                ],
              ),
            ),
          ),

          AppSizes.spaceBtwItems.widthBox,
          CustomContainer(
            fun: () => controller.sendMessage(),
            padding: EdgeInsets.all(10),
            color: Color(0xFFD3B174),
            shape: BoxShape.circle,

            child: SvgPicture.asset("assets/svg/send.svg"),
          ),
        ],
      ),
    );
  }

  bool _isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool _shouldShowDateLabel(int index) {
    if (index == 0) return true;

    final current = controller.messages[index].day;
    final previous = controller.messages[index - 1].day;
    return !_isSameDate(current!, previous!);
  }

  String _formatDateLabel(DateTime date) {
    final now = DateTime.now();
    final yesterday = now.subtract(Duration(days: 1));

    if (_isSameDate(date, now)) return "Today";
    if (_isSameDate(date, yesterday)) return "Yesterday";

    return "${date.day}/${date.month}/${date.year}";
  }
}
