
import 'package:get/get.dart';
import '../Model/data.dart';
import 'GetPosts.dart';

class PostController extends GetxController {
  var posts = <Post>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    isLoading(true);
    try {
      var postList = await ApiService.getPosts();
      if (postList != null) {
        posts.assignAll(postList);
      }
    } finally {
      isLoading(false);
    }
  }
}