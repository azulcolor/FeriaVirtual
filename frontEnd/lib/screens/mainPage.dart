import 'package:feriavirtual/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:feriavirtual/components/header.dart';
import 'package:feriavirtual/constants/global_variables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Importaciones para probar pantallas
import 'package:feriavirtual/screens/homePageLogged.dart';
<<<<<<< HEAD
import 'package:feriavirtual/screens/universities.dart';
=======
import 'package:feriavirtual/features/auth/test_screens/tauth_screen.dart';
>>>>>>> dcd967d086fa46fee18997b7f00fd72b6d2f4e90

class MainPage extends StatefulWidget {
  static const String routeName = '/mainPage';
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 1;

  List<Widget> screens = [
    const Universities(),
    const homePage(),
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
      appBar: const Header(),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(FontAwesomeIcons.circleInfo, size: 23),
            ),
            label: 'Info',
          ),
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
          ),
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
