import 'package:flutter/services.dart';
import 'package:twiliozoompkg/twiliozoompkg.dart';

class TwilioApiProvider {
  Future<String> initTwilio() async {
    try {
      String response = await Twiliozoompkg.connectTwilio;
      return response;
    } on PlatformException catch (e) {
      // Unable to open the browser
      return e.toString();
    }
  }
}
