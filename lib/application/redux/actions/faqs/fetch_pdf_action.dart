// Flutter imports:
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class FetchPDFAction {
  static Future<File> loadNetwork(String pdfUrl, BuildContext context) async {
    final http.Response response = await http.get(Uri.parse(pdfUrl));

    final Uint8List bytes = response.bodyBytes;

    return _storeFile(pdfUrl, bytes);
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final String filename = basename(url);
    final Directory dir = await getApplicationDocumentsDirectory();

    final File file = File('${dir.path}/$filename');
    file.writeAsBytesSync(bytes, flush: true);
    return file;
  }
}
