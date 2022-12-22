import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/common_widgets/common_scaffold.dart';
import 'package:test_project/matchboard/bloc/matchboard_bloc.dart';
import 'package:test_project/matchboard/model/screen_arguments.dart';
import 'package:test_project/preloader/bloc/preloader_bloc.dart';
import 'package:test_project/utils/constants.dart';
import 'package:test_project/utils/theme_colors.dart';
import 'package:test_project/utils/theme_text_styles.dart';

class PreloadScreen extends StatelessWidget {
  const PreloadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocConsumer<PreloaderBloc, PreloaderState>(
        listener: (context, state) {
          if (state is PreloaderErrorState) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      actions: [
                        TextButton(
                          child: Text("Ok", style: ThemeTextRegular.size12.copyWith(color: ThemeColors.black)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                      title:
                          Text(state.errorMessage, style: ThemeTextRegular.size12.copyWith(color: ThemeColors.black)),
                    ));
          }
          if (state is PreloaderLoadedGoogleState) {
            BlocProvider.of<MatchboardBloc>(context).add(MatchboardInitEvent());

            Navigator.pushNamed(context, AppRoutesString.routeToMatchboardScreen);
          }
          if (state is PreloaderLoadedSportState) {
            Navigator.pushNamed(context, AppRoutesString.routeToMatchboardWebViewScreen,
                arguments: ScreenArguments(state.htmlText));
          }
        },
        builder: (context, state) {
          if (state is PreloaderInitial) {
            BlocProvider.of<PreloaderBloc>(context).add(PreloaderInitEvent());
          }
          return CommonScaffold(
            body: Center(
              child: SvgPicture.asset(
                "assets/icons/ball.svg",
                width: 103.w,
                height: 104.h,
              ),
            ),
          );
        },
      ),
    );
  }
}
