import 'package:casale/generated/l10n.dart';
import 'package:casale/src/cubits/navigation_cubit/navigation_cubit.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
      NavigationCubit navigationCubit = NavigationCubit.get(context);
      return Scaffold(
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
            currentIndex: navigationCubit.selectedIndex,
            onTap: (index) {
              navigationCubit.navigation(index);
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
        body: navigationCubit
            .bottomNavigationscreens[navigationCubit.selectedIndex],
      );
    });
  }
}
