import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'Theme/app_text.dart';
import 'Theme/color.dart';

class ToastMessage {
  static toast({String message = "Message"}) {
    return Get.snackbar(
      "",
      message,
      messageText: AppText.text(
        message,
        fontsize: 12,
        maxlines: 3,
        fontweight: FontWeight.w600,
        color: AppColor.backgroundColor,
      ),
      animationDuration: Duration(milliseconds: 500),
      duration: Duration(milliseconds: 2500),
      backgroundColor: AppColor.dark.withOpacity(0.5),
      borderRadius: 15,
      colorText: AppColor.backgroundColor,
      padding: EdgeInsets.all(12),
    );
  }

  defaultYesNoDialouge(
    String title, {
    GestureTapCallback? onCancelPressed,
    GestureTapCallback? onConfirmPressed,
    String yesButtonText = "Delete",
    String noButtonText = "Cancel",
    Color yesButtonColor = Colors.black,
  }) {
    return Get.defaultDialog(
      cancelTextColor: AppColor.primarycolor,
      confirmTextColor: Colors.red,
      backgroundColor: AppColor.lightGrey1000,
      title: "Confirmation",
      titleStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColor.lightGrey500,
      ),
      middleTextStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColor.lightGrey600,
      ),
      middleText: title,
      cancel: InkWell(
        onTap: () {
          onCancelPressed!();
        },
        child: Container(
          width: 80,
          height: 40,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 144, 144, 144),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: AppText.text(noButtonText, color: AppColor.dark),
          ),
        ),
      ),
      confirm: InkWell(
        onTap: () {
          onConfirmPressed!();
          // print("Confrim pressed");
        },
        child: Container(
          width: 80,
          height: 40,
          decoration: BoxDecoration(
            color: yesButtonColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: AppText.text(
              yesButtonText,
              color: AppColor.backgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
