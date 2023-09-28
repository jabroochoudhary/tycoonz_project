import 'package:auth_map/modules/home/controller/home_controller.dart';
import 'package:auth_map/utills/Text%20Field/textfeilds.dart';
import 'package:auth_map/utills/Theme/app_config.dart';
import 'package:auth_map/utills/Theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Stack(
            children: [
              Positioned(
                width: AppConfig(context).width,
                height: AppConfig(context).height,
                child: GoogleMap(
                  buildingsEnabled: false,
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                      target: _homeController.cLocation, zoom: 16.5),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  markers:
                      _homeController.searchTextController.value.text.isNotEmpty
                          // ignore: invalid_use_of_protected_member
                          ? _homeController.markers.value
                          : <Marker>{},
                  compassEnabled: false,
                  onMapCreated: (GoogleMapController controller) async {
                    try {
                      _homeController.mapController.complete(controller);
                    } catch (e) {
                      print(e);
                    }
                  },
                  onTap: (argument) async {
                    print(argument);
                  },
                ),
              ),
              Positioned(
                  width: AppConfig(context).width,
                  top: 50,
                  child: Container(
                    width: AppConfig(context).width * 0.40,
                    height: 80,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: AppTextFormFiledWithOutLabel(
                      height: 80,
                      cntr: _homeController.searchTextController.value,
                      width: 300,
                      text: "Search Location",
                      isMap: true,
                      onTextFieldClick: () async {
                        // await showDialog(
                        //   context: context,
                        //   builder: (context) => ChangeBottomSheet(
                        //       viewController: _viewController),
                        // );
                      },
                      onSearchPressed: () {
                        // print("ppppp");
                        _homeController.searchLocations(
                            _homeController.searchTextController.value.text);
                      },
                      onTextChnage: (t) {
                        _homeController.searchLocations(t);
                      },
                    ),
                  ))
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColor.backgroundColor),
            child: InkWell(
                onTap: () => _homeController.getCurrentLocation(),
                child: const Icon(
                  Icons.my_location_rounded,
                  size: 30,
                )),
          ),
        ));
  }
}
