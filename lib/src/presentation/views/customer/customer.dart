// ignore_for_file: use_build_context_synchronously

import 'package:casale/generated/l10n.dart';
import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:casale/src/presentation/views/customer/customer_card.dart';
import 'package:casale/src/presentation/views/customer/filter_customer.dart';
import 'package:casale/src/presentation/widgets/custome_text_button.dart';
import 'package:casale/src/presentation/widgets/custome_text_form_field.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Customer extends StatelessWidget {
  Customer({super.key});

  final TextEditingController searchTextController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController familyNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

// alert dialog for view customers  .
  void showAlert(BuildContext context, PosCubit posCubit) {
    showDialog(
        useSafeArea: true,
        barrierDismissible: true,
        barrierColor: AppColors.orangeColor.withOpacity(0.08),
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              scrollable: true,
              content: SizedBox(
                height: 500,
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                          ),
                        ),
                        Text(
                          S.current.addCustomerToTicket,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showAlertAddCustomer(
                              context: context,
                              posCubit: posCubit,
                              emailController: emailController,
                              nameController: nameController,
                              familyNameController: familyNameController,
                              phoneController: phoneController,
                            );
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomeTextFormField(
                      inputFormamatters: const [],
                      labelText: S.current.search,
                      suffixIcon: const Icon(Icons.search),
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      textEditingController: searchTextController,
                      validator: (value) {
                        return null;
                      },
                      onSubmitted: (input) {
                        posCubit.filterCustomer(input);
                      },
                      onTap: () {},
                      onchanged: (input) {
                        posCubit.filterCustomer(input);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      S.current.recentCustomers,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    posCubit.isSearchCustomer == false
                        ? const CustomerCard()
                        : const FilterCustomers()
                  ],
                ),
              ));
        });
  }

  // add new customer
  showAlertAddCustomer({
    required BuildContext context,
    required PosCubit posCubit,
    required TextEditingController nameController,
    required TextEditingController familyNameController,
    required TextEditingController phoneController,
    required TextEditingController emailController,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          final GlobalKey<FormState> formkey = GlobalKey<FormState>();

          return AlertDialog(
            content: Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      '${S.current.add} ${S.current.customer}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomeTextFormField(
                      inputFormamatters: const [],
                      onSubmitted: null,
                      labelText: S.current.name,
                      suffixIcon: const Icon(Icons.person),
                      obscureText: false,
                      keyboardType: TextInputType.name,
                      textEditingController: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.current.notNull;
                        }
                        return null;
                      },
                      onchanged: (string) {},
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomeTextFormField(
                      inputFormamatters: const [],
                      onSubmitted: null,
                      labelText: S.current.familyName,
                      suffixIcon: const Icon(Icons.person),
                      obscureText: false,
                      keyboardType: TextInputType.name,
                      textEditingController: familyNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.current.notNull;
                        }
                        return null;
                      },
                      onchanged: (string) {},
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomeTextFormField(
                      onSubmitted: null,
                      labelText: S.current.phone,
                      suffixIcon: const Icon(Icons.phone),
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      inputFormamatters: [LengthLimitingTextInputFormatter(10)],
                      textEditingController: phoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.current.notNull;
                        }
                        return null;
                      },
                      onTap: () {},
                      onchanged: (string) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomeTextFormField(
                      inputFormamatters: const [],
                      onSubmitted: null,
                      labelText: S.current.email,
                      suffixIcon: const Icon(Icons.email),
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      textEditingController: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.current.notNull;
                        }
                        return null;
                      },
                      onTap: () {},
                      onchanged: (string) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomeTextButton(
                      childWidget: Text(
                        S.current.add,
                        style: const TextStyle(
                          color: AppColors.orangeColor,
                        ),
                      ),
                      borderwidth: 1,
                      isBorder: BorderStyle.solid,
                      backgroundColor: AppColors.whiteColor,
                      elevation: 1,
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          posCubit
                              .addCustomer(
                                  firstName: nameController.text.toString(),
                                  familyName: familyNameController.toString(),
                                  email: emailController.text.toString(),
                                  phoneNumber: phoneController.text.toString())
                              .then(
                            (value) async {
                              Navigator.popAndPushNamed(
                                  context, Routes.bottomNavigation);

                              emailController.clear();
                              phoneController.clear();
                              nameController.clear();
                              familyNameController.clear();

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  actionOverflowThreshold: 1,
                                  duration: const Duration(milliseconds: 900),
                                  backgroundColor: Colors.green,
                                  content: Center(
                                    child: Text(S.current.cutomerAdded),
                                  ),
                                ),
                              );
                              posCubit.customers?.clear();

                              // if (value == null) {
                              //   List<dynamic>? messages = posCubit
                              //       .validateModel?.data?.validator?.messages;
                              //   String errorMessage = '';
                              //   for (var element in messages!) {
                              //     errorMessage =
                              //         ' $errorMessage ${element.toString()}';
                              //   }
                              //   // emailController.text = errorMessage;
                              //   // CustomToast().showToast();
                              //   showToast() {
                              //     print('toast');
                              //     Fluttertoast.showToast(
                              //         msg: errorMessage,
                              //         // toastLength: Toast.LENGTH_SHORT,
                              //         gravity: ToastGravity.BOTTOM,
                              //         timeInSecForIosWeb: 5,
                              //         backgroundColor: Colors.green,
                              //         textColor: Colors.white,
                              //         fontSize: 16.0);
                              //   }
                              // } else {
                              //   Navigator.popAndPushNamed(
                              //       context, Routes.bottomNavigation);

                              //   emailController.clear();
                              //   phoneController.clear();
                              //   nameController.clear();
                              //   posCubit.customers.clear();

                              //   ScaffoldMessenger.of(context)
                              //       .showSnackBar(SnackBar(
                              //     actionOverflowThreshold: 1,
                              //     duration: const Duration(milliseconds: 900),
                              //     backgroundColor: Colors.green,
                              //     content: Center(
                              //       child: Text(S.current.cutomerAdded),
                              //     ),
                              //   ));
                              // }
                            },
                          );
                        }
                      },
                      minimumSize: const Size(150, 35),
                      borderRaduis: BorderRadius.circular(10),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

// class CustomPageRouteBuilder extends PageRouteBuilder {
//   final Widget page;

//   CustomPageRouteBuilder({required this.page})
//       : super(
//           pageBuilder: (context, animation, secondaryAnimation) => page,
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             var begin = Offset(1.0, 0.0);
//             var end = Offset.zero;
//             var curve = Curves.easeInOut;
//             var tween =
//                 Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//             var offsetAnimation = animation.drive(tween);
//             return SlideTransition(position: offsetAnimation, child: child);
//           },
//         );
// }

// Usage
// Navigator.push(context, CustomPageRouteBuilder(page: NewScreen()));
