import 'package:alga_blooms_center/controllers/login_controller.dart';
import 'package:alga_blooms_center/helpers/constant.dart';
import 'package:alga_blooms_center/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class KonfimasiProfilScreen extends StatelessWidget {
  const KonfimasiProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        surfaceTintColor: white,
        elevation: 1,
        shadowColor: Colors.grey[100],
        centerTitle: true,
        title: const Text('Lengkapi Profil Anda'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text('Nama Lengkap'),
                  const SizedBox(height: 5),
                  TextFormField(
                    cursorColor: primary,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Tanggal Lahir'),
                  const SizedBox(height: 5),
                  Card(
                    elevation: 0,
                    margin: const EdgeInsets.all(0),
                    color: white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey[300]!, width: 1.5),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      onTap: () {
                        controller.selectDate(context);
                      },
                      title: Obx(
                        () {
                          return Text(
                            // ignore: unrelated_type_equality_checks
                            controller.selectedDate == ''
                                ? 'Pilih Tanggal'
                                : controller.selectedDate.toString(),
                            style: const TextStyle(fontSize: 15),
                          );
                        },
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          controller.selectDate(context);
                        },
                        icon: const Icon(Icons.date_range),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Lokasi'),
                  const SizedBox(height: 5),
                  TextFormField(
                    cursorColor: primary,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      contentPadding: const EdgeInsets.all(15),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        surfaceTintColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(color: primary),
                        ),
                      ),
                      onPressed: () {
                        controller.checkGps();
                        controller.fetchLocation();
                      },
                      child: Text(
                        'Gunakan Lokasi Saat Ini',
                        style: GoogleFonts.montserrat(color: primary),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.offAll(
                            const HomeScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          backgroundColor:
                              primary, // Ubah warna tombol jika diperlukan
                        ),
                        child: Text(
                          'Simpan',
                          style: GoogleFonts.poppins(
                              color: white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Card(
              margin: const EdgeInsets.all(0),
              elevation: 0,
              color: const Color.fromARGB(255, 131, 179, 255),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              )),
              child: Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 30),
                child: Center(
                  child: SizedBox(
                    height: 250,
                    child: Image.asset('assets/images/perahu.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
