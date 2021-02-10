part of 'zoom_cubit.dart';

abstract class ZoomState {}

class ZoomInitial extends ZoomState {}

class ZoomInitiated extends ZoomState {}

//get the message from native this state will triger
class ZoomConnected extends ZoomState {
  final String message;
  ZoomConnected(this.message);
}

class ZoomConnectFailed extends ZoomState {
  //connection failed this state will triger
  final String message;
  ZoomConnectFailed(this.message);
}
