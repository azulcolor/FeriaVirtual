import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';
import '../components/headers.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: GlobalVariables.primaryColor,
        appBar: Header(),
        body: PageView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [Page1(), Page1()]));
  }
}

class Page1 extends StatelessWidget {
  Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          verticalDirection: VerticalDirection.up,
          children: [
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Test Vocacional",
                            style: GlobalVariables.h2B,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          "Elegir una carrera profesional es una decisión muy importante y conocerte mejor es un elemento clave para elegirla.",
                          style: GlobalVariables.bodyTextB,
                          textAlign: TextAlign.center,
                        ),
                        const AnimacionEntrada(),
                      ],
                    ))),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [FlechaAnimada()],
            ),
          ],
        ),
      ),
    );
  }
}

class FlechaAnimada extends StatefulWidget {
  const FlechaAnimada({Key? key}) : super(key: key);

  @override
  State<FlechaAnimada> createState() => _FlechaAnimada();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _FlechaAnimada extends State<FlechaAnimada>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FadeTransition(
        opacity: _animation,
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Icon(Icons.arrow_forward_rounded,
              size: 50, color: GlobalVariables.yellowColor),
        ),
      ),
    );
  }
}

class AnimacionEntrada extends StatefulWidget {
  const AnimacionEntrada({Key? key}) : super(key: key);

  @override
  State<AnimacionEntrada> createState() => _AnimacionEntrada();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _AnimacionEntrada extends State<AnimacionEntrada>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FadeTransition(
        opacity: _animation,
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Icon(Icons.assignment,
              size: 100, color: GlobalVariables.primaryColor),
        ),
      ),
    );
  }
}

class RadioButton extends StatefulWidget {
  RadioButton({Key? key}) : super(key: key);

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
