
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../core/error/exceptions.dart';
import '../Model/data.dart';


class ApiService {
  static var client = http.Client();

  static Future<List<Post>?> getPosts() async {
    var response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return postFromJson(jsonString);
    } else {
      throw ServerException();
    }
  }

  Future<Post> createPost(String title, String body, int userId) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': title,
        'body': body,
        'userId': userId,
      }),
    );

    if (response.statusCode == 201) {
      debugPrint(response.body);
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create post.');
    }
  }
}













// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import '../Model/data.dart';
//
// class Fetchdata extends StatelessWidget {
//   List<Post> Posts=[];
//   Future GetPostsData() async{
//     var responce = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//     var jsonData =jsonDecode(responce.body);
//     print(jsonData);
//     // List<Post> Posts=[];
//     for(var U in jsonData) {
//       Post x = Post(U['Id'],U['userId'],U['title'],U['body']);
//       // Posts.add(x);
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// //
//     );
//   }
// }
