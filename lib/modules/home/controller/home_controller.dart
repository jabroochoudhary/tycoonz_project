import 'dart:convert';

import 'package:auth_map/modules/home/model/location_search_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  LatLng cLocation = const LatLng(31.402519633445955, 74.26008637994528);
  String mapKey = "AIzaSyB0cPuHCMkXgoZZWEaytM0NS9fO6QXN9Hc";

  final Completer<GoogleMapController> mapController = Completer();
  final searchTextController = TextEditingController().obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getCurrentLocation();
    super.onInit();
  }

  void getCurrentLocation() async {
    if (isLoading.value) {
      return;
    }
    try {
      isLoading.value = true;
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      CameraPosition c = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 14,
      );
      cLocation = LatLng(position.latitude, position.longitude);

      final GoogleMapController controller = await mapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(c));
      // setState(() {
      //   print("Location fetcted " + cLocation.toString());
      // });
    } catch (e) {
      print('Error getting location: $e');
      await requestLocationPermission();
      getCurrentLocation();
    }
    isLoading.value = false;
  }

  Future<void> requestLocationPermission() async {
    final status = await Permission.location.request();

    if (status.isGranted) {
    } else if (status.isDenied) {
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  var locations = <LocationSearchModel>[].obs;
  searchLocations(String txt) async {
    if (txt.isEmpty) {
      locations.clear();
      markers.clear();
      return;
    }
    try {
      final String url =
          'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$txt&location=${cLocation.latitude},${cLocation.longitude}&radius=100000&key=$mapKey';
      locations.clear();

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        print(data);
        if (data['status'] == 'OK') {
          for (var element in data['results']) {
            try {
              locations.add(LocationSearchModel.fromJson(element));
            } catch (e) {
              print("Format error");
            }
          }
          addMarkers();
        } else {
          print('Error: ${data['status']}');
        }
      } else {
        print('HTTP Error: ${response.statusCode}');
      }
    } catch (e) {}
  }

  RxSet<Marker> markers = <Marker>{}.obs;

  addMarkers() async {
    markers.clear();
    for (int i = 0; i < locations.length; i++) {
      LatLng lt = LatLng(locations[i].geometry!.location!.lat!,
          locations[i].geometry!.location!.lng!);
      markers.add(
        Marker(
          markerId: MarkerId('marker$i'),
          position: lt,
          infoWindow: InfoWindow(
            title: locations[i].name.toString(),
            snippet: 'Location: $lt',
          ),
        ),
      );
    }
  }
}
