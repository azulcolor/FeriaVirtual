import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: GlobalVariables.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: SafeArea(
          child: Row(children: [
            //Logo
            Image.asset(
              'assets/images/logo.png',
              width: 50,
            ),

            //App Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Feria virtual',
                style: GlobalVariables.h2W,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
