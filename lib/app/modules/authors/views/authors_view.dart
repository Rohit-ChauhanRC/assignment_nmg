import 'package:assignment/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/authors_controller.dart';

class AuthorsView extends GetView<AuthorsController> {
  const AuthorsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Post'),
        backgroundColor: Colors.black54,
        centerTitle: true,
      ),
      body: Obx(
        () =>
            controller.getAllUser.length > 1 && controller.getAllPost.length > 1
                ? ListView.builder(
                    itemBuilder: (context, i) {
                      //
                      final data = {};

                      controller.getAllPost.forEach((e) {
                        if (e.userId == controller.getAllUser[i].id) {
                          // _extendedWallet.add(getExtendedWallet(
                          //     e.id!, e.title!, element.name!, e.body!));
                          data["id"] = e.id;
                          data["title"] = e.title;
                          data["body"] = e.body;
                          data['name'] = controller.getAllUser[i].name;
                        }
                      });

                      return InkWell(
                        onTap: () {
                          Get.toNamed(
                            Routes.POSTS,
                            arguments: data["id"]!,
                          );
                        },
                        child: Container(
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
                                data["title"]!,
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
                                data["body"]!,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                data["name"]!,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: controller.getAllUser.length)
                : const Center(
                    child: SizedBox(
                      child: Text(
                        "Loading ...",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
      ),
    );
  }
}
