import 'package:auth_map/modules/home/components/search_results_bottom_sheet.dart';
import 'package:auth_map/modules/home/controller/home_controller.dart';
import 'package:auth_map/utills/Theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ChangeBottomSheet extends StatelessWidget {
  HomeController viewController;
  ChangeBottomSheet({
    super.key,
    required this.viewController,
  });

  @override
  Widget build(BuildContext context) {
    final heigt = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: SingleChildScrollView(
        child: Dialog(
          alignment: Alignment.center,
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            // height: heigt * 0.60,
            width: width * 0.90,
            // margin: EdgeInsets.only(top: 100),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText.text(
                            "Search Location",
                            color: Colors.white,
                            fontsize: 20,
                            fontweight: FontWeight.w700,
                          ),
                          InkWell(
                            onTap: () => Get.back(),
                            child: const Icon(
                              Icons.close,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SearchLocationComponents().textFieldSearch(
                        hint: "Tycoonz Solution",
                        onChangeText: (v) {
                          try {
                            viewController.searchLocations(v);
                          } catch (e) {}
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Color(0xff7F7C6B),
                  thickness: 0.5,
                ),
                Container(
                  height: heigt * 0.60,
                  // color: Colors.red,
                  child: Obx(
                    () => ListView.builder(
                      itemCount: viewController.locations.length,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return SearchLocationComponents().card(
                          width: width,
                          locationName:
                              viewController.locations[index].name.toString(),
                          locationDetails: viewController
                              .locations[index].formattedAddress
                              .toString(),
                          onPressed: () {
                            //  here i have to write code go to seleted location
                            // Get.back();
                          },
                        );
                      },
                    ),
                  ),
                ), // Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.text(
                      "powered by",
                      color: Color(0xff768196),
                      fontsize: 12,
                      fontweight: FontWeight.w700,
                    ),
                    const Text(
                      " TYCOONZ",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff768196),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
