
import 'package:assiment/View/Posts%20Screan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'SnakBar.dart';

import 'form_field_widget.dart';

void openDialog() {
var _bodyController = TextEditingController();
var _titleController = TextEditingController();
  Get.dialog(
    AlertDialog(
      backgroundColor: Colors.blueGrey[800],
      title: const Text('Add Post',style: TextStyle(color: Colors.white),),
      content: Container(// Dialog background
        width: double.infinity, // Dialog width
        height: 200, // Dialog height
        child: Column(
            children: [
              FormFieldWidget(
                bodycontroller: _titleController,
                name: 'Title',
                lable: 'Title',
                boolval: false,
                prefixIcon: Icons.title,
              ),
             const SizedBox(height: 20,),
              FormFieldWidget(
                bodycontroller: _bodyController,
                name: 'Body',
                lable: 'Body',
                boolval: false,
                prefixIcon: Icons.add_box,
              ),
            ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text("Submit"),
          onPressed: () {
            Get.back();
             if( !_titleController.text.toString().isEmpty && !_bodyController.text.toString().isEmpty) {
               Get.showSnackbar(
                 GetSnackBar(
                   backgroundColor: Colors.blueGrey[900]!,
                   title: 'Done',
                   message: 'Published successfully',
                   icon: const Icon(Icons.done,color: Colors.green,),
                   duration: const Duration(seconds: 3),
                   snackPosition: SnackPosition.TOP,
                 ),
               );

            }else{
               Get.showSnackbar(
                 GetSnackBar(
                   backgroundColor: Colors.blueGrey[900]!,
                   title: 'Error',
                   message: 'Title or body must not be empty',
                   icon: const Icon(Icons.error_outline,color: Colors.red,),
                   duration: const Duration(seconds: 3),
                   snackPosition: SnackPosition.TOP,
                 ),);
            }
          }
        ),
      ],
    ),
  );
}