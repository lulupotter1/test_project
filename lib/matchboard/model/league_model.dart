import 'package:json_annotation/json_annotation.dart';

part 'league_model.g.dart';

@JsonSerializable(anyMap: true)
class LeagueModel {
  @JsonKey(name: 'strLeague')
  String leagueName;
  @JsonKey(name: 'strStatus')
  String status;

  @JsonKey(name: 'strHomeTeam')
  String homeTeam;

  @JsonKey(name: 'strAwayTeam')
  String awayTeam;

  @JsonKey(name: 'intHomeScore')
  String homeScore;

  @JsonKey(name: 'intAwayScore')
  String awayScore;

  String dateEvent;

  LeagueModel({
    required this.status,
    required this.homeTeam,
    required this.awayTeam,
    required this.awayScore,
    required this.homeScore,
    required this.dateEvent,
    required this.leagueName,
  });

  factory LeagueModel.fromJson(Map json) => _$LeagueModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeagueModelToJson(this);
}
