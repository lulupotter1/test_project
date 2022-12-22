import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/matchboard/model/league_model.dart';
import 'package:test_project/utils/extensions.dart';
import 'package:test_project/utils/theme_colors.dart';
import 'package:test_project/utils/theme_text_styles.dart';
import 'package:intl/intl.dart';

class MatchboardContainer extends StatelessWidget {
  final LeagueModel data;
  const MatchboardContainer({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: ThemeColors.gray,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Column(
        children: [
          MatchboardLeagueContainer(
            leagueDate: _getDateFormat(data.dateEvent),
            leagueName: data.leagueName,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            data.status,
            style: ThemeTextMedium.size14.copyWith(fontStyle: FontStyle.italic, color: _getStatusColor(data.status)),
          ),
          SizedBox(
            height: 4.h,
          ),
          MatchboardTeamRow(
            firstTeam: data.homeTeam,
            secondTeam: data.awayTeam,
          ),
          SizedBox(
            height: 8.h,
          ),
          MatchboardScoreContainer(
            firstScore: data.homeScore,
            secondScore: data.awayScore,
          )
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    if (status.toUpperCase() == "Live".toUpperCase()) {
      return ThemeColors.orange;
    }
    return ThemeColors.gray4;
  }

  String _getDateFormat(String date) {
    return DateFormat("dd.mm").format(DateFormat("yyyy-mm-dd").parse(date));
  }
}

class MatchboardScoreContainer extends StatelessWidget {
  final String firstScore;
  final String secondScore;
  const MatchboardScoreContainer({
    Key? key,
    required this.firstScore,
    required this.secondScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeColors.gray2,
        borderRadius: BorderRadius.circular(1.r),
      ),
      child: Row(
        children: [
          Expanded(
              child: Center(
            child: Text(
              firstScore,
              style: ThemeTextRegular.size12,
            ),
          )),
          Expanded(
              child: Center(
                  child: Text(
            secondScore,
            style: ThemeTextRegular.size12,
          ))),
        ],
      ),
    );
  }
}

class MatchboardTeamRow extends StatelessWidget {
  final String firstTeam;
  final String secondTeam;
  const MatchboardTeamRow({
    Key? key,
    required this.firstTeam,
    required this.secondTeam,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Center(
          child: Text(
            firstTeam.capitalize(),
            style: ThemeTextBold.size18,
            softWrap: true,
          ),
        )),
        Container(
          color: ThemeColors.gray3,
          height: 61.h,
          width: 2.w,
        ),
        Expanded(
            child: Center(
          child: Text(
            secondTeam.capitalize(),
            softWrap: true,
            style: ThemeTextBold.size18,
          ),
        )),
      ],
    );
  }
}

class MatchboardLeagueContainer extends StatelessWidget {
  final String leagueName;
  final String leagueDate;
  const MatchboardLeagueContainer({
    Key? key,
    required this.leagueDate,
    required this.leagueName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6.h, bottom: 6.h, left: 20.w, right: 16.w),
      decoration: BoxDecoration(
        color: ThemeColors.gray2,
        borderRadius: BorderRadius.circular(3.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/cup.svg",
                width: 16.w,
                height: 15.h,
              ),
              SizedBox(
                width: 13.w,
              ),
              Text(
                leagueName.capitalize(),
                style: ThemeTextMedium.size14,
              ),
            ],
          ),
          Text(
            leagueDate,
            style: ThemeTextMedium.size14,
          ),
        ],
      ),
    );
  }
}
