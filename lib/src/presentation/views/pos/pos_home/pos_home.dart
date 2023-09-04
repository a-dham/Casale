import 'package:casale/src/presentation/views/pos/pos_home/mobile/pos_mobile.dart';
import 'package:casale/src/presentation/views/pos/pos_home/tablet/pos_tablet.dart';
import 'package:casale/src/presentation/views/reponsive.dart';
import 'package:flutter/material.dart';

class POSHome extends StatelessWidget {
  const POSHome({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    String data = Responive().isMobile(width);
    if (data == 'tablet') {
      return PosTablet();
    } else {
      return const PosMobile();
    }
  }
}
