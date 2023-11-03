import 'package:assiment/View/Widget/Daialog.dart';
import'package:flutter/material.dart';
import 'package:get/get.dart';

class Action_Buttom extends StatelessWidget {
  late var Title;
  late var Body;
  @override
  Widget build(BuildContext context) {
    return   Padding(
    padding: const EdgeInsets.only(right: 260,bottom: 20),
    child: FloatingActionButton(
    child: Icon(
    Icons.add,
    color: Colors.white,
    ),
    backgroundColor: Colors.blueGrey[800],
    onPressed: openDialog,
    ),
    );
     }
}
