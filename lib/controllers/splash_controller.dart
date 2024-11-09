import 'dart:async';

import 'package:alga_blooms_center/helpers/constant.dart';
import 'package:alga_blooms_center/views/home/home_screen.dart';
import 'package:alga_blooms_center/views/login/screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  bool servicestatus = false;
  bool haspermission = false;
  LocationPermission? permission;
  Position? position;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;

  @override
  void onInit() {
    startSplashScreen();
    super.onInit();
    checkGps();
    fetchLocation();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);

    return Timer(duration, () async {
      Get.offAll(
        box.read('token') != null ? const HomeScreen() : const LoginScreen(),
      );
    });
  }

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // print('Izin lokasi ditolak');
        } else if (permission == LocationPermission.deniedForever) {
          // print("''Izin lokasi ditolak permanen");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        // setState(() {
        //   //refresh the UI
        // });

        fetchLocation();
      }
    } else {
      Get.snackbar('Lokasi', 'Nyalakan GPS Terlebih dahulu');
    }
  }

  void fetchLocation() async {
    await Future.delayed(const Duration(seconds: 1));
    position = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.low);
    latitude.value = position!.latitude;
    longitude.value = position!.longitude;
  }
}
