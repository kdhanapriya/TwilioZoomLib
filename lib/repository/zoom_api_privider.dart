import 'package:flutter/services.dart';
import 'package:twiliozoompkg/twiliozoompkg.dart';

class ZoomApiProvider {
  Future<String> initZoom() async {
    try {
      //call the native class
      String response = await Twiliozoompkg.connectZoom;
      return response;
    } on PlatformException catch (e) {
      // Unable to open the browser
      return e.toString();
    }
  }
}
