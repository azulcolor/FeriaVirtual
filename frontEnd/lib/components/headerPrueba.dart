import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';

class HeaderPrueba extends StatelessWidget implements PreferredSizeWidget {
  final String university;
  const HeaderPrueba({
    Key? key,
    required this.university,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: GlobalVariables.primaryColor,
      centerTitle: true,
      title: Text(
        'Feria virtual',
        style: GlobalVariables.h2W,
      ),
    );
  }
}
