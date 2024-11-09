import 'package:alga_blooms_center/controllers/home_controller.dart';
import 'package:alga_blooms_center/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuMap extends StatelessWidget {
  const MenuMap({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Obx(() {
      return controller.isMenu.value
          ? SizedBox(
              width: double.infinity,
              height: 200,
              child: Card(
                margin: const EdgeInsets.all(15),
                color: white,
                surfaceTintColor: white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 10,
                shadowColor: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 65,
                                    width: 65,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/images/map.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Maps\n',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 65,
                                    width: 65,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/images/eutrofikasi.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Eutrofikasi\n\t(Chl-a)',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 65,
                                    width: 65,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/images/algabloom.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Alga Bloom\n\t\t\t\t\t (FLH)',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 65,
                                    width: 65,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/images/habs.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    '\t\t\t\t\t\t\t\t\tHABs\n (Bloom Index)',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 245, 156),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '31 Juli 2024',
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 24, 88, 136),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 245, 156),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '01 Ags 2024',
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 24, 88, 136),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 245, 156),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '15 Okt 2024',
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 24, 88, 136),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : const SizedBox.shrink();
    });
  }
}
