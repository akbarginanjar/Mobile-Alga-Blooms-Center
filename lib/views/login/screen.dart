import 'package:alga_blooms_center/helpers/constant.dart';
import 'package:alga_blooms_center/services/auth_service.dart';
import 'package:alga_blooms_center/views/home/home_screen.dart';
import 'package:alga_blooms_center/views/konfirmasi_profil/screen.dart';
import 'package:alga_blooms_center/views/login/login_noHP.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  GetStorage box = GetStorage();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  AuthController authController = AuthController();
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                        controller: email,
                        validator: (val) {
                          if (val!.isEmpty) {}
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                          prefixIcon: Icon(
                            Icons.person,
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
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      // width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: TextFormField(
                        controller: password,
                        obscureText: _obscureText,
                        validator: (val) {
                          if (val!.isEmpty) {}
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.grey[500],
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
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
                          // Get.offAll(const HomeScreen(),
                          //     transition: Transition.leftToRight);
                          authController.login(
                              email: email.text, password: password.text);
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // const Row(
                    //   children: [
                    //     Expanded(
                    //       child: Divider(
                    //         indent: 100,
                    //         color: Colors.grey, // Warna garis
                    //         thickness: 1, // Ketebalan garis
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(horizontal: 10.0),
                    //       child: Text(
                    //         "atau",
                    //         style: TextStyle(color: Colors.grey),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: Divider(
                    //         color: Colors.grey,
                    //         endIndent: 100, // Warna garis
                    //         thickness: 1, // Ketebalan garis
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 20),
                    // Center(
                    //   child: ElevatedButton.icon(
                    //     onPressed: () {
                    //       Get.offAll(
                    //         const LoginNoHP(),
                    //         transition: Transition.rightToLeft,
                    //       );
                    //     },
                    //     icon: const Icon(
                    //       Icons.phone_android,
                    //       color: black,
                    //     ),
                    //     label: Text(
                    //       'Masuk dengan no HP',
                    //       style: GoogleFonts.poppins(
                    //         color: black, // Warna teks
                    //         fontSize: 16,
                    //       ),
                    //     ),
                    //     style: ElevatedButton.styleFrom(
                    //       elevation: 0,
                    //       backgroundColor: white,
                    //       padding: const EdgeInsets.symmetric(
                    //           horizontal: 20, vertical: 12), // Padding
                    //       shape: RoundedRectangleBorder(
                    //         side: BorderSide(color: Colors.grey[300]!),
                    //         borderRadius: BorderRadius.circular(
                    //             50), // Membuat tombol dengan sudut melengkung
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
