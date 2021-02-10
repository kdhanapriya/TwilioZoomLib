part of 'twilio_cubit.dart';

@immutable
abstract class TwilioState {}

class TwilioInitial extends TwilioState {}

class TwilioInitiated extends TwilioState {}

class TwilioConnected extends TwilioState {
  final String message;
  TwilioConnected(this.message);
}

class TwilioConnectFailed extends TwilioState {
  final String message;
  TwilioConnectFailed(this.message);
}
