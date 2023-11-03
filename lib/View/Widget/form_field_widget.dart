import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormFieldWidget extends StatelessWidget {

 final bodycontroller ;
  String name;
  String lable;
  bool boolval;
  IconData ?suffixIcon;
  IconData prefixIcon;

  FormFieldWidget({
   required this.bodycontroller,
    super.key,
    required this.name,
    required this.lable,
    required this.boolval,
    this.suffixIcon,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      controller: bodycontroller,
      name: name,
      decoration: InputDecoration(
       prefixIconColor: Colors.white,
       labelStyle: TextStyle(color: Colors.white),
        labelText: lable,
        suffixIcon: Icon(suffixIcon),
        prefixIcon: Icon(prefixIcon),
      ),
      obscureText: boolval,
    );
  }
}
