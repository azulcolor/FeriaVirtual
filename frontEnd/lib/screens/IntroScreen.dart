import 'package:feriavirtual/constants/global_variables.dart';
import 'package:feriavirtual/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/user_provider.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() {
    return _IntroScreenState();
  }
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;

  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    setState(() {
      _counter = prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
    });
  }
  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title: "¡Bienvenido a la feria virtual, estudiante!",
        maxLineTitle: 3,
        description:
        "La feria virtual universitaria es un evento estatal que reúne todos los programas educativos de nivel nacional, en un esfuerzo por acercar la oferta educativa a todos los jóvenes que quieren continuar su formación cursando una carrera universitaria.",
        pathImage: "assets/images/intro_slider_1.png",
        backgroundColor: const Color(0xff294D86),
      ),
    );
    slides.add(
      Slide(
        title: "Busca información de diferentes universidades",
        maxLineTitle: 3,
        description:
        "En esta app encontrarás la información de las diferentes universidades estatales. Podrás ver las licenciaturas, maestrías y maestrías que ofrecen, becas, información de contacto, fotos y videos de las instalaciones.",
        pathImage: "assets/images/school.png",
        backgroundColor: const Color(0xff39598C),
      ),
    );

    slides.add(
      Slide(
        title: "Test vocacional hecho solo para tí",
        maxLineTitle: 3,
        description:
        "Elegir una carrera profesional es una decisión muy importante y conocerte mejor es un elemento clave para elegirla. Es por ello que se ha diseñado este test especialmente para ti con el propósito de que identifiques tus intereses y habilidades vocacionales.",
        pathImage: "assets/images/test.png",
        backgroundColor: const Color(0xff406195),
      ),
    );
    slides.add(
      Slide(
        title: "Disfruta la experiencia ¡Registrate!",
        maxLineTitle: 3,
        description:
        "Para disfrutar de todos los beneficios de nuestra app, regístrate en nuestra plataforma. Podrás ver las licenciaturas y todos los beneficios que ofrecen como: becas, información de contacto, fotos y videos de las instalaciones.",
        pathImage: "assets/images/key.png",
        backgroundColor: const Color(0xff445F89),
      ),
    );
  }

  void onDonePress() async{
    // Do what you want
    /*if(Provider.of<UserProvider>(context).user.token.isNotEmpty){
      Navigator.pushNamed(context,'mainPageLogged');
    }else{
      Navigator.pushNamed(context,'mainPage');
    }*/
    _incrementCounter();
    Navigator.pushNamed(context,'/auth-screen');
    print("End of slides");
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      renderSkipBtn: Text("Saltar",style: GlobalVariables.smallTextW2),
      renderNextBtn: Text("Siguiente",style: GlobalVariables.smallTextW2),
      renderDoneBtn: Text("Listo",style: GlobalVariables.smallTextW2,),
      onDonePress: onDonePress,
      colorDot:  GlobalVariables.yellowColor,
      sizeDot: 13.0,
      typeDotAnimation: DotSliderAnimation.SIZE_TRANSITION,
    );
  }
}