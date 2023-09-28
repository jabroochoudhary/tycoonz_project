import 'dart:convert';

import 'package:auth_map/app_constants/api_urls.dart';
import 'package:auth_map/modules/home/views/home_view.dart';
import 'package:auth_map/services/api_service.dart';
import 'package:auth_map/services/local_data_saver.dart';
import 'package:auth_map/utills/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  // final nameController = TextEditingController().obs;
  final cPasswordController = TextEditingController().obs;
  RxBool isLoading = false.obs;

  registerAccount() async {
    if (emailController.value.text.isNotEmpty &&
        passwordController.value.text.isNotEmpty &&
        cPasswordController.value.text.isNotEmpty) {
      if (passwordController.value.text == cPasswordController.value.text) {
        isLoading.value = true;
        try {
          final data = {
            "email": emailController.value.text.trim(),
            "password": passwordController.value.text
          };
          final res = await ApiService().postRequest(AppAPIUrl.register, data);
          final dt = json.decode(res.body);
          print(res.statusCode);
          if (res.statusCode == 200) {
            Get.back();
            ToastMessage.toast(message: "Account Created");
          } else {
            ToastMessage.toast(message: dt['error']);
          }
        } catch (e) {
          print(e);
          ToastMessage.toast(message: e.toString());
        } finally {
          isLoading.value = false;
        }
      } else {
        ToastMessage.toast(message: "Password not match");
      }
    } else {
      ToastMessage.toast(message: "Invalid Form");
    }
  }

  loginAccount() async {
    if (emailController.value.text.isNotEmpty &&
        passwordController.value.text.isNotEmpty) {
      isLoading.value = true;
      try {
        final data = {
          "email": emailController.value.text.trim(),
          "password": passwordController.value.text
        };
        final res = await ApiService().postRequest(AppAPIUrl.login, data);
        final dt = json.decode(res.body);
        print(res.statusCode);
        if (res.statusCode == 200) {
          await AppLocalDataSaver.setString(
              dt['token'], AppLocalDataSaver.token);
          Get.offAll(() => HomeView());
          ToastMessage.toast(message: "Login Success");
        } else {
          ToastMessage.toast(message: dt['error']);
        }
      } catch (e) {
        print(e);
        ToastMessage.toast(message: e.toString());
      } finally {
        isLoading.value = false;
      }
    } else {
      ToastMessage.toast(message: "Password not match");
    }
  }
}
