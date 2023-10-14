import 'package:get/get.dart';

import '../modules/authors/bindings/authors_binding.dart';
import '../modules/authors/views/authors_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/posts/bindings/posts_binding.dart';
import '../modules/posts/views/posts_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTHORS;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTHORS,
      page: () => const AuthorsView(),
      binding: AuthorsBinding(),
    ),
    GetPage(
      name: _Paths.POSTS,
      page: () => const PostsView(),
      binding: PostsBinding(),
    ),
  ];
}
