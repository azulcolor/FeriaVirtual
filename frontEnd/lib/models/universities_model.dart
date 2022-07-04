class UniversitiesResponse {
  UniversitiesResponse({
    required this.universidadId,
    required this.nombre,
    required this.rutaEscudo,
    required this.tipo,
    required this.licenciatura,
    required this.maestria,
    required this.doctorado,
  });

  int universidadId;
  String nombre;
  String rutaEscudo = '';
  String tipo;
  int licenciatura;
  int maestria;
  int doctorado;

  factory UniversitiesResponse.fromJson(Map<String, dynamic> json) =>
      UniversitiesResponse(
        universidadId: json["Universidad_ID"],
        nombre: json["Nombre"],
        rutaEscudo: json["Ruta_Escudo"],
        tipo: json["Tipo"],
        licenciatura: json["LICENCIATURA"],
        maestria: json["MAESTRIA"],
        doctorado: json["DOCTORADO"],
      );

  Map<String, dynamic> toJson() => {
        "Universidad_ID": universidadId,
        "Nombre": nombre,
        "Ruta_Escudo": rutaEscudo,
        "Tipo": tipo,
        "LICENCIATURA": licenciatura,
        "MAESTRIA": maestria,
        "DOCTORADO": doctorado,
      };
}
