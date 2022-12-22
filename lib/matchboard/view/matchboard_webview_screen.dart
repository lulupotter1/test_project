import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_project/matchboard/model/screen_arguments.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MatchboardWebViewScreen extends StatelessWidget {
  const MatchboardWebViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    WebViewController webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int progress) {},
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {
          debugPrint(error.description);
        },
      ))
      ..loadHtmlString(args.htmlText, baseUrl: "https://www.thesportsdb.com");
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                child: SafeArea(
              child: WebViewWidget(
                controller: webViewController,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
