import 'package:flutter/material.dart';

import '../Theme/app_config.dart';
import '../Theme/app_text.dart';
import '../Theme/color.dart';
import 'package:get/get.dart';

class Appbutton {
  static primaryButton({
    required BuildContext context,
    required String title,
    required GestureTapCallback? callback,
    double height = 60,
    double width = 0,
    double fontsize = 14,
    double borderradius = 30,
    required Color backGroundColor,
    Color titleColor = AppColor.backgroundColor,
    double elevation = 0,
    Color borderColor = AppColor.backgroundColor,
  }) {
    width = width == 0 ? AppConfig(context).width : width;
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(borderradius),
      color: backGroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderradius),
        onTap: callback,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(borderradius),
            // boxShadow: [
            //   BoxShadow(
            //     color: Get.theme.primaryColor.withOpacity(0.3),
            //     spreadRadius: 5,
            //     blurRadius: 7,
            //     offset: const Offset(0, 3), // changes position of shadow
            //   ),
            // ],
          ),
          height: height,
          width: width,
          child: Center(
              child: AppText.text(
            title,
            spacing: 1,
            fontsize: fontsize == 0 ? AppConfig(context).width / 30 : fontsize,
            fontweight: FontWeight.w700,
            color: titleColor,
          )),
        ),
      ),
    );
  }

  // static loadingButton({
  //   required BuildContext context,
  //   double height = 50,
  //   required Color backGroundColor,
  // }) {
  //   return Material(
  //     borderRadius: BorderRadius.circular(15),
  //     color: backGroundColor,
  //     child: InkWell(
  //       borderRadius: BorderRadius.circular(15),
  //       onTap: () => {},
  //       child: Container(
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(15),
  //           boxShadow: [
  //             BoxShadow(
  //               color: Get.theme.primaryColor.withOpacity(0.3),
  //               spreadRadius: 5,
  //               blurRadius: 7,
  //               offset: const Offset(0, 3), // changes position of shadow
  //             ),
  //           ],
  //         ),
  //         height: height,
  //         width: AppConfig(context).width,
  //         child: const Center(
  //           child: SpinKitWave(
  //             size: 30.0,
  //             itemCount: 6,
  //             color: Colors.white,
  //             type: SpinKitWaveType.start,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // AppText.text(
  // snapshot.data != null ? "Uploaded: ${snapshot.data}" : "Simple S3",
  // );
  // static prifixIconButton({
  //   required BuildContext context,
  //   required String title,
  //   required Function callback,
  //   required IconData iconData,
  //   double height = 50,
  //   Color backGroundColor = AppColor.greencolor,
  // }) {
  //   return Material(
  //     borderRadius: BorderRadius.circular(100),
  //     color: backGroundColor,
  //     child: InkWell(
  //       borderRadius: BorderRadius.circular(100),
  //       onTap: () => {callback()},
  //       child: SizedBox(
  //         height: height,
  //         width: AppConfig(context).width,
  //         child: Row(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             Icon(
  //               iconData,
  //               size: AppConfig(context).width / 28,
  //               color: Get.theme.primaryColor,
  //             ),
  //             const SizedBox(
  //               width: 3,
  //             ),
  //             AppText.text(
  //               title,
  //               fontsize: AppConfig(context).width / 28,
  //               fontweight: FontWeight.w500,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // static socialButton({
  //   required BuildContext context,
  //   required String title,
  //   required Function callback,
  //   Color backGroundColor = AppColor.whiteText,
  //   required Color textColor,
  //   required String ImagePath,
  // }) {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 10.0),
  //     child: Material(
  //       borderRadius: BorderRadius.circular(100),
  //       color: backGroundColor,
  //       child: InkWell(
  //         borderRadius: BorderRadius.circular(100),
  //         onTap: () => {callback()},
  //         child: SizedBox(
  //           height: 50,
  //           width: AppConfig(context).width,
  //           child: Padding(
  //             padding: EdgeInsets.symmetric(
  //                 horizontal: AppConfig(context).width / 4.8),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 Center(
  //                   child: AppText.text(
  //                     title,
  //                     fontsize: AppConfig(context).width / 25,
  //                     fontweight: FontWeight.bold,
  //                     color: textColor,
  //                   ),
  //                 ),
  //                 Spacer(),
  //                 Image.asset(
  //                   ImagePath,
  //                   height: AppConfig(context).width / 20,
  //                   width: AppConfig(context).width / 20,
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // static socialLoadingButton({
  //   required BuildContext context,
  //   required Color loaderColor,
  //   double height = 50,
  //   Color backGroundColor = AppColor.whiteText,
  // }) {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 10.0),
  //     child: Material(
  //       borderRadius: BorderRadius.circular(100),
  //       color: backGroundColor,
  //       child: InkWell(
  //         borderRadius: BorderRadius.circular(100),
  //         onTap: () => {},
  //         child: SizedBox(
  //           height: height,
  //           width: AppConfig(context).width,
  //           child: Center(
  //               child: SpinKitRipple(
  //             color: loaderColor,
  //           )),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  static deActivePrimaryButton({
    required BuildContext context,
    required String title,
    double height = 50,
    double fontSize = 0,
    required Function callback,
    Color backGroundColor = AppColor.lightGrey700,
    required Color borderColor,
  }) {
    return Material(
      borderRadius: BorderRadius.circular(100),
      color: backGroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () => {callback()},
        child: Container(
          height: height,
          width: AppConfig(context).width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                width: 2,
                color: borderColor,
              )),
          child: Center(
              child: AppText.text(
            title,
            color: Get.theme.primaryColor,
            fontsize: fontSize == 0 ? AppConfig(context).width / 30 : fontSize,
            fontweight: FontWeight.bold,
          )),
        ),
      ),
    );
  }

  static deActivePrimaryButtonWithBorder({
    required BuildContext context,
    required String title,
    double height = 50,
    required Function callback,
    Color backGroundColor = AppColor.lightGrey700,
  }) {
    return Material(
      borderRadius: BorderRadius.circular(100),
      color: backGroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () => {callback()},
        child: Container(
          height: height,
          width: AppConfig(context).width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                width: 2,
                color: AppColor.lightGrey700,
              )),
          child: Center(
              child: AppText.text(
            title,
            color: Get.theme.primaryColor,
            fontsize: AppConfig(context).width / 24,
            fontweight: FontWeight.bold,
          )),
        ),
      ),
    );
  }

  // static secondaryButton(
  //     {required BuildContext context,
  //     required String title,
  //     double height = 50,
  //     required Function callback}) {
  //   return Material(
  //     borderRadius: BorderRadius.circular(100),
  //     color: Get.theme.primaryColor,
  //     child: InkWell(
  //       borderRadius: BorderRadius.circular(100),
  //       onTap: () => {callback()},
  //       child: Container(
  //         height: height,
  //         color: AppColor.transparent,
  //         width: AppConfig(context).width,
  //         child: Center(
  //             child: AppText.text(
  //           title,
  //           fontsize: AppConfig(context).width / 24,
  //           fontweight: FontWeight.bold,
  //         )),
  //       ),
  //     ),
  //   );
  // }

  // static radiobuttonBorder({
  //   required BuildContext context,
  //   required String title,
  //   bool istrue = false,
  //   required Function callBack,
  // }) {
  //   return GestureDetector(
  //     onTap: () {
  //       callBack();
  //     },
  //     child: Row(
  //       children: [
  //         Container(
  //           height: AppConfig(context).width / 20,
  //           width: AppConfig(context).width / 20,
  //           padding: EdgeInsets.all(AppConfig(context).width / 90),
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(100),
  //               color: AppColor.whiteText,
  //               border: Border.all(
  //                 color: AppColor.lightGrey700,
  //                 width: 1,
  //               )),
  //           child: Container(
  //             height: AppConfig(context).width / 25,
  //             width: AppConfig(context).width / 25,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(100),
  //               color: istrue ? AppColor.greencolor : AppColor.whiteText,
  //             ),
  //           ),
  //         ),
  //         const SizedBox(
  //           width: 5,
  //         ),
  //         AppText.text(
  //           title,
  //           fontsize: AppConfig(context).width / 27,
  //           color: AppColor.blackText,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // static simpleRadioButton({
  //   required BuildContext context,
  //   required String title,
  //   bool istrue = false,
  //   Color textColor = AppColor.blackText,
  //   double betweenMargin = 5,
  //   required Function callBack,
  //   Function? onDoubleTap,
  // }) {
  //   return GestureDetector(
  //     onTap: () {
  //       callBack();
  //     },
  //     onDoubleTap: () {
  //       onDoubleTap!();
  //     },
  //     child: Container(
  //       color: AppColor.transparent,
  //       child: Row(
  //         children: [
  //           Container(
  //             height: AppConfig(context).width / 20,
  //             width: AppConfig(context).width / 20,
  //             padding: EdgeInsets.all(AppConfig(context).width / 90),
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(100),
  //                 color: AppColor.whiteText,
  //                 border: Border.all(
  //                   color: AppColor.lightGrey700,
  //                   width: 1,
  //                 )),
  //             child: Container(
  //               height: AppConfig(context).width / 25,
  //               width: AppConfig(context).width / 25,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(100),
  //                 color: istrue ? AppColor.greencolor : AppColor.whiteText,
  //               ),
  //             ),
  //           ),
  //           SizedBox(
  //             width: betweenMargin,
  //           ),
  //           AppText.text(
  //             title,
  //             color: textColor,
  //             fontsize: AppConfig(context).width / 28,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
