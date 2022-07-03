import 'package:feriavirtual/components/header.dart';
import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Universities extends StatefulWidget {
  const Universities({Key? key}) : super(key: key);

  @override
  State<Universities> createState() => _UniversitiesState();
}

class _UniversitiesState extends State<Universities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (_, int index) => const ShowUniversities(),
      ),
    );
  }
}

class EducativeOfferWidget extends StatelessWidget {
  final int kindOf;
  final int number;
  const EducativeOfferWidget({
    Key? key,
    required this.kindOf,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = '';

    if (kindOf == 1) {
      if (number == 1) {
        text = '$number licenciatura';
      } else {
        text = '$number licenciaturas';
      }
    } else if (kindOf == 2) {
      if (number == 1) {
        text = '$number maestría';
      } else {
        text = '$number maestrías';
      }
    } else if (kindOf == 3) {
      if (number == 1) {
        text = '$number doctorado';
      } else {
        text = '$number doctorados';
      }
    }

    return Row(
      children: [
        const Icon(
          FontAwesomeIcons.graduationCap,
          size: 12,
          color: GlobalVariables.grayColor,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: GlobalVariables.mediumTextG,
        )
      ],
    );
  }
}

class ShowUniversities extends StatelessWidget {
  const ShowUniversities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        width: screenWidth * 0.9,
        color: GlobalVariables.backgroundColor,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/universidadTest.jpg',
            ),
            const SizedBox(height: 5),
            Text(
              'Universidad Partenón de Cozumel',
              textAlign: TextAlign.center,
              style: GlobalVariables.h3B,
            ),
            const SizedBox(height: 5),
            const EducativeOfferWidget(kindOf: 1, number: 1),
            const SizedBox(height: 5),
            const EducativeOfferWidget(kindOf: 2, number: 4),
            const SizedBox(height: 5),
            const EducativeOfferWidget(kindOf: 3, number: 0),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Beca disponible',
                style: GlobalVariables.mediumTextGreen,
              ),
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: GlobalVariables.grayColor),
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  'Humanidades',
                  style: GlobalVariables.smallTextB,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
