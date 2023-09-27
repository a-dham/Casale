import 'package:casale/generated/l10n.dart';
import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:casale/src/presentation/widgets/custome_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchSeactions extends StatefulWidget {
  const SearchSeactions({
    super.key,
  });

  @override
  State<SearchSeactions> createState() => _SearchSeactionsState();
}

class _SearchSeactionsState extends State<SearchSeactions> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final PosCubit posCubit = PosCubit.get(context);
    return BlocConsumer<PosCubit, PosState>(
      listener: (context, state) {
        if (state is GetAccountStateLoading) {}
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 80,
                child: Text(
                  posCubit.orgModel?.data!.orgTitle.toString() ?? 'no Title',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: screenWidth >= 600
                      ? (screenWidth * 0.40) - 80
                      : (screenWidth * 0.60) - 80,
                ),
                height: 30,
                child: CustomeTextFormField(
                  labelText: S.current.search,
                  suffixIcon: const Icon(Icons.search),
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  textEditingController: null,
                  onTap: () {
                    setState(() {
                      posCubit.isSearched = true;
                    });
                  },
                  onchanged: (input) {
                    posCubit.filterItems(input);
                  },
                  validator: (value) {
                    return null;
                  },
                  onSubmitted: (value) {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
