import 'package:feriavirtual/constants/global_variables.dart';
import 'package:feriavirtual/constants/utils.dart';
import 'package:feriavirtual/constants/error_handling.dart';
import 'package:feriavirtual/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signUpUser(
      {required BuildContext context,
      required String firstName,
      required String lastNameP,
      required String lasNameM,
      required String email,
      required String phoneNumber,
      required String school, //escuela de procedencia
      required String facility, //area de interes
      required String motive}) async {
    try {
      User user = User(
        id: '',
        firstName: firstName,
        lastNameP: lastNameP,
        lasNameM: lasNameM,
        email: email,
        phoneNumber: phoneNumber,
        school: school,
        facility: facility,
        motive: motive,
      );

      http.Response res = await http.post(
        Uri.parse('$uri/v1/users'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Usuario registrado correctamente');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
