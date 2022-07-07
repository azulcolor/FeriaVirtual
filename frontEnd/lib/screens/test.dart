import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';
import '../components/headers.dart';
import './paginas_Test.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: GlobalVariables.primaryColor,
        appBar: const Header(),
        body: PageView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [Page1(), const Page2(),const Page3()]));
  }
}

class Page1 extends StatelessWidget {
  Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 10,
            right: 10,
            bottom: 0.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 2,child: Container(),),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child:
                  Text(
                    "Test Vocacional",
                    style: GlobalVariables.h2B,
                    textAlign: TextAlign.center,
                  )),
              Text(
                "Elegir una carrera profesional es una decisión muy importante y conocerte mejor es un elemento clave para elegirla.",
                style: GlobalVariables.bodyTextB,
                textAlign: TextAlign.center,
              ),
               const AnimacionEntrada(icono: Icons.assignment, tamano: 70),
              Text(
                "Es por ello que se ha diseñado este test especialmente para ti con el propósito de que identifiques tus intereses y habilidades vocacionale",
                style: GlobalVariables.bodyTextB,
                textAlign: TextAlign.center,
              ),
              const AnimacionEntrada(icono: Icons.auto_stories, tamano: 90),
              Expanded(child: Container()),
              const FlechaAnimada()
            ],
          ),
        ),
      ),
    );
  }
}

class FlechaAnimada extends StatefulWidget {
  const FlechaAnimada({Key? key}) : super(key: key);

  @override
  State<FlechaAnimada> createState() => _FlechaAnimada();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _FlechaAnimada extends State<FlechaAnimada>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FadeTransition(
        opacity: _animation,
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Icon(Icons.keyboard_arrow_down, size: 100, color: GlobalVariables.yellowColor),
        ),
      ),
    );
  }
}

class AnimacionEntrada extends StatefulWidget {
   const AnimacionEntrada( {Key? key, required this.icono,required this.tamano}) : super(key: key);
  final IconData icono;
  final double tamano;

  @override
  State<AnimacionEntrada> createState() => _AnimacionEntrada();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _AnimacionEntrada extends State<AnimacionEntrada>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  var icono ;
  var tamano ;
  //IconData? get icono2 => widget.icono;

  @override
  void initState() {
    super.initState();
    _controller.forward();
    icono = widget.icono;
    tamano = widget.tamano;
    if (kDebugMode) {
      print(widget.icono);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FadeTransition(
        opacity: _animation,
        child:  Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(icono,
              size: tamano, color: GlobalVariables.primaryColor),
        ),
      ),
    );
  }
}

class RadioButton extends StatefulWidget {
  RadioButton({Key? key}) : super(key: key);

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


