
import 'package:get/get.dart';

import '../../../models/base_model_entity.dart';
import '../../../models/home_mainMenus_model_entity_entity.dart';
import '../../../utils/request/request.dart';

class HomeController extends GetxController {

  var appbarOpacity = 0.0.obs;
  var bannerList = <String>[].obs;
  var mainMenuList = <HomeMainMenusModelEntityEntity>[].obs;

  Future<void> testData() async {
    var result = await Request.post<Map>('/api/basic/data');
  }

  Future<void> getBannerData() async {
    var result = await Request.get<List<String>>('/api/home/banner', onTypeTransformerCb: (jsonMap){
      return BaseModelEntity<List<String>>.fromJson(jsonMap);
    });
    bannerList.value = result.data ?? [];
  }

  Future<void> getMainMenusData() async {
    var result = await Request.get<List<HomeMainMenusModelEntityEntity>>('/api/home/mainMenus', onTypeTransformerCb: (jsonMap){
      return BaseModelEntity<List<HomeMainMenusModelEntityEntity>>.fromJson(jsonMap);
    });
    mainMenuList.value = result.data ?? [];
  }

  @override
  void onInit() {
    getBannerData();
    getMainMenusData();
  }
}