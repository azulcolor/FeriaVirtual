import 'package:feriavirtual/components/components.dart';
import 'package:feriavirtual/models/universities_model.dart';
import 'package:feriavirtual/providers/universities_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:feriavirtual/components/downloadButton.dart';
import 'package:feriavirtual/components/universityInfo.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:carousel_slider/carousel_slider.dart';

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

          int welcomeId = university.videos.indexWhere((e) => e.seccionId == 1);

          //Configuración para los videos
          YoutubePlayerController controller = YoutubePlayerController(
            initialVideoId: YoutubePlayerController.convertUrlToId(
                    university.videos[welcomeId].recurso)
                .toString(),
            params: const YoutubePlayerParams(
              showFullscreenButton: true,
            ),
          );
          return Scaffold(
              appBar: const HeaderInfo(),
              body: Center(
<<<<<<< HEAD
                child: ListView(
                  children: [
                    ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        WelcomeWidget(
                            university: university, controller: controller),
                        EducationWidget(university: university),
                        VideosWidget(
                            university: university, controller: controller),
                      ],
                    ),
                    Text(
                      'Fotos',
                      textAlign: TextAlign.center,
                      style: GlobalVariables.h2B,
                    ),
                    const SizedBox(height: 20),
                    CarouselSlider.builder(
                      options: CarouselOptions(
                          autoPlay: true, enlargeCenterPage: true),
                      itemCount: university.fotos.length,
                      itemBuilder: (context, index, realIndex) =>
                          Image.network(university.fotos[index].recurso),
                    )
                  ],
=======
                child: SizedBox(
                  width: screenWidth * 0.9,
                  child: ListView(
                    children: [
                      const SizedBox(height: 40),
                      WelcomeWidget(
                          university: university, controller: controller),
                      const SizedBox(height: 40),
                      EducationWidget(university: university),
                      const SizedBox(height: 40),
                      VideosWidget(
                          university: university, controller: controller),
                      const SizedBox(height: 40),
                      CarouselWidget(university: university),
                      const SizedBox(height: 40),
                      Text(
                        'Contacto',
                        textAlign: TextAlign.center,
                        style: GlobalVariables.h2B,
                      ),
                    ],
                  ),
>>>>>>> 792c318c2e85098574ce1ec8db665baddf9402a4
                ),
              ));
        });
  }
}

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    Key? key,
    required this.university,
  }) : super(key: key);

  final UniversityInfo university;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Fotos',
          textAlign: TextAlign.center,
          style: GlobalVariables.h2B,
        ),
        const SizedBox(height: 20),
        CarouselSlider.builder(
          options: CarouselOptions(autoPlay: true, enlargeCenterPage: true),
          itemCount: university.fotos.length,
          itemBuilder: (context, index, realIndex) =>
              Image.network(university.fotos[index].recurso),
        )
      ],
    );
  }
}

class VideosWidget extends StatelessWidget {
  const VideosWidget({
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
        Text(
          'Videos',
          textAlign: TextAlign.center,
          style: GlobalVariables.h2B,
        ),
        const SizedBox(height: 20),
        ListView.builder(
            itemCount: university.videos.length,
            shrinkWrap: true,
            itemBuilder: (_, int index) => YoutubePlayerIFrame(
                  controller: controller,
                  aspectRatio: 16 / 9,
                )),
      ],
    );
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
        YoutubePlayerIFrame(
          controller: controller,
          aspectRatio: 16 / 9,
        ),
      ],
    );
  }
}
