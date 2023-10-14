import 'package:get/get.dart';

import '../controllers/authors_controller.dart';

class AuthorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthorsController>(
      () => AuthorsController(),
    );
  }
}
