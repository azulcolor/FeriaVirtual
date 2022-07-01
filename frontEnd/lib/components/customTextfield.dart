import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final IconData? icon;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.icon,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: GlobalVariables.yellowColor,
        filled: true,
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
        )),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        labelStyle: TextStyle(
          color: GlobalVariables.blackColor,
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Ingresa tu $hintText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
