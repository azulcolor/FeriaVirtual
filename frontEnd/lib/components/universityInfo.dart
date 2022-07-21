import 'package:flutter/material.dart';

class UniversityImage extends StatelessWidget {
  String image;
  UniversityImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (image != "NA") {
      return Image.network(image, height: 250,);
    }
    return const Image(
      image: AssetImage('assets/images/logo.png'),
    );
  }
}
