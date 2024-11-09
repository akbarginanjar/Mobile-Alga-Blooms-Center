import 'package:alga_blooms_center/helpers/base.dart';
import 'package:alga_blooms_center/helpers/constant.dart';
import 'package:alga_blooms_center/helpers/service_util.dart';
import 'package:alga_blooms_center/models/nilai_index_model.dart';
import 'package:get/get.dart';

class HomeService extends GetConnect {
  Future<List<NilaiIndex>> getNilaiIndex() async {
    final conn = ServiceUtil.call(
      execute: await get('${Base.url}/api/nilai-index', headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      }),
    );
    if (!conn.hasError) {
      final List result = conn.body;
      return result.map((e) => NilaiIndex.fromJson(e)).toList();
    }
    return [];
  }
}
