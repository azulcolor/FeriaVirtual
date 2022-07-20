// To parse this JSON data, do
//
//     final universityInfo = universityInfoFromMap(jsonString);

import 'dart:convert';

class UniversityInfo {
  UniversityInfo({
    required this.universidadId,
    required this.nombre,
    required this.rutaEscudo,
    required this.telefono,
    required this.admision,
    required this.correoElectronico,
    required this.tipo,
    required this.carreras,
    required this.videos,
    required this.fotos,
    required this.urlMaps,
    required this.direccion,
    required this.redesSociales,
  });

  int universidadId;
  String nombre;
  String rutaEscudo;
  String telefono;
  String admision;
  String correoElectronico;
  String tipo;
  List<Carrera> carreras;
  List<Foto> videos;
  List<Foto> fotos;
  String urlMaps;
  String direccion;
  List<RedesSociale> redesSociales;

  factory UniversityInfo.fromJson(String str) =>
      UniversityInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UniversityInfo.fromMap(Map<String, dynamic> json) => UniversityInfo(
        universidadId: json["Universidad_ID"],
        nombre: json["Nombre"],
        rutaEscudo: json["Ruta_Escudo"],
        telefono: json["Telefono"],
        admision: json["Proceso_Admision"],
        correoElectronico: json["Correo_Electronico"],
        tipo: json["Tipo"],
        carreras:
            List<Carrera>.from(json["Carreras"].map((x) => Carrera.fromMap(x))),
        videos: List<Foto>.from(json["Videos"].map((x) => Foto.fromMap(x))),
        fotos: List<Foto>.from(json["Fotos"].map((x) => Foto.fromMap(x))),
        urlMaps: json["url_Maps"],
        direccion: json["Direccion"],
        redesSociales: List<RedesSociale>.from(
            json["redesSociales"].map((x) => RedesSociale.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Universidad_ID": universidadId,
        "Nombre": nombre,
        "Ruta_Escudo": rutaEscudo,
        "Telefono": telefono,
        "Proceso_Admision": admision,
        "Correo_Electronico": correoElectronico,
        "Tipo": tipo,
        "Carreras": List<dynamic>.from(carreras.map((x) => x.toMap())),
        "Videos": List<dynamic>.from(videos.map((x) => x.toMap())),
        "Fotos": List<dynamic>.from(fotos.map((x) => x.toMap())),
        "url_Maps": urlMaps,
        "Direccion": direccion,
        "redesSociales":
            List<dynamic>.from(redesSociales.map((x) => x.toMap())),
      };
}

class Carrera {
  Carrera({
    required this.nombre,
    required this.recurso,
  });

  String nombre;
  String recurso;

  factory Carrera.fromJson(String str) => Carrera.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Carrera.fromMap(Map<String, dynamic> json) => Carrera(
        nombre: json["Nombre"],
        recurso: json["Recurso"],
      );

  Map<String, dynamic> toMap() => {
        "Nombre": nombre,
        "Recurso": recurso,
      };
}

class Foto {
  Foto({
    required this.seccionId,
    required this.titulo,
    required this.recurso,
  });

  int seccionId;
  String titulo;
  String recurso;

  factory Foto.fromJson(String str) => Foto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Foto.fromMap(Map<String, dynamic> json) => Foto(
        seccionId: json["Seccion_ID"],
        titulo: json["Titulo"],
        recurso: json["Recurso"],
      );

  Map<String, dynamic> toMap() => {
        "Seccion_ID": seccionId,
        "Titulo": titulo,
        "Recurso": recurso,
      };
}

class RedesSociale {
  RedesSociale({
    required this.redSocial,
    required this.recurso,
  });

  String redSocial;
  String recurso;

  factory RedesSociale.fromJson(String str) =>
      RedesSociale.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RedesSociale.fromMap(Map<String, dynamic> json) => RedesSociale(
        redSocial: json["Red_social"],
        recurso: json["Recurso"],
      );

  Map<String, dynamic> toMap() => {
        "Red_social": redSocial,
        "Recurso": recurso,
      };
}
