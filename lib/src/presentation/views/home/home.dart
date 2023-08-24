import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/presentation/views/sample_feature/sample_item.dart';
import 'package:flutter/material.dart';

/// Displays a list of SampleItems.
class Home extends StatelessWidget {
  const Home({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sample Items'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.restorablePushNamed(context, Routes.setting);
              },
            ),
          ],
        ),
        body: const Center(
          child: Text('Home'),
        ));
  }
}



//  Positioned(
//             // rectangle407iR (1:141)
//             left: 276,
//             top: 391,
//             child: Align(
//               child: SizedBox(
//                 width: 96,
//                 height: 96,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(24),
//                     // border:  Border.all(color Color(0xfff09d5f)),
//                     color: Color(),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Color(0x661061a8),
//                         offset: Offset(1, 0),
//                         blurRadius: 2,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
