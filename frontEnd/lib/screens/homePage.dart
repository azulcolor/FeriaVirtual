import 'package:feriavirtual/components/components.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imagesRoutes = [
      'assets/images/feriaVirtual1.jpg',
      'assets/images/feriaVirtual2.jpg',
      'assets/images/feriaVirtual3.jpg',
      'assets/images/feriaVirtual4.jpg',
      'assets/images/feriaVirtual5.jpg',
    ];
    return Scaffold(
      appBar: Header(),
      body: Center(
        child: CarouselSlider.builder(
            options: CarouselOptions(
              height: 150,
              autoPlay: true,
            ),
            itemCount: imagesRoutes.length,
            itemBuilder: (context, index, realIndex) {
              final imagesRoute = imagesRoutes[index];

              return buildImage(imagesRoute, index);
            }),
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
