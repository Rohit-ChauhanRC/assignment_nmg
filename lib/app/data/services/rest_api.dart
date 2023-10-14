import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../models/get_all_post_model.dart';
import '../models/get_all_user_model.dart';
import '../models/get_post_comments_model.dart';

class RestAPI {
  final GetConnect connect = Get.find<GetConnect>();

  Future<List<GetAllUserModel>> getAllUser() async {
    //
    List<GetAllUserModel> _allusers = [];
    Response response =
        await connect.get('https://jsonplaceholder.typicode.com/users');
    try {
      if (response.statusCode == 200) {
        print("response.body : ${response.body}");
        _allusers.assignAll(List<GetAllUserModel>.from(
            response.body!.map((x) => GetAllUserModel.fromJson(x))));
        // _allusers.assignAll(response.body as List<GetAllUserModel>);
        if (kDebugMode) {
          print("all users : ${_allusers[0].id}");
        }
        return _allusers;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return _allusers;
  }

  Future<List<GetAllPostModel>> getAllPosts() async {
    //
    List<GetAllPostModel> _allposts = [];
    Response response =
        await connect.get('https://jsonplaceholder.typicode.com/posts');
    try {
      if (response.statusCode == 200) {
        _allposts.assignAll(List<GetAllPostModel>.from(
            response.body!.map((x) => GetAllPostModel.fromJson(x))));
        if (kDebugMode) {
          print("all post ${_allposts[2].id}");
        }
        return _allposts;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return _allposts;
  }

  Future<List<GetPostCommentsModel>> getPostComment(String id) async {
    //
    List<GetPostCommentsModel> _allposts = [];
    Response response = await connect
        .get('https://jsonplaceholder.typicode.com/posts/$id/comments');
    try {
      if (response.statusCode == 200) {
        _allposts.assignAll(List<GetPostCommentsModel>.from(
            response.body!.map((x) => GetPostCommentsModel.fromJson(x))));
        if (kDebugMode) {
          print("all post ${_allposts[2].id}");
        }
        return _allposts;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return _allposts;
  }

  Future<GetAllPostModel> getPost(String id) async {
    //
    GetAllPostModel _post = GetAllPostModel();
    Response response =
        await connect.get('https://jsonplaceholder.typicode.com/posts/$id');
    try {
      if (response.statusCode == 200) {
        print(response.body);
        _post = GetAllPostModel.fromJson(response.body);
        return _post;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return _post;
  }
}
