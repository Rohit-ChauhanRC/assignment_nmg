import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/models/get_all_post_model.dart';
import '../../../data/models/get_all_user_model.dart';
import '../../../data/services/rest_api.dart';

class AuthorsController extends GetxController {
  //

  final RestAPI _api = Get.find<RestAPI>();

  RxList<GetAllUserModel> _getAllUser = RxList<GetAllUserModel>([]);
  List<GetAllUserModel> get getAllUser => _getAllUser;
  set getAllUser(List<GetAllUserModel> users) => _getAllUser.assignAll(users);

  RxList<GetAllPostModel> _getAllPost = RxList<GetAllPostModel>([]);
  List<GetAllPostModel> get getAllPost => _getAllPost;
  set getAllPost(List<GetAllPostModel> users) => _getAllPost.assignAll(users);

  @override
  void onInit() async {
    _getAllUser.value = await _api.getAllUser();
    _getAllPost.value = await _api.getAllPosts();
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    _getAllPost.close();
    _getAllUser.close();
    super.onClose();
  }
}
