// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String Nombre;
  final String Apellido_P;
  final String Apellido_M;
  final String Correo_Electronico;
  final String Telefono;
  final String Escuela;
  final String Area_ID;
  final String Motivo;
  final String token;
  User({
    required this.Nombre,
    required this.Apellido_P,
    required this.Apellido_M,
    required this.Correo_Electronico,
    required this.Telefono,
    required this.Escuela,
    required this.Area_ID,
    required this.Motivo,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'Nombre': Nombre,
      'Apellido_P': Apellido_P,
      'Apellido_M': Apellido_M,
      'Correo_Electronico': Correo_Electronico,
      'Telefono': Telefono,
      'Escuela': Escuela,
      'Area_ID': Area_ID,
      'Motivo': Motivo,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      Nombre: map['Nombre'] ?? '',
      Apellido_P: map['Apellido_P'] ?? '',
      Apellido_M: map['Apellido_M'] ?? '',
      Correo_Electronico: map['Correo_Electronico'] ?? '',
      Telefono: map['Telefono'] ?? '',
      Escuela: map['Escuela'] ?? '',
      Area_ID: map['Area_ID'] ?? '',
      Motivo: map['Motivo'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
