import 'package:casale/generated/l10n.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/settings/settings_cubit.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(builder: (context, state) {
      SettingsCubit settingsCubit = SettingsCubit.get(context);
      return SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: true,
              showUnselectedLabels: false,
              unselectedItemColor: AppColors.greyColor,
              selectedItemColor: AppColors.orangeColor,
              selectedLabelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo',
              ),
              currentIndex: settingsCubit.selectedIndex,
              onTap: (index) {
                settingsCubit.navigation(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.home_outlined,
                    ),
                    label: S.current.home),
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.grid_on_rounded,
                    ),
                    label: S.current.orders),
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.settings,
                    ),
                    label: S.current.settings),
              ]),
          body: settingsCubit
              .bottomNavigationscreens[settingsCubit.selectedIndex],
        ),
      );
    });
  }
}
