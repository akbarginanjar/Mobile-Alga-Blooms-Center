import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LoginController extends GetxController {
  //LOKASI
  bool servicestatus = false;
  bool haspermission = false;
  LocationPermission? permission;
  Position? position;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;

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
        EasyLoading.show(status: 'Melacak lokasi anda');
      }
    } else {
      Get.snackbar('Lokasi', 'Nyalakan GPS Terlebih dahulu');
    }
  }

  void fetchLocation() async {
    await Future.delayed(const Duration(seconds: 1));
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    latitude.value = position!.latitude;
    longitude.value = position!.longitude;
    EasyLoading.showSuccess('Berhasil mendeteksi lokasi');
  }

  //KONFIRMASI PROFIL
  var selectedDate = ''.obs;

  // Fungsi untuk memilih tanggal
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      // Format tanggal menjadi dd/MM/yyyy
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      selectedDate.value = formattedDate; // Update tanggal yang dipilih
    }
  }

  //OTP
  var otp = "".obs;

  void updateOtp(String value) {
    if (otp.value.length < 6) {
      otp.value += value;
    }
  }

  void deleteOtp() {
    if (otp.value.isNotEmpty) {
      otp.value = otp.value.substring(0, otp.value.length - 1);
    }
  }
}
