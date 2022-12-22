import 'package:test_project/matchboard/data/matchboard_api.dart';
import 'package:test_project/matchboard/model/league_model.dart';

class MatchboardRepository {
  final MatchboardApi _api = MatchboardApi();

  Future<List<LeagueModel>> getLeagueInfo() => _api.getLeagueInfo();
}
