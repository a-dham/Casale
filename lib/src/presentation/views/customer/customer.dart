// ignore_for_file: use_build_context_synchronously

import 'package:casale/generated/l10n.dart';
import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:casale/src/presentation/widgets/custome_text_button.dart';
import 'package:casale/src/presentation/widgets/custome_text_form_field.dart';
import 'package:casale/src/presentation/widgets/toast_massage.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class Customer extends StatelessWidget {
  Customer({super.key});

  final TextEditingController searchTextController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
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
                      onSubmitted: null,
                      labelText: S.current.search,
                      suffixIcon: const Icon(Icons.search),
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      textEditingController: searchTextController,
                      validator: (value) {
                        return null;
                      },
                      onTap: () {},
                      onchanged: (string) {},
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
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                String customerId =
                                    posCubit.customers[index].customerId;
                                await posCubit.getCustomer(customerId);
                                Navigator.pop(context);
                              },
                              child: Container(
                                color: Colors.blue[50],
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Text(posCubit.customers[index].firstName ??
                                        ''),
                                    const Spacer(),
                                    Text(posCubit.customers[index].phoneNo ??
                                        ''),
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
                          itemCount: posCubit.customers.length),
                    ),
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
    required TextEditingController phoneController,
    required TextEditingController emailController,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SingleChildScrollView(
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
                    onSubmitted: null,
                    labelText: S.current.name,
                    suffixIcon: const Icon(Icons.person),
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    textEditingController: nameController,
                    validator: (value) {
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
                    textEditingController: phoneController,
                    validator: (value) {
                      return null;
                    },
                    onTap: () {},
                    onchanged: (string) {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomeTextFormField(
                    onSubmitted: null,
                    labelText: S.current.email,
                    suffixIcon: const Icon(Icons.email),
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    textEditingController: emailController,
                    validator: (value) {
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
                      posCubit
                          .addCustomer(
                              firstName: nameController.text.toString(),
                              email: emailController.text.toString(),
                              phoneNumber: phoneController.text.toString())
                          .then((value) async {
                        Navigator.popAndPushNamed(
                            context, Routes.bottomNavigation);
                        emailController.clear();
                        phoneController.clear();
                        nameController.clear();
                        posCubit.customers.clear();
                        posCubit.getCustomers();
                        const Toast().showToast();
                      });
                    },
                    minimumSize: const Size(150, 35),
                    borderRaduis: BorderRadius.circular(10),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
