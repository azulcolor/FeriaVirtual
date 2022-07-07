import 'package:flutter/material.dart';
import 'package:feriavirtual/components/components.dart';


class Formulario extends StatelessWidget {
  const Formulario({Key? key}) : super(key: key);
  static const String routeName = 'formulary';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold(
      appBar: HeaderInfo(),
    );
  }
}
