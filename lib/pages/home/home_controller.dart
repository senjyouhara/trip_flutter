
import 'package:get/get.dart';

import '../../utils/request/request.dart';

class HomeController extends GetxController {

  var appbarOpacity = 0.0.obs;
  var bannerList = <String>[].obs;

  Future<void> testData() async {
    var result = await Request.post<Map>('/api/basic/data');
  }

  Future<void> getBannerData() async {
    var result = await Request.get<List<String>>('/api/home/banner');
    bannerList.value = result.data ?? [];
  }

  @override
  void onInit() {
    getBannerData();
  }
}