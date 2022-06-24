import 'package:feriavirtual/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      Nombre: '',
      Apellido_P: '',
      Apellido_M: '',
      Correo_Electronico: '',
      Telefono: '',
      Escuela: '',
      Area_ID: '',
      Motivo: '',
      token: '');

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
