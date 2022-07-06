import 'package:feriavirtual/components/header.dart';
import 'package:feriavirtual/components/headerPrueba.dart';
import 'package:feriavirtual/models/universities_model.dart';
import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class University extends StatelessWidget {
  static const String routeName = '/details';
  const University({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UniversitiesResponse university =
        ModalRoute.of(context)!.settings.arguments as UniversitiesResponse;

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: HeaderPrueba(university: university.nombre),
        body: Center(
          child: ListView(
            children: [
              Image.network(university.rutaEscudo),
              Text(
                university.nombre,
                textAlign: TextAlign.center,
                style: GlobalVariables.h3B,
              )
            ],
          ),
        ));
  }
}
//firmao