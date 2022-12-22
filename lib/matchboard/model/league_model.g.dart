// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeagueModel _$LeagueModelFromJson(Map json) => LeagueModel(
      status: json['strStatus'] as String,
      homeTeam: json['strHomeTeam'] as String,
      awayTeam: json['strAwayTeam'] as String,
      awayScore: json['intAwayScore'] as String,
      homeScore: json['intHomeScore'] as String,
      dateEvent: json['dateEvent'] as String,
      leagueName: json['strLeague'] as String,
    );

Map<String, dynamic> _$LeagueModelToJson(LeagueModel instance) =>
    <String, dynamic>{
      'strLeague': instance.leagueName,
      'strStatus': instance.status,
      'strHomeTeam': instance.homeTeam,
      'strAwayTeam': instance.awayTeam,
      'intHomeScore': instance.homeScore,
      'intAwayScore': instance.awayScore,
      'dateEvent': instance.dateEvent,
    };
