import 'package:feriavirtual/components/headers.dart';
import 'package:feriavirtual/models/models.dart';
import 'package:feriavirtual/providers/universities_provider.dart';
import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Universities extends StatefulWidget {
  const Universities({Key? key}) : super(key: key);

  @override
  State<Universities> createState() => _UniversitiesState();
}

class _UniversitiesState extends State<Universities> {
  @override
  Widget build(BuildContext context) {
    final universitiesProvider = Provider.of<UniversitiesProvider>(context);
    List<UniversitiesResponse> university = universitiesProvider.universities;

    return Scaffold(
      appBar: HeaderSearch(universities: university),
      body: ListView.builder(
        itemCount: university.length,
        itemBuilder: (_, int index) => ShowUniversities(
            universities: universitiesProvider.universities, index: index),
      ),
    );
  }
}

class EducativeOfferWidget extends StatelessWidget {
  final List<UniversitiesResponse> universities;
  final int index;
  final int kindOf;
  const EducativeOfferWidget({
    Key? key,
    required this.universities,
    required this.index,
    required this.kindOf,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = '';
    int numberLic = universities[index].licenciatura;
    int numberMas = universities[index].maestria;
    int numberDoc = universities[index].doctorado;

    if (kindOf == 1) {
      if (universities[index].licenciatura == 1) {
        text = '$numberLic licenciatura';
      } else {
        text = '$numberLic licenciaturas';
      }
    } else if (kindOf == 2) {
      if (universities[index].licenciatura == 1) {
        text = '$numberMas maestría';
      } else {
        text = '$numberMas maestrías';
      }
    } else if (kindOf == 3) {
      if (universities[index].licenciatura == 1) {
        text = '$numberDoc doctorado';
      } else {
        text = '$numberDoc doctorados';
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

class Becas extends StatelessWidget {
  bool beca;
  Becas({Key? key, required this.beca}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (beca == true) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Beca disponible',
          style: GlobalVariables.mediumTextGreen,
        ),
      );
    } else {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Beca no disponible',
          style: GlobalVariables.mediumTextRed,
        ),
      );
    }
  }
}

class Tipo extends StatelessWidget {
  String tipo;
  Tipo({Key? key, required this.tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (tipo == 'Privada') {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          tipo,
          style: GlobalVariables.mediumTextBlue,
        ),
      );
    } else {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          tipo,
          style: GlobalVariables.mediumTextYellow,
        ),
      );
    }
  }
}

class ShowUniversities extends StatelessWidget {
  final List<UniversitiesResponse> universities;
  final int index;

  const ShowUniversities(
      {Key? key, required this.universities, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (universities[index].getUniversities == null) {
      return Container();
    } else {
      return Center(
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'details',
              arguments: universities[index].universidadId),
          child: Container(
            width: screenWidth * 0.9,
            color: GlobalVariables.backgroundColor,
            child: Column(
              children: [
                const SizedBox(height: 20),
                SizedBox(
                    height: 150,
                    width: screenWidth * .5,
                    child: universities[index].rutaEscudo != "NA"
                        ? Image(
                            image: NetworkImage(universities[index].rutaEscudo),
                          )
                        : const Image(
                            image: AssetImage('assets/images/logo.png'),
                          )),
                const SizedBox(height: 5),
                Text(
                  universities[index].nombre,
                  textAlign: TextAlign.center,
                  style: GlobalVariables.h3B,
                ),
                const SizedBox(height: 5),
                EducativeOfferWidget(
                    universities: universities, index: index, kindOf: 1),
                const SizedBox(height: 5),
                EducativeOfferWidget(
                    universities: universities, index: index, kindOf: 2),
                const SizedBox(height: 5),
                EducativeOfferWidget(
                    universities: universities, index: index, kindOf: 3),
                const SizedBox(height: 5),
                Tipo(tipo: universities[index].tipo),
                const SizedBox(height: 5),
                Becas(
                  beca: false,
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
        ),
      );
    }
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
        style: GlobalVariables.smallTextG,
      ),
    );
  }
}
