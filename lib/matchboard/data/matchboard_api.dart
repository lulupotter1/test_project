import 'package:dio/dio.dart';
import 'package:test_project/matchboard/model/league_model.dart';
import 'package:test_project/utils/constants.dart';

class MatchboardApi {
  final baseUrl = Constants.sportUrl;

  var _dio = Dio();

  Future<List<LeagueModel>> getLeagueInfo() async {
    List<LeagueModel> list = [];
    final response = await _dio.get(baseUrl);

    for (var element in response.data["events"]) {
      list.add(LeagueModel.fromJson(element));
    }
    return list;
  }
}
