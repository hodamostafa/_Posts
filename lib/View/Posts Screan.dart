import 'package:assiment/View/Widget/Floating_action.dart';
import 'package:assiment/View/details_Screan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/postController.dart';

class PostsScreen extends StatelessWidget {
  Color? color;
  Color? color2;
  PostsScreen(
  this.color2,
    this.color,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      appBar: AppBar(
        elevation: 10,
        toolbarHeight: 100,
        backgroundColor: color,
        title: const Text('All Posts'),
        actions: [
          Icon(Icons.post_add_outlined),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Obx(() {
        var getPost = Get.find<PostController>().posts;
        if (Get.find<PostController>().isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: Get.find<PostController>().posts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () {
                          Get.to(Details(getPost[index].id, getPost[index].body,
                              getPost[index].title, color,color2));

                        },
                        child: ListTile(
                          iconColor: Colors.white,
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 10,
                          ),
                          leading: Text(getPost[index].id.toString(),style: TextStyle(color: Colors.white),),
                          title: Text(
                            getPost[index].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Expanded(
                              child: getPost[index].body.length > 100
                                  ? Text(
                                getPost[index].body.substring(0, 30),
                                style: TextStyle(color: Colors.grey),)
                                  : null!),
                          contentPadding:
                              EdgeInsets.only(bottom: 20, right: 10, top: 10),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                ),
              ),
               Action_Buttom(),
            ],
          );
        }
      }),
    );
  }
}
