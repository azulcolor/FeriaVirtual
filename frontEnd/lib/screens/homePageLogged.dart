import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';

class HomePageLogged extends StatelessWidget {
  const HomePageLogged({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
        children: [
          ImageWidget(),
          TitleWidget(screenWidth: screenWidth),
          BodyTextWidget(),
          ButtonWidget()
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
      onPressed: () => null,
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
      margin: EdgeInsets.only(top: 40),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/images/feriaVirtual1.jpg',
          )),
    );
  }
}
