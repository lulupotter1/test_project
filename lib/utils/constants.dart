import 'package:flutter/material.dart';
import 'package:test_project/matchboard/view/matchboard_screen.dart';
import 'package:test_project/matchboard/view/matchboard_webview_screen.dart';
import 'package:test_project/preloader/view/preload_screen.dart';

abstract class Constants {
  static const appTitle = 'Flutter Redirect';
  static const baseUrl = "https://kueski.shop/cq1al3k.php?key=9ckcsrbnkseenkjkuh04";

  static const sportUrl = "https://www.thesportsdb.com/api/v1/json/40130162/eventspastleague.php?id=4328";
  static Map<String, Widget Function(BuildContext)> appRoutes = {
    'PreloadScreen': (context) => const PreloadScreen(),
    'MatchboardScreen': (context) => const MatchboardScreen(),
    'MatchboardWebViewScreen': (context) => const MatchboardWebViewScreen(),
  };
}

class AppRoutesString {
  static const String routeToPreloadScreen = 'PreloadScreen';
  static const String routeToMatchboardScreen = 'MatchboardScreen';
  static const String routeToMatchboardWebViewScreen = 'MatchboardWebViewScreen';
}
