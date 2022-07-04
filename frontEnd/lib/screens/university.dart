import 'package:feriavirtual/components/header.dart';
import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class University extends StatelessWidget {
  const University({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: const Header(),
        body: Center(
          child: ListView(
            children: [Image.asset('assets/images/universidadTest.jpg')],
          ),
        ));
  }
}
