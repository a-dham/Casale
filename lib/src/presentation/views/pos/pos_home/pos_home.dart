import 'package:casale/src/presentation/views/pos/pos_home/mobile/pos_mobile.dart';
import 'package:casale/src/presentation/views/pos/pos_home/tablet/pos_tablet.dart';
import 'package:casale/src/presentation/views/reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/pos_cubit/pos_cubit.dart';

class POSHome extends StatefulWidget {
  const POSHome({super.key});

  @override
  State<POSHome> createState() => _POSHomeState();
}

class _POSHomeState extends State<POSHome> {
  @override
  void initState() {
    // (BlocProvider.of<PosCubit>(context).orgData?.data as Map).clear();
    BlocProvider.of<PosCubit>(context).getOrgData();
    BlocProvider.of<PosCubit>(context).getAccountData();
    BlocProvider.of<PosCubit>(context).getItems();
    BlocProvider.of<PosCubit>(context).getItemSections();
    BlocProvider.of<PosCubit>(context).getLinkedBranchData();
    BlocProvider.of<PosCubit>(context).getCustomers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String data = Responive().isMobile(width, height);
    if (data == 'tablet') {
      return const PosTablet();
    } else {
      return const PosMobile();
    }
  }
}
