import '../Theme/app_config.dart';
import '../Theme/app_text.dart';
import '../Theme/color.dart';
import 'package:flutter/material.dart';

class MyAppBar {
  appBar({
    required BuildContext context,
    GestureTapCallback? filterPressed,
    GestureTapCallback? notificationPressed,
    String name = "Jhon Smith",
    Function? onSearchChange,
    bool isCenterTitle = false,
    bool autoBackButtom = false,
    bool isFilter = true,
    bool isAddButton = true,
    GestureTapCallback? onAddPressed,
    GestureTapCallback? onBackButtonPressed,
    Function? onSearch,
  }) {
    return AppBar(
      backgroundColor: AppColor.primarycolor,
      elevation: 0,
      // shadowColor: Colors.white,
      centerTitle: isCenterTitle,
      title: AppText.text(
        name,
        spacing: 1.5,
        fontsize: 20,
        fontweight: FontWeight.w700,
        color: Colors.white,
      ),
      leading: autoBackButtom
          ? InkWell(
              onTap: onBackButtonPressed,
              child: const Icon(
                Icons.arrow_back,
                color: AppColor.backgroundColor,
                size: 25,
              ),
            )
          : null,
      automaticallyImplyLeading: false,
      actions: [
        isAddButton
            ? Container(
                margin: EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: onAddPressed,
                  child: const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 40, 40, 40),
                    child: Icon(
                      Icons.checklist_rtl,
                      color: AppColor.backgroundColor,
                      size: 30,
                    ),
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }

  detailsAppBar({
    required BuildContext context,
    String? title,
    bool isCenterTitle = false,
    bool isBackButton = false,
    bool isFavIcon = false,
    Color titleColor = AppColor.backgroundColor,
    GestureTapCallback? onFavIconPressed,
    GestureTapCallback? onBackButtonPressed,
  }) {
    return PreferredSize(
      preferredSize: Size.fromHeight(AppConfig(context).height / 6),
      child: AppBar(
        backgroundColor: AppColor.backgroundColor,
        automaticallyImplyLeading: false,
        centerTitle: isCenterTitle,
        leading: isBackButton
            ? IconButton(
                onPressed: onBackButtonPressed,
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                  weight: 20,
                  color: titleColor,
                ),
              )
            : const SizedBox(),
        title: AppText.text(
          title,
          color: titleColor,
          fontsize: 18,
          fontweight: FontWeight.w600,
        ),
        actions: [
          CircleAvatar(
            backgroundColor: AppColor.backgroundColor,
            radius: 18,
            child: Center(
              child: InkWell(
                  onTap: onFavIconPressed,
                  child: const Icon(
                    Icons.favorite_outline,
                    size: 20,
                    color: AppColor.dark,
                  )),
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
    );
  }
}
