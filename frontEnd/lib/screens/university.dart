import 'package:feriavirtual/components/header.dart';
import 'package:feriavirtual/components/headerPrueba.dart';
import 'package:feriavirtual/models/universities_model.dart';
import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class University extends StatelessWidget {
  static const String routeName = '/details';
  const University({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UniversitiesResponse university =
        ModalRoute.of(context)!.settings.arguments as UniversitiesResponse;

    String? videoId =
        YoutubePlayer.convertUrlToId("https://youtu.be/rR3rH75kp6w");
    final YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: videoId.toString(),
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: HeaderPrueba(university: university.nombre),
        body: Center(
          child: Container(
            width: screenWidth * 0.9,
            child: ListView(
              children: [
                const SizedBox(height: 40),
                Image.network(
                  university.rutaEscudo,
                  height: 200,
                ),
                const SizedBox(height: 10),
                Text(
                  university.nombre,
                  textAlign: TextAlign.center,
                  style: GlobalVariables.h2B,
                ),
                const SizedBox(height: 30),
                Text(
                  'Bienvenida',
                  textAlign: TextAlign.center,
                  style: GlobalVariables.h3Blue,
                ),
                const SizedBox(
                  height: 10,
                ),
                YoutubePlayer(
                  controller: controller,
                  liveUIColor: Colors.amber,
                ),
              ],
            ),
          ),
        ));
  }
}
