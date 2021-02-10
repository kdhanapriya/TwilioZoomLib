import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:twiliozoomlib/repository/repository.dart';

part 'zoom_state.dart';

class ZoomCubit extends Cubit<ZoomState> {
  Repository _repository;

  ZoomCubit() : super(ZoomInitial()) {
    _repository = GetIt.I.get<Repository>();
  }

  // ignore: missing_return
  Future<String> connectZoom() async {
    emit(ZoomInitiated());

    await _repository.connectZoom().then((message) {
      emit(ZoomConnected(message));
    }).catchError((Object e) {
      emit(ZoomConnectFailed("Some error -- " + e.toString()));
    });
  }
}
