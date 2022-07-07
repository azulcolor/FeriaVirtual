import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:feriavirtual/components/downloadService.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:feriavirtual/constants/global_variables.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({Key? key, required this.url, required this.fileName})
      : super(key: key);

  final String url;
  final String fileName;

  Future<void> _downloadFile() async {
    DownloadService downloadService = MobileDownloadService();
    await downloadService.download(url: url, fileName: fileName);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: SizedBox(
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
              onPressed: _downloadFile,
              style: ElevatedButton.styleFrom(
                  primary: GlobalVariables.primaryColor,
                  onPrimary: GlobalVariables.backgroundColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: const Icon(
                        FontAwesomeIcons.filePdf,
                        size: 20,
                      ),
                    ),
                    Text(
                      fileName,
                      style: GlobalVariables.smallTextW,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ))
      ],
    );
  }
}
