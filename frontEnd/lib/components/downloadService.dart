import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class DownloadService {
  Future<void> download({required String url, required String fileName});
}

class MobileDownloadService implements DownloadService {
  @override
  Future<void> download({required String url, required String fileName}) async {
    // Solicita permisos para descargar el archivo.
    bool hasPermission = await _requestWritePermission();
    if (!hasPermission) return;

    // Obtiene el directorio donde se descargará el archivo.
    var dir = await getApplicationDocumentsDirectory();

    // Inicia la descarga.
    Dio dio = Dio();
    await dio.download(url, "${dir.path}/$fileName");

    // Abre el archivo.
    OpenFile.open("${dir.path}/$fileName", type: 'application/pdf');
  }
}

// Solicita permisos para el almacenamiento
Future<bool> _requestWritePermission() async {
  await Permission.storage.request();
  return await Permission.storage.request().isGranted;
}
