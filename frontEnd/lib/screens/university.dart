import 'package:feriavirtual/components/components.dart';
import 'package:feriavirtual/models/universities_model.dart';
import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';
<<<<<<< HEAD
=======
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
>>>>>>> 265855a51e7afb4d1d15e111333cbca4e37db3d5

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
        appBar: const HeaderInfo(),
        body: Center(
<<<<<<< HEAD
          child: ListView(
            children: [
              UniversityImage(image: university.rutaEscudo),
              Text(
                university.nombre,
                textAlign: TextAlign.center,
                style: GlobalVariables.h3B,
              )
            ],
=======
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
>>>>>>> 265855a51e7afb4d1d15e111333cbca4e37db3d5
          ),
        ));
  }
}
