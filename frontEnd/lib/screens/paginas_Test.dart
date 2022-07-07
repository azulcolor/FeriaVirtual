import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';
import './test.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

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
              Expanded(
                flex: 2,
                child: Container(),
              ),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Instrucciones",
                    style: GlobalVariables.h2B,
                    textAlign: TextAlign.center,
                  )),
              Text(
                'Encontrará un cierto número de actividades agrupadas de tres en tres. En cada grupo, lea las tres actividades, decida cuál le gusta más y cuál le gusta menos, y CONTESTE marcando la casilla en la columna "Prefiero" al frente de la frase con la actividad que más le gusta y marcando la casilla en la columna "No Prefiero" frente a la actividad que le agrade menos.',
                style: GlobalVariables.bodyTextB,
                textAlign: TextAlign.center,
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 0, right: 10, bottom: 10),
                  child: Image.asset("assets/images/videogiffinal.gif")),
              //const AnimacionEntrada(icono: Icons.assignment, tamano: 70),
              Text(
                "Con base a tus respuestas se te proporcionará tu perfil vocacional y las carreras asociadas a éste.",
                style: GlobalVariables.bodyTextB,
                textAlign: TextAlign.center,
              ),
              //const AnimacionEntrada(icono: Icons.auto_stories, tamano: 90),
              Expanded(child: Container()),
              const FlechaAnimada()
            ],
          ),
        ),
      ),
    );

    ;
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

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
              Expanded(
                flex: 2,
                child: Container(),
              ),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Detalles",
                    style: GlobalVariables.h2B,
                    textAlign: TextAlign.center,
                  )),
              Text(
                'Encontrará algunas actividades que implican unos estudios y una experiencia. En estos casos, supóngase que usted ya posee estos estudios y experiencia. No elija una actividad porque es nueva, poco común o está de moda. Piense en lo que usted preferiría hacer si estuviera igualmente familiarizado con todas las actividades.',
                style: GlobalVariables.bodyTextB,
                textAlign: TextAlign.center,
              ),
              //const AnimacionEntrada(icono: Icons.assignment, tamano: 70),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Algunas actividades pueden parecerle triviales o ridículas. Por favor, indique de todas formas sus preferencias en todos los grupos; son necesarios para ayudarle a usted con un informe completo. Sus respuestas serán guardadas de forma confidencial.",
                    style: GlobalVariables.bodyTextB,
                    textAlign: TextAlign.center,
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "EL TIEMPO ESTIMADO PARA RESPONDER LA PRUEBA ES DE 45 A 60 MINUTOS MÁXIMO",
                    style: GlobalVariables.bodyTextB,
                    textAlign: TextAlign.center,
                  )),
              //const AnimacionEntrada(icono: Icons.auto_stories, tamano: 90),
              Expanded(child: Container()),
              const SiguientePage()
            ],
          ),
        ),
      ),
    );
  }
}

class SiguientePage extends StatefulWidget {
  const SiguientePage({Key? key}) : super(key: key);

  @override
  State<SiguientePage> createState() {
    return _SiguientePageState();
  }
}

class _SiguientePageState extends State<SiguientePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding: const EdgeInsets.only(bottom: 45) , child: ElevatedButton(
      style: ElevatedButton.styleFrom(primary: GlobalVariables.primaryColor,
          onPrimary: GlobalVariables.backgroundColor),
      onPressed: () {
        Navigator.pushNamed(context, 'formulary');
      },
      child: Text('Iniciar Test',style: GlobalVariables.smallTextW),
    ));
  }
}