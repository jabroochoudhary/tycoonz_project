import 'package:flutter/material.dart';

import 'Theme/app_config.dart';
import 'Theme/app_text.dart';
import 'Theme/color.dart';
import 'package:get/get.dart';

class BottomFilterSheet {
  filter(
      {required BuildContext context,
      required bool sortByDateTime,
      GestureTapCallback? sorByAtoZSortPressed,
      GestureTapCallback? sortByDateTimePressed}) {
    return showModalBottomSheet(
        context: context,
        // elevation: 1,
        // barrierColor: AppColors.dark.withOpacity(0.7),
        backgroundColor: AppColor.backgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppConfig(context).width / 15,
                vertical: AppConfig(context).width / 15),
            height: AppConfig(context).height / 3.7,
            // color: Colors.red,
            width: AppConfig(context).width,
            decoration: const BoxDecoration(
              color: AppColor.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.tune,
                      size: 25,
                      color: Get.theme.primaryColor,
                    ),
                    SizedBox(
                      width: AppConfig(context).width / 20,
                    ),
                    AppText.text("Filter By",
                        color: Get.theme.primaryColor,
                        fontsize: 15,
                        fontweight: FontWeight.w600),
                  ],
                ),
                SizedBox(
                  height: AppConfig(context).width / 12,
                ),
                InkWell(
                  onTap: sortByDateTimePressed,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 25,
                            color: sortByDateTime
                                ? Get.theme.primaryColor
                                : AppColor.dark.withOpacity(0.4),
                          ),
                          SizedBox(
                            width: AppConfig(context).width / 20,
                          ),
                          AppText.text("Date and Time",
                              color: sortByDateTime
                                  ? Get.theme.primaryColor
                                  : AppColor.dark.withOpacity(0.4),
                              fontsize: 12,
                              fontweight: FontWeight.w600),
                        ],
                      ),
                      sortByDateTime
                          ? Icon(
                              Icons.check,
                              size: 25,
                              color: Get.theme.primaryColor,
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppConfig(context).width / 30.5,
                ),
                Container(
                  height: 1,
                  color: AppColor.dark.withOpacity(0.4),
                ),
                SizedBox(
                  height: AppConfig(context).height / 70.5,
                ),
                InkWell(
                  onTap: sorByAtoZSortPressed,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.sort_by_alpha_outlined,
                            size: 25,
                            color: sortByDateTime
                                ? AppColor.dark.withOpacity(0.4)
                                : Get.theme.primaryColor,
                          ),
                          SizedBox(
                            width: AppConfig(context).width / 20,
                          ),
                          AppText.text("A to Z",
                              color: sortByDateTime
                                  ? AppColor.dark.withOpacity(0.4)
                                  : Get.theme.primaryColor,
                              fontsize: 12,
                              fontweight: FontWeight.w600),
                        ],
                      ),
                      !sortByDateTime
                          ? Icon(
                              Icons.check,
                              size: 25,
                              color: Get.theme.primaryColor,
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
