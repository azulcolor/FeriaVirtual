// To parse this JSON data, do
//
//     final universitiesResponse = universitiesResponseFromJson(jsonString);

import 'dart:convert';

List<UniversitiesResponse> universitiesResponseFromJson(String str) =>
    List<UniversitiesResponse>.from(
        json.decode(str).map((x) => UniversitiesResponse.fromJson(x)));

String universitiesResponseToJson(List<UniversitiesResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UniversitiesResponse {
  UniversitiesResponse({
    required this.universidadId,
    required this.nombre,
    required this.rutaEscudo,
    required this.tipo,
    required this.licenciatura,
    required this.maestria,
    required this.doctorado,
    required this.beca,
    required this.area,
  });

  int universidadId;
  String nombre;
  String rutaEscudo;
  String tipo;
  int licenciatura;
  int maestria;
  int doctorado;
  int beca;
  String area;

  get getUniversities {
    if (this.universidadId == 17 || this.universidadId == 23) {
      return null;
    }
    return UniversitiesResponse;
  }

  factory UniversitiesResponse.fromJson(Map<String, dynamic> json) =>
      UniversitiesResponse(
        universidadId: json["Universidad_ID"],
        nombre: json["Nombre"],
        rutaEscudo: json["Ruta_Escudo"],
        tipo: json["Tipo"],
        licenciatura: json["LICENCIATURA"],
        maestria: json["MAESTRIA"],
        doctorado: json["DOCTORADO"],
        beca: json["BECA"],
        area: json["area"],
      );

  Map<String, dynamic> toJson() => {
        "Universidad_ID": universidadId,
        "Nombre": nombre,
        "Ruta_Escudo": rutaEscudo,
        "Tipo": tipo,
        "LICENCIATURA": licenciatura,
        "MAESTRIA": maestria,
        "DOCTORADO": doctorado,
        "BECA": beca,
        "area": area,
      };
}
