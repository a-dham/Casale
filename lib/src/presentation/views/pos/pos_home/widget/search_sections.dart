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
    TextEditingController textEditingController = TextEditingController();
    return BlocConsumer<PosCubit, PosState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: screenWidth >= 780
                      ? (screenWidth * 0.40) - 80
                      : (screenWidth * 0.90) - 80,
                ),
                height: 30,
                child: CustomeTextFormField(
                  labelText: S.current.search,
                  suffixIcon: posCubit.isSearched == true
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              posCubit.isSearched = false;
                              textEditingController.clear();
                              // Is there any way to get item when close search ??
                              posCubit.getItems();
                            });
                          },
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(0),
                          icon: const Icon(Icons.close))
                      : const Icon(Icons.search),
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  textEditingController: textEditingController,
                  onTap: () {
                    // _showAlertDialogAndAnotherScreen(context);
                    setState(() {
                      // posCubit.isSearched = true;
                    });
                    // ignore: avoid_print
                    print('search start');
                  },
                  onchanged: (value) {
                    posCubit.filterItems(value);
                  },
                  validator: (value) {
                    return null;
                  },
                  onSubmitted: (value) {},
                  inputFormamatters: const [],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to show alert dialog
  // Future<void> _showAlertDialogAndAnotherScreen(BuildContext context) async {
  //   // Show the alert dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Alert Dialog Title'),
  //         content: Text('This is the content of the alert dialog.'),
  //         actions: <Widget>[
  //           TextButton(
  //             child: Text('OK'),
  //             onPressed: () {
  //               // Close the alert dialog
  //               Navigator.of(context).pop();

  //               // // Push another screen onto the navigation stack
  //               // Navigator.of(context).push(MaterialPageRoute(
  //               //   builder: (BuildContext context) => AnotherScreen(),
  //               // ));
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
