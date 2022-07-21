import 'package:feriavirtual/components/components.dart';
import 'package:feriavirtual/models/universities_model.dart';
import 'package:feriavirtual/providers/universities_provider.dart';
import 'package:feriavirtual/screens/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:feriavirtual/components/downloadButton.dart';
import 'package:feriavirtual/components/universityInfo.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

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
                child: SizedBox(
                  width: screenWidth * 0.9,
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Column(
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
                        DownloadButton(
                            url: university.admision,
                            fileName: "PROCESO DE ADMISIÓN"),
                        const SizedBox(height: 40),
                        ContactWidget(
                            screenWidth: screenWidth, university: university),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    Key? key,
    required this.screenWidth,
    required this.university,
  }) : super(key: key);

  final double screenWidth;
  final UniversityInfo university;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Contacto',
          textAlign: TextAlign.center,
          style: GlobalVariables.h2B,
        ),
        const SizedBox(height: 20),
        Information(screenWidth: screenWidth, university: university),
        const SizedBox(height: 20),
        Social(university: university)
      ],
    );
  }
}

class Social extends StatelessWidget {
  const Social({
    Key? key,
    required this.university,
  }) : super(key: key);

  final UniversityInfo university;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var item in university.redesSociales)
          if (item.redSocial == "FACEBOOK")
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.facebookF,
                  size: 30,
                  color: Color.fromARGB(255, 24, 119, 242),
                ),
                onPressed: () => launch(item.recurso),
              ),
            )
          else if (item.redSocial == "INSTAGRAM")
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.instagram,
                  size: 30,
                  color: Color.fromARGB(255, 225, 48, 108),
                ),
                onPressed: () => launch(item.recurso),
              ),
            )
          else if (item.redSocial == "WHATSAPP")
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: const Icon(
                FontAwesomeIcons.whatsapp,
                size: 30,
                color: Color.fromARGB(255, 7, 94, 84),
              ),
            )
          else if (item.redSocial == "TWITTER")
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.twitter,
                  size: 30,
                  color: Color.fromARGB(255, 29, 160, 242),
                ),
                onPressed: () => launch(item.recurso),
              ),
            )
          else if (item.redSocial == "PAGINA WEB")
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.globe,
                  size: 30,
                  color: GlobalVariables.primaryColor,
                ),
                onPressed: () => launch(item.recurso),
              ),
            )
      ],
    );
  }
}

class Information extends StatelessWidget {
  const Information({
    Key? key,
    required this.screenWidth,
    required this.university,
  }) : super(key: key);

  final double screenWidth;
  final UniversityInfo university;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.8,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                FontAwesomeIcons.phone,
                size: 20,
                color: GlobalVariables.primaryColor,
              ),
              SizedBox(width: 10),
              Text(
                university.telefono,
                style: GlobalVariables.bodyTextB,
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                FontAwesomeIcons.at,
                size: 20,
                color: GlobalVariables.primaryColor,
              ),
              SizedBox(width: 10),
              Flexible(
                child: Text(
                  university.correoElectronico,
                  style: GlobalVariables.bodyTextB,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                FontAwesomeIcons.locationDot,
                size: 20,
                color: GlobalVariables.primaryColor,
              ),
              SizedBox(width: 10),
              Flexible(
                child: Text(
                  university.direccion,
                  style: GlobalVariables.bodyTextB,
                ),
              ),
            ],
          ),
        ],
      ),
    );
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
        InteractiveViewer(
          minScale: 0.1,
          maxScale: 3,
          scaleEnabled: true,
          panEnabled: false,
          child: CarouselSlider.builder(
            options: CarouselOptions(autoPlay: true, enlargeCenterPage: true),
            itemCount: university.fotos.length,
            itemBuilder: (context, index, realIndex) {
              if (university.fotos[index].recurso == "NA")
                return Image.network(university.rutaEscudo);
              else
                return Image.network(university.fotos[index].recurso);
            },
          ),
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
        SizedBox(
          height: 200,
          child: ListView.builder(
              controller: ScrollController(),
              itemCount: university.videos.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index) => YoutubePlayerIFrame(
                    controller: controller,
                    aspectRatio: 16 / 9,
                  )),
        ),
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
        /*Text(
          'Licenciatura',
          textAlign: TextAlign.center,
          style: GlobalVariables.h3Blue,
        ),
        const SizedBox(
          height: 10,
        ),*/
        SizedBox(
          height: 40,
          child: ListView.builder(
              controller: ScrollController(),
              itemCount: university.carreras.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index) => DownloadButton(
                    url: university.carreras[index].recurso,
                    fileName: university.carreras[index].nombre,
                  )),
        ),
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
