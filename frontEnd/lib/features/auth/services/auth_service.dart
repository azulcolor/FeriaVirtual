// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:feriavirtual/constants/global_variables.dart';
import 'package:feriavirtual/constants/utils.dart';
import 'package:feriavirtual/constants/error_handling.dart';
//import 'package:feriavirtual/features/auth/test_screens/widgets_test/bottom_bar.dart';
import 'package:feriavirtual/models/user.dart';
import 'package:feriavirtual/screens/homePage.dart';
import 'package:feriavirtual/screens/mainPage.dart';
import 'package:feriavirtual/screens/mainPageLogged.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:feriavirtual/providers/user_provider.dart';

class AuthService {
  // Sign Up user
  void signUpUser(
      {required BuildContext context,
      required String Nombre,
      required String Apellido_P,
      required String Apellido_M,
      required String Correo_Electronico,
      required String Telefono,
      required String Escuela, //escuela de procedencia
      required String? Area_ID, //area de interes
      required String? Motivo}) async {
    try {
      User user = User(
        Nombre: Nombre,
        Apellido_P: Apellido_P,
        Apellido_M: Apellido_M,
        Correo_Electronico: Correo_Electronico,
        Telefono: Telefono,
        Escuela: Escuela,
        Area_ID: Area_ID,
        Motivo: Motivo,
        token: '',
      );
      print('xd');
      http.Response res = await http.post(
        Uri.parse('$uri/auth/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
              context,
              'Usuario registrado correctamente',
            );

            Navigator.pushNamedAndRemoveUntil(
              context,
              MainPageLogged.routeName,
              (route) => false,
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // Sign In user
  void signInUser({
    required BuildContext context,
    required String Correo_Electronico,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/auth/signin'),
        body: jsonEncode({'Correo_Electronico': Correo_Electronico}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res);

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.pushNamedAndRemoveUntil(
            context,
            MainPageLogged.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

// get user data
  void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/auth/verifyToken'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/users'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, 'No hay conexión a internet');
    }
  }
}
