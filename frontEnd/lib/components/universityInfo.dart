import 'package:flutter/material.dart';

class UniversityImage extends StatelessWidget {
  String image;
  UniversityImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (image != "NA") {
      return Image(
        image: NetworkImage(image),
      );
    }
    return const Image(
      image: AssetImage('assets/images/logo.png'),
    );
  }
}
