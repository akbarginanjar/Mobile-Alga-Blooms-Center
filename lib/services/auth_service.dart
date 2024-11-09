import 'dart:async';

import 'package:alga_blooms_center/helpers/constant.dart';
import 'package:alga_blooms_center/models/user_model.dart';
import 'package:alga_blooms_center/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthController extends GetConnect {
  Future<User> login({required String email, required String password}) async {
    if (password.isNotEmpty && email.isNotEmpty) {
      var body = FormData({
        "email": email,
        "password": password,
      });

      EasyLoading.show(status: 'loading...');

      final Response conn = await post(
        'https://algabloomscenter.online/api/login',
        body,
        headers: {'Accept': 'application/json'},
      );
      print(conn.body);
      if (conn.statusCode == 200) {
        EasyLoading.showSuccess('Berhasil');
        box.write('token', conn.body['access_token']);
        box.write('id_user', conn.body['user']['id']);
        box.write('name', conn.body['user']['name']);
        box.write('email', conn.body['user']['email']);
        Get.offAll(
          const HomeScreen(),
          transition: Transition.rightToLeft,
        );
      } else {
        EasyLoading.dismiss();
        Get.dialog(
          barrierDismissible: false,
          barrierColor: Colors.black.withOpacity(0.2),
          AlertDialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            title: const Text('Login Gagal!'),
            content: const Text('Akun tidak ditemukan!'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                  Get.back();
                },
                child: Text(
                  'OKE',
                  style: GoogleFonts.poppins(color: primary),
                ),
              ),
            ],
          ),
        );
      }
      // Get.snackbar("Gagal Login", conn.body['message']);
    }

    return User();
  }
}
