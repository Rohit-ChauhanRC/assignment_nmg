import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/posts_controller.dart';

class PostsView extends GetView<PostsController> {
  const PostsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('Post Detail Page'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.getPost.id != null
            ? Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      controller.getPost.title!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.getPost.body!,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Comments:",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() => controller.getPostComments.length > 1
                        ? SizedBox(
                            height: Get.height * 0.5,
                            child: ListView.builder(itemBuilder: (ctx, i) {
                              final data = {};

                              controller.getPostComments.forEach((e) {
                                if (e.postId == controller.getPost.id) {
                                  // _extendedWallet.add(getExtendedWallet(
                                  //     e.id!, e.title!, element.name!, e.body!));
                                  data["id"] = e.id;
                                  data["email"] = e.email!;
                                  data["body"] = e.body!;
                                  data['name'] = e.name!;
                                }
                              });
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      data["name"]!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      data["email"]!,
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      data["body"]!,
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          )
                        : const SizedBox())
                  ],
                ),
              )
            : const Center(
                child: SizedBox(
                  child: Text("Loading ..."),
                ),
              ),
      ),
    );
  }
}
