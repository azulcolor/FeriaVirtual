import 'package:feriavirtual/components/components.dart';
import 'package:feriavirtual/models/universities_model.dart';
import 'package:feriavirtual/providers/universities_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:feriavirtual/components/downloadButton.dart';
import 'package:feriavirtual/components/universityInfo.dart';

import '../models/models.dart';

class University extends StatelessWidget {
  static const String routeName = '/details';
  const University({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final universitiesProvider = Provider.of<UniversitiesProvider>(context);

    final int idUniversity = ModalRoute.of(context)!.settings.arguments as int;

    double screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder(
        future: universitiesProvider.getOnDisplayUniversityInfo(idUniversity),
        builder: (_, AsyncSnapshot<UniversityInfo> snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(
              appBar: HeaderInfo(),
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final university = snapshot.data!;

          String? videoId =
              YoutubePlayer.convertUrlToId(university.videos[1].recurso);

          final YoutubePlayerController controller = YoutubePlayerController(
            initialVideoId: videoId.toString(),
            flags: const YoutubePlayerFlags(
              autoPlay: false,
              mute: false,
            ),
          );
          return Scaffold(
              appBar: const HeaderInfo(),
              body: Center(
                child: SizedBox(
                  width: screenWidth * 0.9,
                  child: ListView(
                    children: [
                      const SizedBox(height: 40),
                      WelcomeWidget(
                          university: university, controller: controller),
                      const SizedBox(height: 40),
                      EducationWidget(university: university)
                    ],
                  ),
                ),
              ));
        });
  }
}

class EducationWidget extends StatelessWidget {
  const EducationWidget({
    Key? key,
    required this.university,
  }) : super(key: key);

  final UniversityInfo university;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Oferta educativa',
          textAlign: TextAlign.center,
          style: GlobalVariables.h2B,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Licenciatura',
          textAlign: TextAlign.center,
          style: GlobalVariables.h3Blue,
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
            itemCount: university.carreras.length,
            shrinkWrap: true,
            itemBuilder: (_, int index) => DownloadButton(
                  url: university.carreras[index].recurso,
                  fileName: university.carreras[index].nombre,
                )),
      ],
    );
  }
}

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({
    Key? key,
    required this.university,
    required this.controller,
  }) : super(key: key);

  final UniversityInfo university;
  final YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UniversityImage(image: university.rutaEscudo),
        const SizedBox(height: 10),
        Text(
          university.nombre,
          textAlign: TextAlign.center,
          style: GlobalVariables.h2B,
        ),
        const SizedBox(height: 20),
        Text(
          'Bienvenida',
          textAlign: TextAlign.center,
          style: GlobalVariables.h3Blue,
        ),
        const SizedBox(
          height: 10,
        ),
        YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: controller,
              liveUIColor: Colors.amber,
            ),
            builder: (context, player) {
              return Container(
                child: player,
              );
            }),
      ],
    );
  }
}
