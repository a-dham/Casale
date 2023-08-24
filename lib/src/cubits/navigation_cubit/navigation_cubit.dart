import 'package:casale/src/presentation/views/Orders/orders.dart';
import 'package:casale/src/presentation/views/settings/settings.dart';
import 'package:casale/src/presentation/views/pos/pos_home/pos_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());
  static NavigationCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 0;
  navigation(int index) {
    selectedIndex = index;
    emit(NavigationSuccess());
  }

  List<Widget> bottomNavigationscreens = [
    const POSHome(),
    const Orders(),
    const Settings(),
  ];
}
