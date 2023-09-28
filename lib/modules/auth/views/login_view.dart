import 'package:auth_map/modules/auth/views/signup_view.dart';
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

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final _controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final hight = AppConfig(context).height;
    final width = AppConfig(context).width;

    return Obx(() => Scaffold(
          body: Container(
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
                      delay: const Duration(milliseconds: 1400),
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
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: width * 0.02),
                                child: AppText.text("Username",
                                    textAlignment: TextAlign.left,
                                    color: AppColor.lightGrey500,
                                    fontsize: 18,
                                    fontweight: FontWeight.w600),
                              ),
                              SizedBox(height: hight * 0.01),
                              AppTextFormFiledWithOutLabel(
                                keyboardtype: TextInputType.emailAddress,
                                text: "Enter your username",
                                fontweight: FontWeight.w400,
                                cntr: _controller.emailController.value,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: hight * 0.04),
                                child: AppText.text(
                                  "Password",
                                  textAlignment: TextAlign.left,
                                  color: AppColor.lightGrey500,
                                  fontsize: 18,
                                  fontweight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: hight * 0.01),
                              AppTextFormFiledWithOutLabel(
                                text: "Enter your password",
                                fontweight: FontWeight.w400,
                                isPassword: true,
                                cntr: _controller.passwordController.value,
                              ),
                              SizedBox(
                                height: hight * 0.03,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () => Get.to(() => SignUpView()),
                                    child: AppText.text(
                                      "Create new account",
                                      fontsize: 12,
                                      fontweight: FontWeight.w400,
                                      color: AppColor.lightGrey500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: hight * 0.03,
                              ),
                              _controller.isLoading.value
                                  ? Center(
                                      child:
                                          LoadingIndicator().loadingWithLabel())
                                  : Appbutton.primaryButton(
                                      context: context,
                                      title: "Login",
                                      fontsize: 18,
                                      borderradius: 5,
                                      backGroundColor: AppColor.lightGrey1000,
                                      callback: () {
                                        _controller.loginAccount();
                                      })
                            ]),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
