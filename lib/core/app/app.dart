import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global_test_project/config/app_router.dart';
import 'package:global_test_project/core/constant/constants.dart';
import 'package:global_test_project/core/constant/theme_colors.dart';
import 'package:global_test_project/core/core_bloc/core_blocs.dart';
import 'package:global_test_project/features/auth/presentation/auth/auth_bloc/auth_bloc.dart';
import 'package:global_test_project/features/auth/presentation/main_screen/blocs/profile_bloc/profile_bloc.dart';
import 'package:global_test_project/features/auth/presentation/main_screen/blocs/transaction_bloc/transaction_bloc.dart';

class MyApp extends StatelessWidget {
  final AppRouter router = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TransactionBloc>(
          create: (BuildContext context) => CoreBlocs.transaction,
        ),
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => CoreBlocs.auth,
        ),
        BlocProvider<ProfileBloc>(
          create: (BuildContext context) => CoreBlocs.profile,
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router.config(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: ThemeColors.white,
        ),
        title: Constants.title,
      ),
    );
  }
}
