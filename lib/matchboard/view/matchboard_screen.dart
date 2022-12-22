import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/common_widgets/common_scaffold.dart';
import 'package:test_project/matchboard/bloc/matchboard_bloc.dart';
import 'package:test_project/matchboard/model/league_model.dart';
import 'package:test_project/matchboard/view/matchboard_widgets/matchboard_appbar.dart';
import 'package:test_project/matchboard/view/matchboard_widgets/matchboard_container.dart';
import 'package:test_project/utils/theme_colors.dart';
import 'package:test_project/utils/theme_text_styles.dart';

class MatchboardScreen extends StatelessWidget {
  const MatchboardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    List<LeagueModel> leagueList = [];
    return WillPopScope(
      onWillPop: () async => false,
      child: CommonScaffold(
        appBar: const MatchboardAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: BlocConsumer<MatchboardBloc, MatchboardState>(
            listener: (context, state) {
              if (state is MatchboardErrorState) {
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
                          title: Text(state.errorMessage,
                              style: ThemeTextRegular.size12.copyWith(color: ThemeColors.black)),
                        ));
              }
            },
            builder: (context, state) {
              if (state is MatchboardLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is MatchboardLoadedState) {
                leagueList = state.data;
              }
              if (leagueList.isNotEmpty) {
                return ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 16.h,
                  ),
                  controller: scrollController,
                  itemCount: leagueList.length,
                  itemBuilder: (context, index) => MatchboardContainer(
                    data: leagueList[index],
                  ),
                );
              }
              return const Text(
                "No elements",
                style: ThemeTextMedium.size14,
              );
            },
          ),
        ),
      ),
    );
  }
}
