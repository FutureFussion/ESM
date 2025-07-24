import 'package:european_single_marriage/controller/auth%20controller/auth_controller.dart';
import 'package:european_single_marriage/core/common/custom_text.dart';
import 'package:european_single_marriage/core/common/custom_textfield.dart';
import 'package:european_single_marriage/core/common/main_button.dart';
import 'package:european_single_marriage/core/extensions/size_box_extension.dart';
import 'package:european_single_marriage/core/utils/constant/app_colors.dart';
import 'package:european_single_marriage/core/utils/constant/app_images.dart';
import 'package:european_single_marriage/core/utils/constant/app_sizes.dart';
import 'package:european_single_marriage/routes/app_routes.dart';
import 'package:european_single_marriage/views/screens%20widgets/auth%20widget/auth_login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final controller = Get.put(AuthController());
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLogin(
      bgImage: AppImages.login,
      child: Column(
        children: [
          AppSizes.spaceBtwItems.heightBox,
          CustomText(
            title: "Login to your Account",
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
          AppSizes.spaceMd.heightBox,
          CustomTextField(
            title: "Please enter username",
            hintText: "",
            keyboardType: TextInputType.name,
            controller: controller.loginUserName,
          ),
          CustomTextField(
            title: "Please enter password",
            controller: controller.loginPassword,
            keyboardType: TextInputType.name,
            hintText: '',
            obscureText: controller.isPasswordHidden,
          ),

          AppSizes.spaceMd.heightBox,

          MainButton(
            title: "Login",
            onPressed: () {
              Get.toNamed(AppRoutes.basicDetails);
            },
          ),
          AppSizes.xxl.heightBox,
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.subTitleColors,
              ),
              children: [
                const TextSpan(text: "Don’t have an account?  "),
                TextSpan(
                  text: "Sign Up",
                  style: const TextStyle(
                    color: AppColors.blue,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(AppRoutes.registerScreen);
                        },
                ),
                const TextSpan(text: "  here"),
              ],
            ),
          ),
          AppSizes.spaceBtwItems.heightBox,
        ],
      ),
    );
  }
}
