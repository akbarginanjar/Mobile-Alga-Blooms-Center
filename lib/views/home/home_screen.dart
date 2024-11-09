import 'package:alga_blooms_center/controllers/home_controller.dart';
import 'package:alga_blooms_center/helpers/constant.dart';
import 'package:alga_blooms_center/views/home/menu_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: white,
          surfaceTintColor: white,
          elevation: 10,
          shadowColor: Colors.black12,
          title: const Text(
            'Bandung, Jawabarat',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.dialog(
                  barrierColor: Colors.black.withOpacity(0.2),
                  AlertDialog(
                    backgroundColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    title: const Text('Peringatan Informasi'),
                    content: const Text(
                        'Apakah anda ingin melihat informasi laut saat ini?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'Tutup',
                          style: GoogleFonts.poppins(color: Colors.black87),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                          controller.loadNilaiIndex();
                          Get.bottomSheet(
                            barrierColor: Colors.black12,
                            SizedBox(
                              width: double.infinity,
                              height: 290,
                              child: Obx(
                                () => controller.isLoadingNilaiIndex.value
                                    ? const Center(
                                        child: Card(
                                        color: white,
                                        surfaceTintColor: white,
                                        child: Padding(
                                          padding: EdgeInsets.all(20),
                                          child: CircularProgressIndicator(
                                            color: primary,
                                          ),
                                        ),
                                      ))
                                    : Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        color: HexColor(
                                            '${controller.listNilaiIndex[0].pengaturan!.kodeWarna}'),
                                        margin: const EdgeInsets.all(20),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Icon(
                                                Icons.warning_amber_rounded,
                                                color: white,
                                                size: 50,
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                '${controller.listNilaiIndex[0].pengaturan!.keterangan}',
                                                style: GoogleFonts.poppins(
                                                  color: white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                '${controller.listNilaiIndex[0].pengaturan!.deskripsi}',
                                                style: GoogleFonts.poppins(
                                                  color: white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Ya',
                          style: GoogleFonts.poppins(color: primary),
                        ),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(
                Icons.warning_amber_rounded,
                color: black,
                size: 28,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  controller.toggleMenu();
                },
                icon: const Icon(
                  Icons.menu_rounded,
                  color: black,
                  size: 28,
                ),
              ),
            ),
          ]),
      body: Stack(
        children: [
          // Background (map or image)
          // SizedBox(
          //   width: double.infinity,
          //   height: double.infinity,
          //   child: Image.asset(
          //     'assets/images/maps.png', // Replace with your map image
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Obx(() => FlutterMap(
                mapController: controller.mapController,
                options: MapOptions(
                  initialCenter: controller
                      .center.value, // Posisi awal berdasarkan lokasi pengguna
                  initialZoom: controller.zoom.value,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoiZXhwcmVzaGlwIiwiYSI6ImNtMGk0eHAzODBodTIybG9idDltcG1ydmMifQ.hm5UZy-lY-v0zJOY3x2-Yg",
                    additionalOptions: const {
                      'accessToken':
                          'pk.eyJ1IjoiZXhwcmVzaGlwIiwiYSI6ImNtMGk0eHAzODBodTIybG9idDltcG1ydmMifQ.hm5UZy-lY-v0zJOY3x2-Yg',
                      'id': 'mapbox/streets-v11', // Gaya peta Mapbox
                    },
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: controller.center.value,
                        width: 80,
                        height: 80,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Radar Circle
                            _buildRadarCircle(50,
                                Colors.blue.withOpacity(0.2)), // Outer circle
                            _buildRadarCircle(30,
                                Colors.blue.withOpacity(0.4)), // Middle circle
                            _buildRadarCircle(18, Colors.white), // Inner circle
                            const Icon(
                              Icons.circle,
                              color: Colors.blue,
                              size: 18,
                            ), // Marker icon
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),

          const MenuMap(),

          // Floating weather component (main card)
          Positioned(
            bottom: 0, // Positioned at the bottom of the screen
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 80, bottom: 0),
              margin: const EdgeInsets.all(0),
              decoration: const BoxDecoration(
                color: Color.fromARGB(245, 241, 251, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Weather details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Temperature
                      Column(
                        children: [
                          Text('Suhu',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: const Color.fromARGB(255, 24, 88, 136),
                              )),
                          const Icon(
                            Icons.thermostat,
                            size: 30,
                            color: Color.fromARGB(255, 24, 88, 136),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '30°C',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 24, 88, 136),
                            ),
                          ),
                        ],
                      ),
                      // Humidity
                      Column(
                        children: [
                          Text('Kelembapan',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: const Color.fromARGB(255, 24, 88, 136),
                              )),
                          const Icon(
                            Icons.opacity,
                            size: 30,
                            color: Color.fromARGB(255, 24, 88, 136),
                          ),
                          const SizedBox(height: 8),
                          Text('75%',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 24, 88, 136),
                              )),
                        ],
                      ),
                      // Wind Speed
                      Column(
                        children: [
                          Text('Kec. Angin',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: const Color.fromARGB(255, 24, 88, 136),
                              )),
                          const Icon(
                            Icons.air,
                            size: 30,
                            color: Color.fromARGB(255, 24, 88, 136),
                          ),
                          const SizedBox(height: 8),
                          Text('20 Km/Jam',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 24, 88, 136),
                              )),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/ombak.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 430),
              child: Positioned(
                bottom:
                    240, // Adjust the distance from the bottom to position it above the card
                // left:
                //     MediaQuery.of(context).size.width * 0.33, // Center horizontally
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(
                            255, 24, 88, 136), // Background color for the icon
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.wb_sunny,
                        size: 60,
                        color: Color.fromARGB(255, 255, 245, 156),
                      ),
                    ),
                    const SizedBox(
                        height: 8), // Space between the icon and the date
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 245, 156),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Obx(
                        () => Text(
                          controller.formattedDate.value,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 24, 88, 136),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 24, 88, 136),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(30),
        // ),
        onPressed: () {
          controller.centerMapToCurrentLocation();
        },
        child: const Icon(
          Icons.my_location,
          color: white,
        ),
      ),
    );
  }

  Widget _buildRadarCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
