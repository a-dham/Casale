import 'package:casale/generated/l10n.dart';
import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/cubits/product_cubit/products_cubit.dart';
import 'package:casale/src/presentation/views/settings/widgets/list_widget.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        // ProductsCubit productsCubit = ProductsCubit.get(context);
        // productsCubit.getProductData();
        // Locale locale = Localizations.localeOf(context);
        // print('sssssssssssss ${locale}');

        return SafeArea(
          child: Scaffold(
              body: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: AppColors.orangeColor,
                ),
                height: 150,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Owner',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'POS1',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'ADHAM Elsharkawy',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  children: [
                    ListWidget(
                      onTap: () {},
                      title: S.current.profile,
                      iconData: Icons.person,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListWidget(
                      onTap: () {},
                      title: S.current.invoice,
                      iconData: Icons.point_of_sale,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListWidget(
                      onTap: () {},
                      title: S.current.printers,
                      iconData: Icons.print_rounded,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListWidget(
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.settingview);
                      },
                      title: S.current.themes,
                      iconData: Icons.dark_mode_rounded,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListWidget(
                      onTap: () {},
                      title: S.current.language,
                      iconData: Icons.language,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              // SettingsView(controller: settingsController),
            ],
          )),
        );
      },
    );
  }
}
