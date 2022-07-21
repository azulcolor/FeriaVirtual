import 'package:carousel_slider/carousel_slider.dart';
import 'package:feriavirtual/components/components.dart';
import 'package:feriavirtual/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';

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
      appBar: Header(),
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
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider.builder(
              options: CarouselOptions(
                height: 150,
                autoPlay: true,
              ),
              itemCount: GlobalVariables.imagesRoutes.length,
              itemBuilder: (context, index, realIndex) {
                final imagesRoute = GlobalVariables.imagesRoutes[index];

                return buildImage(imagesRoute, index);
              }),
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
      margin: const EdgeInsets.only(top: 40),
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

Widget buildImage(String imageRoute, int index) => Container(
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            image: AssetImage(imageRoute),
            fit: BoxFit.fill,
          )),
      margin: const EdgeInsets.symmetric(horizontal: 12),
    );
