import 'package:feriavirtual/components/components.dart';
import 'package:feriavirtual/models/universities_model.dart';
import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:feriavirtual/components/downloadButton.dart';
import 'package:feriavirtual/components/universityInfo.dart';

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
          child: Container(
            width: screenWidth * 0.9,
            child: ListView(
              children: [
                const SizedBox(height: 40),
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
                const SizedBox(
                  height: 40,
                ),
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
                const DownloadButton(
                  url:
                      "https://feriavirtual-upqroo.ozelot.it/SeccionAdministrativa/docs_Unis/carreras/1645197930.pdf",
                  fileName: "LICENCIATURA EN ADMINISTRACIÓN",
                ),
                const DownloadButton(
                  url:
                      "https://feriavirtual-upqroo.ozelot.it/SeccionAdministrativa/docs_Unis/carreras/1645197930.pdf",
                  fileName: "LICENCIATURA EN ADMINISTRACIÓN",
                ),
              ],
            ),
          ),
        ));
  }
}
