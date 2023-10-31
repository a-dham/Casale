import 'package:casale/generated/l10n.dart';
import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/cubits/settings/settings_cubit.dart';
import 'package:casale/src/presentation/views/settings/widgets/list_widget.dart';
import 'package:casale/src/presentation/widgets/alert_dialog.dart';
import 'package:casale/src/presentation/widgets/circular_progress.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../cubits/pos_cubit/pos_cubit.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});
  // String selectedLanguage = 'ar';

  @override
  Widget build(BuildContext context) {
    SettingsCubit settingsCubit = SettingsCubit.get(context);

    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is SignOutStateSuccess) {}
      },
      builder: (context, state) {
        return BlocBuilder<PosCubit, PosState>(
          builder: (context, state) {
            PosCubit posCubit = PosCubit.get(context);
            return SafeArea(
              child: Scaffold(
                  body: Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        height: 250,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Spacer(),
                                SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(
                                      fit: BoxFit.scaleDown,
                                      width: double.infinity,
                                      height: 85,
                                      'assets/images/ows_logo.png'),
                                  // Image.network(
                                  //   '${EndPoints.assetsUrl}${posCubit.orgData?.data?.logo}',
                                  //   fit: BoxFit.scaleDown,
                                  //   width: double.infinity,
                                  //   height: 85,
                                  //   errorBuilder:
                                  //       (context, object, stacktrace) {
                                  //     return Image.asset(
                                  //         fit: BoxFit.scaleDown,
                                  //         width: double.infinity,
                                  //         height: 85,
                                  //         'assets/images/error-loading-items.gif');
                                  //   },
                                  //   loadingBuilder:
                                  //       (context, child, loadingProgress) {
                                  //     if (loadingProgress == null) {
                                  //       return child;
                                  //     } else {
                                  //       return const CustomeCircularProgress();
                                  //     }
                                  //   },
                                  //   frameBuilder: (context, child, frame,
                                  //           wasSynchronouslyLoaded) =>
                                  //       child,
                                  // ),
                                ),
                                const Spacer(),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              posCubit.loginModel?.data?.accountTitle ??
                                  'No Data',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                letterSpacing: 3,
                              ),
                            ),
                            Text(
                              posCubit.loginModel?.data?.userId ?? 'No Data',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          children: [
                            ListWidget(
                              onTap: () {},
                              title: S.current.profile,
                              iconData: Icons.person,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              thickness: 2,
                            ),
                            ListWidget(
                              onTap: () {},
                              title: S.current.invoice,
                              iconData: Icons.point_of_sale,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              thickness: 2,
                            ),
                            ListWidget(
                              onTap: () {},
                              title: S.current.printers,
                              iconData: Icons.print_rounded,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              thickness: 2,
                            ),
                            ListWidget(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(Routes.settingview);
                              },
                              title: S.current.themes,
                              iconData: Icons.dark_mode_rounded,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              thickness: 2,
                            ),
                            ListWidget(
                              onTap: () {
                                String currentLocal = Intl.getCurrentLocale();
                                currentLocal == 'ar'
                                    ? settingsCubit.changeDefaultlanguage('en')
                                    : settingsCubit.changeDefaultlanguage('ar');
                              },
                              title: S.current.language,
                              iconData: Icons.language,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              thickness: 2,
                            ),
                            ListWidget(
                              onTap: () {
                                // make alert massage for confirmation
                                const CustomeAlertDialog().showMyDialog(
                                  context: context,
                                  acceptWidget: settingsCubit.isloading == true
                                      ? const CustomeCircularProgress()
                                      : Text(
                                          S.current.yes,
                                          style: const TextStyle(
                                            color: AppColors.orangeColor,
                                          ),
                                        ),
                                  onTapAccept: () {
                                    settingsCubit.signOut(context);
                                    posCubit.cart.clear();
                                    posCubit.invoiceTotal();
                                    // settingsCubit.isloading == true
                                    //     ? CustomeCircularProgress()
                                    //     : null;
                                  },
                                  onTapCancel: () {
                                    Navigator.of(context).pop();
                                  },
                                  textCancel: S.current.no,
                                  textContent: S.current.areSure,
                                );
                              },
                              title: S.current.logout,
                              iconData: Icons.logout,
                            ),
                          ],
                        ),
                      ),
                      // SettingsView(controller: settingsController),
                    ],
                  ),
                ],
              )),
            );
          },
        );
      },
    );
  }

  // void showAlert(
  //   BuildContext context,
  // ) {
  //   showDialog(
  //       useSafeArea: true,
  //       barrierDismissible: true,
  //       barrierColor: AppColors.orangeColor.withOpacity(0.08),
  //       context: context,
  //       builder: (BuildContext context) {
  //         return const AlertDialog(
  //           scrollable: true,
  //           content: SizedBox(
  //             height: 100,
  //             width: 200,
  //             child: Column(
  //               children: [],
  //             ),
  //           ),
  //         );
  //       });
  // }
}
