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
    required this.becas,
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
  List<Beca> becas;
  String urlMaps;
  String direccion;
  List<RedesSociales> redesSociales;

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
        becas: List<Beca>.from(json["Becas"].map((x) => Beca.fromMap(x))),
        urlMaps: json["url_Maps"],
        direccion: json["Direccion"],
        redesSociales: List<RedesSociales>.from(
            json["redesSociales"].map((x) => RedesSociales.fromMap(x))),
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

class Beca {
  Beca({
    required this.nombre,
    required this.recurso,
  });

  String nombre;
  String recurso;

  factory Beca.fromJson(String str) => Beca.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Beca.fromMap(Map<String, dynamic> json) => Beca(
        nombre: json["Nombre"],
        recurso: json["Recurso"],
      );

  Map<String, dynamic> toMap() => {
        "Nombre": nombre,
        "Recurso": recurso,
      };
}

class RedesSociales {
  RedesSociales({
    required this.nombre,
    required this.recurso,
  });

  String nombre;
  String recurso;

  factory RedesSociales.fromJson(String str) =>
      RedesSociales.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RedesSociales.fromMap(Map<String, dynamic> json) => RedesSociales(
        nombre: json["Nombre"],
        recurso: json["Recurso"],
      );

  Map<String, dynamic> toMap() => {
        "Nombre": nombre,
        "Recurso": recurso,
      };
}
