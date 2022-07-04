import 'package:feriavirtual/components/header.dart';
import 'package:feriavirtual/screens/test.dart';
import 'package:feriavirtual/screens/universities.dart';
import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageLogged extends StatefulWidget {
  const HomePageLogged({Key? key}) : super(key: key);

  @override
  State<HomePageLogged> createState() => _HomePageLoggedState();
}

class _HomePageLoggedState extends State<HomePageLogged> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const Header(),
      body: Center(
        child: ScreenWidget(screenWidth: screenWidth),
      ),
    );
  }
}

class ScreenWidget extends StatelessWidget {
  const ScreenWidget({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.9,
      color: GlobalVariables.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ImageWidget(),
          TitleWidget(screenWidth: screenWidth),
          const BodyTextWidget()
        ],
      ),
    );
  }
}

class BodyTextWidget extends StatelessWidget {
  const BodyTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 40),
      child: Text(
        'La Feria Virtual Universitaria es un evento estatal que reúne a todos los programas educativos de nivel superior,en un esfuerzo por acercar la Oferta Educativa a todos los jóvenes que quieren continuar su formación cursando una carrera universitaria.',
        textAlign: TextAlign.center,
        style: GlobalVariables.bodyTextB,
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.5,
      margin: EdgeInsets.only(top: 40),
      child: Text(
        "Bienvenido a la feria virtual 2022",
        textAlign: TextAlign.center,
        style: GlobalVariables.h2B,
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Universities()),
        )
      },
      style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all<Color>(GlobalVariables.backgroundColor),
          backgroundColor:
              MaterialStateProperty.all<Color>(GlobalVariables.primaryColor),
          padding:
              MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(20))),
      child: Text(
        'Universidades',
        style: GlobalVariables.bigTextW,
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/images/feriaVirtual1.jpg',
          )),
    );
  }
}
