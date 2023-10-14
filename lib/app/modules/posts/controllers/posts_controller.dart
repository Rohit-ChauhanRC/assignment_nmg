import 'package:get/get.dart';

import '../../../data/models/get_all_post_model.dart';
import '../../../data/models/get_post_comments_model.dart';
import '../../../data/services/rest_api.dart';

class PostsController extends GetxController {
  //

  final RestAPI _api = Get.find<RestAPI>();

  Rx<GetAllPostModel> _getPosts = Rx<GetAllPostModel>(GetAllPostModel());

  GetAllPostModel get getPost => _getPosts.value;

  set getPost(GetAllPostModel v) => _getPosts.value = v;

  RxList<GetPostCommentsModel> _getPostComments =
      RxList<GetPostCommentsModel>([]);
  List<GetPostCommentsModel> get getPostComments => _getPostComments;
  set getPostComments(List<GetPostCommentsModel> users) =>
      _getPostComments.assignAll(users);

  @override
  void onInit() async {
    _getPosts.value = await _api.getPost(Get.arguments.toString());
    _getPostComments.value =
        await _api.getPostComment(Get.arguments.toString());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
