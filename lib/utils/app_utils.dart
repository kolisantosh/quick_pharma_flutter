import 'dart:convert';
import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

class AppUtils {
  static Future<XFile?> openFilePicker(XTypeGroup typeGroup) {
    return openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);
  }

  static String? getBase64String(XFile selectedFile) {
    // String? selectedFileBase64;

    final bytes = File(selectedFile.path).readAsBytesSync();
    String file64 = base64Url.encode(bytes);
    print("Selected BASE64: ${file64.length}");

    /* String dataBase64URL = "";
    AppUtils.fileTypeJson.forEach((key, value) {
      if (value == path.extension(selectedFile.path).replaceFirst(".", "")) {
        dataBase64URL = "data:$key;base64";
      }
    });

    if (!dataBase64URL.isEmpty && !file64.isEmpty) {
      selectedFileBase64 = "$dataBase64URL,$file64";
    }*/
    // return selectedFileBase64;
    return lookupMimeType(selectedFile.path) == null && file64.isEmpty
        ? null
        : "data:${lookupMimeType(selectedFile.path)};base64,$file64";
  }

  static String getErrorMessage(dynamic message) {
    if (message is String) {
      return message;
    }

    if (message is Map<String, dynamic>) {
      List<String> msgDataList = [];
      message.forEach((key, value) {
        /* print(
            "Map<String, dynamic> :${List<String>.from(message[key].map((x) => x))}");*/
        // if (value is List<String>) {
        // }
        msgDataList.addAll(List<String>.from(message[key].map((x) => x)));
      });
      return msgDataList.join("\n");
    }
    return "";
  }


}
