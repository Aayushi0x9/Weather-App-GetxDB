import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:weatherapp_dbgetx/Models/city_model.dart';
import 'package:weatherapp_dbgetx/Services/citysearch.dart';

class SearchCityController extends GetxController {
  RxList<Search> allSearch = <Search>[].obs;

  Future<void> initData([city = 'surat']) async {
    allSearch(await SearchHelper.searchHelper.getSearch(city: city));
    Logger().i('api calling');
  }
}
