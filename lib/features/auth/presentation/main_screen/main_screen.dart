import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:global_test_project/core/constant/theme_colors.dart';
import 'package:global_test_project/core/constant/theme_text_style.dart';
import 'package:global_test_project/core/core_bloc/core_blocs.dart';
import 'package:global_test_project/features/auth/presentation/main_screen/blocs/profile_bloc/profile_bloc.dart';
import 'package:global_test_project/features/auth/presentation/main_screen/dashboard_body_widget/dashboard_body_widget.dart';
import 'package:global_test_project/features/auth/presentation/main_screen/dashboard_body_widget/dashboard_widget/dashboard_profile_widget.dart';
import 'package:global_test_project/features/auth/presentation/main_screen/other_body_widget.dart';
import 'package:global_test_project/features/auth/presentation/widgets/custom_scaffold.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Widget> screenWidgets = [];

  @override
  void initState() {
    screenWidgets.addAll([
      const DashboardBodyWidget(),
      const OtherBodyWidget(text: "Savings"),
      const OtherBodyWidget(text: "Bill payment"),
      const OtherBodyWidget(text: "Profile"),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileChangedIndex) {
          selectedIndex = state.index;
        }
        return CustomScaffold(
          canPop: true,
          appBar: selectedIndex == 0
              ? AppBar(
                  backgroundColor: ThemeColors.white,
                  surfaceTintColor: ThemeColors.transparent,
                  title: const DashboardProfileWidget(),
                )
              : null,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: screenWidgets[selectedIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ThemeColors.primaryColor,
            unselectedItemColor: ThemeColors.gray700,
            unselectedLabelStyle: ThemeTextAvenirRegular.commonSize.copyWith(
              color: ThemeColors.gray700,
              fontSize: 12,
            ),
            selectedLabelStyle: ThemeTextAvenirRegular.commonSize.copyWith(
              color: ThemeColors.primaryColor,
              fontSize: 12,
            ),
            onTap: (selIndex) {
              CoreBlocs.profile.add(ProfileChangeIndex(index: selIndex));
            },
            items: [
              _item(asset: "assets/icons/dashboard.svg", text: "Dashboard"),
              _item(asset: "assets/icons/savings.svg", text: "Savings"),
              _item(asset: "assets/icons/bill.svg", text: "Bill payment"),
              _item(asset: "assets/icons/profile.svg", text: "Profile"),
            ],
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _item({
    required String asset,
    required String text,
  }) {
    return BottomNavigationBarItem(
      label: text,
      icon: SvgPicture.asset(
        asset,
        height: 24,
        width: 24,
        colorFilter: const ColorFilter.mode(ThemeColors.gray700, BlendMode.srcIn),
      ),
      activeIcon: SvgPicture.asset(
        asset,
        height: 24,
        width: 24,
        colorFilter: const ColorFilter.mode(ThemeColors.primaryColor, BlendMode.srcIn),
      ),
    );
  }
}
