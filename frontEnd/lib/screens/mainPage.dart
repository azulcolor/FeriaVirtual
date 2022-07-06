import 'package:feriavirtual/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  static const String routeName = '/mainPage';
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  List<Widget> screens = [
    const HomePage(),
    const AuthScreen(),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(FontAwesomeIcons.houseUser, size: 23),
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(FontAwesomeIcons.rightToBracket, size: 23),
            ),
            label: 'Ingresar',
          )
        ],
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: GlobalVariables.primaryColor,
        unselectedItemColor: GlobalVariables.backgroundColor,
        selectedItemColor: GlobalVariables.yellowColor,
      ),
    );
  }
}
