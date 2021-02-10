import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:twiliozoomlib/repository/repository.dart';

part 'twilio_state.dart';

class TwilioCubit extends Cubit<TwilioState> {
  Repository _repository;

  TwilioCubit() : super(TwilioInitial()) {
    _repository = GetIt.I.get<Repository>();
  }

  // ignore: missing_return
  Future<String> connectTwilio() async {
    emit(TwilioInitiated());
//call the Repository
    await _repository.connectTwilio().then((message) {
      emit(TwilioConnected(message));
    }).catchError((Object e) {
      emit(TwilioConnectFailed("Some error -- " + e.toString()));
    });
  }
}
