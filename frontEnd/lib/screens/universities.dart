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
        itemCount: 5,
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
        text = '$number Licenciatura';
      } else {
        text = '$number Licenciaturas';
      }
    } else if (kindOf == 2) {
      if (number == 1) {
        text = '$number Maestría';
      } else {
        text = '$number Maestrías';
      }
    } else if (kindOf == 3) {
      if (number == 1) {
        text = '$number Doctorado';
      } else {
        text = '$number Doctorados';
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
              child: Wrap(spacing: 5, runSpacing: 5, children: [
                for (int i = 0; i <= 4; i++)
                  const AreaWidget(
                    text: "Humanidades",
                  )
              ]),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class AreaWidget extends StatelessWidget {
  final String text;
  const AreaWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: GlobalVariables.grayColor),
          borderRadius: BorderRadius.circular(50)),
      child: Text(
        text,
        style: GlobalVariables.smallTextB,
      ),
    );
  }
}
