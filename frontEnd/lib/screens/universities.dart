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
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const Header(),
      body: Center(
        child: Container(
          width: screenWidth * 0.9,
          color: GlobalVariables.backgroundColor,
          child: Column(
            children: [
              Image.asset(
                'assets/images/universidadTest.jpg',
              ),
              Text(
                'Universidad Partenón de Cozumel',
                textAlign: TextAlign.center,
                style: GlobalVariables.h3B,
              ),
              EducativeOfferWidget(),
              EducativeOfferWidget(),
              EducativeOfferWidget(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Beca disponible',
                  style: GlobalVariables.mediumTextGreen,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: GlobalVariables.grayColor),
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    'Humanidades',
                    style: GlobalVariables.smallTextB,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EducativeOfferWidget extends StatefulWidget {
  const EducativeOfferWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<EducativeOfferWidget> createState() => _EducativeOfferWidgetState();
}

class _EducativeOfferWidgetState extends State<EducativeOfferWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          FontAwesomeIcons.graduationCap,
          size: 12,
          color: GlobalVariables.grayColor,
        ),
        Text(
          '4 Licenciaturas',
          style: GlobalVariables.mediumTextG,
        )
      ],
    );
  }
}
