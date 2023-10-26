import 'package:casale/generated/l10n.dart';
import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsHeader extends StatelessWidget {
  const ItemsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PosCubit, PosState>(
      builder: (context, state) {
        PosCubit posCubit = PosCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Row(
            children: [
              Text(
                S.current.items,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              Text(
                '${posCubit.isSearched == true ? posCubit.filterdItems?.length : posCubit.items?.length ?? '...'}  ${S.current.item}',
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
