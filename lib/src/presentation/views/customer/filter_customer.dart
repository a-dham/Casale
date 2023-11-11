import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:casale/src/presentation/views/reponsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCustomers extends StatelessWidget {
  const FilterCustomers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PosCubit posCubit = PosCubit.get(context);

    return BlocBuilder<PosCubit, PosState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                double width = MediaQuery.of(context).size.width;
                double height = MediaQuery.of(context).size.height;
                String data = Responive().isMobile(width, height);

                return GestureDetector(
                  onTap: () async {
                    String customerId =
                        posCubit.filterCusotmers![index].customerId;
                    await posCubit.getCustomer(customerId);
                    posCubit.isSearchCustomer = false;

                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Text(posCubit.filterCusotmers![index].customerId ?? ''),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: data == 'tablet' ? 300 : 100,
                          ),
                          child: Text(
                            '${posCubit.filterCusotmers![index].firstName} ',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        const Spacer(),
                        Text(posCubit.filterCusotmers![index].phoneNo ?? ''),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 1,
                  color: Colors.black.withOpacity(0.44),
                );
              },
              itemCount: posCubit.filterCusotmers!.length),
        );
      },
    );
  }
}
