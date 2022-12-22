import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/matchboard/bloc/matchboard_bloc.dart';
import 'package:test_project/preloader/bloc/preloader_bloc.dart';
import 'package:test_project/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PreloaderBloc(),
        ),
        BlocProvider(
          create: (context) => MatchboardBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 740),
        builder: (context, child) => MaterialApp(
          title: Constants.appTitle,
          initialRoute: AppRoutesString.routeToPreloadScreen,
          routes: Constants.appRoutes,
        ),
      ),
    );
  }
}
