part of 'preloader_bloc.dart';

@immutable
abstract class PreloaderState {}

class PreloaderInitial extends PreloaderState {}

class PreloaderErrorState extends PreloaderState {
  final String errorMessage;
  PreloaderErrorState({
    required this.errorMessage,
  });
}

class PreloaderLoadedGoogleState extends PreloaderState {}

class PreloaderLoadedSportState extends PreloaderState {
  final String htmlText;
  PreloaderLoadedSportState({required this.htmlText});
}
