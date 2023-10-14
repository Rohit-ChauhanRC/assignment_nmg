import 'package:get/get.dart';

import 'rest_api.dart';

class DependencyInjection {
  static void init() async {
    Get.put<GetConnect>(GetConnect());
    Get.put<RestAPI>(RestAPI());
  }
}
