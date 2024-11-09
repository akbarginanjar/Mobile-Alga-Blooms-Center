import 'package:alga_blooms_center/controllers/login_controller.dart';
import 'package:alga_blooms_center/helpers/constant.dart';
import 'package:alga_blooms_center/views/konfirmasi_profil/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        surfaceTintColor: white,
        elevation: 1,
        shadowColor: Colors.grey[100],
        title: const Text('Masukkan OTP'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 30),
            Text(
              'Masukkan kode OTP',
              style: GoogleFonts.poppins(fontSize: 20),
            ),
            Obx(() {
              final otpDigits = controller.otp.string.split('');
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) {
                  return Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: primary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        index < otpDigits.length ? otpDigits[index] : '',
                        style: GoogleFonts.poppins(fontSize: 24),
                      ),
                    ),
                  );
                }),
              );
            }),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[50],
                  elevation: 0,
                ),
                child: Text(
                  'Kirim ulang kode otp',
                  style: GoogleFonts.poppins(color: primary),
                )),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return _buildNumberButton(
                        (index + 1).toString(), controller);
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return _buildNumberButton(
                        (index + 4).toString(), controller);
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return _buildNumberButton(
                        (index + 7).toString(), controller);
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildNumberButton('Delete', controller, isDelete: true),
                    _buildNumberButton('0', controller),
                    Obx(() {
                      final isOtpComplete = controller.otp.value.length == 6;
                      return _buildNumberButton(
                        'Submit',
                        controller,
                        isSubmit: true,
                        isEnabled: isOtpComplete,
                      );
                    }),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberButton(String text, LoginController controller,
      {bool isDelete = false, bool isSubmit = false, bool isEnabled = true}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: isEnabled
            ? () {
                if (isDelete) {
                  controller.deleteOtp();
                } else if (isSubmit) {
                  if (controller.otp.value.length == 6) {
                    Get.off(
                      const KonfimasiProfilScreen(),
                      transition: Transition.rightToLeft,
                    );
                  } else {
                    print('OTP kurang dari 6 digit');
                  }
                } else {
                  controller.updateOtp(text);
                }
              }
            : null, // Tombol disabled jika isEnabled = false
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.green[200],

          elevation: 0,
          backgroundColor: text == 'Submit'
              ? (isEnabled ? primary : Colors.grey[400])
              : Colors.grey[200],
          minimumSize: const Size(90, 90), // Ukuran tombol
        ),
        child: text == 'Delete'
            ? const Icon(
                Icons.backspace,
                color: black,
              )
            : text == 'Submit'
                ? const Icon(
                    Icons.check,
                    size: 30,
                    color: white,
                  )
                : Text(
                    text,
                    style: GoogleFonts.poppins(fontSize: 25, color: black),
                  ),
      ),
    );
  }
}
