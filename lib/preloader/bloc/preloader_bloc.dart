import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_project/preloader/data/preloader_repositories.dart';
import 'package:test_project/utils/error_handling.dart';

part 'preloader_event.dart';
part 'preloader_state.dart';

class PreloaderBloc extends Bloc<PreloaderEvent, PreloaderState> {
  PreloaderBloc() : super(PreloaderInitial()) {
    PreloaderRepository _repository = PreloaderRepository();
    on<PreloaderInitEvent>((event, emit) async {
      try {
        final String? response = await _repository.getRedirectUrl();
        if (response != null) {
          emit(PreloaderLoadedSportState(htmlText: response));
        } else {
          emit(PreloaderLoadedGoogleState());
        }
      } catch (e) {
        print(complainError(e));
        emit(PreloaderErrorState(errorMessage: complainError(e)));
      }
    });
  }
}
