import 'dart:io';

Future<bool> checkInternet() async {
  try {
    final List<InternetAddress> result =
        await InternetAddress.lookup('google.com');

    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}
