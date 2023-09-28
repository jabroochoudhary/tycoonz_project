import 'package:auth_map/utills/loading_indicator.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utills/App Button/app_button.dart';
import '../../../utills/Text Field/textfeilds.dart';
import '../../../utills/Theme/app_config.dart';
import '../../../utills/Theme/app_text.dart';
import '../../../utills/Theme/color.dart';
import '../controller/auth_controller.dart';

class SignUpView extends StatelessWidget {
  SignUpView({Key? key}) : super(key: key);

  final _controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    final hight = AppConfig(context).height;
    final width = AppConfig(context).width;

    return Scaffold(
      body: Obx(
        () => Container(
          height: AppConfig(context).height,
          width: AppConfig(context).width,
          color: AppColor.primarycolor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: width,
                  height: hight * 0.4,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DelayedDisplay(
                          delay: const Duration(milliseconds: 700),
                          child: Container(
                            height: hight * 0.17,
                            width: width * 0.85,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/app_logo.png"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 1400),
                  child: Container(
                    height: hight * 0.6,
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 24),
                    width: width,
                    decoration: BoxDecoration(
                        color: AppColor.dark.withOpacity(0.3),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(height: hight * 0.02),
                        AppTextFormFiledWithLabel(
                          keyboardtype: TextInputType.emailAddress,
                          text: "Username or Email",
                          fontweight: FontWeight.w400,
                          cntr: _controller.emailController.value,
                        ),
                        SizedBox(height: hight * 0.02),
                        AppTextFormFiledWithLabel(
                          text: "Password",
                          fontweight: FontWeight.w400,
                          isPassword: true,
                          cntr: _controller.passwordController.value,
                        ),
                        SizedBox(height: hight * 0.02),
                        AppTextFormFiledWithLabel(
                          text: "Confirm Password",
                          fontweight: FontWeight.w400,
                          isPassword: true,
                          cntr: _controller.cPasswordController.value,
                        ),
                        SizedBox(
                          height: hight * 0.03,
                        ),
                        _controller.isLoading.value
                            ? Center(
                                child: LoadingIndicator().loadingWithLabel(),
                              )
                            : Appbutton.primaryButton(
                                context: context,
                                fontsize: 18,
                                borderradius: 5,
                                title: "Create Account",
                                backGroundColor: AppColor.lightGrey1000,
                                callback: () {
                                  _controller.registerAccount();
                                }),
                        SizedBox(height: hight * 0.02),
                        Row(
                          children: [
                            AppText.text(
                              "I already have an account ",
                              textAlignment: TextAlign.left,
                              color: AppColor.lightGrey600,
                              fontsize: 12,
                            ),
                            InkWell(
                              onTap: () => Get.back(),
                              child: AppText.text(
                                "Login",
                                textAlignment: TextAlign.left,
                                color: AppColor.lightGrey500,
                                fontsize: 15,
                                fontweight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: hight * 0.03,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
