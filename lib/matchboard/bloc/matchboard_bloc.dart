import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_project/matchboard/data/matchboard_repositories.dart';
import 'package:test_project/matchboard/model/league_model.dart';
import 'package:test_project/utils/error_handling.dart';

part 'matchboard_event.dart';
part 'matchboard_state.dart';

class MatchboardBloc extends Bloc<MatchboardEvent, MatchboardState> {
  MatchboardBloc() : super(MatchboardInitial()) {
    MatchboardRepository _repository = MatchboardRepository();
    on<MatchboardInitEvent>((event, emit) async {
      try {
        final List<LeagueModel> response = await _repository.getLeagueInfo();

        emit(MatchboardLoadedState(data: response));
      } catch (e) {
        emit(MatchboardErrorState(errorMessage: complainError(e)));
      }
    });
  }
}
