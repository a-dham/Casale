import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:casale/src/domain/models/products_model.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FiltteredItems extends StatelessWidget {
  const FiltteredItems({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    PosCubit posCubit = PosCubit.get(context);
    return BlocBuilder<PosCubit, PosState>(
      builder: (context, state) {
        return Expanded(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width >= 730 ? 4 : 2,
                mainAxisSpacing: 10,
                mainAxisExtent: 150,
              ),
              itemCount: posCubit.filterdItems!.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                // final item = posCubit.isSearched != true
                //     ? posCubit.filterdItems![index]
                //     : posCubit.itemModel?.dataList[index];

                final Data item = posCubit.filterdItems?[index];
                return GestureDetector(
                  onTap: () {
                    posCubit.addItemTocart(item);
                  },
                  child: Item(
                    item: item,
                  ),
                );
              }),
        );
      },
    );
  }
}
