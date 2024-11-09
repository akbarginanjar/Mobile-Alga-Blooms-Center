import 'package:alga_blooms_center/models/nilai_index_model.dart';
import 'package:alga_blooms_center/services/home_service.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

class HomeController extends GetxController {
  //TANGGAL SAAT INI
  RxString formattedDate = ''.obs;

  //API NILAI INDEX
  RxList<NilaiIndex> listNilaiIndex = <NilaiIndex>[].obs;
  RxBool isLoadingNilaiIndex = false.obs;

  setLoadingNilaiIndex() {
    isLoadingNilaiIndex.value = !isLoadingNilaiIndex.value;
  }

  Future<void> loadNilaiIndex() async {
    setLoadingNilaiIndex();
    final res = await HomeService().getNilaiIndex();
    listNilaiIndex.value = res;
    setLoadingNilaiIndex();
  }

  //MAPS
  final mapController = MapController();
  final Rx<LatLng> center =
      const LatLng(-2.548926, 118.014863).obs; // Default center (Indonesia)
  final RxDouble zoom = 4.5.obs;

  @override
  void onInit() {
    super.onInit();
    _determinePosition();
    DateTime currentDate = DateTime.now();
    formattedDate.value = DateFormat('dd MMMM yyyy').format(currentDate);
  }

  // Mendapatkan lokasi pengguna
  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Periksa apakah layanan lokasi aktif
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Layanan lokasi tidak aktif');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Izin lokasi ditolak');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Izin lokasi ditolak secara permanen');
    }

    // Dapatkan lokasi pengguna
    Position position = await Geolocator.getCurrentPosition();
    center.value = LatLng(position.latitude, position.longitude);
    mapController.move(
        center.value, zoom.value); // Memindahkan peta ke lokasi pengguna
  }

  Future<void> centerMapToCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    center.value = LatLng(position.latitude, position.longitude);
    mapController.move(center.value, 17.0);
  }

  //MENU MAPS
  var isMenu = false.obs;

  // Fungsi untuk toggle visibilitas
  void toggleMenu() {
    isMenu.value = !isMenu.value;
  }
}
