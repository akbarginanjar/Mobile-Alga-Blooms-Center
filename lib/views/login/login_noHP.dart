import 'package:alga_blooms_center/helpers/constant.dart';
import 'package:alga_blooms_center/views/login/otp_screen.dart';
import 'package:alga_blooms_center/views/login/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginNoHP extends StatelessWidget {
  const LoginNoHP({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController noHp = TextEditingController();
    // AuthController authController = AuthController();
    final GlobalKey<FormState> form = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                margin: const EdgeInsets.all(0),
                elevation: 0,
                color: const Color.fromARGB(255, 131, 179, 255),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )),
                child: Padding(
                  padding: const EdgeInsets.only(top: 80, bottom: 30),
                  child: Center(
                    child: SizedBox(
                      height: 250,
                      child: Image.asset('assets/images/perahu.png'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Masuk',
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Silahkan masuk di Alga Bloom Center',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 7),
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      // width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: TextFormField(
                        controller: noHp,
                        validator: (val) {
                          if (val!.isEmpty) {
                            // showErrorDialog('No HP tidak boleh kosong!');
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Nomor HP',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: Colors.grey[500],
                          ),
                          fillColor: primary,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1.5, color: Colors.transparent),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 0, color: Colors.transparent),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 7),
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          elevation: 0,
                          surfaceTintColor: primary,
                        ),
                        onPressed: () {
                          Get.to(const OtpScreen(),
                              transition: Transition.leftToRight);
                          // if (form.currentState!.validate()) {
                          //   authController
                          //       .login(
                          //     email: email.text,
                          //     password: password.text,
                          //   )
                          //       .then((value) {
                          //     if (box.read('tokens') != null) {
                          //       form.currentState!.reset();
                          //       Get.offAll(
                          //         const MainScreen(),
                          //         transition: Transition.rightToLeft,
                          //       );
                          //     }
                          //   });
                          // }
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Masuk menggunakan Email'),
                  TextButton(
                    onPressed: () {
                      Get.offAll(const LoginScreen(),
                          transition: Transition.leftToRight);
                    },
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(color: primary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
