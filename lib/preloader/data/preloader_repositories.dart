import 'package:test_project/preloader/data/preloader_api.dart';

class PreloaderRepository {
  final PreloaderApi _api = PreloaderApi();

  Future<String?> getRedirectUrl() => _api.getRedirectUrl();
}
