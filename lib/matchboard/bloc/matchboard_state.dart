part of 'matchboard_bloc.dart';

@immutable
abstract class MatchboardState {}

class MatchboardInitial extends MatchboardState {}

class MatchboardErrorState extends MatchboardState {
  final String errorMessage;
  MatchboardErrorState({
    required this.errorMessage,
  });
}

class MatchboardLoading extends MatchboardState {}

class MatchboardLoadedState extends MatchboardState {
  final List<LeagueModel> data;

  MatchboardLoadedState({
    required this.data,
  });
}
