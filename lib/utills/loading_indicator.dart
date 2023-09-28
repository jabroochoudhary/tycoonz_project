import 'package:flutter/material.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import '/utills/Theme/color.dart';

class LoadingIndicator {
  loading() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // LoadingAnimationWidget.threeArchedCircle(
        //   color: AppColors.primarycolor,
        //   size: 30,
        // ),
        // SizedBox(
        //   width: 10,
        // ),
        const Text(
          "Loading",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppColor.backgroundColor,
          ),
        ),
        LoadingAnimationWidget.waveDots(
          color: AppColor.backgroundColor,
          size: 25,
        ),
      ],
    );
  }

  loadingWithLabel({String title = "Loading Data"}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppColor.backgroundColor,
          ),
        ),
        const SizedBox(width: 5),
        LoadingAnimationWidget.fourRotatingDots(
          color: AppColor.backgroundColor,
          size: 25,
        ),
      ],
    );
  }
}
