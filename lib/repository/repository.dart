import 'package:get_it/get_it.dart';
import 'package:twiliozoomlib/repository/twilio_api_provider.dart';
import 'zoom_api_privider.dart';

class Repository {
  final zoomApiProvider = GetIt.I.get<ZoomApiProvider>();
  final twilioApiProvider = GetIt.I.get<TwilioApiProvider>();

  Future<String> connectZoom() => zoomApiProvider.initZoom();
  Future<String> connectTwilio() => twilioApiProvider.initTwilio();
}
