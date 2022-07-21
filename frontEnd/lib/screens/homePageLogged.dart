import 'package:carousel_slider/carousel_slider.dart';
import 'package:feriavirtual/components/components.dart';
import 'package:feriavirtual/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          PageLogged1(),
          PageLogged2(),
          PageLogged3(),
        ],
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Container(child: Image.asset('assets/images/banner.jpg')),
        ],
      ),
    );
  }
}

class PageLogged1 extends StatelessWidget {
  const PageLogged1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TitleWidget(
          screenWidth: screenWidth,
          title: "Bienvenido a la feria virtual 2022",
        ),
        SizedBox(height: 50),
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
        SizedBox(height: 20),
        BodyTextWidget(
          text:
              'La Feria Virtual Universitaria es un evento estatal que reúne a todos los programas educativos de nivel superior,en un esfuerzo por acercar la Oferta Educativa a todos los jóvenes que quieren continuar su formación cursando una carrera universitaria.',
        ),
      ],
    );
  }
}

class PageLogged2 extends StatelessWidget {
  const PageLogged2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(child: Image.asset('assets/images/school.png', height: 200)),
        TitleWidget(
          screenWidth: screenWidth,
          title: "¿Qué es la feria virtual?",
        ),
        BodyTextWidget(
          text:
              'El gobierno del estado de quintana roo, a través de la secretaría de educación y la comisión estatal para la planeación de la educación superior (coepes), realizan un evento virtual en el que se promociona la oferta educativa de más de 60 instituciones para estudiantes de educación media superior e interesados en cursar estudios de nivel técnico superior, licenciatura o posgrado.',
        ),
      ],
    );
  }
}

class PageLogged3 extends StatelessWidget {
  const PageLogged3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(child: Image.asset('assets/images/info.png', height: 200)),
        TitleWidget(
          screenWidth: screenWidth,
          title: "Información de la feria virtual",
        ),
        SizedBox(height: 10),
        ButtonWidget(link: '', text: 'Aviso de Privacidad'),
        ButtonWidget(link: '', text: 'Mapa de sitio'),
        ButtonWidget(link: 'https://qroo.gob.mx/seq/', text: 'Ir a la SEQ'),
        SizedBox(height: 10),
      ],
    );
  }
}

class BodyTextWidget extends StatelessWidget {
  String text;
  BodyTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 60),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GlobalVariables.bodyTextB,
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  String title;
  TitleWidget({
    Key? key,
    required this.title,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.5,
      margin: const EdgeInsets.only(top: 30),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GlobalVariables.h2B,
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  String link;
  String text;
  ButtonWidget({Key? key, required this.link, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        SizedBox(
          width: 280,
          child: ElevatedButton(
            onPressed: () => {launch(link)},
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    GlobalVariables.backgroundColor),
                backgroundColor: MaterialStateProperty.all<Color>(
                    GlobalVariables.primaryColor),
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.all(20))),
            child: Text(
              text,
              style: GlobalVariables.bigTextW,
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
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
