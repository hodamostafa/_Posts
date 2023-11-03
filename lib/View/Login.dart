import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/postController.dart';
import 'Posts Screan.dart';
import 'Widget/form_field_widget.dart';

class LoginScreen extends StatelessWidget {
  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();
  Color color = Colors.blueGrey[900]!;
  Color? color2 = Colors.blueGrey[800];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: color,
        title: Text('Login'),
        elevation: 10,
        toolbarHeight: 100,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Card(
            color: color2,
            elevation: 30,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  FormFieldWidget(
                    bodycontroller: _usernameController,
                    name: 'Email',
                    lable: 'Email',
                    boolval: false,
                    prefixIcon: Icons.email,
                  ),
                  SizedBox(height: 20),
                  FormFieldWidget(
                    bodycontroller: _passwordController,
                    name: 'Password',
                    lable: 'Password',
                    boolval: false,
                    // suffixIcon: Icons.remove_red_eye,
                    prefixIcon: Icons.remove_red_eye,
                  ),
                  SizedBox(height: 40),
                  InkWell(
                  child : Container(
                    width: 400,
                    height: 30,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(child: Text('Login',style: TextStyle(color: Colors.white),)),
                  ),
                      onTap: () {
                        if (!_usernameController.text.toString().isEmpty &&
                            !_passwordController.text.toString().isEmpty) {
                          Get.lazyPut(() => PostController());
                          Get.to(PostsScreen(color, color2));
                        } else {
                          Get.showSnackbar(
                            GetSnackBar(
                              backgroundColor: Colors.blueGrey[900]!,
                              title: "Error",
                              message: "Username or Password mustn't be empty",
                              icon: const Icon(
                                Icons.error_outline,
                                color: Colors.red,
                              ),
                              duration: const Duration(seconds: 3),
                              snackPosition: SnackPosition.TOP,
                            ),
                          );
                        }
                      }
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
