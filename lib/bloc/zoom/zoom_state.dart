part of 'zoom_cubit.dart';

abstract class ZoomState {}

class ZoomInitial extends ZoomState {}

class ZoomInitiated extends ZoomState {}

class ZoomConnected extends ZoomState {
  final String message;
  ZoomConnected(this.message);
}

class ZoomConnectFailed extends ZoomState {
  final String message;
  ZoomConnectFailed(this.message);
}
